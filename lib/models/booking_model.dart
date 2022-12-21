// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class BookingModel {
  String id;
  String restourentName;
  String latitude;
  String longitude;
  String amount;
  int seats;
  String userId;
  BookingModel({
    required this.id,
    required this.restourentName,
    required this.latitude,
    required this.longitude,
    required this.amount,
    required this.seats,
    required this.userId,
  });

  BookingModel copyWith({
    String? id,
    String? restourentName,
    String? latitude,
    String? longitude,
    String? amount,
    int? seats,
    String? userId,
  }) {
    return BookingModel(
      id: id ?? this.id,
      restourentName: restourentName ?? this.restourentName,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      amount: amount ?? this.amount,
      seats: seats ?? this.seats,
      userId: userId ?? this.userId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'restourentName': restourentName,
      'latitude': latitude,
      'longitude': longitude,
      'amount': amount,
      'seats': seats,
      'userId': userId,
    };
  }

  factory BookingModel.fromMap(DocumentSnapshot map) {
    return BookingModel(
      id: map['id'] as String,
      restourentName: map['restourentName'] as String,
      latitude: map['latitude'] as String,
      longitude: map['longitude'] as String,
      amount: map['amount'] as String,
      seats: map['seats'] as int,
      userId: map['userId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'BookingModel(id: $id, restourentName: $restourentName, latitude: $latitude, longitude: $longitude, amount: $amount, seats: $seats, userId: $userId)';
  }

  @override
  bool operator ==(covariant BookingModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.restourentName == restourentName &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.amount == amount &&
        other.seats == seats &&
        other.userId == userId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        restourentName.hashCode ^
        latitude.hashCode ^
        longitude.hashCode ^
        amount.hashCode ^
        seats.hashCode ^
        userId.hashCode;
  }
}
