import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'dart:io';

class PreviewPic extends StatefulWidget {
  const PreviewPic({super.key});

  @override
  State<PreviewPic> createState() => _PreviewPicState();
}

class _PreviewPicState extends State<PreviewPic> {
  late File imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(0, 117, 88, 46),
        title: const Text(
          'Preview da Foto',
          style: TextStyle(
            color: Colors.black87,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Container(
            margin: const EdgeInsets.all(8),
            height: 380,
            decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.network(
                'https://www.reconcavo.org.br/wp-content/themes/irt/assets/img/instituto-reconcavo-de-tecnologia-logo-medio.png'),
          ),
          const SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(0, 117, 88, 46)),
                  onPressed: () {
                    _getFromCamera();
                  },
                  child: const Icon(
                    Icons.add_a_photo,
                    size: 30,
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(0, 117, 88, 46)),
                  onPressed: () {
                    _getFromGallery();
                  },
                  child: const Icon(
                    Icons.image,
                    size: 30,
                  )),
            ],
          )
        ],
      ),
      backgroundColor: Colors.grey[200],
    );
  }

  /// Get from gallery
  _getFromGallery() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    setState(() {
      imageFile = File(pickedFile.path);
    });
  }

  /// Get from Camera
  _getFromCamera() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    setState(() {
      imageFile = File(pickedFile.path);
    });
  }
}
