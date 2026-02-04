// import 'package:chat_bot/core/extensions/context_extension.dart';
// import 'package:chat_bot/core/utils/app_styles.dart';
// import 'package:deraman/core/extension/context_extension.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:gap/gap.dart';

// class EmptyView extends StatelessWidget {
//   const EmptyView({super.key, this.onRetry, this.emptyMessage});

//   final String? emptyMessage;
//   final VoidCallback? onRetry;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       spacing: 12,
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         const Gap(12),
//         SvgPicture.asset(Assets.iconsEmpty, width: 200, height: 200),
//         Text(
//           emptyMessage ?? "No data",
//           style: AppStyles.fontStyle14,
//           textAlign: TextAlign.center,
//         ),
//         if (onRetry != null)
//           SizedBox(
//             width: context.width - 100,
//             child: ElevatedButton.icon(
//               onPressed: onRetry,
//               icon: const Icon(Icons.refresh),
//               label: Text('Refresh'),
//             ),
//           ),
//       ],
//     );
//   }
// }
