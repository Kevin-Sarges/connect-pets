class ImagesApp {
  static String _pathImagesSVG(String path) {
    return 'assets/images/$path.svg';
  }

  static String _pathImagesPNG(String path) {
    return 'assets/images/$path.png';
  }

  static final logo = _pathImagesPNG('logo');

  static final apple = _pathImagesSVG('apple_icon');
  static final facebook = _pathImagesSVG('facebook_icon');
  static final google = _pathImagesSVG('google_icon');
}
