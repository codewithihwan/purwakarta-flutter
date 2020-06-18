import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:purwakartaflutter/wisata.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<ListWisata> listWisata;

  Future<ListWisata> getListWista() async {
    //fetch data from api

    var dio = Dio();
    Response response =
        await dio.get('https://dev.farizdotid.com/api/purwakarta/wisata');
    print(response.data);
    if (response.statusCode == 200) {
      return ListWisata.fromJson(response.data);
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    super.initState();
    listWisata = getListWista();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wisata Purwakarta"),
      ),
      body: FutureBuilder<ListWisata>(
          future: listWisata,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  itemCount: snapshot.data.wisata.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              '${snapshot.data.wisata[index].gambarUrl}'),
                        ),
                        title: Text("${snapshot.data.wisata[index].nama}"),
                        subtitle:
                            Text("${snapshot.data.wisata[index].kategori}"),
                      ),
                    );
                  });
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
