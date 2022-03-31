import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AlbumDetail extends StatelessWidget{
  final album;
  AlbumDetail(this.album);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vue détaillée"),
      ),
      body: ListView(
        children: [
          Card(
            elevation: 4,
            shadowColor: Colors.deepPurple,
            child: Container(
              height: 400,
              child: Image.asset("assets/images/album.jpg", fit: BoxFit.fill,),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 40.0,
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.only(bottom:16, top: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.indigoAccent,
                        boxShadow: const [
                          BoxShadow(color: Colors.white, spreadRadius: 3),
                        ],
                      ),
                      child: Text("Dètails de l'album",
                          style: GoogleFonts.laila(textStyle: TextStyle(fontSize: 16,color: Colors.white, fontWeight: FontWeight.w500)),
                          textAlign: TextAlign.center),
                    ),
                    _buildInformationRow("Id de l'album : " , album.id.toString()),
                    _buildInformationRow("Id de l'auteur de l'album : " , album.userId.toString()),
                    _buildInformationRow("Titre de l'album :" , album.title),
                  ],
                ),
              )
          )
        ],
      ),
    );
  }

  Container _buildInformationRow(String title , String content){
    return Container(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:[
          Text(title+"  ",
            style: GoogleFonts.cinzel(textStyle: TextStyle(fontSize: 16, color: Colors.black54, fontWeight: FontWeight.w500)),
          ),
          Expanded(
            child: Text(content,
              style: GoogleFonts.cinzel(textStyle: TextStyle(fontSize: 18),),
              textAlign: TextAlign.start,
            ),
          )
        ],
      ),
    );
  }

}