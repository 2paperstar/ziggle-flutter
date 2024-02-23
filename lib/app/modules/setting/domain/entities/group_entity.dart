import 'package:ziggle/app/modules/auth/domain/entities/user_entity.dart';

class GroupEntity {
  final int id;
  final String name;
  final List<UserEntity> users;

  GroupEntity({required this.id, required this.name, required this.users});
}
