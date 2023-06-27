import 'package:flutter/material.dart';
import 'movie.dart';

class MovieDetail extends StatelessWidget {
  final int? index;
  final Movie? movie;

  const MovieDetail({super.key, this.index, this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie # $index"),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Hero(
              tag: movie!,
              child: Image.network(movie!.imageLink!,fit: BoxFit.cover,
                height:400,
                width: 400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}