import 'package:proto/proto.dart';

import '../repository/repository.dart';

class AddBook {
  final BookRepository _bookRepository;
  AddBook(this._bookRepository);

  Future<void> execute(Book book) => _bookRepository.addBook(book);
}
