class DealsFlight {
  int id, price;
  String image, from, to;
  DateTime start, end;
  DealsFlight({
    required this.id,
    required this.image,
    required this.price,
    required this.from,
    required this.to,
    required this.start,
    required this.end,
  });
}

List<DealsFlight> listDealsFlight = [
  DealsFlight(
    id: 2,
    image: "assets/images/deal2.png",
    price: 8000,
    from: 'Da Nang',
    to: 'Ho Chi Minh',
    start: DateTime(2023, 8, 8),
    end: DateTime(2023, 10, 28),
  ),
  DealsFlight(
    id: 3,
    image: "assets/images/deal3.png",
    price: 8000,
    from: 'Ho Chi Minh',
    to: 'Phu Quoc',
    start: DateTime(2023, 8, 8),
    end: DateTime(2023, 10, 28),
  ),
  DealsFlight(
    id: 4,
    image: "assets/images/deal4.png",
    price: 8000,
    from: 'Ho Chi Minh',
    to: 'Da Nang',
    start: DateTime(2023, 8, 8),
    end: DateTime(2023, 10, 28),
  ),
  DealsFlight(
    id: 5,
    image: "assets/images/deal2.png",
    price: 8000,
    from: 'Da Nang',
    to: 'Ho Chi Minh',
    start: DateTime(2023, 8, 8),
    end: DateTime(2023, 10, 28),
  ),
  DealsFlight(
    id: 6,
    image: "assets/images/deal3.png",
    price: 8000,
    from: 'Ho Chi Minh',
    to: 'Phu Quoc',
    start: DateTime(2023, 8, 8),
    end: DateTime(2023, 10, 28),
  ),
  DealsFlight(
    id: 7,
    image: "assets/images/deal4.png",
    price: 8000,
    from: 'Ho Chi Minh',
    to: 'Da Nang',
    start: DateTime(2023, 8, 8),
    end: DateTime(2023, 10, 28),
  ),
];
