import 'package:hive_flutter/hive_flutter.dart';
import 'package:ziggle/app/data/enums/notice_sort.dart';
import 'package:ziggle/app/data/model/tag_response.dart';
import 'package:ziggle/gen/strings.g.dart';

part 'article_type.g.dart';

@HiveType(typeId: 1)
enum ArticleType {
  @HiveField(4)
  deadline('⭐️', sort: NoticeSort.deadline),
  @HiveField(5)
  hot('🔥', sort: NoticeSort.hot),
  @HiveField(6)
  my('🔥'),
  @HiveField(7)
  reminders('🔔'),
  @HiveField(0)
  recruit('🎯', id: 1),
  @HiveField(1)
  event('🎈', id: 2),
  @HiveField(2, defaultValue: true)
  general('🔔', id: 3),
  @HiveField(3)
  academic('📰', id: 4);

  final String emoji;
  String get title => t.article.section.title(type: this);
  String get shortTitle => t.article.section.shortTitle(type: this);
  String get description => t.article.section.description(type: this);
  final int id;
  final NoticeSort sort;
  String get header => '$emoji $title';
  String get label => '$emoji $shortTitle';
  bool get isHorizontal => this == deadline;
  bool get isSearchable => searchables.contains(this);
  bool get isProfile => profile.contains(this);

  static const writables = [recruit, event, general];
  static const searchables = [...writables, academic];
  static const main = [deadline, hot, ...searchables];
  static const profile = [my, reminders];

  const ArticleType(this.emoji, {this.id = 0, NoticeSort? sort})
      : sort = sort ?? NoticeSort.recent;
}

extension TagResponseExtention on TagResponse {
  bool get isType => ArticleType.searchables.map((e) => e.id).contains(id);
  TagResponse get type => copyWith(
        name: ArticleType.searchables.firstWhere((e) => e.id == id).shortTitle,
      );
}
