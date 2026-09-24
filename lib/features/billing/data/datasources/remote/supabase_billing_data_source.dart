import 'package:ironlink/core/error/exceptions.dart';
import 'package:ironlink/features/billing/data/models/subscription_model.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

@lazySingleton
class SupabaseBillingDataSource {
  const SupabaseBillingDataSource(this._client);
  final sb.SupabaseClient _client;

  Future<String> createCheckoutSession(String priceId, String redirectUrl) async {
    try {
      final response = await _client.functions.invoke(
        'stripe-checkout',
        body: {'price_id': priceId, 'redirect_url': redirectUrl},
      );
      final data = response.data as Map<String, dynamic>?;
      if (response.status != 200 || data == null) {
        throw ServerException(message: data?['error'] as String? ?? 'Unknown error');
      }
      
      return data['checkout_url'] as String;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  Stream<SubscriptionModel?> watchSubscriptionStatus(String coachId) {
    return _client
        .from('subscriptions')
        .stream(primaryKey: ['id'])
        .eq('coach_id', coachId)
        .map((data) => data.isEmpty ? null : SubscriptionModel.fromJson(data.first));
  }

  Future<SubscriptionModel?> checkSubscriptionStatus(String coachId) async {
    try {
      final result = await _client
          .from('subscriptions')
          .select()
          .eq('coach_id', coachId)
          .maybeSingle();
      if (result == null) return null;
      return SubscriptionModel.fromJson(result);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
