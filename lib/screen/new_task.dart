import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoo_app/provider/all_provider.dart';
import 'package:todoo_app/widget/custom_textfield.dart';
import 'package:todoo_app/widget/selection_color.dart';

// class NewTask extends ConsumerStatefulWidget {
//   const NewTask({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _NewTaskState();
// }

// class _NewTaskState extends ConsumerState<NewTask> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

class NewTask extends ConsumerStatefulWidget {
  const NewTask({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewTaskState();
}

class _NewTaskState extends ConsumerState<NewTask> {
  late final TextEditingController titleController;
  late final TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: Container(
        decoration: const BoxDecoration(
          color: CupertinoColors.white,
          shape: BoxShape.rectangle,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      CupertinoIcons.xmark,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: GestureDetector(
                    child: const Text("Save"),
                    onTap: () {
                      ref.read(itemProvider.notifier).edited(
                          titleController.text, descriptionController.text);

                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: Row(
                children: [
                  Text(
                    "Create Task",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CupertinoListTile(
                title: const Text("Title"),
                subtitle: CustomTextField(
                    controller: TextEditingController(),
                    hintText: "e.g Buy Iphone 11 pro"),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CupertinoListTile(
                title: const Text("Description"),
                subtitle: CustomTextField(
                    controller: TextEditingController(),
                    hintText: "[opitional]"),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  SelectionColor(
                    appColor: CupertinoColors.destructiveRed,
                  ),
                  SelectionColor(
                    appColor: CupertinoColors.extraLightBackgroundGray,
                  ),
                  SelectionColor(
                    appColor: CupertinoColors.activeBlue,
                  ),
                  SelectionColor(
                    appColor: CupertinoColors.activeGreen,
                  ),
                  SelectionColor(
                    appColor: CupertinoColors.activeOrange,
                  ),
                  SelectionColor(
                    appColor: CupertinoColors.inactiveGray,
                  ),
                  SelectionColor(
                    appColor: CupertinoColors.systemMint,
                  ),
                  SelectionColor(
                    appColor: CupertinoColors.systemIndigo,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

/**
 * 
 * 

 * 
 */

