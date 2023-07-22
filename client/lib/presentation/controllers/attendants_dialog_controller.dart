import 'package:proto/proto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../config/config.dart';
import '../../core/mixins/notifier_mounted.dart';
import '../../domain/domain.dart';

part 'attendants_dialog_controller.g.dart';

@riverpod
class AttendantsDialogController extends _$AttendantsDialogController
    with NotifierMounted {
  @override
  FutureOr<void> build() {
    // no-op
  }

  Future<void> addAttendants(List<Attendant> attendants) async {
    state = const AsyncValue.loading();
    final value = await AsyncValue.guard(
        () => ref.read(addAttendantsProvider).execute(attendants));
    if (mounted) {
      state = value;
    }
    ref.read(goRouter).pop();
  }
}
