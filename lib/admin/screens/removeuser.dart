import 'package:flutter/material.dart';
import '../models/removeUserModel.dart';

class RemoveUser extends StatefulWidget {
  const RemoveUser({Key? key}) : super(key: key);

  @override
  State<RemoveUser> createState() => _RemoveUserState();
}

class _RemoveUserState extends State<RemoveUser> {
  final myController = TextEditingController();
  final List<DeleteUser> itemList = [
    DeleteUser(title: 'userName', subtitle: 'Role'),
    DeleteUser(title: 'userName', subtitle: 'Role'),
    DeleteUser(title: 'userName', subtitle: 'Role'),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigoAccent[700],
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_rounded,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            "Remove User",
            style: TextStyle(),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(20.0),
            child: Container(),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
              child: TextFormField(
                controller: myController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search_outlined),
                  border: InputBorder.none,
                  labelText: "Enter StartUp Name",
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 12, 0, 0),
              child: Text(
                'Startups matching search',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: itemList.length,
                itemBuilder: (context, index) {
                  final item = itemList[index];
                  return ListTile(
                    title: Text(
                      item.title,
                      style: const TextStyle(fontSize: 40),
                    ),
                    subtitle: Text(item.subtitle),
                    trailing: const Icon(Icons.delete),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
