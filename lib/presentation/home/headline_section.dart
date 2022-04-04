import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news/core/async_value_widget.dart';
import 'package:news/data/models/headline_model.dart';
import 'package:news/logic/headline_provider.dart';

class HeadlineSection extends ConsumerWidget {
  const HeadlineSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _headlines = ref.watch(headlineProvider);
    return Column(
      children: [
        SizedBox(
          height: 250,
          child: AsyncValueWidget<List<HeadlineModel>>(
            value: _headlines,
            data: (_d) {
              return ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ..._d.map(
                    (e) => Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      width: 330,
                      margin: const EdgeInsets.only(
                        left: 14,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Text(
                              e.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Divider(),
                            Text(
                              e.description,
                              maxLines: 5,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              e.description,
                              maxLines: 5,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),

        // SizedBox(
        //   height: 180,
        //   child: _headlines.when(
        //     data: (d) {
        //       return ListView(
        //         scrollDirection: Axis.horizontal,
        //         children: [
        //           ...d.map(
        //             (e) => Container(
        //               decoration: BoxDecoration(
        //                 color: Colors.grey[300],
        //                 borderRadius: BorderRadius.circular(12),
        //               ),
        //               width: 330,
        //               margin: const EdgeInsets.only(
        //                 left: 14,
        //               ),
        //               child: Padding(
        //                 padding: const EdgeInsets.all(8),
        //                 child: Column(
        //                   children: [
        //                     Text(
        //                       e.name,
        //                       style:
        //                           const TextStyle(fontWeight: FontWeight.bold),
        //                     ),
        //                     const Divider(),
        //                     Text(
        //                       e.description,
        //                       maxLines: 5,
        //                       style: const TextStyle(
        //                         fontSize: 16,
        //                       ),
        //                     ),
        //                     Text(
        //                       e.description,
        //                       maxLines: 5,
        //                       style: const TextStyle(
        //                         fontSize: 16,
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ),
        //           ),
        //         ],
        //       );
        //     },
        //     error: (error, s) {
        //       return Text(error.toString());
        //     },
        //     loading: () => const Center(
        //       child: CircularProgressIndicator(),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
