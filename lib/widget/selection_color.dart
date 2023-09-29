// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:todoo_app/provider/all_provider.dart';

// class SelectionColor extends ConsumerWidget {
//   const SelectionColor({super.key, required this.appColor});
//   final Color appColor;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return GestureDetector(
//       onTap: () {
//         ref.read(backgrounColorProvider.notifier).update((state) => appColor);
//       },
//       child: CircleAvatar(
//         backgroundColor: appColor,
//       ),
//     );
//   }
// }
