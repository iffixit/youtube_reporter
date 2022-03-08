import 'package:flutter/material.dart';
import 'package:social_reporter/core.dart';

import 'telegram/auth.dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _telegramLoggedIn = false;
  bool _youtubeLoggedIn = false;
  bool _twitterLoggedIn = false;

  Future<void> _onLoginTelegramPressed() async {
    _telegramLoggedIn =
        await TelegramAuthDialog.open(context, TelegramService());
    setState(() {});
  }

  Future<void> _onLoginYouTubePressed() async {
    _youtubeLoggedIn = await YouTubeService().login();
    setState(() {});
  }

  void _onLoginTwitterPressed() {
    YouTubeService().reportChannelVideos();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: AppTheme.warningColor,
        content: Text(AppLocale.inDevelopment),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            _AdaptiveButton(
              loggedIn: _telegramLoggedIn,
              onPressed: _onLoginTelegramPressed,
              title: AppLocale.homeLoginToTelegram,
              successText: AppLocale.homeLoggedInTelegram,
            ),
            const SizedBox(height: 24),
            _AdaptiveButton(
              loggedIn: _youtubeLoggedIn,
              onPressed: _onLoginYouTubePressed,
              title: AppLocale.homeLoginToYouTube,
              successText: AppLocale.homeLoggedInYouTube,
            ),
            const SizedBox(height: 24),
            _AdaptiveButton(
              loggedIn: _twitterLoggedIn,
              onPressed: _onLoginTwitterPressed,
              title: AppLocale.homeLoginToTwitter,
              successText: AppLocale.homeLoggedInTwitter,
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _AdaptiveButton extends StatelessWidget {
  const _AdaptiveButton({
    Key? key,
    required this.loggedIn,
    required this.onPressed,
    required this.title,
    required this.successText,
  }) : super(key: key);

  final bool loggedIn;
  final VoidCallback? onPressed;
  final String title;
  final String successText;

  @override
  Widget build(BuildContext context) {
    Widget content;
    if (loggedIn) {
      content = _LoggedIn(text: successText);
    } else {
      content = _Button(
        onPressed: onPressed,
        title: title,
      );
    }

    return Container(
      height: 40,
      alignment: Alignment.center,
      child: content,
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    Key? key,
    required this.onPressed,
    required this.title,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 300,
          child: ElevatedButton(
            onPressed: onPressed,
            child: Text(title),
          ),
        ),
      ],
    );
  }
}

class _LoggedIn extends StatelessWidget {
  const _LoggedIn({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text),
        const SizedBox(width: 8),
        const Icon(
          Icons.check_circle,
          color: AppTheme.successColor,
        ),
      ],
    );
  }
}
