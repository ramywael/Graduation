class OnBoardingModel{
  final  String image;
  final String? title;
  final String? description;
  final String? buttonText;

  OnBoardingModel({required this.image,this.description,this.buttonText,  this.title});


}

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
    image: "assets/images/onBoarding1.png",
    title: "Blood Chain",
  ),
  OnBoardingModel(
    image: "assets/images/onBoarding2.png",
    title: "BloodChain",
    buttonText: "Save Life",
    description: "Welcome to Blood Chain, the platform to donate life-saving blood and connect with those in need!",
  ),
  OnBoardingModel(
    image: "assets/images/onBoarding3.png",
    buttonText: "Start",
  ),
];