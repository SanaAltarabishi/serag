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

  static const String counter = 'assets/images/counter.png';
  static const String meeting = 'assets/images/meeting.png';
  static const String mandala = 'assets/images/mandala.png';
  static const String employee = 'assets/images/employee.png';
  static const String lightFrame = 'assets/images/lightFrame.png';
  static const String darkFrame = 'assets/images/darkFrame.png';
  static String getFrame(bool isDarkTheme) {
    return isDarkTheme ? darkFrame : lightFrame;
  }
}
