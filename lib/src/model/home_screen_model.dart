// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  final Data data;

  HomeModel({
    required this.data,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  final List<Level> levels;
  final List<DryHour> dryHours;

  Data({
    required this.levels,
    required this.dryHours,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        levels: List<Level>.from(json["levels"].map((x) => Level.fromJson(x))),
        dryHours: List<DryHour>.from(
            json["dry_hours"].map((x) => DryHour.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "levels": List<dynamic>.from(levels.map((x) => x.toJson())),
        "dry_hours": List<dynamic>.from(dryHours.map((x) => x.toJson())),
      };
}

class DryHour {
  final int id;
  final Name name;
  final int lostVol;
  final double mdt;
  final double ydt;
  final int cost;

  DryHour({
    required this.id,
    required this.name,
    required this.lostVol,
    required this.mdt,
    required this.ydt,
    required this.cost,
  });

  factory DryHour.fromJson(Map<String, dynamic> json) => DryHour(
        id: json["id"],
        name: nameValues.map[json["name"]]!,
        lostVol: json["lost_vol"],
        mdt: json["mdt"]?.toDouble(),
        ydt: json["ydt"]?.toDouble(),
        cost: json["cost"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "lost_vol": lostVol,
        "mdt": mdt,
        "ydt": ydt,
        "cost": cost,
      };
}

enum Name { ADO, OIL, WAX }

final nameValues =
    EnumValues({"ADO": Name.ADO, "OIL": Name.OIL, "WAX": Name.WAX});

class Level {
  final String date;
  final String month;
  final List<Product> products;

  Level({
    required this.date,
    required this.month,
    required this.products,
  });

  factory Level.fromJson(Map<String, dynamic> json) => Level(
        date: json["date"],
        month: json["month"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "month": month,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  final int id;
  final Name name;
  final Stock stock;

  Product({
    required this.id,
    required this.name,
    required this.stock,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: nameValues.map[json["name"]]!,
        stock: Stock.fromJson(json["stock"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "stock": stock.toJson(),
      };
}

class Stock {
  final int id;
  final int liter;
  final int receivedQty;
  final int rate;
  final int dryHours;
  final double tankLevel;

  Stock({
    required this.id,
    required this.liter,
    required this.receivedQty,
    required this.rate,
    required this.dryHours,
    required this.tankLevel,
  });

  factory Stock.fromJson(Map<String, dynamic> json) => Stock(
        id: json["id"],
        liter: json["liter"],
        receivedQty: json["received_qty"],
        rate: json["rate"],
        dryHours: json["dry_hours"],
        tankLevel: json["tank_level"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "liter": liter,
        "received_qty": receivedQty,
        "rate": rate,
        "dry_hours": dryHours,
        "tank_level": tankLevel,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
