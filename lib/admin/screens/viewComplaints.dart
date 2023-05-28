import 'package:flutter/material.dart';

import '../models/complaintModel.dart';

class Complaints extends StatefulWidget {
  const Complaints({Key? key}) : super(key: key);

  @override
  State<Complaints> createState() => _ComplaintsState();
}

class _ComplaintsState extends State<Complaints> {
  final List<Complaint> complaints = [
    Complaint(
        userName: "username",
        subject:
            "MessageMejfdjflajldjal;dljfldjflsa;lsljdlfjdlkfjlkdjflejifjsajdkfjldkjflkdjfljdklfjdj"),
    Complaint(
        userName: "userName",
        subject:
            "MessageMessageMejfdjflajldjal;dljfldjflsa;lsljdlfjdlkfjlkdjflejifjsajdkfjldkjflkdjfljdklfjdj"),
    Complaint(
        userName: "userName",
        subject:
            "MessageMessageMejfdjflajldjal;dljfldjflsa;lsljdlfjdlkfjlkdjflejifjsajdkfjldkjflkdjfljdklfjdj"),
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
          title: const Text("Complaints"),
        ),
        body: ListView.builder(
            itemCount: complaints.length,
            itemBuilder: (context, index) {
              final complaint = complaints[index];
              return ExpansionTile(
                title: Text(
                  complaint.userName,
                  style: const TextStyle(fontSize: 40),
                ),
                subtitle: Text(complaint.subject.substring(0, 7)),
                trailing: const Icon(
                  Icons.arrow_drop_down,
                  size: 50,
                ),
                children: [
                  Text(complaint.subject),
                  // Expanded(child: ElevatedButton(
                  //     onPressed: (){},
                  //   child: const Text("Reply"),
                  // ),
                ],
              );
            }),
        // body: const Column(
        //   children: [
        //     Column(
        //       children: [
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             Text(
        //                 "User name",
        //               style: TextStyle(
        //                 fontSize: 30,
        //               ),
        //             ),
        //
        //             Icon(
        //               Icons.arrow_drop_down,
        //               size: 50,
        //
        //             )
        //           ],
        //         ),
        //         Row(
        //           children: [
        //             Text(
        //               "Message Subject",
        //               style: TextStyle(
        //                 // fontSize: 30,
        //                 fontFamily: "poppins"
        //               ),
        //             ),
        //
        //           ],
        //         ),
        //         SizedBox(height: 20,),
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             Text(
        //               "User name",
        //               style: TextStyle(
        //                 fontSize: 30,
        //               ),
        //             ),
        //             Icon(
        //               Icons.arrow_drop_down,
        //               size: 50,
        //
        //             )
        //           ],
        //         ),
        //         Row(
        //           children: [
        //             Text(
        //               "Message Subject",
        //               style: TextStyle(
        //
        //                   fontFamily: "poppins"
        //               ),
        //             ),
        //
        //           ],
        //         )
        //       ],
        //     )
        //   ],
        // ),
      ),
    );
  }
}
