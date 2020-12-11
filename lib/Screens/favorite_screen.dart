import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_list/Data/movies_data.dart';
import 'package:movies_list/Model/Movie.dart';
class FavoriteScreen extends StatefulWidget{
   List<Movie> fav_movies = MoviesData.getFavData();
  FavoriteScreen(){
    if(fav_movies == null){

    }
  }
  @override
  State<StatefulWidget> createState() {
   return FavoriteScreenState();
  }

}
class FavoriteScreenState extends State<FavoriteScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
      ),
      backgroundColor: Colors.blueGrey,

      body: ListView.builder(
          itemCount: widget.fav_movies.length,
            itemBuilder: (context,index){
            //Stack of Favorites
            return Stack(
                children:[
                  //Movie details
                  Container(
                    margin: EdgeInsets.only(left: 60.0,top: 15.0),
                    child: Card(
                      elevation: 5.0,
                      child: ListTile(
                        title: Text(widget.fav_movies[index].Title),
                        subtitle: Text(widget.fav_movies[index].Genre),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          color: Colors.red,
                          onPressed: (){

                              deleteData(widget.fav_movies[index],context);


                          },
                        ),
                      ),
                    ),
                  ),
                  //Movie Image in Stack
                  Container(
                    margin: EdgeInsets.only(top: 20.0,left: 10.0),
                    height: 70.0,
                    width: 70.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(widget.fav_movies[index].Images[0]),
                            fit: BoxFit.cover
                        ),
                        shape: BoxShape.circle
                    ),
                  ),
                ]
            );
            })
      );
  }

  void deleteData(Movie movie,BuildContext context) {
    if(MoviesData.removeData(movie)){
      setState(() {
        widget.fav_movies = MoviesData.getFavData();
          Scaffold.of(context).showSnackBar(SnackBar(content: Text("Deleted Succefully",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),),
          backgroundColor: Colors.red,
          action:SnackBarAction(
            label: "Undo",
            onPressed: (){
              setState(() {
                MoviesData.addFavData(movie);
                widget.fav_movies = MoviesData.getFavData();
              });

            },
          )));
      });

    }
  }
}
