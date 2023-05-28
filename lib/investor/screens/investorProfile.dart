import 'package:flutter/material.dart';
import '../models/investorprofileModel.dart';

class InvestorProfileWidget extends StatefulWidget {
  const InvestorProfileWidget({super.key});

  @override
  State<InvestorProfileWidget> createState() => _InvestorProfileWidgetState();
}

class _InvestorProfileWidgetState extends State<InvestorProfileWidget> {
  InvestorProfileModel investorProfileModel = InvestorProfileModel();

  final _formkey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _DesController = TextEditingController();
  String? _phone = null;

  bool _funding = false;

  bool _Mentoring = false;
  bool _legal = false;
  bool _other = false;

  bool _seed = false;

  bool _early = false;
  bool _growth = false;
  bool _late = false;

  @override
  void initState() {
    super.initState();

    // _nameController.addListener(_updateText);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    super.dispose();
  }

  void _updateText(value) {
    setState(() {
      _phone = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Form(
              key: _formkey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Field Required!';
                      } else
                        null;
                    },
                    controller: _nameController,
                    decoration: InputDecoration(
                        labelText: 'Investor\'s Name',
                        border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Field required!';
                      } else
                        null;
                    },
                    onChanged: (value) {
                      _updateText(value);
                    },
                    decoration: InputDecoration(
                        labelText: 'Phone Number',
                        border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Field required!';
                      }
                      null;
                    },
                    controller: _DesController,
                    maxLines: 15,
                    minLines: 6,
                    decoration: InputDecoration(
                        labelText: 'Description', border: OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Column(
                    children: [
                      Text(
                        'Investment Interest',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Container(
                        child: Column(
                          children: [
                            CheckboxListTile(
                              tristate: false,
                              onChanged: (value) {
                                setState(() {
                                  _funding = value!;
                                });
                              },
                              value: _funding,
                              title: Text('Funding'),
                            ),
                            CheckboxListTile(
                              tristate: false,
                              onChanged: (value) {
                                setState(() {
                                  _Mentoring = value!;
                                });
                              },
                              value: _Mentoring,
                              title: Text('Mentoring'),
                            ),
                            CheckboxListTile(
                              tristate: false,
                              onChanged: (value) {
                                setState(() {
                                  _legal = value!;
                                });
                              },
                              value: _legal,
                              title: Text('Legal Assisstance'),
                            ),
                            CheckboxListTile(
                              tristate: false,
                              onChanged: (value) {
                                setState(() {
                                  _other = value!;
                                });
                              },
                              value: _other,
                              title: Text('Other'),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Investment Stage',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Container(
                        child: Column(
                          children: [
                            CheckboxListTile(
                              tristate: false,
                              onChanged: (value) {
                                setState(() {
                                  _seed = value!;
                                });
                              },
                              value: _seed,
                              title: Text('Seed'),
                            ),
                            CheckboxListTile(
                              tristate: false,
                              onChanged: (value) {
                                setState(() {
                                  _early = value!;
                                });
                              },
                              value: _early,
                              title: Text('Early - Stage'),
                            ),
                            CheckboxListTile(
                              tristate: false,
                              onChanged: (value) {
                                setState(() {
                                  _growth = value!;
                                });
                              },
                              value: _growth,
                              title: Text('Growth'),
                            ),
                            CheckboxListTile(
                              tristate: false,
                              onChanged: (value) {
                                setState(() {
                                  _late = value!;
                                });
                              },
                              value: _late,
                              title: Text('Late - Stage'),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              investorProfileModel.early = _early!;
                              investorProfileModel.late = _late!;
                              investorProfileModel.growth = _growth!;
                              investorProfileModel.seed = _seed!;
                              investorProfileModel.funding = _funding!;
                              investorProfileModel.mentoring = _Mentoring!;
                              investorProfileModel.legal = _legal!;
                              investorProfileModel.other = _other!;
                              investorProfileModel.name = _nameController.text!;
                              investorProfileModel.description =
                                  _DesController.text!;
                              investorProfileModel.phone = _phone!;
                              print(
                                  'name: ${investorProfileModel.name} des: ${investorProfileModel.description} phone: ${investorProfileModel.phone} bools: ${investorProfileModel.early}');
                            } else
                              null;
                          },
                          child: const Text('submitt')),
                    ],
                  )
                  // CheckboxListTile(
                  //   title: Text('top product'),
                  //   value: _listtilecheck,
                  //   onChanged: (value) {
                  //     setState(() {
                  //       _listtilecheck = value;
                  //     });
                  //   },
                  //   controlAffinity: ListTileControlAffinity.leading,
                  // ),
                  // Row(
                  //   children: <Widget>[
                  //     Expanded(
                  //       child: RadioListTile<ProductTypeEnums>(
                  //         contentPadding: EdgeInsets.all(0.0),
                  //         tileColor: Colors.deepPurple.shade50,
                  //         dense: true,
                  //         title: Text(ProductTypeEnums.Deliverable.name),
                  //         value: ProductTypeEnums.Deliverable,
                  //         groupValue: _productTypeEnum,
                  //         onChanged: (value) {
                  //           setState(() {
                  //             _productTypeEnum = value;
                  //           });
                  //         },
                  //       ),
                  //     ),
                  //     SizedBox(width: 5.0),
                  //     Expanded(
                  //       child: RadioListTile<ProductTypeEnums>(
                  //         contentPadding: EdgeInsets.all(0.0),
                  //         tileColor: Colors.deepPurple.shade50,
                  //         title: Text(ProductTypeEnums.Downloadable.name),
                  //         dense: true,
                  //         value: ProductTypeEnums.Downloadable,
                  //         groupValue: _productTypeEnum,
                  //         onChanged: (value) {
                  //           setState(() {
                  //             _productTypeEnum = value;
                  //           });
                  //         },
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(
                  //   height: 10.0,
                  // ),
                  // DropdownButtonFormField(
                  //     dropdownColor: Colors.purple.shade50,
                  //     decoration: InputDecoration(
                  //       labelText: 'product sizes',
                  //       border: UnderlineInputBorder(),
                  //     ),
                  //     value: _selectedVal,
                  //     items: _productSizes
                  //         .map((e) => DropdownMenuItem(
                  //               child: Text(e),
                  //               value: e,
                  //             ))
                  //         .toList(),
                  //     onChanged: (val) {
                  //       setState(() {
                  //         _selectedVal = val as String;
                  //       });
                  //     }),
                  // ElevatedButton(
                  //     onPressed: () {
                  //       if (_formkey.currentState!.validate()) {
                  //         InvestorProfileModel InvestorProfileModel = InvestorProfileModel();

                  //         InvestorProfileModel.productname = _nameController.text;
                  //         InvestorProfileModel.InvestorProfileModel = _DesController.text;
                  //          InvestorProfileModel.isTopProduct = _topProduct!;
                  //          InvestorProfileModel.productType = _productTypeEnum!;
                  //          InvestorProfileModel.productSize = _selectedVal!;
                  //         Navigator.push(context, MaterialPageRoute(
                  //           builder: (context) {
                  //             return Details(InvestorProfileModel: InvestorProfileModel);
                  //           },
                  //         ));
                  //       } else
                  //         null;
                  //     },
                  //     child: const Text('submitt')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
