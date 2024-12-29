class Tantangan {
  final int id;
  final String title;
  final String deskripsi;
  final String tanggal;
  final String image;
  final int points;

  Tantangan({
    required this.id,
    required this.title,
    required this.deskripsi,
    required this.tanggal,
    required this.image,
    required this.points,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'deskripsi': deskripsi,
      'tanggal': tanggal,
      'image': image,
      'points': points,
    };
  }

  factory Tantangan.fromMap(Map<String, dynamic> map) {
    return Tantangan(
      id: map['id'],
      title: map['title'],
      deskripsi: map['deskripsi'],
      tanggal: map['tanggal'],
      image: map['image'],
      points: map['points'],
    );
  }
}
