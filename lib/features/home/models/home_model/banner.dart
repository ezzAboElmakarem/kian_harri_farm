class Banner {
  int? id;
  String? name;
  String? url;
  String? image;

  Banner({this.id, this.name, this.url, this.image});

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        id: json['id'] as int?,
        name: json['name'] as String?,
        url: json['url'] as String?,
        image: json['image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'url': url,
        'image': image,
      };
}
