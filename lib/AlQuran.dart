import 'package:flutter/material.dart';
import 'package:alquran/viewModel/AlQuranViewModel.dart';
import 'DetailAlQuran.dart';

class AlQuran extends StatefulWidget {
  @override
  _AlQuranState createState() => _AlQuranState();
}

class _AlQuranState extends State<AlQuran> {

  List dataAlQuran = List();

  void getListSurat(){
    AlQuranViewModel().getAlquran().then((value) {
      setState(() {
        dataAlQuran = value;
      });
    });
  }

  @override
  void initState(){
    super.initState();
    getListSurat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Al Quran XII RPL"),
      ),
      body: dataAlQuran == null ? Center(child: CircularProgressIndicator(),) : ListView.builder(
        itemCount: dataAlQuran.length,
        itemBuilder: (context, i) {
          return ListTile(
            title: Text(dataAlQuran[i].nama),
            subtitle: Text("${dataAlQuran[i].type} | ${dataAlQuran[i].ayat} ayat"),
            trailing: Text(dataAlQuran[i].asma),
            onTap: () {
              Navigator.push(context, MaterialPageRoute (
                builder: (context) {
                  return DetailAlQuran(
                    nomor: dataAlQuran[i].nomor,
                    nama: dataAlQuran[i].nama
                  );
                }
              ));
            },
          );
        },
      )
    );
  }
}
