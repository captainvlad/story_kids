class Plan {
  bool active;
  final int index;
  final String name;
  final String price;

  Plan({
    required this.index,
    this.price = "\$0.00",
    this.name = "Darmovy",
    this.active = false,
  });
}
