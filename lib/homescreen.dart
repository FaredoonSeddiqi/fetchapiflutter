import 'package:api/models/name.dart';
import 'package:api/service/apis.dart';
import 'package:flutter/material.dart';

class homescr extends StatefulWidget {
  const homescr({super.key});

  @override
  State<homescr> createState() => _homescrState();
}

class _homescrState extends State<homescr> {
  List<properties> users = [];

  @override
  void initState() {
    super.initState();
    fetchdata();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("APis"),
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final namess = users[index];
            final email = namess.email;
            return ListTile(
              title: Text(namess.fullname),
              subtitle: Text(email),
            );
          }),
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   return fetchdata();
      // }),
    );
  }

  void fetchdata() async {
    final data = await userapis.fetch();

    setState(() {
      users = data;
    });
  }
}
