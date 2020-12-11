import 'package:flutter/material.dart';
import 'package:movies_list/Screens/favorite_screen.dart';
import 'package:movies_list/Screens/home_screen.dart';
import 'package:movies_list/main.dart';
class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
              accountName: Text("Sainath Chilkuri"),
              accountEmail: Text("chilkurisainath@gmail.com"),
              currentAccountPicture: GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  height: 20.0,
                  width: 20.0,
                  child: Text("S",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                  ),),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20.0)
                    )
                  ),
                ),
              ),
          InkWell(
            child: ListTile(
              leading: Icon(Icons.movie),
              title: Text(
                "My Movies"
              ),
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
              return MyApp();
               }));

            },
          ),
          InkWell(
            child: ListTile(
              leading: Icon(Icons.favorite,
              color: Colors.red,),
              title: Text(
                  "Favorites"
              ),
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return FavoriteScreen();
              }));
            },
          ),
          InkWell(
            child: ListTile(
              leading: Icon(Icons.remove_red_eye_outlined),
              title: Text(
                  "Watched"
              ),
            ),
            onTap: (){
              debugPrint("Mymovies");
            },
          ),
          Divider(thickness: 3.0,
          color: Colors.blueGrey,),
          InkWell(
            child: ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                  "settings"
              ),
            ),
            onTap: (){
              debugPrint("Mymovies");
            },
          ),
          InkWell(
            child: ListTile(
              leading: Icon(Icons.account_box_outlined),
              title: Text(
                  "About"
              ),
            ),
            onTap: (){
              debugPrint("Mymovies");
            },
          )


        ],
      ),

    );
  }
}
