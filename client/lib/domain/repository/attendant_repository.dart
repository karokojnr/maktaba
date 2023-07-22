import 'package:proto/proto.dart';

abstract class AttendantRepository {
  Future<void> addAttendats(List<Attendant> attendants);
  Stream<List<Attendant>> getAttendants();
}
