class UpdatesClass {
  UpdatesClass(this.name, this.images, this.lastUpdate);
  final String name;
  final List<String> images;
  final DateTime lastUpdate;
}

List<UpdatesClass> updates = [
  UpdatesClass(
      "Tola",
      [
        "assets/img1.jpg",
        "assets/img2.jpg",
        "assets/img3.jpg",
        "assets/img4.jpg"
      ],
      DateTime.now()),
  UpdatesClass("Lekan", ["assets/img3.jpg", "assets/img4.jpg"], DateTime.now()),
  UpdatesClass("Tolu", ["assets/img1.jpg", "assets/img4.jpg"], DateTime.now()),
  UpdatesClass("Razak", ["assets/img1.jpg", "assets/img4.jpg"], DateTime.now())
];
