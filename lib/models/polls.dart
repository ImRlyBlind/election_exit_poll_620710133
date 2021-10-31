class Polls{
  final int number;
  final String title;
  final String firstName;
  final String lastName;

  Polls({
    required this.number,
    required this.title,
    required this.firstName,
    required this.lastName,
  });

  factory Polls.fromJson(Map<String, dynamic> json){
    return Polls(
      number: json['number'],
      title: json['title'],
      firstName: json['firstName'],
      lastName: json['lastName'],
    );
  }
}