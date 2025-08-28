import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:three_thousand_words/app/core/remote_config/remote_config_service.dart';

class RemoteConfigServiceImpl implements RemoteConfigService {
  final FirebaseRemoteConfig _remoteConfig;

  RemoteConfigServiceImpl({required FirebaseRemoteConfig remoteConfig})
      : _remoteConfig = remoteConfig;

  @override
  Future<void> init() async {
    await _remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 10),
      minimumFetchInterval: const Duration(hours: 1),
    ));

    await _remoteConfig.fetchAndActivate();
  }

  @override
  String get googleClientId => _remoteConfig.getString('GOOGLE_WEB_CLIENT_ID');
}
