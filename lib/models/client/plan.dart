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

  String get currency {
    Map<String, String> currencySymbolMap = {
      "€": "EUR",
      "£": "GBP",
      "\$": "USD",
    };

    return currencySymbolMap[price[0]]!;
  }

  double get priceValue => double.parse(
        price.substring(1),
      );
}
