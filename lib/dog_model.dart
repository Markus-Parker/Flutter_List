import 'dart:convert';
import 'dart:io';
import 'dart:async';

class Dog {
  final String name;
  final String location;
  final String description;
  final String imagen;
  String imageUrl;

  int rating = 10;

  var arr = [
    'https://pbs.twimg.com/media/EgUTNXHWoAMgju7.jpg',
    'https://i.ytimg.com/vi/DwlzqcGhITA/hqdefault.jpg',
    'https://i.ytimg.com/vi/Eu4Cm7Ara4c/maxresdefault.jpg',
    'https://pbs.twimg.com/profile_images/1233865690303561728/DDxFmGAv.jpg',
    'https://www.cinemascomics.com/wp-content/uploads/2015/08/Ted-2.jpg',
    'https://viapais.com.ar/files/2020/04/20200424185035_42307645_0_body.jpg',
    'https://static.wikia.nocookie.net/hitlerparody/images/3/34/Dp40OdfUwAAXiJs.jpg/revision/latest?cb=20190129152045&path-prefix=es',
    'https://pbs.twimg.com/profile_images/1257407845802422273/E8O5JMzw_400x400.jpg',
    'https://assets.change.org/photos/7/yi/my/kxyimYUGLDCYfJx-800x450-noPad.jpg?1551299436',
    'https://i.ytimg.com/vi/GKyaRERJR6U/maxresdefault.jpg'
  ];

  Dog(this.name, this.location, this.description, this.imagen);

  Future getImageUrl() async {
    if (imageUrl != null) {
      return;
    }

    try {
      imageUrl = arr[int.parse(this.imagen)];
    } catch (exception) {
      print(exception);
    }
  }
}
