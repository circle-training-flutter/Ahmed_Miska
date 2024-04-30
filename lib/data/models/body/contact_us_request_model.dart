class ContactUsRequestModel {
  final String name;
  final String? email;
  final String subject;
  final String message;
  final String phone;

  ContactUsRequestModel(this.name, this.email, this.subject, this.message, this.phone);

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "subject": subject,
        "message": message,
        "phone": phone,
      };
}
