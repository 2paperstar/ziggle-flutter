import 'package:injectable/injectable.dart';
import 'package:ziggle/app/modules/auth/domain/entities/user_entity.dart';

import '../../domain/entities/group_entity.dart';
import '../../domain/repositories/group_repository.dart';

@Injectable(as: GroupRepository)
class MockGroupRepository implements GroupRepository {
  @override
  Future<List<GroupEntity>> getGroups() async {
    return [
      GroupEntity.mock(
        name: '인포팀',
        englishName: 'INFOTEAM',
        representative: UserEntity.mock(name: '최익준', studentId: '20235203'),
        users: List.generate(
          21,
          (index) => UserEntity.mock(name: '최익준', studentId: '20235203'),
        ),
        verified: true,
      ),
      GroupEntity.mock(
        name: 'WING',
        englishName: 'WING',
        representative: UserEntity.mock(name: '이보성', studentId: '20235140'),
        users: List.generate(
          10,
          (index) => UserEntity.mock(name: '이보성', studentId: '20235140'),
        ),
      ),
    ];
  }
}
