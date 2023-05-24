import 'package:flutter/material.dart';
import 'package:http_request/service/http_service.dart';
import 'package:http_request/models/movie.dart';
import 'package:http_request/pages/movie_detail.dart';

class MovieList extends StatefulWidget {
  const MovieList({super.key});

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  int moviesCount = 0;
  late List movies;
  late HttpService service;

  Future initialize() async {
    movies = [];
    movies = (await service.getPopularMovies())!;
    print(movies.toString());
    setState(() {
      moviesCount = movies.length;
      movies = movies;
    });
  }

  @override
  void initState() {
    service = HttpService();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Popular Movies"),
      ),
      body: ListView.builder(
        //gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //crossAxisCount: 1, // Ubah jumlah kolom sesuai keinginan Anda
          //childAspectRatio: 5, // Sesuaikan rasio lebar-tinggi item
        //),
        itemCount: (moviesCount == 0) ? 0 : moviesCount,
        itemBuilder: (context, int position) {
          var image =
              'http://image.tmdb.org/t/p/w500/${movies[position].posterPath}';
          return Card(
            color: Color.fromARGB(255, 246, 240, 252),
            elevation: 2.0,
            child: ListTile(
              trailing: Image.network(
                //backgroundImage: NetworkImage(
                image,
                width: 50,
                height: 120,
                fit: BoxFit.cover,
                //),
              ),
              title: Text(movies[position].title),
              subtitle: Text(
                'Rating = ' + movies[position].voteAverage.toString(),
              ),
              onTap: () {
                MaterialPageRoute route = MaterialPageRoute(
                    builder: (_) => MovieDetail(movies[position]));
                Navigator.push(context, route);
              },
            ),
          );
        },
      ),
    );
  }
}
