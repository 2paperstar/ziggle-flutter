import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/group_entity.dart';
import '../../domain/repositories/group_repository.dart';

part 'group_bloc.freezed.dart';

@injectable
class GroupBloc extends Bloc<GroupEvent, GroupState> {
  final GroupRepository groupRepository;

  GroupBloc({required this.groupRepository})
      : super(const GroupState.initial()) {
    on<_Load>((event, emit) async {
      emit(GroupState.loading(state.groups));
      try {
        final result = await groupRepository.getGroups();
        emit(GroupState.loaded(result));
      } catch (e) {
        emit(GroupState.error(e.toString(), state.groups));
      }
    });
  }
}

@freezed
sealed class GroupEvent with _$GroupEvent {
  const factory GroupEvent.load() = _Load;
}

@freezed
sealed class GroupState with _$GroupState {
  const factory GroupState.initial([
    @Default([]) List<GroupEntity> groups,
  ]) = _Initial;
  const factory GroupState.loading([
    @Default([]) List<GroupEntity> groups,
  ]) = _Loading;
  const factory GroupState.loaded(List<GroupEntity> groups) = _Loaded;
  const factory GroupState.error(
    String message, [
    @Default([]) List<GroupEntity> groups,
  ]) = _Error;
}
