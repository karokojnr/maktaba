import 'package:proto/proto.dart';

import '../repository/repository.dart';

class AddManyBooks {
  final BookRepository _bookRepository;
  AddManyBooks(this._bookRepository);

  Future<void> execute(List<Book> books) => _bookRepository.addManyBooks(books);
}
