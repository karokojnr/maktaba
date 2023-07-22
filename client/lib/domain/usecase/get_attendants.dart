import 'package:proto/proto.dart';

import '../repository/repository.dart';

class GetAttendants {
  GetAttendants(this._attendantRepository);
  final AttendantRepository _attendantRepository;

  Stream<List<Attendant>> execute() async* {
    yield* _attendantRepository.getAttendants();
  }
}
