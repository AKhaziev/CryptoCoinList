import 'dart:developer';

import 'package:crypto_coin_list/features/crypto_coin/bloc/crypto_coin_bloc.dart';
import 'package:crypto_coin_list/repositories/crypto_coins/crypto_coin.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../widgets/widgets.dart';

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({
    super.key,
  });

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  String coinName = '';
  CryptoCoinDetails? coin;

  final _cryptoCoinBloc = CryptoCoinBloc(GetIt.I<AbstractCoinsRepository>());

  @override
  void initState() {
    _cryptoCoinBloc.add(LoadCryptoCoin());
  }

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    log(args.toString());
    assert(args != null && args is String, "You must provide String args");
    coinName = args as String;
    _loadCryptoCoinDetail(coinName);
    // setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // appBar: AppBar(
      //   centerTitle: true,
      //   // leading: const Icon(Icons.arrow_back),
      //   title: Text(coinName),
      // ),
      body: (coin == null)
          ? const Center(child: CircularProgressIndicator())
          : Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 160,
                    width: 160,
                    child: Image.network(coin!.imageUrl),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    coinName,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  BaseCard(
                    child: Center(
                      child: Text(
                        '${coin!.priceInUSD.toStringAsFixed(2)} \$',
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  BaseCard(
                    child: Column(
                      children: [
                        _DataRow(
                          title: 'Hight 24 Hour',
                          value: '${coin!.high24Hour.toStringAsFixed(2)} \$',
                        ),
                        const SizedBox(height: 6),
                        _DataRow(
                          title: 'Low 24 Hour',
                          value: '${coin!.low24Hour.toStringAsFixed(2)} \$',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Future<void> _loadCryptoCoinDetail(String coinName) async {
    coin = await GetIt.I<AbstractCoinsRepository>().getCoinDetails(coinName);
    setState(() {});
    debugPrint(coin.toString());
  }

//   static IconData _getIconData(TargetPlatform platform) {
//     switch (platform) {
//       case TargetPlatform.android:
//       case TargetPlatform.fuchsia:
//       case TargetPlatform.linux:
//       case TargetPlatform.windows:
//         return Icons.arrow_back;
//       case TargetPlatform.iOS:
//       case TargetPlatform.macOS:
//         return Icons.arrow_back_ios;
//     }
//   }
}

class _DataRow extends StatelessWidget {
  const _DataRow({
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 140, child: Text(title)),
        const SizedBox(width: 32),
        Flexible(
          child: Text(value),
        ),
      ],
    );
  }
}
