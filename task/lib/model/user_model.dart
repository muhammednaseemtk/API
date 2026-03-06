import 'package:task/model/address_model.dart';
import 'package:task/model/company_model.dart';

class UserModel {
  final int? id;
  final String? name;
  final String? username;
  final String? email;
  final String? phone;
  final String? website;
  final AddressModel? address;
  final CompanyModel? company;

  UserModel({
    this.id,
    this.name,
    this.username,
    this.email,
    this.phone,
    this.website,
    this.address,
    this.company
  });

  factory UserModel.fromJson(Map<String,dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      website: json['website'],
      address: AddressModel.fromJson(json['address']),
      company: CompanyModel.fromJson(json['company'])
    );
  }
}