// import 'dart:html';
// import 'dart:typed_data';
//
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// class image extends StatefulWidget {
//   const image({super.key});
//
//   @override
//   State<image> createState() => _imageState();
// }
//
// class _imageState extends State<image> {
//   File? _image;
//   File? selectedImage;
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//
//       body: Center(
//         child: Stack(
//           children: [
//             _image != null?
//             CircleAvatar(
//               radius: 100,
//               backgroundImage: MemoryImage(_image! as Uint8List)
//             ):
//              CircleAvatar(
//               radius: 100,
//               backgroundImage: NetworkImage("https://t4.ftcdn.net/jpg/00/65/77/27/360_F_65772719_A1UV5kLi5nCEWI0BNLLiFaBPEkUbv5Fv.jpg"),
//             ),
//             Positioned(
//                 bottom: 10,
//                 right: 10,
//                 child: GestureDetector(
//                     onTap: (){
//                       showImagePickerOption(context);
//                     },
//                     child: Icon((Icons.add_a_photo),)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//   void showImagePickerOption(BuildContext context){
//     showModalBottomSheet(
//         backgroundColor: Colors.white30,
//         context: context, builder: (builder){
//       return Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: SizedBox(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height/4 ,
//           child: Row(
//             children: [
//               Expanded(
//                 child: InkWell(
//                   onTap: (){
//                     _pickImageFronGallery();
//                   },
//                   child: SizedBox(
//                     child: Column(
//                       children: [
//                         Icon(Icons.image,size: 70,),
//                         Text("Gallery")
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: InkWell(
//                   onTap: (){},
//                   child: SizedBox(
//                     child: Column(
//                       children: [
//                         Icon(Icons.camera,size: 70,),
//                         Text("Camera")
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     }
//     );
//   }
//   Future _pickImageFronGallery()async{
//     final returnImage = await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (returnImage == null ) return;
//
//     setState(() {
//       selectedImage = File(returnImage.path as List<Object>)
//       _image = File (returnImage.path as List<Object>).readAsBytesSync();
//     });
//   }
// }
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickImage extends StatefulWidget {
  const PickImage({super.key});

  @override
  State<PickImage> createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
  Uint8List? _image;
  File? selectedIMage;
  //Gallery
  Future _pickImageFromGallery() async {
    final returnImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedIMage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop(); //close the model sheet
  }

//Camera
  Future _pickImageFromCamera() async {
    final returnImage =
    await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedIMage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Center(
        child: Stack(
          children: [
            _image != null
                ? CircleAvatar(
                radius: 100, backgroundImage: MemoryImage(_image!))
                : const CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage(
                  "https://t4.ftcdn.net/jpg/00/65/77/27/360_F_65772719_A1UV5kLi5nCEWI0BNLLiFaBPEkUbv5Fv.jpg"),
            ),
            Positioned(
                bottom: -0,
                left: 140,
                child: IconButton(
                    onPressed: () {
                      showImagePickerOption(context);
                    },
                    icon: const Icon(Icons.add_a_photo)))
          ],
        ),
      ),
    );
  }

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.blue[100],
        context: context,
        builder: (builder) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4.5,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromGallery();
                      },
                      child: const SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.image,
                              size: 70,
                            ),
                            Text("Gallery")
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromCamera();
                      },
                      child: const SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.camera_alt,
                              size: 70,
                            ),
                            Text("Camera")
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }


}