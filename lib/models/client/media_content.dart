class MediaContent {
  int id;
  String age;
  String meta;
  String title;
  String duration;
  String author;
  String brief;
  String titleUpper;
  String description;
  String illustration;

  String category;
  String date;
  String cardPath;
  String bookImage;
  String contentPath;
  String darkBackground;
  String lightBackground;

  MediaContent({
    required this.id,
    required this.age,
    required this.meta,
    required this.title,
    required this.duration,
    required this.contentPath,
    required this.author,
    required this.brief,
    required this.cardPath,
    required this.titleUpper,
    required this.description,
    required this.darkBackground,
    required this.illustration,
    required this.lightBackground,
    required this.bookImage,
    required this.category,
    required this.date,
  });
}
