// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class UserModel {
  String id;
  String email;
  List<String> bookingIds;
  String longitude;
  String latitude;
  UserModel({
    required this.id,
    required this.email,
    required this.bookingIds,
    required this.longitude,
    required this.latitude,
  });

  UserModel copyWith({
    String? id,
    String? email,
    List<String>? bookingIds,
    String? longitude,
    String? latitude,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      bookingIds: bookingIds ?? this.bookingIds,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'bookingIds': bookingIds,
      'longitude': longitude,
      'latitude': latitude,
    };
  }

  factory UserModel.fromMap(DocumentSnapshot map) {
    return UserModel(
      id: map['id'] as String,
      email: map['email'] as String,
      bookingIds: List.from((map['bookingIds'] as List)),
      longitude: map['longitude'] as String,
      latitude: map['latitude'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'UserModel(id: $id, email: $email, bookingIds: $bookingIds, longitude: $longitude, latitude: $latitude)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.email == email &&
        listEquals(other.bookingIds, bookingIds) &&
        other.longitude == longitude &&
        other.latitude == latitude;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        email.hashCode ^
        bookingIds.hashCode ^
        longitude.hashCode ^
        latitude.hashCode;
  }
}
