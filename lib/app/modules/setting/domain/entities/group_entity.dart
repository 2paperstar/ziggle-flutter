import 'package:ziggle/app/modules/auth/domain/entities/user_entity.dart';

class GroupEntity {
  final int id;
  final String name;
  final String englishName;
  final UserEntity representative;
  final List<UserEntity> users;

  GroupEntity({
    required this.id,
    required this.name,
    required this.englishName,
    required this.representative,
    required this.users,
  });

  factory GroupEntity.mock({
    required String name,
    required String englishName,
    required UserEntity representative,
    required List<UserEntity> users,
  }) {
    return GroupEntity(
      id: 1,
      name: name,
      englishName: englishName,
      representative: representative,
      users: users,
    );
  }
}
