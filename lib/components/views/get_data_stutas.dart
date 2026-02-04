// import 'package:flutter/material.dart';
// import 'empty_view.dart';
// import 'error_view.dart';

// enum GetDataStatus { loading, success, error, empty }

// class _GetDataStatusErrorStore {
//   static final _errors = <GetDataStatus, dynamic>{};
//   static const int _maxErrorsStored = 10; // Prevent unlimited growth

//   static void setError(GetDataStatus status, dynamic error) {
//     if (status == GetDataStatus.error) {
//       // Prevent memory leaks by limiting stored errors
//       if (_errors.length >= _maxErrorsStored) {
//         _errors.clear();
//       }
//       _errors[status] = error;
//     }
//   }

//   static dynamic getError(GetDataStatus status) => _errors[status];

//   // /// Clear all stored errors to prevent memory leaks
//   // static void clearErrors() {
//   //   _errors.clear();
//   // }
// }

// extension GetDataStatusExt on GetDataStatus {
//   GetDataStatus withError(dynamic error) {
//     _GetDataStatusErrorStore.setError(this, error);
//     return this;
//   }

//   dynamic get error => _GetDataStatusErrorStore.getError(this);
// }

// class AsyncStateView extends StatelessWidget {
//   final GetDataStatus status;
//   final WidgetBuilder successBuilder;
//   final WidgetBuilder? loadingBuilder;
//   final WidgetBuilder? errorBuilder;
//   final WidgetBuilder? emptyBuilder;
//   final bool isSliver;
//   final String? errorText;
//   final String? emptyText;
//   final VoidCallback? onRetry;
//   final bool hideLoading;
//   final bool hideError;

//   const AsyncStateView({
//     super.key,
//     required this.status,
//     required this.successBuilder,
//     this.loadingBuilder,
//     this.errorBuilder,
//     this.emptyBuilder,
//     this.isSliver = false,
//     this.errorText,
//     this.emptyText,
//     this.onRetry,
//     this.hideLoading = false,
//     this.hideError = false,
//   });

//   Widget _buildLoading(BuildContext context) {
//     if (hideLoading) {
//       return successBuilder.call(context);
//     }
//     return loadingBuilder?.call(context) ??
//         (isSliver
//             ? const SliverToBoxAdapter(
//                 child: Center(child: CircularProgressIndicator.adaptive()),
//               )
//             : const Center(child: CircularProgressIndicator.adaptive()));
//   }

//   Widget _buildError(BuildContext context) {
//     if (hideError) {
//       try {
//         return successBuilder.call(context);
//       } catch (e) {
//         // Fallback if successBuilder fails
//         return isSliver
//             ? const SliverToBoxAdapter(child: SizedBox.shrink())
//             : const SizedBox.shrink();
//       }
//     }

//     final errorMessage =
//         errorText ?? status.error?.toString() ?? 'An error occurred';

//     try {
//       return errorBuilder?.call(context) ??
//           (isSliver
//               ? SliverToBoxAdapter(
//                   child: Center(
//                     child: ErrorView(
//                       errorMessage: errorMessage,
//                       onRetry: onRetry,
//                     ),
//                   ),
//                 )
//               : Center(
//                   child: ErrorView(
//                     errorMessage: errorMessage,
//                     onRetry: onRetry,
//                   ),
//                 ));
//     } catch (e) {
//       // Fallback error widget if ErrorView fails
//       return isSliver
//           ? SliverToBoxAdapter(
//               child: Center(
//                 child: Text(
//                   'Error: $errorMessage',
//                   style: const TextStyle(color: Colors.red),
//                 ),
//               ),
//             )
//           : Center(
//               child: Text(
//                 'Error: $errorMessage',
//                 style: const TextStyle(color: Colors.red),
//               ),
//             );
//     }
//   }

//   Widget _buildEmpty(BuildContext context) {
//     return emptyBuilder?.call(context) ??
//         (isSliver
//             ? SliverToBoxAdapter(
//                 child: Center(
//                   child: EmptyView(emptyMessage: emptyText, onRetry: onRetry),
//                 ),
//               )
//             : Center(
//                 child: EmptyView(emptyMessage: emptyText, onRetry: onRetry),
//               ));
//   }

//   @override
//   Widget build(BuildContext context) {
//     Widget content;

//     try {
//       switch (status) {
//         case GetDataStatus.loading:
//           content = _buildLoading(context);
//           break;
//         case GetDataStatus.error:
//           content = _buildError(context);
//           break;
//         case GetDataStatus.empty:
//           content = _buildEmpty(context);
//           break;
//         case GetDataStatus.success:
//           try {
//             content = successBuilder(context);
//           } catch (e) {
//             // Fallback if successBuilder fails
//             content = isSliver
//                 ? const SliverToBoxAdapter(
//                     child: Center(
//                       child: Text(
//                         'Error loading content',
//                         style: TextStyle(color: Colors.red),
//                       ),
//                     ),
//                   )
//                 : const Center(
//                     child: Text(
//                       'Error loading content',
//                       style: TextStyle(color: Colors.red),
//                     ),
//                   );
//           }
//           break;
//       }
//     } catch (e) {
//       // Ultimate fallback
//       content = isSliver
//           ? const SliverToBoxAdapter(child: SizedBox.shrink())
//           : const SizedBox.shrink();
//     }

//     if (isSliver) {
//       return content;
//     } else {
//       try {
//         return AnimatedSwitcher(
//           duration: const Duration(milliseconds: 100),
//           transitionBuilder: (Widget child, Animation<double> animation) {
//             return FadeTransition(opacity: animation, child: child);
//           },
//           child: KeyedSubtree(key: ValueKey(status), child: content),
//         );
//       } catch (e) {
//         // Fallback if AnimatedSwitcher fails
//         return content;
//       }
//     }
//   }
// }
