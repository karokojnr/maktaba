import 'dart:async';

import 'package:proto/proto.dart';

import '../../domain/domain.dart';

class AttendantRepositoryImpl extends AttendantRepository {
  AttendantRepositoryImpl(this._stub);
  final BookServiceClient _stub;

  final StreamController<List<Attendant>> _attendantsStreamController =
      StreamController.broadcast();

  @override
  Future<void> addAttendats(List<Attendant> attendants) async {
    final resultStream = _stub
        .addAttendants(_generateAttendantsList(attendants))
        .map((e) => e.attendants);
    _attendantsStreamController.sink.addStream(resultStream);
  }

  @override
  Stream<List<Attendant>> getAttendants() async* {
    yield* _attendantsStreamController.stream;
  }

  Stream<AttendantsList> _generateAttendantsList(
      List<Attendant> attendants) async* {
    yield AttendantsList()..attendants.addAll(attendants);
  }
}
