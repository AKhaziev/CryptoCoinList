import 'package:crypto_coin_list/repositories/crypto_coins/models/crypto_coin_detail.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'crypto_coin.g.dart';

@HiveType(typeId: 2)
class CryptoCoin extends Equatable {
  const CryptoCoin({
    required this.name,
    required this.details
  });

  @HiveField(0)
  final String name;

  @HiveField(1)
  final CryptoCoinDetail details;

  @override
  String toString() {
    return 'CryptoCoin{name: $name, details: $details}';
  }

  @override
  List<Object> get props => [name, details];

}

