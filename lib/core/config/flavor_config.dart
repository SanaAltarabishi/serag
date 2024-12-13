class FlavorConfig {
  final String assetBasePath;

  const FlavorConfig._(this.assetBasePath);

  static const staging = FlavorConfig._('assets/staging/');
  static const production = FlavorConfig._('assets/prod/');

  static FlavorConfig current = staging;

  static void setFlavor(FlavorConfig flavor) {
    current = flavor;
  }


//   static const String apiUrl = 'https://staging.api.example.com';
//   static const String appName = 'App (Staging)';

}