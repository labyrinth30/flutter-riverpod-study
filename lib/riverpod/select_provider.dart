import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_study/model/shopping_item_model.dart';

final selectProvider = StateNotifierProvider<SelectNotifier, ShoppingItemModel>(
  (ref) => SelectNotifier(),
);

class SelectNotifier extends StateNotifier<ShoppingItemModel> {
  SelectNotifier()
      : super(
          ShoppingItemModel(
            name: "김치",
            quantity: 3,
            hasBought: false,
            isSpicy: true,
          ),
        );
  // 노가다를 하지 않도록
  // void toggleHasBought() {
  //   state = ShoppingItemModel(
  //     name: state.name,
  //     quantity: state.quantity,
  //     hasBought: !state.hasBought,
  //     isSpicy: state.isSpicy,
  //   );
  // }
  void toggleHasBought() {
    state = state.copyWith(hasBought: !state.hasBought);
  }

  void toggleIsSpicy() {
    // const ts = TextStyle(
    //   fontSize: 20,
    //   fontWeight: FontWeight.w500,
    // );

    // // ts2는 ts에서 fontSize만 변경한 것
    // final ts2 = ts.copyWith(
    //   fontSize: 30,
    // );

    state = state.copyWith(
      isSpicy: !state.isSpicy,
    );
  }
}
