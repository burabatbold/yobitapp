import 'package:yobit/services/preference.dart';

const String _AUTH_KEY = 'AuthKey';

class AuthRepository {
  final Preference preference;

  AuthRepository(this.preference);

  Future<bool> isUserLoggedIn() async =>
      Future.delayed(Duration(seconds: 2)).then((value) {
        return preference.getBool(_AUTH_KEY, defaultValue: false);
      });

  Future<bool> _updateLoginStatus(bool loggedIn) =>
      Future.delayed(Duration(seconds: 2)).then((value) {
        return preference.putBool(_AUTH_KEY, loggedIn);
      });

  Future<bool> logout() => _updateLoginStatus(false);

  Future<bool> login() => _updateLoginStatus(true);
}
