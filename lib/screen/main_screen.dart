import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoo_app/model/item_model.dart';
import 'package:todoo_app/provider/all_provider.dart';

import 'new_task.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<ItemModel> item = ref.watch(itemProvider);

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: const Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            "To Do",
            style: TextStyle(fontSize: 20),
          ),
        ),
        automaticallyImplyLeading: false,
        trailing: CupertinoButton(
          padding: const EdgeInsets.all(0),
          child: const Icon(CupertinoIcons.add),
          onPressed: () async {
            await shotBottomSheet(context);
          },
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            const CupertinoListTile(
              title: Text(
                'Tasks',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
              ),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            CupertinoListTile(
              trailing: CupertinoSwitch(
                value: true,
                onChanged: (value) {},
              ),
              title: const Text(
                'Hide Completed Tasks',
              ),
            ),
            const Padding(padding: EdgeInsets.all(20)),
            Expanded(
              child: ListView.builder(
                itemCount: item.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: ref.watch(backgrounColorProvider),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: CupertinoListTile(
                        title: Text(item[index].title),
                        subtitle: Text(item[index].subTitle),
                        trailing: CupertinoCheckbox(
                          value: item[index].isCompleted,
                          onChanged: (value) {
                            ref
                                .read(itemProvider.notifier)
                                .toggle(item[index].id);
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Future shotBottomSheet(BuildContext context) {
    return showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return const SafeArea(
          child: NewTask(),
        );
      },
    );
  }
}
