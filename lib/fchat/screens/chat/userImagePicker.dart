
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class userImagePicker extends StatefulWidget {

  final void Function(File pickedImage)imagePickFn;

  const userImagePicker(this.imagePickFn);

    @override
    _userImagePickerState createState() => _userImagePickerState();
  }

  class _userImagePickerState extends State<userImagePicker> {
    File _pickedImage;
    final ImagePicker _picker=ImagePicker();

    void _pickImage(ImageSource src)async{
      final pickedImageFile = await _picker.getImage(source:src,imageQuality:50,maxWidth:150);

      if(pickedImageFile!= null)
        {
          setState(() {
            _pickedImage =File(pickedImageFile.path);
          });
          widget.imagePickFn(_pickedImage);
        }
      else{

        print("no Image Selected");
      }
    }

    @override
    Widget build(BuildContext context) {
      return Column(
        children:<Widget>[
          CircleAvatar(
            radius:40,
            backgroundColor:Colors.grey,
            backgroundImage:_pickedImage !=null ? FileImage(_pickedImage):null,
          ),
          SizedBox(
            height:10
          ),
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceAround,
            children:<Widget>[
              FlatButton.icon(
                textColor:Theme.of(context).primaryColor,
                onPressed:()=>_pickImage(ImageSource.camera),
                icon:Icon(Icons.photo_camera),
                label:Text("Add Image",textAlign:TextAlign.center),

              ),
              FlatButton.icon(
                textColor:Theme.of(context).primaryColor,
                onPressed:()=>_pickImage(ImageSource.gallery),
                icon:Icon(Icons.image_outlined),
                label:Text("Add Image",textAlign:TextAlign.center),

              ),
            ]
          )
        ]
      );
    }
  }
