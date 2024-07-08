import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gym_app/theme/colors.dart';
import 'package:image_picker/image_picker.dart';

class ImageProfilePicker extends StatefulWidget {
  const ImageProfilePicker({super.key});

  @override
  State<ImageProfilePicker> createState() => _ImageProfilePickerState();
}

class _ImageProfilePickerState extends State<ImageProfilePicker> {
  final ImagePicker picker = ImagePicker();
  File? _image;

  Future<void> _pickImage() async {
    final image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: CircleAvatar(
        backgroundColor: primaryBlue,
        radius: 24,
        child: CircleAvatar(
          radius: 22,
          backgroundImage: _image != null
              ? FileImage(_image!)
              : const AssetImage(
                  'assets/image/najuuh.png',
                ),
        ),
      ),
    );
  }
}
