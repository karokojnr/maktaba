import 'package:doe/data/data.dart';
import 'package:doe/domain/usecase/add_attendants.dart';
import 'package:doe/domain/usecase/add_many_books.dart';
import 'package:doe/domain/usecase/get_attendants.dart';
import 'package:doe/domain/usecase/get_books.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proto/proto.dart';

import 'add_book.dart';

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
