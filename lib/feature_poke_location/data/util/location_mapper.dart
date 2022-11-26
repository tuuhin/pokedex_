import 'package:flutter/animation.dart';

class LocationMapper {
  final Color color;
  final String? imgUrl;
  final String? url;
  LocationMapper({
    required this.color,
    this.imgUrl,
    this.url,
  });

  static LocationMapper getData(String location) {
    Map<String, LocationMapper> map = <String, LocationMapper>{
      'kanto': LocationMapper._kanto(),
      'johto': LocationMapper._jhoto(),
      'hoenn': LocationMapper._hoenn(),
      'sinnoh': LocationMapper._sinnoh(),
      'unova': LocationMapper._unova(),
      'kalos': LocationMapper._kalos(),
      'alola': LocationMapper._alola(),
      'galar': LocationMapper._galar(),
      'hisui': LocationMapper._husui()
    };
    return map[location.toLowerCase()] ?? LocationMapper._unknown();
  }

  factory LocationMapper._kanto() => LocationMapper(
      color: const Color(0xff80BB1D),
      imgUrl:
          'https://archives.bulbagarden.net/media/upload/thumb/a/ae/Hollywood.png/225px-Hollywood.png',
      url: 'https://bulbapedia.bulbagarden.net/wiki/Kanto');

  factory LocationMapper._jhoto() => LocationMapper(
        color: const Color(0xffCAC02E),
        imgUrl:
            'https://archives.bulbagarden.net/media/upload/thumb/0/02/Charicific_Valley_main_area.png/225px-Charicific_Valley_main_area.png',
        url: 'https://bulbapedia.bulbagarden.net/wiki/Jhoto',
      );

  factory LocationMapper._hoenn() => LocationMapper(
        color: const Color(0xff67C1AB),
        imgUrl:
            'https://archives.bulbagarden.net/media/upload/archive/a/af/20210508145044%21Forbidden_Forest_Gate.png',
        url: 'https://bulbapedia.bulbagarden.net/wiki/Hoenn',
      );

  factory LocationMapper._sinnoh() => LocationMapper(
        color: const Color(0xff9072A3),
        imgUrl:
            'https://archives.bulbagarden.net/media/upload/archive/5/5e/20170323234444%21Chocovine_Town.png',
        url: 'https://bulbapedia.bulbagarden.net/wiki/Sinnoh',
      );

  factory LocationMapper._unova() => LocationMapper(
        color: const Color(0xff6BAECE),
        imgUrl:
            'https://archives.bulbagarden.net/media/upload/thumb/2/23/Rainbow_Valley.png/225px-Rainbow_Valley.png',
        url: 'https://bulbapedia.bulbagarden.net/wiki/Unova',
      );

  factory LocationMapper._kalos() => LocationMapper(
        color: const Color(0xffCB0B4F),
        imgUrl:
            'https://archives.bulbagarden.net/media/upload/thumb/e/e0/Pikachu_Land.png/225px-Pikachu_Land.png',
        url: 'https://bulbapedia.bulbagarden.net/wiki/Kalos',
      );

  factory LocationMapper._alola() => LocationMapper(
        color: const Color(0xffDC5A40),
        imgUrl:
            'https://archives.bulbagarden.net/media/upload/thumb/8/80/Manalo_Stadium.png/225px-Manalo_Stadium.png',
        url: 'https://bulbapedia.bulbagarden.net/wiki/Alola',
      );

  factory LocationMapper._galar() => LocationMapper(
        color: const Color(0xffAC379E),
        imgUrl:
            'https://pokecompany.com/wp-content/uploads/2020/11/VP43_48.jpg',
        url: 'https://bulbapedia.bulbagarden.net/wiki/Galar',
      );

  factory LocationMapper._husui() => LocationMapper(
        color: const Color(0xff9072A3),
        imgUrl:
            'https://archives.bulbagarden.net/media/upload/a/ac/Hisui_anime.png',
        url: 'https://bulbapedia.bulbagarden.net/wiki/Husui',
      );

  factory LocationMapper._unknown() =>
      LocationMapper(color: const Color(0xffD78144));
}
