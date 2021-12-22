import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:star/helper/Helper.dart';
import 'package:star/models/basket.dart';
import 'package:star/models/product.dart';
import 'package:star/models/table.dart';
import 'package:star/states/basket_state/basket_cubit.dart';
import 'package:star/states/product_state/product_cubit.dart';
import 'package:star/states/product_state/product_state.dart';
import 'package:star/states/table_state/table_cubit.dart';
import 'package:star/states/table_state/table_state.dart';
import 'package:star/view/qr_scanner/qr_scanner.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
/*  Future scanCode() async{
    try {
      ScanResult cameraScanResult = await BarcodeScanner.scan();
      setState(() {
        Helper.table = cameraScanResult.rawContent; // setting string result with cameraScanResult
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }*/

  List<BasketModel> basket = List.empty();
  bool on = false;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ProductCubit()),
          BlocProvider(create: (context) => TableCubit()),
          BlocProvider(create: (context) => BasketCubit()),
        ],
        child: Scaffold(
          /*floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.yellow,

            onPressed: (){},
            child: Center(
              child: Icon(Icons.store, color: Colors.black, size: 40,),
            ),
          ),*/
          backgroundColor: Colors.white70,
          appBar: PreferredSize(
              preferredSize: Size(MediaQuery
                  .of(context)
                  .size
                  .width, 150),
              child: Container(
                color: Colors.white,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
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
                      width: MediaQuery
                          .of(context)
                          .size
                          .width - 200,
                      child: BlocConsumer<TableCubit, TableState>(
                          listener: (context, state) {
                            if (Helper.table != '')
                              BlocProvider.of<TableCubit>(context).getData();
                          }, builder: (context, state) {
                        print(Helper.table);
                        if (state is InitState) {
                          return Text("Wait..",
                              style: TextStyle(
                                fontSize: 35,
                              ));
                        } else if (state is LoadingState) {
                          return Text("Loading..",
                              style: TextStyle(
                                fontSize: 35,
                              ));
                        } else if (state is LoadedState) {
                          print("looooool");
                          return FutureBuilder(
                              future: state.table,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  print(
                                      "table : ${(snapshot.data as TableModel)
                                          .name}");
                                  return Text(
                                      (snapshot.data as TableModel).name,
                                      style: TextStyle(
                                        fontSize: 35,
                                      ));
                                } else {
                                  return Text("Wait..",
                                      style: TextStyle(
                                        fontSize: 35,
                                      ));
                                }
                              });
                        } else {
                          return Text("Error..",
                              style: TextStyle(
                                fontSize: 35,
                              ));
                        }
                      }),
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
                        onTap: () {
                          QRCodeScan scan = QRCodeScan();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => scan));
                        } //scanCode,
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
              snappings: [0.15, 1.0, 1.0],
              // Define to what the snappings relate to. In this case,
              // the total available space that the sheet can expand to.
              positioning: SnapPositioning.relativeToAvailableSpace,
            ),
            // The body widget will be displayed under the SlidingSheet
            // and a parallax effect can be applied to it.
            body: Center(
                child: BlocConsumer<ProductCubit, ProductState>(
                  listener: (context, state) {
                    if (state is PErrorState) {
                      print("error");
                    }
                  },
                  builder: (context, state) {
                    BlocProvider.of<ProductCubit>(context).getData();
                    if (state is PInitState) {
                      return Center(
                        child: Text("Hello"),
                      );
                    }
                    else if (state is PLoadingState) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    else if (state is PLoadedState) {
                      return FutureBuilder(
                        future: state.product,
                          builder: (context, snapshot) {
                          if(snapshot.hasData){
                            return ListView.builder(
                              itemCount: (snapshot.data as List<Product>).length,
                                itemBuilder: (context,index){
                                return Card(
                                  elevation: 2,
                                  child: ListTile(
                                    leading: Image.network((snapshot.data as List<Product>)[index].image),
                                    title: Text((snapshot.data as List<Product>)[index].name),
                                    subtitle: Text((snapshot.data as List<Product>)[index].price),
                                  ),
                                );
                                }
                            );
                          }
                          else{
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          });
                    }
                    else{
                      return Center(
                        child: Text("Error"),
                      );
                    }
                  },
                )
            ),
            builder: (context, state) {
              // This is the content of the sheet that will get
              // scrolled, if the content is bigger than the available
              // height of the sheet.
              return Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: MediaQuery
                    .of(context)
                    .size
                    .height - 100,
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
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height - 230,
                      child: SingleChildScrollView(child: Text("salam")),
                    ),
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
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
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
        ));
  }
}
