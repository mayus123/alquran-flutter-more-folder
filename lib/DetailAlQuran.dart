import 'package:flutter/material.dart';
import 'package:alquran/viewModel/AyatViewModel.dart';

class DetailAlQuran extends StatefulWidget {
  final String nomor;
  final String nama;

  DetailAlQuran({this.nomor, this.nama});
  @override
  _DetailAlQuranState createState() => _DetailAlQuranState();
}

class _DetailAlQuranState extends State<DetailAlQuran> {

  List dataAyat = List();

  void getListAyat(){
    AyatViewModel().getAyat(int.parse(widget.nomor)).then((value) {
      setState(() {
        dataAyat = value;
      });
    });
  }

  @override
  void initState(){
    super.initState();
    getListAyat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${widget.nama}"),
        ),
        body: dataAyat == null ? Center(child: CircularProgressIndicator(),) : ListView.builder(
          itemCount: dataAyat.length,
          itemBuilder: (context, i) {
            return ListTile(
              title: Container(
                padding: EdgeInsets.only(top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(dataAyat[i].ar ?? ""),
                    Text(dataAyat[i].id ?? ""),
                  ],
                ),
              ),
              onTap: () {},
            );
          },
        )
    );
  }
}
