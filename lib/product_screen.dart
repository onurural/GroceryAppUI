import 'package:GreenGrocerApp/profie_screen.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final categoryList = <String>["All", "Fruit", "Vegetable", "SeaFood"];
  var _selectedItem = 0;
  var _bottomNavIndex = 2;
  int _selectedCategory = 0;
  int _currentPage = 2;
  final _controller = PageController(initialPage: 0, keepPage: true);
  @override
  Widget build(BuildContext context) {
    List<Widget> chips = [];
    categoryList.forEach((element) {
      chips.add(chipWidget(categoryList.indexOf(element)));
    });
    return Scaffold(
        appBar: _myAppBar(true),
        bottomNavigationBar: CurvedNavigationBar(
        
          buttonBackgroundColor: Colors.orangeAccent,
          backgroundColor: Colors.orangeAccent,
          animationCurve: Curves.easeOut,
          height: 50,
          index: _bottomNavIndex,
          items: <Widget>[
            Icon(Icons.shopping_bag_outlined, size: 30),
            Icon(Icons.receipt_long, size: 30),
            Icon(Icons.home_outlined, size: 30),
            Icon(Icons.store_outlined, size: 30),
            Icon(Icons.account_circle_rounded, size: 30),
          ],
          onTap: (index) {
            setState(() {
              _bottomNavIndex = index;
              _controller.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);
            });
          },
          letIndexChange: (index) => true,
        ),
        body: PageView(        
          scrollDirection: Axis.horizontal,
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              pageChanged(index);
              _currentPage = index;
            });
          },
          children: [
            Container(
                color: Colors.white,
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(mainAxisSize: MainAxisSize.max, children: [
                        _searchBar(),
                        Container(
                              margin: EdgeInsets.only(left :25),
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.orangeAccent),
                              child: Icon(
                                Icons.format_list_bulleted_sharp,
                                color: Colors.white,
                              )),
                      
                      ]),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      height: 50,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: chips),
                      ),
                    ),
                    _productTable()
                  ],
                )),
              
            ProfileScreen(),

          ],
        ),
      
        );
  }

  Widget chipWidget(int index) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: FlatButton(
        color: _selectedCategory == index ? Colors.orangeAccent : Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 12),
        minWidth: 32,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(
            "${categoryList[index]}",
            style: TextStyle(
                color: _selectedCategory == index ? Colors.white : Colors.grey),
          ),
        ),
        onPressed: () {
          setState(() {
            _selectedCategory = index;
          });
        },
      ),
    );
  }

  _myAppBar(bool visible) {
    return AppBar(
      elevation: 0,
      toolbarOpacity: 1.0,
      primary: true,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.black,
          )),
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Text(
        "Product",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800),
      ),
      actions: [
        Icon(
          Icons.notifications_sharp,
          color: Colors.black,
        )
      ],
    );
  }

  _searchBar() {
    return Container(
      width: 300,
      child: TextFormField(
        style: TextStyle(),
        decoration: InputDecoration(
            fillColor: Colors.white,
            suffixIcon: Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.orangeAccent),
                child: Icon(
                  Icons.search_rounded,
                  color: Colors.white,
                  size: 20,
                )),
            labelText: "Search",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      ),
    );
  }

  _productTable() {
    return Expanded(
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0),
            itemCount: 21,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    FocusScope.of(context).unfocus();
                    _selectedItem = index;
                  });
                },
                child: PhysicalModel(
                  borderRadius: BorderRadius.circular(20),
                  elevation: 5.0,
                  color: Colors.white,
                  child: (Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: _selectedItem == index
                                ? Colors.green.withOpacity(0.7)
                                : Colors.white,
                          ),
                        ]),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                            'asset/image/Single_apple.png',
                            height:40 ,
                            width: 40,
                            ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "  Apple ",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("10 USD",style: TextStyle(fontSize: 8),)
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(5)),
                                  color: Colors.orangeAccent,
                                ),
                                child: Icon(
                                  Icons.add_business_outlined,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ]),
                      ],
                    ),
                  )),
                ),
              );
            }));
  }

  void pageChanged(int index) {
    setState(() {
      _bottomNavIndex = index;
    });
  }
}


