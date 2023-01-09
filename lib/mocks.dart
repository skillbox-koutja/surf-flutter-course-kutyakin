import 'package:places/domain/sight.dart';

final restaurant = Sight(
  name: 'Пряности и радости',
  coordinates: MapCoordinates(lat: 0.04, long: 0.04),
  imageUrl: 'https://24warez.ru/uploads/posts/050318/221314/2.jpg',
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
    imageUrl:
        'https://kartinkin.net/pics/uploads/posts/2022-08/1660314555_62-kartinkin-net-p-khram-vasiliya-blazhennogo-moskva-krasivo-66.jpg',
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
