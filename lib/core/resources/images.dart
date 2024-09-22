class AppImages {
  //splash :
  static const String lightSplash = 'assets/images/splash.png';
  static const String darkSplash = 'assets/images/darkSplash.png';
  static String getSplash(bool isDarkTheme) {
    return isDarkTheme ? darkSplash : lightSplash;
  }

  static const String lightFloral = 'assets/images/floral.png';
  static const String darkFloral = 'assets/images/darkFloral.png';
  static String getFloral(bool isDarkTheme) {
    return isDarkTheme ? darkFloral : lightFloral;
  }

  static const String lightGroup = 'assets/images/lightGroup.png';
  static const String darkGroup = 'assets/images/darkGroup.png';
  static String getGroup(bool isDarkTheme) {
    return isDarkTheme ? darkGroup : lightGroup;
  }

  static const String quran = 'assets/images/quran.png';
  static const String beads = 'assets/images/beads.png';
  static const String series = 'assets/images/series.png';

  static const String lightFrill = 'assets/images/frills.png';
  static const String darkFrill = 'assets/images/darkFrills.png';
  static String getFrill(bool isDarkTheme) {
    return isDarkTheme ? darkFrill : lightFrill;
  }
}
