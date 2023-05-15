import 'dart:convert';
import 'models.dart';

// UserLoginModelResponse userLoginResponseModel(String str) =>
//     UserLoginModelResponse.fromJson(json.decode(str));

// UserRegisterModelResponse userRegisterModelResponse(String str) =>
//     UserRegisterModelResponse.fromJson(json.decode(str));

// WalletDetail walletDetailsResponse(String str) =>
//     WalletDetail.fromJson(json.decode(str));

// UserExistResponse userExistModelResponse(String str) =>
//     UserExistResponse.fromJson(json.decode(str));

// class UserLoginModelRequest {
//   late String mobile;
//   late String password;

//   UserLoginModelRequest({required this.mobile, required this.password});

//   UserLoginModelRequest.fromJson(Map<String, dynamic> json) {
//     mobile = json['mobile'];
//     password = json['password'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['email'] = mobile;
//     data['password'] = password;

//     return data;
//   }
// }

// class UserRegisterModelRequest {
//   late String email;
//   late String username;
//   late String password;
//   late String wallet;
//   late String mobile;

//   UserRegisterModelRequest({
//     required this.email,
//     required this.username,
//     required this.password,
//     required this.mobile,
//   });

//   UserRegisterModelRequest.fromJson(Map<String, dynamic> json) {
//     username = json['username'];
//     email = json['email'];
//     password = json['password'];
//     mobile = json['mobile'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['email'] = email;
//     data['username'] = username;
//     data['password'] = password;
//     data['password2'] = password;

//     return data;
//   }
// }

// class UserRegisterModelResponse {
//   late String? message;
//   late DataRegisterResponse? data;

//   UserRegisterModelResponse({required this.message, required this.data});

//   UserRegisterModelResponse.fromJson(Map<String, dynamic> json) {
//     message = json['message'];
//     data =
//         (json['response'] != null ? DataRegisterResponse.fromJson(json) : null);
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['response'] = message;
//     _data['data'] = data!.toJson();
//     return _data;
//   }
// }

// class UserLoginModelResponse {
//   late String? message;
//   late DataLoginResponse? data;

//   UserLoginModelResponse({required this.message, required this.data});

//   UserLoginModelResponse.fromJson(Map<String, dynamic> json) {
//     message = json['message'];
//     data = (json['response'] != null ? DataLoginResponse.fromJson(json) : null);
//   }

//   Map<String, dynamic> toJson() {
//     final response = <String, dynamic>{};
//     response['message'] = message;
//     response['data'] = data!.toJson();
//     return response;
//   }
// }

// class UserExistResponse {
//   String? email;
//   String? username;

//   UserExistResponse({required this.email, required this.username});
//   UserExistResponse.fromJson(Map<String, dynamic> json) {
//     username = json['username'];
//   }
//   Map<String, dynamic> toJson() {
//     final response = <String, dynamic>{};
//     response['username'] = username;
//     return response;
//   }
// }

// class DataLoginResponse {
//   String? response;
//   String? email;
//   String? token;
//   int? pk;

//   DataLoginResponse({
//     this.response,
//     this.pk,
//     this.email,
//     this.token,
//   });

//   DataLoginResponse.fromJson(Map<String, dynamic> json) {
//     response = json['response'];
//     pk = json['pk'];
//     email = json['email'];
//     token = json['token'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['response'] = response;
//     data['pk'] = pk;
//     data['email'] = email;
//     data['token'] = token;
//     return data;
//   }
// }

// // save wallet detail when user register
// class WalletDetail {
//   String? wallet;
//   String? privateKey;

//   WalletDetail({this.wallet, this.privateKey});

//   WalletDetail.fromJson(Map<String, dynamic> json) {
//     wallet = json['wallet'];
//     privateKey = json['privateKey'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['wallet'] = wallet;
//     data['privateKey'] = privateKey;
//     return data;
//   }
// }

// // response receive from server after register
// class DataRegisterResponse {
//   String? response;
//   String? username;
//   String? email;
//   String? mobile;
//   String? wallet;
//   String? token;
//   int? pk;

//   DataRegisterResponse({
//     this.response,
//     this.username,
//     this.email,
//     this.mobile,
//     this.wallet,
//     this.token,
//     this.pk,
//   });

//   DataRegisterResponse.fromJson(Map<String, dynamic> json) {
//     response = json['response'];
//     email = json['email'];
//     username = json['username'];
//     wallet = json['wallet'];
//     pk = json['pk'];
//     token = json['token'];
//     mobile = json['mobile'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['response'] = response;
//     data['username'] = username;
//     data['email'] = email;
//     data['wallet'] = wallet;
//     data['token'] = token;
//     data['pk'] = pk;
//     data['mobile'] = mobile;

//     return data;
//   }
// }

class User {
  final String mobile;
  final String? email;
  final String? profilePicture;
  final List<String>? wallet;
  final List<Token>? assets;
  User({
    required this.mobile,
    this.email,
    this.assets,
    this.wallet,
    this.profilePicture,
  });
}
