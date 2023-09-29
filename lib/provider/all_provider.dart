import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoo_app/model/item_model.dart';
import 'package:todoo_app/provider/notifier/item_notifier.dart';

final itemProvider = StateNotifierProvider<ItemNotifier, List<ItemModel>>(
    (ref) => ItemNotifier());

final backgrounColorProvider =
    StateProvider<Color>((ref) => CupertinoColors.white);
