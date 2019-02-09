import 'package:flutter/material.dart';
import 'package:flutter_app/model.dart';

class GirlsWidget extends StatelessWidget {
  GirlsWidget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Redux Items'),
        ),
        backgroundColor: Colors.green[100],
        body: StreamBuilder(
//            stream: block.models(),
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
