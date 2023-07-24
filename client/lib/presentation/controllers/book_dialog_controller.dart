import 'package:proto/proto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../config/config.dart';
import '../../core/mixins/notifier_mounted.dart';
import '../../domain/domain.dart';

part 'book_dialog_controller.g.dart';

@riverpod
class BookDialogController extends _$BookDialogController with NotifierMounted {
  @override
  FutureOr<void> build() {
    ref.onDispose(setUnmounted);
    // no-op
  }

  Future<void> addBook(Book book) async {
    state = const AsyncValue.loading();
    final value =
        await AsyncValue.guard(() => ref.read(addBookProvider).execute(book));
    if (mounted) {
      state = value;
    }
    ref.read(goRouter).pop();
  }

  Future<void> addManyBooks(List<Book> books) async {
    state = const AsyncValue.loading();
    final value = await AsyncValue.guard(
        () => ref.read(addManyBooksProvider).execute(books));
    if (mounted) {
      state = value;
    }
    ref.read(goRouter).pop();
  }
}
