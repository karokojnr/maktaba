import 'dart:async';

import 'package:proto/proto.dart';

import '../data/data_sources/database_data_source.dart';
import '../data/db/data.dart';

class BookService extends BookServiceBase {
  final DatabaseDataSource _databaseDataSource = DatabaseDataSource();
  final StreamController<List<Book>> _booksStream =
      StreamController.broadcast();

  @override
  Future<Empty> addBook(ServiceCall call, Book request) async {
    _databaseDataSource.addBook(request);
    _booksStream.add(books);
    return Empty();
  }

  @override
  Future<Empty> addManyBooks(ServiceCall call, Stream<BookList> request) async {
    // ! get the current list
    final List<Book> newBooks = books;
    await for (var bookList in request) {
      newBooks.addAll(bookList.books);
      if (bookList.books.isEmpty) break;
    }
    // !Add to existing list plus new books to stream
    _booksStream.add(newBooks);
    return Empty();
  }

  @override
  Stream<BookList> getBooks(ServiceCall call, request) async* {
    //! get current books
    yield BookList()..books.addAll(_databaseDataSource.getBooks());
    //! listen to any additions in the stream
    await for (var book in _booksStream.stream) {
      yield BookList()..books.addAll(book);
    }
  }

  @override
  Stream<AttendantsList> addAttendants(
      ServiceCall call, Stream<AttendantsList> request) async* {
    final List<Attendant> attendants = [];
    await for (var attendantList in request) {
      attendants.addAll(attendantList.attendants);
      if (attendantList.attendants.isEmpty) break;
    }
    yield AttendantsList()..attendants.addAll(attendants);
  }
}
