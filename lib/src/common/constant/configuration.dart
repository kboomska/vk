abstract final class Configuration {
  // --- COMMON --- //

  static const appTitle = String.fromEnvironment('APP_TITLE');

  // --- API --- //

  static const clientId = String.fromEnvironment('CLIENT_ID');
  static const apiHost = String.fromEnvironment('API_HOST');
  static const display = String.fromEnvironment('DISPLAY');
  static const scope = String.fromEnvironment('SCOPE');
  static const responseType = String.fromEnvironment('RESPONSE_TYPE');
  static const versionApi = String.fromEnvironment('VERSION_API');
  static const language = String.fromEnvironment('LANGUAGE');

  // --- Authentication --- //

  static const authHost = String.fromEnvironment('AUTH_HOST');
  static const redirectUri = String.fromEnvironment('REDIRECT_URI');
}
