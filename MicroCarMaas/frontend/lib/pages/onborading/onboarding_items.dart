class OnboardingInfo {
  final String title;
  final String descriptions;
  final String image;

  OnboardingInfo({
    required this.title,
    required this.descriptions,
    required this.image,
  });
}

class OnboardingItems {
  List<OnboardingInfo> items = [
    OnboardingInfo(
      title:
          "Modern, pratik ve çevre dostu bir ulaşım deneyimi için doğru yerdesiniz!",
      descriptions:
          "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing",
      image: "assets/carSplash.png",
    ),
    OnboardingInfo(
        title:
            "Rahat ve çevreci bir yolculuğa hazır olun! Elektrikli mikro araçlarımızla ulaşım  artık çok daha keyifli.",
        descriptions:
            "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing",
        image: "assets/carSplash2.png"),
    OnboardingInfo(
        title:
            "Elektrikli mikroaraçlarımızın keyfini çıkarmak için uygulamaya geçiş yapabilirsiniz.",
        descriptions:
            "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing",
        image: "assets/carSplash3.png"),
  ];
}
