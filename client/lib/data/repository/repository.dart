import 'package:doe/data/data.dart';
import 'package:doe/data/repository/book_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/domain.dart';
import 'attendant_repository_impl.dart';

final bookRepositoryProvider = Provider<BookRepository>(
    (ref) => BookRepositoryImpl(ref.read(stubProvider)));

final attendantRepositoryProvider = Provider<AttendantRepository>(
    (ref) => AttendantRepositoryImpl(ref.read(stubProvider)));
