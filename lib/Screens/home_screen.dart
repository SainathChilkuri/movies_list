import 'package:flutter/material.dart';
import 'package:movies_list/Data/movies_data.dart';
import 'package:movies_list/Model/Movie.dart';
import 'package:movies_list/Screens/movie_details.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Movie> movies = MoviesData.getMovies();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount:movies.length,
        itemBuilder: (context,index) {
          return Stack(
              children: [
                Movielist(movies: movies[index]),
                MovieImageView(image : movies[index].Images[0]),

              ]
          );
        }
    );
  }
}

class Movielist extends StatelessWidget {
  final Movie movies;
  Movielist({
    this.movies
});
  @override
  Widget build(BuildContext context) {
          return Container(
            margin: EdgeInsets.only(left: 50.0),
            child: InkWell(
              onTap: (){
                navigateToDetails(movies,context);
              },
              child: Card(
                elevation: 9.0,
                margin: EdgeInsets.all(10.0),
                child: ListTile(
                  title: Text(movies.Title),
                  subtitle: Text(movies.Genre),
                  trailing: Column(
                    children: [
                      Text("ImDb"),
                      Padding(padding:EdgeInsets.all(10.0),child: Text(movies.imdbRating))
                    ],
                  ),
                ),
              ),
            ),
          );

  }

  void navigateToDetails(Movie movie,BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return MovieDetails(movie: movie);
    }));

  }
}
class MovieImageView extends StatelessWidget {
  final String image;
  MovieImageView({
    this.image
});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      width: 60.0,
      height: 60.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        //borderRadius: BorderRadius.circular(14.0),
        image: DecorationImage(
          image: NetworkImage(image),fit: BoxFit.cover
        ),

      ),
    );
  }
}



