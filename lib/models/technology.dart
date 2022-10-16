import 'package:Nkipay/utils/constants.dart';

class TechnologyModel {
  final String name;
  final String logo;

  TechnologyModel(this.name, this.logo);
}

class TechnologyConstants {
  static TechnologyModel python =
      TechnologyModel("Ticket Booking", AppConstants.pythonImage);
  static TechnologyModel php = TechnologyModel("Python", AppConstants.phpImage);
  static TechnologyModel flutter =
      TechnologyModel("mobile recharge", AppConstants.flutterImage);
  static TechnologyModel flask =
      TechnologyModel("AEPS Aadhaar", AppConstants.flaskImage);
  static TechnologyModel firebase =
      TechnologyModel("Data Recharge", AppConstants.firebaseImage);
  static TechnologyModel razorPay =
      TechnologyModel("Razor Pay", AppConstants.razorPayImage);
  static TechnologyModel cPlus =
      TechnologyModel("Bill payments", AppConstants.cPlusImage);
  static TechnologyModel javascript =
      TechnologyModel("Money transfer", AppConstants.javascriptImage);
  static TechnologyModel swift =
      TechnologyModel("DTH recharge", AppConstants.swiftImage);
  static TechnologyModel sceneKit =
      TechnologyModel("and many more", AppConstants.sceneKitImage);

  static List<TechnologyModel> technologyLearned = [
    flutter,
    swift,
    cPlus,
    python,
    javascript,
    flask,
    firebase,
    sceneKit
  ];
}
