class WeatherErrorMessageService {
  static String beutifulVersion(String errorMessage) {
    if (errorMessage.toUpperCase().contains('FAILED HOST LOOKUP')) {
      return 'You\'re offline';
    } else {
      return errorMessage;
    }
  }
}
