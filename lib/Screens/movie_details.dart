import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_list/Data/movies_data.dart';
import 'package:movies_list/Model/Movie.dart';
import 'package:movies_list/Utils/custom_drawer.dart';

import 'favorite_screen.dart';
class MovieDetails extends StatefulWidget {
  IconButton _isWatched = IconButton(
      icon: Icon(Icons.remove_red_eye_outlined),
      onPressed: () {
        _changeTheICon();
      });
  final Movie movie;
  MovieDetails({
    this.movie
  });
  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
        widget._isWatched
         /* IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {

                showSnackBar(context);

              }
          )*/
        ],
        title: Text("Details"),
      ),
      drawer: CustomDrawer(),
      floatingActionButton: Builder(builder:(BuildContext context){
        return FloatingActionButton(
          child: Icon(Icons.favorite),
          onPressed: (){
            MoviesData.addFavData(widget.movie);
            Scaffold.of(context).showSnackBar(SnackBar(content: Text("Added"),duration: Duration(milliseconds: 500),
              backgroundColor: Colors.greenAccent,));
          },
        );
      },),

      body: Container(
        child: Column(
          children: [
            ShowImage(imageURL: widget.movie.Images[0]),
            Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Card(
                         elevation: 5.0,
                         child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                           child: Container(
                             width: MediaQuery.of(context).size.width/4,
                             height: 180.0,
                             decoration: BoxDecoration(
                               image: DecorationImage(
                                 image: NetworkImage(
                                   widget.movie.Images[0],
                                 ),
                                 fit: BoxFit.cover
                               )
                             ),
                           ),
                         ),
                       ),
                       MovieCastDetails(movie: widget.movie,),


                     ],
                   ),
            CastDetails(movie: widget.movie),

             Flexible(child:AddImages(widget.movie.Images))

          ],

        ),
      ),
    );
  }


}

void _changeTheICon() {

}


/*class AddImages extends StatelessWidget {
  final List<String> movieImages;
  AddImages({
    this.movieImages
});
  @override*/
Widget AddImages(List<String> movieImages) {
    return  ListView.separated(
            separatorBuilder: (context,index)=> SizedBox(width: 6.0,),
           physics:ClampingScrollPhysics(),
           shrinkWrap: true,
           scrollDirection: Axis.horizontal,
           itemCount: movieImages.length,
            itemBuilder:(context,index){
             return Card(
               child: ClipRect(
                 child: Container(
                   height: 120.0,
                   width: MediaQuery.of(context).size.width/4,
                   //margin: EdgeInsets.all(10.0),
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(5.0),
                     image: DecorationImage(
                       image: NetworkImage(
                         movieImages[index]
                       ),
                       fit: BoxFit.cover
                     )),
                 ),
               ),
             );
            },
          );
  }
void showSnackBar(BuildContext context){
  Scaffold.of(context).showSnackBar(SnackBar(content: Text("Added"),duration: Duration(milliseconds: 500),
    backgroundColor: Colors.greenAccent,));
}

class CastDetails extends StatelessWidget {
  final Movie movie;
  CastDetails({
    this.movie
});
  @override
  Widget build(BuildContext context) {
    return Column(
     mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(10.0),
          child: Text("Actors: ${movie.Actors}"),
        ),
        Container(
          margin: EdgeInsets.all(10.0),
          child: Text("Released: ${movie.Released}"),
        ),
        Container(
          margin: EdgeInsets.all(10.0),
          child: Text("Language: ${movie.Language}"),
        )
      ],
    );
  }
}

class MovieCastDetails extends StatelessWidget {
  final Movie movie;
  MovieCastDetails({
    this.movie
});
  var textStyle = TextStyle(
    color: Colors.lightBlue,
    fontSize: 15.0,
    fontWeight: FontWeight.bold
  );
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10.0),
                      child: Text("${movie.Year} . ",style: textStyle),
                    ),
                    Container(
                      margin: EdgeInsets.all(10.0),
                      child: Text(movie.Genre,style: textStyle),
                    ),
                  ],

                ),

                Text(
                  movie.Title,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                  ),
                ),

                 Text(
                  movie.Plot
                ),





          ],
        ),
    );
  }
}

class ShowImage extends StatelessWidget {
  final String imageURL;
  ShowImage({
    this.imageURL
});
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(imageURL),
                      fit: BoxFit.cover
                  )
              ),
            ),
            Container(
              child: IconButton(icon: Icon(Icons.play_circle_fill_outlined,
                color: Colors.white,
                size: 50.0,),),
            )
          ]),
        Container(
          height: 80.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0x00f5f5f5),
                Color(0xfff5f5f5),

              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
            )
          ),
        )
      ],

    );
  }
}

