import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddImage extends StatefulWidget {
  final Function packImage;

  const AddImage({ this.packImage});
  @override
  _AddImageState createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  File _storedImage;
  final picker = ImagePicker();
  Future<void> getImage(int type) async {
    final image = await picker.getImage(
        source: type == 1 ? ImageSource.gallery : ImageSource.camera,
        preferredCameraDevice: CameraDevice.rear
        );
    setState(() {
      _storedImage = File(image.path);
    });
    final bytes = await image.readAsBytes();
     final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(image.path);
    final savedImage =  File('${appDir.path}/$fileName');
    await savedImage.writeAsBytes(bytes);
    widget.packImage(savedImage);
 
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: 200,
          width: 250,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(color: Colors.purple),
            ),
          ),
          child: _storedImage != null
              ? Image.file(
                  _storedImage,
                  fit: BoxFit.cover,
                )
              : Text("No Taken Images"),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RaisedButton.icon(
              color: Colors.purple,
              label: Text("Take Image",
              style:TextStyle(
                color: Colors.white
              )
              ),
              onPressed: () =>getImage(0),
              icon: Icon(Icons.camera_alt,),
            ),
             RaisedButton.icon(
              color: Colors.purple,
              label: Text("Pick Image",
              style:TextStyle(
                color: Colors.white
              )
              ),
              onPressed: () =>getImage(1),
              icon: Icon(Icons.image),
            ),

          ],
        )
      ],
    );
  }
}
