


class CartItem {
  final int id;
   double price;
   double priceWithVat;
  final String name;
  final String name2;
  final String unitId;
  final String description;
  double quantity;
  final double discountRate;
  final double discountAmount;
  final double vat;
  final double vatAmount;
  final double total;
  final bool priceIncludeVat;

  CartItem({
    required this.id,
    required this.price,
    required this.priceWithVat,
    required this.name,
    required this.name2,
    required this.unitId,
    required this.description,
    required this.quantity,
    required this.discountRate,
    required this.discountAmount,
    required this.vat,
    required this.vatAmount,
    required this.total,
    required this.priceIncludeVat,
  });

  // Constructor logic to calculate values
  CartItem.calculate({
    required int id,
    required String name,
    required String name2,
    required double price,
    required double priceWithVat,
    required String unitId,
    required String description,
    required double quantity,
    required double discountRate,
    required double vat,
    required bool priceIncludeVat,
  })  : id = id,
        price = priceIncludeVat? price-calculateVat(price, priceIncludeVat):price,
    priceWithVat = priceWithVat,
        unitId = unitId,
        name = name,
        priceIncludeVat = priceIncludeVat,
        name2 = name2,
        description = description,
        quantity = quantity,
        discountRate = discountRate,
        discountAmount = (discountRate * quantity),
        vat = vat,
        vatAmount =calculateVat(price, priceIncludeVat) * quantity,
        total = (priceIncludeVat? price-calculateVat(price, priceIncludeVat):price) * quantity;




  // Convert a CartItem object to a map
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "price": price,
      "priceWithVat": priceWithVat,
      "name": name,
      "name2": name2,
      "unitId": unitId,
      "description": description,
      "quantity": quantity,
      "discountRate": discountRate,
      "discountAmount": discountAmount,
      "vat": vat,
      "vatAmount": vatAmount,
      "total": total,
      "priceIncludeVat": priceIncludeVat,
    };
  }


  // Convert a JSON map to a CartItem object
  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      price: json['price'],
      priceWithVat: json['priceWithVat'],
      name: json['name'],
      name2: json['name2'],
      unitId: json['unitId'],
      description: json['description'],
      quantity: json['quantity'],
      discountRate: json['discountRate'],
      discountAmount: json['discountAmount'],
      vat: json['vat'],
      vatAmount: json['vatAmount'],
      total: json['total'],
      priceIncludeVat: json['priceIncludeVat'],
    );
  }
}

double calculateVat(double price, bool priceIncludeVat) {
  if (!priceIncludeVat) {
    // إذا كان السعر غير شامل الضريبة
    return double.parse((price * 0.15).toStringAsFixed(2));
  } else {
    // إذا كان السعر شامل الضريبة
    return double.parse((price * (0.15 / 1.15)).toStringAsFixed(2));
  }
}