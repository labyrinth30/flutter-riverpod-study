import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_study/model/shopping_item_model.dart';
import 'package:flutter_riverpod_study/riverpod/state_notifier_provider.dart';

// Provider 안에 무언가를 쓸 때는 watch를 사용함
// read말고 watch를 사용해야 상위 Provider도 변경되어야하기 때문임
// provider 안에서 watch를 통해 다른 provider를 사용할 수 있음
final filteredShoppingListProvider = Provider<List<ShoppingItemModel>>(
  (ref) {
    final filterState = ref.watch(filterProvider);
    final shoppingListState = ref.watch(shoppingListProvider);

    if (filterState == FilterState.all) {
      return shoppingListState;
    }
    return shoppingListState.where(
      (element) {
        if (filterState == FilterState.spicy) {
          return element.isSpicy;
        } else {
          return !element.isSpicy;
        }
      },
    ).toList();
  },
);

enum FilterState {
  // 모두
  all,
  // 매운 것
  spicy,
  // 안 매운 것
  notSpicy,
}

final filterProvider = StateProvider<FilterState>((ref) => FilterState.all);
