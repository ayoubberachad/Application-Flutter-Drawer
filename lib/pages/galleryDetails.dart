import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class GalleryDetails extends StatefulWidget {
  String keyWord;
  GalleryDetails(this.keyWord);
  @override
  _GalleryDetailsState createState() => _GalleryDetailsState();
}
class _GalleryDetailsState extends State<GalleryDetails> {
  late List<dynamic> data;
  int currentPage=1;int pageSize=10; int totalPages=0;
  ScrollController _scrollController=new ScrollController();
  dynamic dataGallery;
  List<dynamic> hits=[];
  getData(url){
    http.get(Uri.parse(url)).then((resp){
      setState(() {
        dataGallery=json.decode(resp.body);
        hits.addAll(dataGallery['hits']);
        if(dataGallery['totalHits']%this.pageSize==0)
          this.totalPages=dataGallery['totalHits']~/this.pageSize;
        else this.totalPages=1+(dataGallery['totalHits']/this.pageSize).floor() as int;
      });
    }).catchError((err){
      print(err);
    });
  }

  @override
  void initState() {
    super.initState();this.loadData();
    this._scrollController.addListener((){
      if(_scrollController.position.pixels==_scrollController.position.maxScrollExtent){
        if(currentPage<totalPages){
          ++currentPage;
          this.loadData();
        }
      }
    });
  }
  @override void dispose() {
// TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }
  void loadData(){
    String url="https://pixabay.com/api/?key=5832566-81dc7429a63c86e3b707d0429&q=${widget.keyWord}&page=$currentPage&per_page=$pageSize";
    print(url);
    this.getData(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.keyWord} : ${currentPage} / ${totalPages}') ,backgroundColor:
      Colors.green,),
      body: (dataGallery==null)? Center(child: CircularProgressIndicator()):
      ListView.builder(
          controller:_scrollController ,
          itemCount: dataGallery==null?0:hits.length,
          itemBuilder: (context,index){
            return Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(left: 5,right: 5,top: 0,bottom: 0),
                    child: Card(
                        color: Colors.green,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(hits[index]['tags'],style: TextStyle(fontSize: 20,color:

                          Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),

                        )),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(right: 5,left: 5,top: 0,bottom: 0),
                    child: Card(
                        child: Image.network(hits[index]['previewURL'],fit: BoxFit.fitWidth,)),
                  ),
                  Divider(color: Colors.grey,thickness: 2,),
                ]
            );
          })
      ,
    );
  }
}