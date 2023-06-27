import 'package:flutter/material.dart';
import 'package:movie_list/movie.dart';
import 'movie_list.dart';
import 'movie_detail.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Top five movies")),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: movies.length,
        itemBuilder: (BuildContext context, int index) {
          final movie = movies[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(
                height: 100,
                width: 100,
                child: Hero(
                  tag: movie,
                  child: InkWell(
                    child: Image.network(movie.imageLink!,fit: BoxFit.cover),
                    onTap: () => openDetail(context, index, movie),

                  ),
                )

              ),
              Text("Movie name: ${movie.name}"),
              Text("Movie description: ${movie.description}"),

              // SizedBox(
              //   height: 100,
              //   width: 100,
              //   child: movie.imageLink != null
              //       ? Image.network(movie.imageLink!,fit: BoxFit.cover,)
              //       : const Placeholder(child: Text("placeholderimage"),), // Placeholder image when imageLink is null
              // ),
              // Text("Movie name: ${movie.name ?? 'Unknown'}"),
              // Text("Movie description: ${movie.description ?? 'No description available'}"),

            ],
          );
        },
      ),
    );

  }

  openDetail(context, index, movie) {
    final route = MaterialPageRoute(
      builder: (context) => MovieDetail(index: index, movie: movie),
    );
    Navigator.push(context, route);
  }

}


