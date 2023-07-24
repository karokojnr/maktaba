import 'package:pwani_lib/core/core.dart';
import 'package:pwani_lib/domain/usecase/usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proto/proto.dart';

import '../components/components.dart';

class AttendantsView extends ConsumerWidget {
  const AttendantsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: AsyncValueWidget<List<Attendant>>(
              value: ref.watch(attendantsStreamProvider),
              data: (attendants) => ListView.builder(
                  itemCount: attendants.length,
                  itemBuilder: (context, index) {
                    final attendant = attendants[index];
                    return ListTile(
                      title: Text(attendant.name),
                      subtitle: Text(attendant.role),
                    );
                  })),
        ),
        Container(
          decoration: const BoxDecoration(
            color: primaryColor,
          ),
          width: double.infinity,
          child: PrimaryTextButton(
            onPressed: () => _showAttendantsDialog(context, ref),
            text: 'Add Attendant',
          ),
        ),
      ],
    );
  }

  _showAttendantsDialog(BuildContext context, WidgetRef ref) => showDialog(
      context: context, builder: (context) => const AttendantsDialog());
}
