import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class BillingPage extends StatelessWidget {
  const BillingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colors.background, // Quiet, plain background
      appBar: AppBar(
        title: const Text('Settings & Billing'),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        children: [
          Text('Subscription', style: textTheme.labelLarge),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colors.surface1,
              border: Border.all(color: colors.surface2, width: 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Pro Coach Plan', style: textTheme.titleMedium),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      color: colors.surface2,
                      child: Text(
                        'ACTIVE',
                        style: textTheme.labelSmall?.copyWith(color: colors.success),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text('Next billing date: Nov 1, 2026', style: textTheme.bodyMedium),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Text('\$49.00', style: AppTextStyles.dataStyle(colors, fontSize: 24)),
                    Text(' / mo', style: textTheme.bodyMedium),
                  ],
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colors.surface2, // Muted button, not accent
                      foregroundColor: colors.textPrimary,
                    ),
                    child: const Text('MANAGE SUBSCRIPTION'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          Text('Account Details', style: textTheme.labelLarge),
          const SizedBox(height: 12),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text('Email Address', style: textTheme.titleSmall),
            subtitle: Text('coach@ironlink.app', style: textTheme.bodyMedium),
            trailing: Icon(Icons.edit, size: 16, color: colors.textSecondary),
            onTap: () {},
          ),
          Divider(color: colors.surface2, height: 1),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text('Payment Method', style: textTheme.titleSmall),
            subtitle: Text('Visa ending in 4242', style: textTheme.bodyMedium),
            trailing: Icon(Icons.edit, size: 16, color: colors.textSecondary),
            onTap: () {},
          ),
          Divider(color: colors.surface2, height: 1),
        ],
      ),
    );
  }
}
