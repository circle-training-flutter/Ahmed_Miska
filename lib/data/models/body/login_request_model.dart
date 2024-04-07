class LoginRequestBody {
  final String phoneCode='+20';
  final String phone;

  LoginRequestBody(this.phone);

  Map<String, dynamic> toJson() => {
    
    'phone_code': phoneCode,
    "phone": phone};
}
