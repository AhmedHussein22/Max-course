import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../provider/fetch_locations.dart';
import '../view/add_location.dart';
import 'package:provider/provider.dart';

class ListOfLOcation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Google Maps"),
        ),
        floatingActionButton: IconButton(
          alignment: Alignment.center,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddLocation()));
          },
          icon: Icon(Icons.add, size: 50, color: Colors.pink),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<FetchLocatins>(
              child: Center(
                child: Text("No Places added yet"),
              ),
              builder: (context, fetchlocations, child) {
                if (fetchlocations.alllocations.length <= 0) {
                  return child;
                } else {
                  return ListView.builder(
                    itemCount: fetchlocations.alllocations.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.pink,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: FileImage(
                              fetchlocations.alllocations[index].image,
                            ),
                          ),
                          title:Text(fetchlocations.alllocations[index].title)
                        ),
                      );
                    },
                  );
                }
              }),
        ),
      ),
    );
  }
}
