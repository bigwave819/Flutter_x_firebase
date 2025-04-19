import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_x_firebase/readdata/get_user_name.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  List<String> docIDs = [];

  Future<void> getDocsId() async {
  await FirebaseFirestore.instance.collection("users").get().then(
    (snapshot) => snapshot.docs.forEach((element) {
      print(element.reference);
      docIDs.add(element.reference.id);
    }),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text('Signed in: ${user.email!}'),
            const SizedBox(height: 10),
            MaterialButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              color: Colors.deepPurple[200],
              child: const Text("Sign Out"),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: FutureBuilder(
                future: getDocsId(),
                builder: (context, snapshot) {
                    return ListView.builder(
                      itemCount: docIDs.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: GetUserName(documentId: docIDs[index]),
                        );
                      },
                    );
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
