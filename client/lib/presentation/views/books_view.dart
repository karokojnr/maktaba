import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proto/proto.dart';

import '../../core/core.dart';
import '../../domain/domain.dart';
import '../components/components.dart';

class BooksView extends ConsumerWidget {
  const BooksView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget<List<Book>>(
      value: ref.watch(booksStreamProvider),
      data: (books) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];
                  return ListTile(
                    title: Text(book.title),
                    subtitle: Text(book.author),
                  );
                }),
          ),
          Container(
            decoration: const BoxDecoration(
              color: primaryColor,
            ),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PrimaryTextButton(
                  onPressed: () => _showBookDialog(
                    context,
                    ref,
                  ),
                  text: 'Add Book',
                ),
                const Text(
                  '|',
                  style: TextStyle(color: tertiaryColor),
                ),
                PrimaryTextButton(
                  onPressed: () => _showBookDialog(context, ref, true),
                  text: 'Add many Books',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _showBookDialog(BuildContext context, WidgetRef ref,
          [bool addingMany = false]) =>
      showDialog(
          context: context,
          builder: (context) => BookDialog(
                addingMany: addingMany,
              ));
}
