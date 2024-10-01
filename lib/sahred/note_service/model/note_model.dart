class NoteModel {
  final int? id;
  final String? title;
  final String? description;
  final String? colorCode;

  const NoteModel({
    this.id,
    this.title,
    this.description,
    this.colorCode,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'description': description,
        'colorCode': colorCode,
      };

  Map<String, dynamic> toMapWithoutId() => {
        'title': title,
        'description': description,
        'colorCode': colorCode,
      };

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      colorCode: map['colorCode'] as String,
    );
  }
}
