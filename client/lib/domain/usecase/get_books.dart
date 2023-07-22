import 'package:proto/proto.dart';

import '../repository/repository.dart';

class GetBooks {
  final BookRepository _bookRepository;
  GetBooks(this._bookRepository);

  Stream<List<Book>> execute() async* {
    yield* _bookRepository.getBooks();
  }
}
