//
//  Generated code. Do not modify.
//  source: book.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use bookDescriptor instead')
const Book$json = {
  '1': 'Book',
  '2': [
    {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    {'1': 'author', '3': 2, '4': 1, '5': 9, '10': 'author'},
  ],
};

/// Descriptor for `Book`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bookDescriptor = $convert.base64Decode(
    'CgRCb29rEhQKBXRpdGxlGAEgASgJUgV0aXRsZRIWCgZhdXRob3IYAiABKAlSBmF1dGhvcg==');

@$core.Deprecated('Use attendantDescriptor instead')
const Attendant$json = {
  '1': 'Attendant',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'role', '3': 2, '4': 1, '5': 9, '10': 'role'},
  ],
};

/// Descriptor for `Attendant`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List attendantDescriptor = $convert.base64Decode(
    'CglBdHRlbmRhbnQSEgoEbmFtZRgBIAEoCVIEbmFtZRISCgRyb2xlGAIgASgJUgRyb2xl');

@$core.Deprecated('Use attendantsListDescriptor instead')
const AttendantsList$json = {
  '1': 'AttendantsList',
  '2': [
    {'1': 'attendants', '3': 1, '4': 3, '5': 11, '6': '.Attendant', '10': 'attendants'},
  ],
};

/// Descriptor for `AttendantsList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List attendantsListDescriptor = $convert.base64Decode(
    'Cg5BdHRlbmRhbnRzTGlzdBIqCgphdHRlbmRhbnRzGAEgAygLMgouQXR0ZW5kYW50UgphdHRlbm'
    'RhbnRz');

@$core.Deprecated('Use bookListDescriptor instead')
const BookList$json = {
  '1': 'BookList',
  '2': [
    {'1': 'books', '3': 1, '4': 3, '5': 11, '6': '.Book', '10': 'books'},
  ],
};

/// Descriptor for `BookList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bookListDescriptor = $convert.base64Decode(
    'CghCb29rTGlzdBIbCgVib29rcxgBIAMoCzIFLkJvb2tSBWJvb2tz');

@$core.Deprecated('Use emptyDescriptor instead')
const Empty$json = {
  '1': 'Empty',
};

/// Descriptor for `Empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor = $convert.base64Decode(
    'CgVFbXB0eQ==');

