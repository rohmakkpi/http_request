import 'package:flutter/material.dart';
import 'package:http_request/models/movie.dart';

class MovieDetail extends StatelessWidget {
  //const MovieDetail({super.key});

  final Movie movie;
  final String imgPath = 'http://image.tmdb.org/t/p/w500/';

  MovieDetail(this.movie);

  @override
  Widget build(BuildContext context) {
    String path;
    if (movie.posterPath != null) {
      path = imgPath + movie.posterPath;
    } else {
      path =
          'https://images.freeimages.com/images/large-previews/5eb/moive-clapboard-1184339.jpg';
    }

    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: height / 1.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(path),
                    fit: BoxFit.cover,
                    ),
                ),
                //padding: EdgeInsets.all(16),
                //height: height / 1.5,
                //child: Image.network(path),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  movie.overview,
                  style: TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                child: Text(movie.overview),
                padding: EdgeInsets.only(left: 16, right: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
