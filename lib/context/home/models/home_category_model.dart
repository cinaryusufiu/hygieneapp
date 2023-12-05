final class HomeCategory {
  final String id;
  final String name;

  const HomeCategory({required this.id, required this.name});

  /// Empty user which represents an HomeResponse.
  static const empty = HomeCategory(id: "title", name: "content");

  /// Modify HomeResponse parameters
  HomeCategory copyWith({String? id, String? name}) {
    return HomeCategory(id: id ?? this.id, name: name ?? this.name);
  }
}
