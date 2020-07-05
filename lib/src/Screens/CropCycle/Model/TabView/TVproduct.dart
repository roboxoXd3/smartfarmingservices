class TVProduct {
  final String id;
  final String imageUrl;
  final String name;
  TVProduct({
    this.id,
    this.imageUrl,
    this.name,
  });

  Map<String, dynamic> toMap() {
    return {'id': id, 'imageUrl': imageUrl, 'name': name};
  }
}
