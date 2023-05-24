import 'package:flutter/material.dart';


import '../models/startUpPairedWithInvestorModel.dart';
export '../models/startUpPairedWithInvestorModel.dart';



class startUpPairedWithInvestorsWidget extends StatefulWidget {
  const startUpPairedWithInvestorsWidget({Key? key}) : super(key: key);

  @override
  _startUpPairedWithInvestorsWidgetState createState() => _startUpPairedWithInvestorsWidgetState();
}

class _startUpPairedWithInvestorsWidgetState extends State<startUpPairedWithInvestorsWidget> {
  late startUpPairedWithInvestorsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  // @override
  // void initState() {
  //   super.initState();
  //   _model = createModel(context, () => startUpPairedWithInvestorsModel());
  // }

  // @override
  // void dispose() {
  //   _model.dispose();

  //   _unfocusNode.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () async {
              // context.pop();
            },
          ),
          title: Text(
            'Paired Startups',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ListTile(
                      title: Text(
                        'Start UP Name1',
                        style:
                            TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Address',
                        style:
                            TextStyle( fontWeight: FontWeight.bold),
                      ),
                      tileColor: Colors.white,
                      dense: false,
                    ),
                    ListTile(
                      title: Text(
                        'Start UP Name2',
                        style:
                            TextStyle( fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Address',
                        style:
                            TextStyle( fontWeight: FontWeight.bold),
                      ),
                      tileColor: Colors.white,
                      dense: false,
                    ),
                    ListTile(
                      title: Text(
                        'Start UP  Name 3',
                        style:
                            TextStyle( fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Address',
                        style:
                            TextStyle( fontWeight: FontWeight.bold),
                      ),
                      tileColor: Colors.white,
                      dense: false,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}