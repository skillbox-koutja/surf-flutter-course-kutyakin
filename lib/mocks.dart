import 'package:places/domain/map/map_coordinates.dart';
import 'package:places/domain/sight/category/value.dart';
import 'package:places/domain/sight/sight.dart';
import 'package:places/domain/sight/sight_photo.dart';
import 'package:places/domain/sight/sight_type.dart';

const centerPoint = MapCoordinates(lat: 55.75435144407907, long: 37.620671454713715);

final List<Sight> sights = [
   Sight(
    name: 'Московский Кремль и Красная площадь',
    coordinates: const MapCoordinates(lat: 55.75435144407907, long: 37.620671454713715),
    photos: [SightPhoto(imageUrl: 'https://www.guideoftheworld.com/wp-content/uploads/map/st_basil_red_square_moscow.jpg')],
    details:
        'Кремль – средневековый укрепленный комплекс. В 1990 году Московский Кремль и Красная площадь вошли в список Всемирного наследия ЮНЕСКО',
    type: SightType.other,
  ),
   Sight(
    name: 'Храм Василия Блаженного',
    coordinates: const MapCoordinates(lat: 55.75264986188569, long: 37.62378420325405),
    photos: [SightPhoto(imageUrl: 'https://sevizm.mos.ru/presscenter/Храм%20Василия%20Блаженного%20с%20сайта%20liveinternet.ru.jpg')],
    details: 'Храм Василия Блаженного – самая знаменитая достопримечательность на Красной площади',
    type: SightType.other,
  ),
   Sight(
    name: 'Зарядье',
    coordinates: const MapCoordinates(lat: 55.75142615694952, long: 37.62910162500578),
    photos: [SightPhoto(imageUrl: 'https://24warez.ru/uploads/posts/050318/221314/2.jpg')],
    details: 'Зарядье – один из новых парков Москвы',
    type: SightType.park,
  ),
   Sight(
    name: 'Парк Горького',
    coordinates: const MapCoordinates(lat: 55.73187544630208, long: 37.603593522008374),
    photos: [SightPhoto(imageUrl: 'https://www.mos.ru/upload/newsfeed/newsfeed/Katok_otkritie-0206_1.jpg')],
    details:
        'Центральный парк столицы, чьи территории посещает более 40 000 человек в будние и 250 000 в выходные и праздничные дни. С 2011 года парк задает новые стандарты, став первым парком мирового уровня в России, пространством для отдыха, спорта, танцев и игр на свежем воздухе.',
    type: SightType.park,
  ),
  Sight(
    name: 'Корчма',
    coordinates: const MapCoordinates(lat: 55.741400987822885, long: 37.58595205328104),
    photos: [SightPhoto(imageUrl: 'https://img.freepik.com/free-photo/traditional-russian-salad-olivier_2829-6252.jpg?w=2000&t=st=1673379775~exp=1673380375~hmac=69a02528813bf51d843c8ac5d9808c7b611ffc2ba3102f875d83e8b8026a57c3')],
    details: 'Уникальный стиль подачи. Традиционные рецепты. Незабываемый вкус',
    type: SightType.restaurant,
  ),
  Sight(
    name: 'Пряности и радости',
    coordinates: const MapCoordinates(lat: 55.74001855028845, long: 37.59595459157536),
    photos: [SightPhoto(imageUrl: 'https://img.freepik.com/free-photo/restaurant-interior_1127-3394.jpg?w=2000&t=st=1673350186~exp=1673350786~hmac=032547a723606804dc49088c1e06a30e43adf4caa5c821578112f0017b2daf5e')],
    details:
        'Пряный вкус радостной жизни вместе с\u{00A0}шеф-поваром Изо Дзандзава, благодаря которой у\u{00A0}гостей ресторана есть возможность выбирать из\u{00A0}двух направлений: европейского и\u{00A0}восточного',
    type: SightType.restaurant,
  ),
];

List<CategoryFilterValue> getCategoryFilterValues() => [
      CategoryFilterValue(
        type: SightType.hotel,
      ),
      CategoryFilterValue(
        type: SightType.restaurant,
      ),
      CategoryFilterValue(
        type: SightType.park,
      ),
      CategoryFilterValue(
        type: SightType.museum,
      ),
      CategoryFilterValue(
        type: SightType.cafe,
      ),
      CategoryFilterValue(
        type: SightType.other,
      ),
    ];
