import 'dart:async';

import 'package:proto/proto.dart';

import '../../domain/domain.dart';

class BookRepositoryImpl implements BookRepository {
  BookRepositoryImpl(this._stub);
  final BookServiceClient _stub;


  @override
  Future<void> addBook(Book book) => _stub.addBook(book);

  @override
  Future<void> addManyBooks(List<Book> books) =>
      _stub.addManyBooks(_generateBookList(books));

  

  @override
  Stream<List<Book>> getBooks() async* {
    yield* _stub.getBooks(Empty()).map((e) {
      return e.books;
    });
  }

  

  /// Helper methods

  Stream<BookList> _generateBookList(List<Book> books) async* {
    yield BookList()..books.addAll(books);
  }

  
}
