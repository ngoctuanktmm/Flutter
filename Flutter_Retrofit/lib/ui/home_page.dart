import 'package:Flutter_Retrofit/models/user_model.dart';
import 'package:Flutter_Retrofit/repositories/user_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final _repository = UserRepository(Dio());
  final _usernameEdittingController = TextEditingController();
  final _fullnameEdittingController = TextEditingController();
  final _emailEdittingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Retrofit'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => insertNewUser(),
        child: Icon(Icons.person_add),
      ),
      body: FutureBuilder<List<UserModel>>(
        future: _repository.getAllUsers(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            final users = snapshot.data;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  onTap: () => showDetails(user.id),
                  title: Text(user.username),
                  subtitle: Text(user.fullname),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }

  void showDetails(String id) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          content: FutureBuilder<UserModel>(
            future: _repository.getDetailUserById(id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  height: 50,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                final user = snapshot.data;
                return ListTile(
                  title: Text(user.fullname),
                  subtitle: Text(user.email),
                );
              }
              return Container();
            },
          ),
        );
      },
    );
  }

  void insertNewUser() {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          content: Container(
            height: 200,
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: _usernameEdittingController,
                  ),
                  TextFormField(
                    controller: _fullnameEdittingController,
                  ),
                  TextFormField(
                    controller: _emailEdittingController,
                  ),
                ],
              ),
            ),
          ),
          actions: [
            FlatButton(
              onPressed: () async {
                await _repository.insertNewUser(
                  UserModel(
                    username: _usernameEdittingController.text,
                    fullname: _fullnameEdittingController.text,
                    email: _emailEdittingController.text,
                  ),
                );
                Navigator.pop(context);
                setState(() {});
              },
              child: Text('Save'),
            )
          ],
        );
      },
    );
  }
}
