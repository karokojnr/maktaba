import 'package:pwani_lib/core/core.dart';
import 'package:pwani_lib/presentation/controllers/attendants_dialog_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proto/proto.dart';

class AttendantsDialog extends ConsumerStatefulWidget {
  const AttendantsDialog({
    super.key,
  });

  @override
  ConsumerState<AttendantsDialog> createState() => _AttendantsDialogState();
}

class _AttendantsDialogState extends ConsumerState<AttendantsDialog> {
  final _formKey = GlobalKey<FormState>();
  final _addedAttendants = <Attendant>[];

  final _nameController = TextEditingController();
  final _roleController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _roleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue>(
      attendantsDialogControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
    final state = ref.watch(attendantsDialogControllerProvider);
    Attendant attendant = Attendant();

    return AlertDialog(
      title: state.isLoading ? null : const Text('Add Attendant'),
      content: state.isLoading
          ? const SizedBox(
              height: 100,
              width: 100,
              child: Center(
                child: Loader(
                  text: 'Adding attendant, please wait...',
                ),
              ),
            )
          : Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                    ),
                    onChanged: (value) => attendant.name = value,
                  ),
                  TextFormField(
                    controller: _roleController,
                    decoration: const InputDecoration(
                      labelText: 'Role',
                    ),
                    onChanged: (value) => attendant.role = value,
                  ),
                  const SizedBox(height: 20.0),
                  if (_addedAttendants.isNotEmpty)
                    Wrap(
                      spacing: 8.0,
                      children: _addedAttendants
                          .map(
                            (attendant) => Chip(
                              labelPadding: const EdgeInsets.all(2.0),
                              backgroundColor: primaryColor,
                              padding: const EdgeInsets.all(8.0),
                              deleteIconColor: tertiaryColor,
                              label: Text(
                                attendant.name,
                                style: const TextStyle(
                                  color: tertiaryColor,
                                ),
                              ),
                              onDeleted: () {
                                setState(
                                    () => _addedAttendants.remove(attendant));
                              },
                            ),
                          )
                          .toList(),
                    ),
                ],
              ),
            ),
      actions: state.isLoading
          ? null
          : [
              PrimaryTextButton(
                text: 'Cancel',
                textColor: primaryColor,
                onPressed: () => Navigator.pop(context),
              ),
              PrimaryTextButton(
                text: 'Add to list',
                textColor: primaryColor,
                onPressed: () {
                  if (!_formKey.currentState!.validate()) return;
                  _nameController.clear();
                  _roleController.clear();
                  setState(() {
                    _addedAttendants.add(attendant);
                  });
                },
              ),
              PrimaryTextButton(
                text: 'Add attedants',
                textColor: primaryColor,
                onPressed: () async {
                  if (_addedAttendants.isEmpty) return;
                  final controller =
                      ref.watch(attendantsDialogControllerProvider.notifier);
                  await controller.addAttendants(_addedAttendants);
                },
              ),
            ],
    );
  }
}
