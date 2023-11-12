import 'package:crypto_coin_list/repositories/crypto_coins/models/crypto_coin_detail.dart';
import 'package:equatable/equatable.dart';

class CryptoCoin extends Equatable {
  const CryptoCoin({
    required this.name,
    required this.details
  });

  final String name;
  final CryptoCoinDetail details;

  @override
  String toString() {
    return 'CryptoCoin{name: $name, details: $details}';
  }

  @override
  List<Object> get props => [name, details];

// final double priceInUSD;
// final String imageUrl;


}

