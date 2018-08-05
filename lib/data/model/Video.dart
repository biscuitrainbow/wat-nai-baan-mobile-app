class Video {
  final String name;
  final String id;
  final String thumbnailUrl;

  Video({
    this.name,
    this.id,
    this.thumbnailUrl,
  });

  @override
  String toString() {
    return 'Video{name: $name, id: $id, thumbnailUrl: $thumbnailUrl}';
  }


}
