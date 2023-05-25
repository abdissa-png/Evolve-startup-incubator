import 'package:flutter/material.dart';


class Complaints extends StatelessWidget {
  const Complaints({Key? key}) : super(key: key);

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
        body: const Column(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        "User name",
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),

                    Icon(
                      Icons.arrow_drop_down,
                      size: 50,

                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Message Subject",
                      style: TextStyle(
                        // fontSize: 30,
                        fontFamily: "poppins"
                      ),
                    ),

                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "User name",
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      size: 50,

                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Message Subject",
                      style: TextStyle(

                          fontFamily: "poppins"
                      ),
                    ),

                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
