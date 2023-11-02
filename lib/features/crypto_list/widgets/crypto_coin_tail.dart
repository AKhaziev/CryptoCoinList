import '../../../repositories/crypto_coins/models/crypto_coin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({
    super.key,
    required this.coin,
    // required this.coinPriceInUSD,
  });

  final CryptoCoin coin;
  // final double coinPriceInUSD;

  // final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: Image.network(
          coin.imageUrl,
      // leading: SvgPicture.asset(
      //   'assets/images/logo_bitcoin.svg',
        height: 48,
        width: 48,
      ),
      title: Text(coin.name, style: theme.textTheme.bodyMedium),
      subtitle: Text('\$ ${coin.priceInUSD.toStringAsFixed(2)}', style: theme.textTheme.labelSmall),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.of(context).pushNamed(
          '/coin',
          arguments: coin.name
        );
      },
    );
  }
}
