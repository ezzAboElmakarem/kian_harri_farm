class Advert {
  String? image;
  String? link;
  String? title;

  Advert({this.image, this.link, this.title});

  factory Advert.fromJson(Map<String, dynamic> json) => Advert(
        image: json['image'] as String?,
        link: json['link'] as String?,
        title: json['title'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'image': image,
        'link': link,
        'title': title,
      };
}
