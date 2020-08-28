class WeatherErrorMessageService {
  static String beutifulVersion(String errorMessage) {
    if (errorMessage.toUpperCase().contains('FAILED HOST LOOKUP')) {
      return 'You\'re offline';
    } else if (errorMessage
        .toUpperCase()
        .contains('GEOLOCATOR ISN\'T AVAILABLE.')) {
      return 'Turn on Geolocator';
    } else {
      return errorMessage;
    }
  }
}
