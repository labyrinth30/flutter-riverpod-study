// StateNotifierProvider를 선언할 때는 클래스를 선언해야함
// StateNotifier를 상속해야함
// 상태관리할 타입이 어떤 건지 지정해줘야함
// 클래스이기 떄문에 메소드로 상태 관리 가능
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_study/model/shopping_item_model.dart';

// 첫 번째 제네릭으로 어떤 노티파이어를 사용할건지
// 두 번째 제네릭으로 관리하는 상태의 타입을 넣기
final shoppingListProvider =
    StateNotifierProvider<ShoppingListNotifier, List<ShoppingItemModel>>(
  (ref) => ShoppingListNotifier(),
);

class ShoppingListNotifier extends StateNotifier<List<ShoppingItemModel>> {
  // 생성자는 처음에 어떤 값으로 상태를 초기화할 지 적어줘야함
  ShoppingListNotifier()
      : super(
          [
            ShoppingItemModel(
              name: "Kimchi",
              quantity: 2,
              hasBought: false,
              isSpicy: true,
            ),
            ShoppingItemModel(
              name: "Lemon",
              quantity: 5,
              hasBought: true,
              isSpicy: false,
            ),
            ShoppingItemModel(
              name: "Pepper",
              quantity: 1,
              hasBought: true,
              isSpicy: true,
            ),
            ShoppingItemModel(
              name: "Salt",
              quantity: 3,
              hasBought: false,
              isSpicy: false,
            ),
            ShoppingItemModel(
              name: "Sugar",
              quantity: 6,
              hasBought: true,
              isSpicy: false,
            ),
          ],
        );

  void toggleHasBought({required String name}) {
    // 현재 값을 가져오고 싶으면 state 호출
    state = state
        .map((e) => e.name == name
            ? ShoppingItemModel(
                name: e.name,
                quantity: e.quantity,
                hasBought: !e.hasBought,
                isSpicy: e.isSpicy,
              )
            : e)
        .toList();
  }
}
