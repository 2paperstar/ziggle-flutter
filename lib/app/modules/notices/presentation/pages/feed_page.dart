import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ziggle/app/di/locator.dart';
import 'package:ziggle/app/modules/common/presentation/widgets/ziggle_app_bar.dart';
import 'package:ziggle/app/modules/notices/presentation/bloc/notice_list_bloc.dart';
import 'package:ziggle/app/modules/notices/presentation/widgets/list_layout.dart';
import 'package:ziggle/app/values/palette.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.grayLight,
      appBar: ZiggleAppBar.main(
        onTapSearch: () {},
        onTapWrite: () {},
      ),
      body: BlocProvider(
        create: (_) => sl<NoticeListBloc>()..add(const NoticeListEvent.load()),
        child: const ListLayout(),
      ),
    );
  }
}
