class UserEntity {
  final String email;
  final String name;
  final String studentId;
  final String uuid;

  UserEntity({
    required this.email,
    required this.name,
    required this.studentId,
    required this.uuid,
  });

  factory UserEntity.mock({
    String email = '',
    required String name,
    String studentId = '',
    String uuid = '',
  }) {
    return UserEntity(
      email: email,
      name: name,
      studentId: studentId,
      uuid: uuid,
    );
  }
}
