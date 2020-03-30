import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class TextComposer extends StatefulWidget {
  final Function({String msg, File imgFile}) sendMessage;
  TextComposer(this.sendMessage);
  @override
  _TextComposerState createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {
  bool _isCompose = false;
  void _reset(){
    _controller.clear();
    setState(() {
      _isCompose= false;
    });
  }
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.camera_enhance),
            onPressed: () async {
             final File imgFile = await ImagePicker.pickImage(source: ImageSource.gallery);
             if(imgFile == null) return;
             widget.sendMessage(imgFile: imgFile);

            },
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration:
                  InputDecoration.collapsed(hintText: "Escreva uma Mensagem.."),
              onChanged: (text) {
                setState(() {
                  _isCompose = text.isNotEmpty;
                });
              },
              onSubmitted: (msg){
                widget.sendMessage(msg: msg);
                _reset();
              },
            ),
          ),IconButton(
            icon: Icon(Icons.send),
            onPressed: _isCompose ? () {
              widget.sendMessage(msg: _controller.text);

              _reset();

            } : null,
          ),
        ],
      ),
    );
  }
}
