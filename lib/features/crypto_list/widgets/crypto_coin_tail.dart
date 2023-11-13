import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../repositories/crypto_coins/models/crypto_coin.dart';
import '../../../router/router.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({
    super.key,
    required this.coin,
  });

  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: Image.network(
          coin.details.fullImageUrl,
      // leading: SvgPicture.asset(
      //   'assets/images/logo_bitcoin.svg',
        height: 48,
        width: 48,
      ),
      title: Text(coin.name, style: theme.textTheme.bodyMedium),
      subtitle: Text('\$ ${coin.details.priceInUSD.toStringAsFixed(2)}', style: theme.textTheme.labelSmall),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        AutoRouter.of(context).push(CryptoCoinRoute(coin: coin));
        // Navigator.of(context).pushNamed(
        //   '/coin',
        //   arguments: coin.name
        // );
      },
    );
  }
}
