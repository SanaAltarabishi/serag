import 'package:serag/core/config/flavor_config.dart';

class AppImages {
  static String getPath(String relativePath) {
    return '${FlavorConfig.current.assetBasePath}$relativePath';
  }

  //splash :
  static String get lightSplash => getPath('images/splash.png');
  static String get darkSplash => getPath('images/darkSplash.png');
  static String getSplash(bool isDarkTheme) {
    return isDarkTheme ? darkSplash : lightSplash;
  }

  static String get lightFloral => getPath('images/floral.png');
  static String get darkFloral => getPath('images/darkFloral.png');
  static String getFloral(bool isDarkTheme) {
    return isDarkTheme ? darkFloral : lightFloral;
  }

  static String get lightGroup => getPath('images/lightGroup.png');
  static String get darkGroup => getPath('images/darkGroup.png');
  static String getGroup(bool isDarkTheme) {
    return isDarkTheme ? darkGroup : lightGroup;
  }

  static String get quran => getPath('images/quran.png');
  static String get beads => getPath('images/beads.png');
  static String get series => getPath('images/series.png');

  static String get lightFrill => getPath('images/frills.png');
  static String get darkFrill => getPath('images/darkFrills.png');
  static String getFrill(bool isDarkTheme) {
    return isDarkTheme ? darkFrill : lightFrill;
  }

  static String get counter => getPath('images/counter.png');
  static String get meeting => getPath('images/meeting.png');
  static String get mandala => getPath('images/mandala.png');
  static String get employee => getPath('images/employee.png');
  //frame :
  static String get lightFrame => getPath('images/lightFrame.png');
  static String get darkFrame => getPath('images/darkFrame.png');
  static String getFrame(bool isDarkTheme) {
    return isDarkTheme ? darkFrame : lightFrame;
  }
}
