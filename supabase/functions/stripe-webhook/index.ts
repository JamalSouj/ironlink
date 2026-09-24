import { serve } from "https://deno.land/std@0.168.0/http/server.ts";
import Stripe from "https://esm.sh/stripe@14.14.0";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2.39.3";

const stripe = new Stripe(Deno.env.get("STRIPE_SECRET_KEY") as string, {
  apiVersion: "2023-10-16",
});
const endpointSecret = Deno.env.get("STRIPE_WEBHOOK_SECRET");

const supabaseUrl = Deno.env.get("SUPABASE_URL") as string;
const supabaseServiceKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") as string;

const supabase = createClient(supabaseUrl, supabaseServiceKey);

serve(async (req) => {
  const signature = req.headers.get("stripe-signature");
  if (!signature || !endpointSecret) {
    return new Response("Webhook signature or secret missing", { status: 400 });
  }

  const body = await req.text();
  let event;

  try {
    event = stripe.webhooks.constructEvent(body, signature, endpointSecret);
  } catch (err) {
    return new Response(`Webhook Error: \${err.message}`, { status: 400 });
  }

  try {
    switch (event.type) {
      case "checkout.session.completed": {
        const session = event.data.object;
        const coachId = session.client_reference_id;
        if (!coachId) throw new Error("No client_reference_id in session");

        const subscription = await stripe.subscriptions.retrieve(
          session.subscription as string
        );
        const planId = subscription.items.data[0].price.id;
        const plan = planId === Deno.env.get("STRIPE_PRO_PRICE_ID") ? "pro" : "starter";

        await supabase.from("subscriptions").upsert({
          coach_id: coachId,
          stripe_customer_id: session.customer,
          stripe_subscription_id: subscription.id,
          plan: plan,
          status: subscription.status,
          current_period_end: new Date(subscription.current_period_end * 1000).toISOString(),
        });
        break;
      }
      case "customer.subscription.updated":
      case "customer.subscription.deleted": {
        const subscription = event.data.object;
        const planId = subscription.items.data[0].price.id;
        const plan = planId === Deno.env.get("STRIPE_PRO_PRICE_ID") ? "pro" : "starter";

        await supabase
          .from("subscriptions")
          .update({
            plan: plan,
            status: subscription.status,
            current_period_end: new Date(subscription.current_period_end * 1000).toISOString(),
          })
          .eq("stripe_subscription_id", subscription.id);
        break;
      }
    }

    return new Response(JSON.stringify({ received: true }), {
      headers: { "Content-Type": "application/json" },
    });
  } catch (err) {
    return new Response(`Error handling event: \${err.message}`, { status: 500 });
  }
});
