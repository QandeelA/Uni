import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab_final_task/part1.dart';
import 'package:lab_final_task/password.dart';
import 'SplashScreen.dart';
import 'main.dart';
import 'board.dart';

class Retrieve extends StatelessWidget {
  const Retrieve({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor:Colors.black26,
            title: Text('Random Password Generating App'),

          ),
          drawer: Drawer(

            child: Container(
              color: Colors.black12,
              child: ListView(
                // Important: Remove any padding from the ListView.
                  padding: EdgeInsets.zero,
                  children: [
                    const DrawerHeader(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("Images/how-to-use-a-random-password-generator_tvjd.jpg"),
                            fit: BoxFit.cover,
                          )
                      ), child: null,
                    ),
                    ListTile(
                      title: const Text('SplashScreen'),
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacement(MaterialPageRoute(builder: (context) => SplashScreen())); // Update the state of the app.
                        // ...
                      },
                    ),
                    ListTile(
                      title: const Text('Home'),

                      onTap: () {
                        Navigator.of(context)
                            .pushReplacement(MaterialPageRoute(builder: (context) => MyApp()));
                        // Update the state of the app.
                        // ...
                      },
                    ),
                    ListTile(
                      title: const Text('Simple'),

                      onTap: () {
                        Navigator.of(context)
                            .pushReplacement(MaterialPageRoute(builder: (context) => GeneratePassword()));
                        // Update the state of the app.
                        // ...
                      },
                    ),
                    ListTile(
                      title: const Text('Hard'),

                      onTap: () {
                        Navigator.of(context)
                            .pushReplacement(MaterialPageRoute(builder: (context) => MyApps()));
                        // Update the state of the app.
                        // ...
                      },
                    ),

                    ListTile(
                      title: const Text('Upload Password'),

                      onTap: () {
                        Navigator.of(context)
                            .pushReplacement(MaterialPageRoute(builder: (context) => Retrieve()));
                        // Update the state of the app.
                        // ...
                      },
                    ),

                  ]
              ),
            ),),
          body: RetrievePage(),
        )
    );
  }
}

class RetrievePage extends StatefulWidget {
  const RetrievePage({Key key}) : super(key: key);

  @override
  _RetrievePageState createState() => _RetrievePageState();
}

class _RetrievePageState extends State<RetrievePage> {
  List<Board> boardMessages = List();
  Board board;
  final FirebaseDatabase database = FirebaseDatabase.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  DatabaseReference databaseReference;

  @override
  void initState() {
    super.initState();

    board = Board("", "");
    databaseReference = database.reference().child("Passwords");
    databaseReference.onChildAdded.listen(_onEntryAdded);
    databaseReference.onChildChanged.listen(_onEntryChanged);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: <Widget>[
          Flexible(
            flex: 0,
            child: Center(
              child: Form(
                key: formKey,
                child: Flex(
                  direction: Axis.vertical,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.subject),
                      title: TextFormField(
                        initialValue: "",
                        onSaved: (val) => board.Pass = val,
                        validator: (val) => val == "" ? val : null,
                      ),
                    ),

                    ListTile(
                      leading: Icon(Icons.message),
                      title: TextFormField(
                        initialValue: "",
                        onSaved: (val) => board.Index = val,
                        validator: (val) => val == "" ? val : null,
                      ),
                    ),

                    //Send or Post button
                    FlatButton(
                      child: Text("Post"),
                      color: Colors.blue,
                      onPressed: () {
                        handleSubmit();
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            child: FirebaseAnimatedList(
              query: databaseReference,
              itemBuilder: (_, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.white,
                    ),
                    title: Text(boardMessages[index].Index ),
                    subtitle: Text(boardMessages[index].Pass),

                  ),
                );
              },
            ),
          )
        ],
      ),
  );

    }


   void _onEntryAdded(Event event) {
     setState(() {
       boardMessages.add(Board.fromSnapshot(event.snapshot));
     });
   }

   void _onEntryChanged(Event event) {
     var oldEntry = boardMessages.singleWhere((entry) {
       return entry.key == event.snapshot.key;
     });

     setState(() {
       boardMessages[boardMessages.indexOf(oldEntry)] =
           Board.fromSnapshot(event.snapshot);
     });
   }

   void handleSubmit() {
     final FormState form = formKey.currentState;
     if (form.validate()) {
       form.save();
       form.reset();
       //save form data to the database
       databaseReference.push().set(board.toJson());
     }
   }
}

