import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_map/view/selecte_location.dart';
import '../provider/fetch_locations.dart';
import '../view/add_image.dart';
import 'package:provider/provider.dart';

class AddLocation extends StatefulWidget {
  @override
  _AddLocationState createState() => _AddLocationState();
}

class _AddLocationState extends State<AddLocation> {
  final _titleController = TextEditingController();
  File _packimage;
  void pickimage(File packimage) {
    _packimage = packimage;
  }

  void _savePlace() {
    if (_titleController.text.isEmpty || _packimage == null) {
      return;
    }
    Provider.of<FetchLocatins>(context, listen: false)
        .addPlace(_titleController.text, _packimage);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add Location"),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  hintText: "Add Addresses",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide()),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              AddImage(
                packImage: pickimage,
              ),
              SizedBox(
                height: 20,
              ),
              SelecteLocation(),
              SizedBox(
                height: 20,
              ),
              CupertinoButton(
                child: Text("Add Location"),
                onPressed: () => _savePlace(),
                color: Colors.pink,
              ),
            ],
          ),
        )),
      ),
    );
  }
}
