import 'package:places/domain/sight.dart';

final restaurant = Sight(
  name: 'Пряности и радости',
  coordinates: MapCoordinates(lat: 0.04, long: 0.04),
  imageUrl:
      'https://img.freepik.com/free-photo/restaurant-interior_1127-3394.jpg?w=2000&t=st=1673350186~exp=1673350786~hmac=032547a723606804dc49088c1e06a30e43adf4caa5c821578112f0017b2daf5e',
  details:
      'Пряный вкус радостной жизни вместе с\u{00A0}шеф-поваром Изо Дзандзава, благодаря которой у\u{00A0}гостей ресторана есть возможность выбирать из\u{00A0}двух направлений: европейского и\u{00A0}восточного',
  type: 'ресторан',
);

final List<Sight> sights = [
  Sight(
    name: 'Московский Кремль и Красная площадь',
    coordinates: MapCoordinates(lat: 0.01, long: 0.01),
    imageUrl: 'https://www.guideoftheworld.com/wp-content/uploads/map/st_basil_red_square_moscow.jpg',
    details:
        'Кремль – средневековый укрепленный комплекс. В 1990 году Московский Кремль и Красная площадь вошли в список Всемирного наследия ЮНЕСКО',
    type: 'площадь',
  ),
  Sight(
    name: 'Храм Василия Блаженного',
    coordinates: MapCoordinates(lat: 0.02, long: 0.02),
    imageUrl: 'https://sevizm.mos.ru/presscenter/Храм%20Василия%20Блаженного%20с%20сайта%20liveinternet.ru.jpg',
    details: 'Храм Василия Блаженного – самая знаменитая достопримечательность на Красной площади',
    type: 'храм',
  ),
  Sight(
    name: 'Зарядье',
    coordinates: MapCoordinates(lat: 0.03, long: 0.03),
    imageUrl: 'https://24warez.ru/uploads/posts/050318/221314/2.jpg',
    details: 'Зарядье – один из новых парков Москвы',
    type: 'парк',
  ),
  restaurant
];
