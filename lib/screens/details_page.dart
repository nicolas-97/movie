import 'package:flutter/material.dart';
import 'package:movie/widgets/casting_cards.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no movie';
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(),
              _OverView(),
              _OverView(),
              _OverView(),
              CastingCard(),
            ]),
          )
        ],
      )
    );
  }
}

class _OverView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        'Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas "Letraset", las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.',
        textAlign: TextAlign.justify ,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text('movie.title'),
        titlePadding: EdgeInsets.all(10),
        centerTitle: true,
        background: FadeInImage(
          placeholder: AssetImage('images/loading.gif'),
          image: NetworkImage('https://via.placeholder.com/500x300'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
  
}

class _PosterAndTitle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('images/no-image.jpg'),
              image: NetworkImage('https://via.placeholder.com/200x300'),
              height: 250,
            ),
          ),
          SizedBox(width: 20,),
          Column(
            children: [
              Text(
                'Movie.title', 
                style: textTheme.headlineSmall, 
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                'Movie.original title', 
                style: textTheme.labelSmall, 
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Row(
                children: [
                  Icon(
                    Icons.star_outline, 
                    size: 15, 
                    color: Colors.grey
                  ),
                  SizedBox(width: 5),
                  Text(
                    'movie.voteAverage', 
                    style: textTheme.bodySmall
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}