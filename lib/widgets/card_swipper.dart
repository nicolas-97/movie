import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:movie/models/movie.dart';


class CardSwiper extends StatelessWidget{

  final List<Movie> movies;

  const CardSwiper({
    super.key, 
    required this.movies
  });

  @override
  Widget build(BuildContext context){

    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/details', arguments: "Ver pelicula");
      },
      child: Container(
        width: double.infinity,
        height: size.height * 0.5,
        child: Swiper(
          itemCount: movies.length,
          layout: SwiperLayout.STACK,
          itemWidth: size.width * 0.6,
          itemHeight: size.height * 0.9,
          itemBuilder: (_, int index) {

            final Movie movie = movies[index];
            
            return ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage("images/no-image.jpg"),
                image: NetworkImage(movie.fullPosterImage()),
                fit: BoxFit.fill,
              ),
            );
          },
        ),
      ),
    );
  }
}