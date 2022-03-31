import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'album.dart';
import 'albumDetail.dart';
import 'apiHelper.dart';

class AlbumList extends StatefulWidget{
  AlbumList();
  @override
  _AlbumListState createState()=> _AlbumListState();

}
class _AlbumListState extends State<AlbumList>{
  _AlbumListState();
  late Future<List<Album>> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text("Liste des albums"),
        ),
        body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child:
              FutureBuilder <List<Album>>(
                future: futureAlbum,
                builder: (context , snapshot) {
                  if(snapshot.hasData){
                    var albumData = snapshot.data;
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: albumData!.length,
                      itemBuilder: (context , index) {
                        return AlbumCardItem(albumData[index]);
                      }
                    );
                  }else{
                    return const Align(child: CircularProgressIndicator(), alignment: Alignment.center,);
                  }
                }
            )
          ),
    );
  }
}

class AlbumCardItem extends StatelessWidget{
  final album;
  AlbumCardItem(this.album);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder:(context)=> AlbumDetail(album)));
      },
      child: Card(
        margin: const EdgeInsets.all(8),
        elevation: 4,
        child: Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              width: 60,
              height: 60,
              padding: const EdgeInsets.all(4.0),
              child: const ClipOval(
                child: FadeInImage(
                placeholder: AssetImage("assets/images/loader.gif"),
                image: AssetImage("assets/images/album1.jpg"),
                fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child:Text(
                  album.title,
                  style: GoogleFonts.nunito(textStyle: TextStyle(fontSize: 18 , fontWeight: FontWeight.w500)),
                  overflow:TextOverflow.ellipsis,
                      ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}