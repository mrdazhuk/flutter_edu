import 'package:flutter/material.dart';
import 'package:flutter_app/ModelProvider.dart';
import 'package:flutter_app/model.dart';

class HomePage extends StatelessWidget {
  HomePage();

  @override
  Widget build(BuildContext context) {
    var block = GlobalBlocsProvider.modelBloc(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Redux Items'),
        ),
        backgroundColor: Colors.green[100],
        body: StreamBuilder(
            stream: block.models(),
            builder: (context, AsyncSnapshot<List<Model>> models) {
              return ListView.builder(
                  itemCount: models.data.length,
                  itemBuilder: (context, index) =>
                      Container(
                        height: 200,
                          width: 200,
                          child: Image.network(models.data[index].url)));
            }));
  }
}
