import 'package:url_launcher/url_launcher.dart';

class Utilty {
  static Future<void> openUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  static Future<void> openMail() => openUrl("mailto:nkrecharges@gmail.com");

  static Future<void> openMyLocation() => openUrl("https://goo.gl/maps/");
  static Future<void> openMyPhoneNo() => openUrl("tel:+91-9629638280");
  static Future<void> openWhatsapp() => openUrl("https://wa.me/9629638280");
}
