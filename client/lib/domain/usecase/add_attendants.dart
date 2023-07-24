import 'package:proto/proto.dart';

import '../domain.dart';

class AddAttendants {
  AddAttendants(this._attendantRepository);
  final AttendantRepository _attendantRepository;

  Future<void> execute(List<Attendant> attendants) =>
      _attendantRepository.addAttendats(attendants);
}
