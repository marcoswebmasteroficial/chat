import 'package:flutter/material.dart';
import 'package:chat/ui/chat_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
 runApp(MyApp());


/*  Firestore.instance.collection("mensagens").snapshots().listen((dado){
    dado.documents.forEach((d){
      print(d.data);

    });

  });*/
/*  DocumentSnapshot snapshot =  await Firestore.instance.collection("mensagens").document("q8ftZLdiEXXGLW9RNS8A").get();
print(snapshot.documentID);*/
/*QuerySnapshot snapshot =  await Firestore.instance.collection("mensagens").getDocuments();
snapshot.documents.forEach((d){
  print(d.data);
  d.reference.updateData({"Read": true});
  print(d.documentID);
  });*/
  //Firestore.instance.collection("mensagens").document().setData({"nome" : "Marcos","texto" : "Oiii", "Read": false});
  //Firestore.instance.collection("mensagens").document("O9Bi0VM23LLkLi6DQwtS").updateData({"Texto" : "gay"});
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      title: 'Chat Flutter',
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
        primaryColor: Color(0xff075e54),
    indicatorColor: Colors.white,
    primaryColorDark: Color(0xFF128C7E),
    primaryIconTheme: IconThemeData(
    color: Colors.white,
    ),
    textTheme: TextTheme(
    title: TextStyle(color: Colors.white),
    ),
        )
,
      home: ChatScreen(),
    );
  }
}