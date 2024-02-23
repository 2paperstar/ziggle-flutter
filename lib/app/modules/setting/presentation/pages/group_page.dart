import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ziggle/app/di/locator.dart';
import 'package:ziggle/app/modules/auth/presentation/bloc/auth_bloc.dart';
import 'package:ziggle/app/modules/core/presentation/widgets/ziggle_button.dart';
import 'package:ziggle/app/values/palette.dart';
import 'package:ziggle/gen/assets.gen.dart';
import 'package:ziggle/gen/strings.g.dart';

import '../../domain/entities/group_entity.dart';
import '../bloc/group_bloc.dart';

class GroupPage extends StatelessWidget {
  const GroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.setting.group.title),
      ),
      body: BlocProvider(
        create: (_) => sl<GroupBloc>()..add(const GroupEvent.load()),
        child: const _Layout(),
      ),
    );
  }
}

class _Layout extends StatelessWidget {
  const _Layout();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ZiggleButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.icons.group.svg(
                    colorFilter: const ColorFilter.mode(
                      Palette.white,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    t.setting.group.create,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Text(
              t.setting.group.my,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            BlocBuilder<GroupBloc, GroupState>(
              builder: (context, state) => Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (state.isLoading)
                    const Center(child: CircularProgressIndicator()),
                  if (!state.isLoading && state.groups.isEmpty)
                    Text(
                      t.setting.group.empty,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Palette.textGreyDark,
                      ),
                    ),
                  ListView.separated(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (_, index) {
                      final group = state.groups[index];
                      return _GroupCard(group: group);
                    },
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemCount: state.groups.length,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Palette.backgroundGreyLight,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              child: Text(
                t.setting.group.howToJoin,
                style: const TextStyle(
                  fontSize: 14,
                  color: Palette.textGreyDark,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GroupCard extends StatelessWidget {
  const _GroupCard({required this.group});

  final GroupEntity group;

  @override
  Widget build(BuildContext context) {
    final representative = group.representative;
    final isRepresentative =
        representative.studentId == AuthBloc.userOrNull(context)?.studentId;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Palette.primary100),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {},
              icon: Assets.icons.moreVert.svg(
                colorFilter: const ColorFilter.mode(
                  Palette.primary100,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Text(
                      group.name,
                      style: const TextStyle(
                        color: Palette.primary100,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 5),
                    if (isRepresentative)
                      Assets.icons.crown.svg(
                        colorFilter: const ColorFilter.mode(
                          Palette.primary100,
                          BlendMode.srcIn,
                        ),
                      ),
                  ],
                ),
                Text(
                  group.englishName,
                  style: const TextStyle(
                    color: Palette.primary100,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Assets.icons.userCrown.svg(
                      colorFilter: const ColorFilter.mode(
                        Palette.textGreyDark,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text('${representative.studentId} ${representative.name}'),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Assets.icons.userCircle.svg(
                      colorFilter: const ColorFilter.mode(
                        Palette.textGreyDark,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(t.setting.group.people(count: group.users.length)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
