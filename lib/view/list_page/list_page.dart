import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        
        onPressed: (){},
        child: Center(
          child: Icon(Icons.store, color: Colors.black, size: 40,),
        ),
      ),
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
            )));
  }
}
