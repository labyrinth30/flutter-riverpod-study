class ShoppingItemModel {
  // 이름
  final String name;
  // 개수
  final int quantity;
  // 구매 여부
  final bool hasBought;
  // 매운 지 여부
  final bool isSpicy;

  ShoppingItemModel({
    required this.name,
    required this.quantity,
    required this.hasBought,
    required this.isSpicy,
  });

  // 입력이 된 것만 바꾸는 copyWith 메서드
  ShoppingItemModel copyWith({
    String? name,
    int? quantity,
    bool? hasBought,
    bool? isSpicy,
  }) {
    return ShoppingItemModel(
      // name이 null이면 this.name, 아니면 name
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      hasBought: hasBought ?? this.hasBought,
      isSpicy: isSpicy ?? this.isSpicy,
    );
  }
}
