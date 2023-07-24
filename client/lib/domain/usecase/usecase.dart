
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proto/proto.dart';

import '../../data/data.dart';
import 'add_attendants.dart';
import 'add_book.dart';
import 'add_many_books.dart';
import 'get_attendants.dart';
import 'get_books.dart';

final addBookProvider =
    Provider<AddBook>((ref) => AddBook(ref.read(bookRepositoryProvider)));

final addManyBooksProvider = Provider<AddManyBooks>(
    (ref) => AddManyBooks(ref.read(bookRepositoryProvider)));

final booksStreamProvider = StreamProvider<List<Book>>(
    (ref) => GetBooks(ref.watch(bookRepositoryProvider)).execute());

final addAttendantsProvider = Provider<AddAttendants>(
    (ref) => AddAttendants(ref.read(attendantRepositoryProvider)));

final attendantsStreamProvider = StreamProvider<List<Attendant>>(
    (ref) => GetAttendants(ref.watch(attendantRepositoryProvider)).execute());
