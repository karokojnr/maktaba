//
//  Generated code. Do not modify.
//  source: book.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'book.pb.dart' as $0;

export 'book.pb.dart';

@$pb.GrpcServiceName('BookService')
class BookServiceClient extends $grpc.Client {
  static final _$addBook = $grpc.ClientMethod<$0.Book, $0.Empty>(
      '/BookService/AddBook',
      ($0.Book value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$addManyBooks = $grpc.ClientMethod<$0.BookList, $0.Empty>(
      '/BookService/AddManyBooks',
      ($0.BookList value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$getBooks = $grpc.ClientMethod<$0.Empty, $0.BookList>(
      '/BookService/GetBooks',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.BookList.fromBuffer(value));
  static final _$addAttendants = $grpc.ClientMethod<$0.AttendantsList, $0.AttendantsList>(
      '/BookService/AddAttendants',
      ($0.AttendantsList value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.AttendantsList.fromBuffer(value));

  BookServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.Empty> addBook($0.Book request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addBook, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> addManyBooks($async.Stream<$0.BookList> request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$addManyBooks, request, options: options).single;
  }

  $grpc.ResponseStream<$0.BookList> getBooks($0.Empty request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$getBooks, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseStream<$0.AttendantsList> addAttendants($async.Stream<$0.AttendantsList> request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$addAttendants, request, options: options);
  }
}

@$pb.GrpcServiceName('BookService')
abstract class BookServiceBase extends $grpc.Service {
  $core.String get $name => 'BookService';

  BookServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Book, $0.Empty>(
        'AddBook',
        addBook_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Book.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.BookList, $0.Empty>(
        'AddManyBooks',
        addManyBooks,
        true,
        false,
        ($core.List<$core.int> value) => $0.BookList.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.BookList>(
        'GetBooks',
        getBooks_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.BookList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AttendantsList, $0.AttendantsList>(
        'AddAttendants',
        addAttendants,
        true,
        true,
        ($core.List<$core.int> value) => $0.AttendantsList.fromBuffer(value),
        ($0.AttendantsList value) => value.writeToBuffer()));
  }

  $async.Future<$0.Empty> addBook_Pre($grpc.ServiceCall call, $async.Future<$0.Book> request) async {
    return addBook(call, await request);
  }

  $async.Stream<$0.BookList> getBooks_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async* {
    yield* getBooks(call, await request);
  }

  $async.Future<$0.Empty> addBook($grpc.ServiceCall call, $0.Book request);
  $async.Future<$0.Empty> addManyBooks($grpc.ServiceCall call, $async.Stream<$0.BookList> request);
  $async.Stream<$0.BookList> getBooks($grpc.ServiceCall call, $0.Empty request);
  $async.Stream<$0.AttendantsList> addAttendants($grpc.ServiceCall call, $async.Stream<$0.AttendantsList> request);
}
