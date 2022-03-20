class ContactModel {
  final String name;
  final String surname;
  final String fullname;
  final String phone;
  final String email;
  final String message;
  final bool hasData;

  ContactModel({
    required this.name,
    required this.surname,
    required this.fullname,
    required this.phone,
    required this.email,
    required this.message,
    required this.hasData,
  });
}
