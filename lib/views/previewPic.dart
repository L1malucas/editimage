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
  File? imageFile;

  Widget showImage() {
    if (imageFile == null) {
      return Image.asset(
        'assets/irt.png',
        height: 250,
        width: 250,
      );
    } else {
      return Image.file(imageFile!);
    }
  }

  Future getImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) {
      return;
    }
    File? img = File(image.path);
    print('img $img');
  }

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
          showImage(),
          const SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(0, 117, 88, 46)),
                  onPressed: () {
                    getImage(ImageSource.camera);
                  },
                  child: const Icon(
                    Icons.add_a_photo,
                    size: 30,
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(0, 117, 88, 46)),
                  onPressed: () {
                    getImage(ImageSource.gallery);
                  },
                  child: const Icon(
                    Icons.image,
                    size: 30,
                  )),
            ],
          )
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
