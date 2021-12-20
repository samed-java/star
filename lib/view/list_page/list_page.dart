import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';


class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  bool on =false;
  @override
  Widget build(BuildContext context) {
    return
        Scaffold(
          /*floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.yellow,

            onPressed: (){},
            child: Center(
              child: Icon(Icons.store, color: Colors.black, size: 40,),
            ),
          ),*/
            backgroundColor: Colors.white70,
            appBar: PreferredSize(

                preferredSize: Size(MediaQuery.of(context).size.width, 150),
                child: Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 60,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 200,
                        child: Text("Table 1",
                            style: TextStyle(
                              fontSize: 35,
                            )),
                      ),
                      GestureDetector(
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.yellow),
                          child: Center(
                              child: Icon(
                            Icons.qr_code,
                            color: Colors.black,
                            size: 40,
                          )),
                        ),
                        onTap: () {},
                      )
                    ],
                  ),
                )),
        body: SlidingSheet(
          elevation: 8,
          cornerRadius: 16,
          snapSpec: const SnapSpec(
            // Enable snapping. This is true by default.
            snap: true,
            // Set custom snapping points.
            snappings: [0.15, 0.8, 1.0],
            // Define to what the snappings relate to. In this case,
            // the total available space that the sheet can expand to.
            positioning: SnapPositioning.relativeToAvailableSpace,
          ),
          // The body widget will be displayed under the SlidingSheet
          // and a parallax effect can be applied to it.
          body: Center(
            child: Text('This widget is below the SlidingSheet'),
          ),
          builder: (context, state) {
            // This is the content of the sheet that will get
            // scrolled, if the content is bigger than the available
            // height of the sheet.
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height-100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: 60,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          height: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text(
                                "Total item:",
                                style: TextStyle(fontSize: 30),
                              ),
                              Text(
                                "4",
                                style: TextStyle(fontSize: 30),
                              ),
                              Text(
                                "Total cost",
                                style: TextStyle(fontSize: 30),
                              ),
                              Text(
                                "10",
                                style: TextStyle(fontSize: 30),
                              ),
                            ],
                          )),
                    ),
                  ),
                  Text('salam'),
                  Container(
                      alignment: Alignment.bottomCenter,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      height: 70,
                      child: Center(
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 200,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.yellow),
                            child: Center(
                              child: Text(
                                "Order now",
                                style: TextStyle(
                                    fontSize: 40, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      )),
                ],
              ),
            );
          },
        ),
        );

  }
}
