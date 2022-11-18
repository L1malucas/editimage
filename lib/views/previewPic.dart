import 'dart:io';
import 'package:editimage/cropper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _picker = ImagePicker();
  File? fileImage;

  _getImageFrom({required ImageSource source}) async {
    final pickedImage = await _picker.pickImage(source: source);
    if (pickedImage != null) {
      var image = File(pickedImage.path.toString());

      var croppedImage = await Cropper.cropImage(image);
      if (croppedImage == null) {
        return;
      }
      setState(() {
        fileImage = croppedImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Preview"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.teal,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (fileImage != null)
            Container(
              height: 350,
              width: 300,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12, width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: Colors.grey,
                  image: DecorationImage(
                    image: FileImage(fileImage!),
                    fit: BoxFit.cover,
                  )),
            )
          else
            Container(
              height: 350,
              width: 350,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12, width: 1),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: Colors.grey[300],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/irt.jpg",
                    width: 150,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Imagem cortada",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  ),
                ],
              ),
            ),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
              onPressed: () {
                _openBottomSheet();
              },
              child: const Text(
                'Escolher Imagem',
              ),
            ),
          ),
        ],
      ),
    );
  }

  _openBottomSheet() {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          color: const Color.fromRGBO(0, 194, 145, 76),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text('Escolha a origem'),
                SizedBox(
                  width: 300,
                  height: 45,
                  child: ElevatedButton( 
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(0, 117, 88, 46)),
                    onPressed: () {
                      Navigator.pop(context);
                      _getImageFrom(source: ImageSource.camera);
                    },
                    child: Row(
                      children: const [
                        SizedBox(width: 50),
                        Icon(
                          Icons.add_a_photo,
                          size: 28,
                        ),
                        SizedBox(width: 120),
                        Text(
                          'Câmera',
                          textAlign: TextAlign.end,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(0, 117, 88, 46)),
                    onPressed: () {
                      Navigator.pop(context);

                      _getImageFrom(source: ImageSource.gallery);
                    },
                    child: Row(
                      children: const [
                        SizedBox(width: 50),
                        Icon(
                          Icons.image,
                          size: 28,
                        ),
                        SizedBox(width: 120),
                        Text(
                          'Galeria',
                          textAlign: TextAlign.end,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(0, 117, 88, 46)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: const [
                        SizedBox(width: 50),
                        Icon(
                          Icons.cancel,
                          size: 28,
                        ),
                        SizedBox(width: 120),
                        Text('Cancelar'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
