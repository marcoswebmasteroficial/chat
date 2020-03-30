import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatMessage extends StatelessWidget {
  ChatMessage(this.data, this.mine);

  final Map<String, dynamic> data;
  final bool mine;

  final hora = new DateFormat('hh:mm:ss');

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Row(
        children: <Widget>[
          !mine ?
          Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(data["foto_user"]),
              )) : Container(),
          Expanded(
            child: Column(
              crossAxisAlignment: mine
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: <Widget>[
                data["imgUrl"] != null
                    ? Image.network(data["imgUrl"], width: 100.0,)
                    : Text(
                  data["msg"], style: TextStyle(fontSize: 18.0), textAlign: mine ? TextAlign.end : TextAlign.start,),
                Text(hora.format(data["time"].toDate())
                  ,
                  style: TextStyle(fontSize: 11.0, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          mine ?
          Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(data["foto_user"]),
              )) : Container(),
        ],
      ),
    )
    );
  }
}
