import 'package:Nkipay/models/link.dart';
import 'package:Nkipay/models/technology.dart';
import 'package:Nkipay/utils/constants.dart';

class ProjectModel {
  final String project;
  final String title;
  final String description;
  final String appPhotos;
  final String projectLink;
  final List<TechnologyModel> techUsed;
  List<LinkModel>? links = [];
  final String? buttonText;

  ProjectModel({
    required this.project,
    required this.title,
    required this.description,
    required this.appPhotos,
    required this.projectLink,
    required this.techUsed,
    this.buttonText,
    this.links,
  });

  static List<ProjectModel> projects = [
    ProjectModel(
      project: "",
      title: "Mobile Recharge",
      description:
          "We provides recharge service in India for the mobile networks like Aircel, Airtel, BSNL - Top Up, BSNL - Validity, Docomo - Special, Docomo - Top Up, Idea, Loop (BPL), MTNL -Top Up, MTNL - Validity, MTS, Reliance - CDMA, Reliance - GSM, Tata Indicom, Uninor - Special, Uninor - Top Up, Virgin - CDMA, Virgin - GSM and Vodafone. Our online recharge service is convenient and fast that facilitates recharge of prepaid mobile at competitive prices through internet.",
      appPhotos: AppConstants.nklogo,
      projectLink: "",
      techUsed: [],
      //buttonText: "Contact us",
    ),
    ProjectModel(
      project: "",
      title: "DTH Recharges",
      description:
          "We provide online/Offline DTH recharge service provider. Our DTH service covers the service providers like Tata Sky, Dish TV, Sun Direct, Videocon D2H and Big TV.You can recharge it at the comfort of your home or office Gprs Based Recharge or simple wright sms based Recharge or online recharge with few clicks of mouse. All you need to have is a computer with internet connection and online recharge of your prepaid DTH account is just few clicks away.",
      appPhotos: AppConstants.nklogo,
      projectLink: "",
      techUsed: [],
      //buttonText: "Contact us",
    ),
    ProjectModel(
      project: "",
      title: "Data Recharges",
      description:
          "We provide online/Offiline Data Recharge services for Airtel, Aircel, BSNL, Idea, Reliance, Videocon, Virgin, Vodafone, MTS, Tata Indicom, Tata Docomo & Uninor.Data card recharging service is another amenity that furthers in the list of the services provided by us. Through our data card recharge service you can recharge prepaid data card connection easily So, the customers can now enjoy the benefit of anytime and anywhere connectivity via Internet.",
      appPhotos: AppConstants.nklogo,
      projectLink: "",
      techUsed: [],
    ),
    ProjectModel(
      project: "",
      title: "Money Transfer",
      description:
          "We Are Offering a simple, fast and enjoyable experience for online Money Transfer. If you are ready to do business on internet then you need a good website that will work on internet as your shop.",
      appPhotos: AppConstants.nklogo,
      projectLink: "",
      techUsed: [],
    ),
    ProjectModel(
      project: "",
      title: "Travel Booking",
      description:
          "Air ticket fares vary every day. Airlines follow a weekly cycle i.e. they have a pricing system for each week. For example, they often offer discounts on some seats on Mondays at midnight; they’re likely to have sales on Tuesdays; domestic fare may be available at better prices.",
      appPhotos: AppConstants.nklogo,
      projectLink: "",
      techUsed: [],
    ),
    ProjectModel(
      project: "",
      title: "Bill Payment",
      description:
          "We Are Offering a simple, fast and enjoyable experience for online recharges and payments. If you are ready to do business on internet then you need a good website that will work on internet as your shop.",
      appPhotos: AppConstants.nklogo,
      projectLink: "",
      techUsed: [],
    ),
  ];

  static List<ProjectModel> demos = [
    ProjectModel(
      project: "Flutter App",
      title: "Flutter Web Portfolio",
      description: "",
      appPhotos: AppConstants.portfolioGif,
      projectLink: "https://github.com/AgnelSelvan/Flutter-Web-Portfolio",
      techUsed: [],
      buttonText: "Github Link",
    ),
  ];
}
