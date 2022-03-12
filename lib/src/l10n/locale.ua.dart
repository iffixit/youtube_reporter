import 'locale.delegate.dart';

class AppLocaleUa implements AppLocaleDelegate {
  const AppLocaleUa();

  @override
  final appTitle = 'Social Reporter';

  @override
  final next = 'Далі';
  @override
  final submit = 'Підтвердити';

  @override
  final inDevelopment = 'В розробці';

  @override
  final generalError = 'Сталася помилка!';

  @override
  final homeTitle = 'IT Спротив України';
  @override
  final homeAbout = 'Про нас';
  @override
  final homePrivacy = 'Політика конфіденційності';
  @override
  final homeLoginToTelegram = 'Вхід у Telegram';
  @override
  final homeLoggedInTelegram = 'Вхід у Telegram виконано';
  @override
  final homeLoginToYouTube = 'Вхід у YouTube';
  @override
  String homeLoggedInYouTube(String email) =>
      'Вхід у YouTube виконано як $email';
  @override
  final homeReportingInProgress =
      'Триває надсилання скарги. Зачекайте будь-ласка...';

  @override
  final telegramEnterPhoneTitle = 'Введіть номер телефону';
  @override
  final telegramEnterPhoneHint = 'Введіть номер телефону тут...';
  @override
  final telegramEnterPhoneWrongPhone = 'Введено некорректний телефон!';

  @override
  final telegramEnterOtpTitle = 'Введіть OTP код';
  @override
  final telegramEnterOtpHint = 'Введіть OTP код тут...';
}