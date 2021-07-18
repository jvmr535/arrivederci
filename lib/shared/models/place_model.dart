class Place {
  String name;
  String address;
  String rating;
  String photo;

  Place(
      {required this.name,
      required this.address,
      required this.rating,
      required this.photo});

  @override
  String toString() {
    return 'Place(Nome : $name, endereço: $address, avaliação: $rating, referencia de imagem: $photo)';
  }
}
