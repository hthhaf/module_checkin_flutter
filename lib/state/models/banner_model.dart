class BannerSlider {
  int id;
  String image, title, detail;
  DateTime createdDate;

  BannerSlider(
      {required this.id,
      required this.image,
      required this.title,
      required this.detail,
      required this.createdDate});
}

List<BannerSlider> listBanners = [
  BannerSlider(
    id: 1,
    image: "assets/images/Banner1.png",
    title: "BARGAIN PRICE FOR AUTUMN FLIGHTS",
    detail: "",
    createdDate: DateTime(2023, 8, 2),
  ),
  BannerSlider(
    id: 1,
    image: "assets/images/Banner2.png",
    title: "FALL IN LOVE WITH FLYING",
    detail: "",
    createdDate: DateTime(2023, 8, 2),
  ),
  BannerSlider(
    id: 1,
    image: "assets/images/Banner4.png",
    title: "10% DISCOUNT ON PRE-ORDER HOT MEAL",
    detail: "",
    createdDate: DateTime(2023, 8, 1),
  ),
  BannerSlider(
    id: 1,
    image: "assets/images/Banner3.png",
    title: "TASTED HOTMEAL IN FLIGHT",
    detail: "",
    createdDate: DateTime(2023, 7, 28),
  ),
  BannerSlider(
    id: 1,
    image: "assets/images/Banner4.png",
    title: "IOE PILOT PROGRAM RECRUITMENT",
    detail: "",
    createdDate: DateTime(2023, 7, 27),
  ),
];
