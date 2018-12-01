class Notification {
  final title;
  final body;
  final topic;

  Notification({
    this.title,
    this.body,
    this.topic,
  });

  @override
  String toString() {
    return 'Notification{title: $title, body: $body, topic: $topic}';
  }
}
