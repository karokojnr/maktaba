import 'package:doe/domain/domain.dart';
import 'package:proto/proto.dart';

class AddAttendants {
  AddAttendants(this._attendantRepository);
  final AttendantRepository _attendantRepository;

  Future<void> execute(List<Attendant> attendants) =>
      _attendantRepository.addAttendats(attendants);
}
