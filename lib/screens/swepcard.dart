
import 'package:flutter/material.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Swipe Delete"),
        ),
        body: Center(child: SwipeList()));
  }
}

class SwipeList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CircleWidgets();
  }
}

class CircleWidgets extends State<SwipeList> {
  List items = getDummyList();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
      // itemCount: items.length,
      physics: NeverScrollableScrollPhysics(),
        itemCount: 3,
      itemBuilder: (context, index) {
        return Dismissible(
          direction: DismissDirection.endToStart,
  
          key:
           Key(items[index]),
          background: Container(   height: MediaQuery.of(context).size.height*0.2,
   
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color:MyColors.bgcolor),
            alignment: AlignmentDirectional.centerEnd,
           
            child: Padding(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 25.0, 0.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.edit,
                  color: Colors.white,
                  
              ),
SizedBox(width: 35,),
                  Icon(Icons.delete,
                  color: Colors.white,
                  
              ),
                //  Image.asset("assets/image/editpet.png",color:MyColors.white,),
                //      Image.asset("assets/image/delete.png",color:MyColors.white,height: 20,),
                ],
              ),
              
              
            ),
          ),
          onDismissed: (direction) {
            setState(() {
              items.removeAt(index);
            });
          },
          child:  
          
             Column(
               children: [
                 Container(height:   MediaQuery.of(context).size.height*0.18,
     width:MediaQuery.of(context).size.width ,
     decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: MyColors.boxbgcolor),
     child: Row(children: [
                 


                 Padding(
                   padding: const EdgeInsets.all(15.0),
                   child: Image.asset("assets/image/fooddog.png",),
                 ),

                 Column(crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.center,
                  
                  children: [


Text("Mars Petcare Inc",style: CustomTextStyle.popinsmedium,),

Text("with paneer or cottage cheese",style: CustomTextStyle.popinssmall0),
Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
  
  children: [

Text("₹ 620.00",style: CustomTextStyle.popinsmedium,),

SizedBox(width: MediaQuery.of(context).size.width*0.1,),
Row(
              children: [
                Container(
                    width: 30,
                  height: 25,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color:MyColors.yellow,
                 borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child:Text("-",style: TextStyle(color:MyColors. black,fontSize: 18),)
                    //  Icon(
                    //   Icons.minimize,
                    //   size: 8,
                    //   color: Colors.white,
                    // ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                    width: 35,
                    height: 40,
                    decoration: BoxDecoration(

                        borderRadius:
                            BorderRadius.circular(50),
                      

                        ),
                    child: Center(
                        child: Text(
                      "4",
                      style: TextStyle(
                          fontWeight: FontWeight.w500),
                    ))),
                SizedBox(
                  width: 5,
                ),
                Container(
                  width: 30,
                  height: 25,
                  decoration: BoxDecoration(
                    //shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
color:MyColors.yellow
                  ),
                  child: Icon(
                    Icons.add,size: 15,
                    color: Colors.black
                  ),
                ),
              ],
            )



],) ],)
      
     ]),
     
     ),
              SizedBox(height: 20,),
               ],
             )
      
        );
      },
    ));
  }

  static List getDummyList(){
   List list =  List.generate(10, (i) {
    return "Item ${i +1 }";
    });
    return list;
  }
}