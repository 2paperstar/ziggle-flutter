import 'package:flutter/material.dart';
import 'package:ziggle/app/modules/common/presentation/widgets/ziggle_chip.dart';
import 'package:ziggle/app/modules/common/presentation/widgets/ziggle_pressable.dart';
import 'package:ziggle/app/modules/notice/domain/entities/notice_summary.dart';
import 'package:ziggle/app/values/palette.dart';
import 'package:ziggle/gen/assets.gen.dart';

class NoticeCard extends StatelessWidget {
  const NoticeCard({super.key, required this.notice});

  final NoticeSummary notice;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: const BoxDecoration(
        color: Palette.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Assets.images.defaultProfile.image(width: 40),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          notice.authorName,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Palette.black,
                            height: 1,
                            leadingDistribution: TextLeadingDistribution.even,
                          ),
                        ),
                        const SizedBox(width: 5),
                        if (notice.authorIsCertificated)
                          Assets.icons.certificatedBadge.svg(width: 20),
                      ],
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      '10분 전',
                      style: TextStyle(
                        fontSize: 12,
                        color: Palette.gray,
                      ),
                    ),
                  ],
                ),
              ),
              const ZiggleChip(label: '343days left'),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            notice.title,
            style: const TextStyle(
              color: Palette.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          if (notice.images.isNotEmpty)
            Image.network(
              notice.images.first,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            )
          else
            Text(
              notice.content,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Palette.black,
              ),
            ),
          const SizedBox(height: 8),
          Row(
            children: [
              ZigglePressable(
                onPressed: () {},
                child: Row(
                  children: [
                    Assets.icons.fire.svg(width: 30),
                    const SizedBox(width: 5),
                    Text(
                      '${notice.likes}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Palette.black,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              ZigglePressable(
                onPressed: () {},
                child: Assets.icons.share.svg(width: 30),
              ),
            ],
          )
        ],
      ),
    );
  }
}
