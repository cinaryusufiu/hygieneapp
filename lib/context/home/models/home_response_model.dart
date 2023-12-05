final class HomeResponse {
  final String title;
  final String content;

  const HomeResponse({required this.title, required this.content});

  /// Empty user which represents an HomeResponse.
  static const empty = HomeResponse(title: "title", content: "content");

  /// Modify HomeResponse parameters
  HomeResponse copyWith({String? title, String? content}) {
    return HomeResponse(
        title: title ?? this.title, content: content ?? this.content);
  }
}
