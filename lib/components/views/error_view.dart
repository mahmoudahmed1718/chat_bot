// import 'package:chat_bot/core/extensions/context_extension.dart';
// import 'package:chat_bot/core/utils/app_styles.dart';
// import 'package:chat_bot/core/utils/assets.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:gap/gap.dart';

// class ErrorView extends StatelessWidget {
//   const ErrorView({super.key, required this.errorMessage, this.onRetry});

//   final String errorMessage;
//   final VoidCallback? onRetry;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       spacing: 12,
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         const Gap(12),
//         SvgPicture.asset(Assets.iconsError, width: 200, height: 200),
//         Text(
//           errorMessage,
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
