import 'package:proto/proto.dart';

abstract class BookRepository {
  Future<void> addBook(Book book);
  Future<void> addManyBooks(List<Book> books);
  Stream<List<Book>> getBooks();
}
