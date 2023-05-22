import 'list_price.dart';
import 'rental_duration.dart';
import 'retail_price.dart';

class Offer {
  num? finskyOfferType;
  ListPrice? listPrice;
  RetailPrice? retailPrice;
  bool? giftable;
  RentalDuration? rentalDuration;

  Offer({
    this.finskyOfferType,
    this.listPrice,
    this.retailPrice,
    this.giftable,
    this.rentalDuration,
  });

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        finskyOfferType: json['finskyOfferType'] as int?,
        listPrice: json['listPrice'] == null
            ? null
            : ListPrice.fromJson(json['listPrice'] as Map<String, dynamic>),
        retailPrice: json['retailPrice'] == null
            ? null
            : RetailPrice.fromJson(json['retailPrice'] as Map<String, dynamic>),
        giftable: json['giftable'] as bool?,
        rentalDuration: json['rentalDuration'] == null
            ? null
            : RentalDuration.fromJson(
                json['rentalDuration'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'finskyOfferType': finskyOfferType,
        'listPrice': listPrice?.toJson(),
        'retailPrice': retailPrice?.toJson(),
        'giftable': giftable,
        'rentalDuration': rentalDuration?.toJson(),
      };
}
