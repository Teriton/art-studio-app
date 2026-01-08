class AppConfig {
  static const String _flavor = String.fromEnvironment(
    'FLAVOR',
    defaultValue: 'test',
  );

  static bool get isTest => _flavor == 'test';
  static bool get isDevelopment => _flavor == 'development';
  static bool get isProduction => _flavor == 'production';
}
