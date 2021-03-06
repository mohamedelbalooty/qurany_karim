class AzkarCategory {
  final int id;
  final String name;

  const AzkarCategory({required this.id, required this.name});

  factory AzkarCategory.fromJson(Map<String, dynamic> json) {
    return AzkarCategory(id: json['id'], name: json['name']);
  }
}
