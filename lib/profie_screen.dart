import 'dart:ui';

import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Color color = Colors.white;
  var _selectedItemIndex;
  final textList = <String>[
    'Add Product',
    'Add Outlet',
    'Add Stock',
    'List Order',
    'Report',
    'Absen'
  ];
  final _iconList = <IconData>[
    Icons.home_outlined,
    Icons.add_box_rounded,
    Icons.receipt_long,
    Icons.list_alt,
    Icons.qr_code_scanner_rounded,
    Icons.add_shopping_cart,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
     Stack(children: [
            Container(
              height: 150.0,
              decoration: BoxDecoration(
                  color: Colors.orange[300],
                  boxShadow: [BoxShadow(blurRadius: 40.0)],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  )),
              child: Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 18.0, top: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                            backgroundImage: AssetImage(
                          'asset/image/SampleProfilePic.png',
                        )),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Hallo Onur ",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    Flexible(flex: 2, child: Icon(Icons.notifications_rounded)),
                  ],
                ),
              ),
            ),
            Container(
              height: 150,
              margin: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20.0,
                    color: Colors.grey,
                    offset: Offset(0.0, 0.75),
                  ),
                ],
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      flex: 4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("100",
                              style: TextStyle(
                                  color: Colors.orange[300],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30)),
                          Text("100",
                              style: TextStyle(
                                  color: Colors.orange[300],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30)),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Text("Total Distributor",
                                style: TextStyle(
                                    color: Colors.grey[400],
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12)),
                          ),
                          Flexible(
                            flex: 1,
                            child: Text("Total Customer",
                                style: TextStyle(
                                    color: Colors.grey[400],
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Divider(thickness: 0.5, color: Colors.grey),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("10",
                            style: TextStyle(
                                color: Colors.orange[300],
                                fontWeight: FontWeight.bold,
                                fontSize: 30)),
                        Text("20",
                            style: TextStyle(
                                color: Colors.orange[300],
                                fontWeight: FontWeight.bold,
                                fontSize: 30)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("New Order",
                            style: TextStyle(
                                color: Colors.grey[400],
                                fontWeight: FontWeight.w600,
                                fontSize: 12)),
                        Text("Canceled Order",
                            style: TextStyle(
                                color: Colors.grey[400],
                                fontWeight: FontWeight.w600,
                                fontSize: 12)),
                      ],
                    ),
                  ]),
            )
          ]),
        
        userOptionMenu(),
        
      ],
    );
  }

  userOptionMenu() {
    return (Flexible(
      flex: 1,
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Expanded(
                          child: GridView.builder(
                itemCount: 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 20),
                itemBuilder: (BuildContext context, int index) {
                  return PhysicalModel(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedItemIndex = index;
                          });
                        },
                        child: Container(
                        
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: _selectedItemIndex == index
                                      ? Colors.orange[300]
                                      : Colors.white,
                                ),
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                _iconList[index],
                                size: 40,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${textList[index]}",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ));
                },
              ),
            ),
            Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Order waiting to be processed",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.grey[600]),
              ),
            ),
          ],
        ),
            orderDetailBox(context)
          ],
        ),
      ),
    ));
  }

  orderDetailBox(BuildContext context) {
    final orderDetailBoxIcons = <IconData>[
      Icons.analytics,
      Icons.payments_rounded,
      Icons.local_shipping,
    ];
    final orderDetailBoxTitle = <String>['approval', 'payment', 'shipped'];
    final orderDetailBoxTrailing = <String>['10', '100', '200'];
    return Expanded(
      child: (Container(
          child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
            
              return Row(
                children: [
                  Expanded(
                    child: ListTile(
                      leading: Icon(orderDetailBoxIcons[index],color: Colors.orange,),
                      title: Text("Waiting for ${orderDetailBoxTitle[index]}"),
                      trailing: Text("${orderDetailBoxTrailing[index]}"),
                    ),
                  )
                ],
              );
            }),
          )
        ],
      ))),
    );
  }
}
