import 'package:pwani_lib/core/core.dart';
import 'package:pwani_lib/presentation/controllers/book_dialog_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proto/proto.dart';

class BookDialog extends ConsumerStatefulWidget {
  const BookDialog({
    super.key,
    this.addingMany = false,
  });

  final bool addingMany;

  @override
  ConsumerState<BookDialog> createState() => _BookDialogState();
}

class _BookDialogState extends ConsumerState<BookDialog> {
  final _formKey = GlobalKey<FormState>();
  final _selectedBooks = <Book>[];

  final _titleController = TextEditingController();
  final _authorController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _authorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue>(
      bookDialogControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
    final state = ref.watch(bookDialogControllerProvider);
    Book book = Book();

    return AlertDialog(
      title: state.isLoading ? null : const Text('Add Book'),
      content: state.isLoading
          ? const SizedBox(
              height: 100,
              width: 100,
              child: Center(
                child: Loader(
                  text: 'Adding book, please wait...',
                ),
              ),
            )
          : Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                      labelText: 'Title',
                    ),
                    onChanged: (value) => book.title = value,
                  ),
                  TextFormField(
                    controller: _authorController,
                    decoration: const InputDecoration(
                      labelText: 'Author',
                    ),
                    onChanged: (value) => book.author = value,
                  ),
                  const SizedBox(height: 20.0),
                  if (_selectedBooks.isNotEmpty)
                    Wrap(
                      spacing: 8.0,
                      children: _selectedBooks
                          .map(
                            (book) => Chip(
                              labelPadding: const EdgeInsets.all(2.0),
                              backgroundColor: primaryColor,
                              padding: const EdgeInsets.all(8.0),
                              deleteIconColor: tertiaryColor,
                              label: Text(
                                book.title,
                                style: const TextStyle(
                                  color: tertiaryColor,
                                ),
                              ),
                              onDeleted: () {
                                setState(() {
                                  _selectedBooks.remove(book);
                                });
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
              if (widget.addingMany)
                PrimaryTextButton(
                  text: 'Add to list',
                  textColor: primaryColor,
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) return;
                    _titleController.clear();
                    _authorController.clear();
                    setState(() {
                      _selectedBooks.add(book);
                    });
                  },
                ),
              PrimaryTextButton(
                text: 'Add book${widget.addingMany ? 's' : ''}',
                textColor: primaryColor,
                onPressed: () async {
                  final controller =
                      ref.watch(bookDialogControllerProvider.notifier);
                  widget.addingMany && _selectedBooks.isNotEmpty
                      ? await controller.addManyBooks(_selectedBooks)
                      : await controller.addBook(book);
                },
              ),
            ],
    );
  }
}
