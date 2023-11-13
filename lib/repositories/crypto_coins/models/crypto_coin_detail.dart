import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crypto_coin_detail.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class CryptoCoinDetail extends Equatable {
  const CryptoCoinDetail(
      {required this.toSymbol,
      required this.lastUpdate,
      required this.high24Hour,
      required this.low24Hour,
      required this.priceInUSD,
      required this.imageUrl});

  @HiveField(0)
  @JsonKey(name: "TOSYMBOL")
  final String toSymbol;

  @HiveField(1)
  @JsonKey(name: "LASTUPDATE")
  final int lastUpdate;

  @HiveField(2)
  @JsonKey(name: "HIGH24HOUR")
  final double high24Hour;

  @HiveField(3)
  @JsonKey(name: "LOW24HOUR")
  final double low24Hour;

  @HiveField(4)
  @JsonKey(name: "PRICE")
  final double priceInUSD;

  @HiveField(5)
  @JsonKey(
      name: "IMAGEURL",
      // fromJson: _fullImageUrlFromJson
  )
  final String imageUrl;
  String get fullImageUrl => 'https://www.cryptocompare.com/$imageUrl';

  @HiveField(6)
  @override
  String toString() {
    return 'CryptoCoinDetails{'
        'toSymbol: $toSymbol, '
        'lastUpdate: $lastUpdate, '
        'high24Hour: $high24Hour, '
        'low24Hour: $low24Hour, '
        'priceInUSD: $priceInUSD, '
        'imageUrl: $imageUrl}';
  }

  factory CryptoCoinDetail.fromJson(Map<String, dynamic> json) => _$CryptoCoinDetailFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoCoinDetailToJson(this);

  // static String _fullImageUrlFromJson (String imageUrl) => 'https://www.cryptocompare.com/$imageUrl';

  @override
  List<Object> get props => [
        toSymbol,
        lastUpdate,
        high24Hour,
        low24Hour,
        priceInUSD,
        imageUrl,
      ];
}
