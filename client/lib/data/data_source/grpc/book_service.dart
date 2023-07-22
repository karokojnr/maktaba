import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proto/proto.dart';

final stubProvider = Provider<BookServiceClient>((ref) {
  final channel = ClientChannel(
    'localhost',
    port: 4000,
    options: const ChannelOptions(
      credentials: ChannelCredentials.insecure(),
    ),
  );
  return BookServiceClient(channel);
});
