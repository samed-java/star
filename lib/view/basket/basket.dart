import 'package:flutter/material.dart';

class Basket extends StatelessWidget {
  const Basket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15),)
      ),
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: MediaQuery
          .of(context)
          .size
          .height,
      child: Container(
        color: Colors.white,
        alignment: Alignment.bottomCenter,
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height * (2 / 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
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
            SingleChildScrollView(),
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
      ),
    );
  }
}
