import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoo_app/model/item_model.dart';
import 'package:uuid/uuid.dart';

class ItemNotifier extends StateNotifier<List<ItemModel>> {
  ItemNotifier()
      : super([
          ItemModel(
              id: const Uuid().v4(),
              title: "Buy Iphone 15 pro max",
              subTitle: "Go to Iphone 15 pro max",
              isCompleted: false),
          ItemModel(
              id: const Uuid().v4(),
              title: "Buy Iphone 14 pro max",
              subTitle: "Go to Iphone 14 pro max",
              isCompleted: false),
          ItemModel(
              id: const Uuid().v4(),
              title: "Buy Iphone 13 pro max",
              subTitle: "Go to Iphone 13 pro max",
              isCompleted: false),
        ]);

  void toggle(String id) {
    state = [
      for (var item in state)
        if (item.id == id)
          ItemModel(
              id: id,
              title: item.title,
              subTitle: item.subTitle,
              isCompleted: !item.isCompleted)
        else
          item
    ];
  }

  void edited(String title, String desc) {
    var item = ItemModel(
        id: const Uuid().v4(),
        title: title,
        subTitle: desc,
        isCompleted: false);

    state = [...state, item];
  }
}
