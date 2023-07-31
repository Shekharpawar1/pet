import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';

class AddPet extends StatefulWidget {
  const AddPet({super.key});

  @override
  State<AddPet> createState() => _AddPetState();
}

class _AddPetState extends State<AddPet> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(

  //         appBar: AppBar(
  //             elevation: 0,
  //           backgroundColor:green,
  // // leading: Padding(
  // //   padding:  EdgeInsets.only(left:20.0,top: 10,bottom: 10,right: 0),
  // //   child:   InkWell(onTap: (){
  // //     Navigator.pop(context);
  // //   },
  // //     child: Icon(Icons.arrow_back_ios,color: black,size: 20,
      
  // //     ),
  // //   ),
  // // ),
              
              
  //             actions: [
  //             SvgPicture.asset("assets/image/notification.svg",color:MyColors.white,),
  //             // Image.asset("assets/image/cartimg.png"),
  //             SizedBox(width: 20),
  //             Padding(
  //               padding:  EdgeInsets.only(right:20.0),
  //               child: SvgPicture.asset("assets/image/bag.svg",color:MyColors.white,),
  //             ),
            
  //           ],
    
  //         title: Text("My Pet",style: CustomTextStyle.appbartextwhite,),
  //         ),
      
        body:  Stack(children: [

          
          Container(height: MediaQuery.of(context).size.height*0.4,

          width: MediaQuery.of(context).size.width,
            child: Image.asset("assets/image/girlwithdog.png",fit: BoxFit.cover,)),
              

              Center(
                child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height*0.06,),
Padding(
  padding: const EdgeInsets.all(10.0),
  child:   Row(crossAxisAlignment: CrossAxisAlignment.center,
  
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  
    
  
    children: [
  
      Icon(Icons.arrow_back_ios_new,color:MyColors.white,size: 20,),
  
     Text("My Pet",style: CustomTextStyle.appbartextwhite,),

     Row(
       children: [
         SvgPicture.asset("assets/image/notification.svg",color:MyColors.white,),
                  // Image.asset("assets/image/cartimg.png"),
                  SizedBox(width: 20),
                  Padding(
                    padding:  EdgeInsets.only(right:0.0),
                    child: SvgPicture.asset("assets/image/bag.svg",color:MyColors.white,),
                  ),
       ],
     ),
  
  ],),
),
                                    
                  ],
                ),
              ),
        
        
          ListView(
          
            children:[ 
              
              
              Padding(
            padding:  EdgeInsets.only(top:200.0),
            child: Container(
          height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
 decoration: BoxDecoration(color:MyColors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight:Radius.circular(30) ),
              ),

              child: Padding(
                padding:  EdgeInsets.all(20),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  
                  children: [
                  
                   Stack(
  alignment: Alignment.topLeft,
  children: <Widget>[
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Container(
        width:400,
        height: 150,
        margin: EdgeInsets.all(16.0),
        child: Card(
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          ),
          color: Colors.white,
          child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.end,
             children: [
    

    Align(alignment: Alignment.topRight,
      child: Container(
            //alignment: Alignment.topRight,
            height: MediaQuery.of(context).size.height*0.03,
            width: MediaQuery.of(context).size.width*0.4,
            decoration: BoxDecoration(color:MyColors.yellow,borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomLeft: Radius.circular(20))),
         child: Center(child: Text("2 Year 3 Month",style: CustomTextStyle.popinssmall0,)), ),
    ),
    


 
            ],),
          
          SizedBox(height: 10,),
Text("09/04/2021",style:CustomTextStyle.popinssmall1,),
SizedBox(height: 3,),
Text("Jarman safed",style:CustomTextStyle.popinssmall1,),
SizedBox(height: 3,),
          
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
 Padding(
   padding: const EdgeInsets.all(8.0),
   child: Column(crossAxisAlignment: CrossAxisAlignment.center,
     children: [
       Text("Jumba",style: CustomTextStyle.popinstext,),
 Text("Female",style: CustomTextStyle.popinssmall0,),
     ],
   ),
 ),

            Row(
  mainAxisAlignment: MainAxisAlignment.end,
  crossAxisAlignment: CrossAxisAlignment.start,
  
  children: [
Image.asset("assets/image/edit0.png"),

Image.asset("assets/image/delete0.png")
],),
          ],
          )

          ],
          ),
        ),
      ),
    ),
 Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        // shape: BoxShape.circle,
        // border: Border.all(
        //   color: Colors.black12,
        // ),
        color: Colors.transparent,
        image: DecorationImage(
          fit: BoxFit.cover,
          image:AssetImage("assets/image/cutedogi2.png")
          
          
        ),
      ),
    ),
 
  ],
),


   Stack(
  alignment: Alignment.topLeft,
  children: <Widget>[
    Padding(
      padding: EdgeInsets.only(top: 10),
      child: Container(
        width:400,
        height: 150,
        margin: EdgeInsets.all(16.0),
        child: Card(
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          ),
          color: Colors.white,
          child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.end,
             children: [
    

    Align(alignment: Alignment.topRight,
      child: Container(
            //alignment: Alignment.topRight,
            height: MediaQuery.of(context).size.height*0.03,
            width: MediaQuery.of(context).size.width*0.4,
            decoration: BoxDecoration(color:MyColors.  bgcolor,borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomLeft: Radius.circular(20))),
         child: Center(child: Text("2 Year 3 Month",style: CustomTextStyle.popinssmall0,)), ),
    ),
    


 
            ],),
          
          SizedBox(height: 10,),
Text("09/04/2021",style:CustomTextStyle.popinssmall1,),
SizedBox(height: 3,),
Text("Jarman safed",style:CustomTextStyle.popinssmall1,),
SizedBox(height: 3,),
          
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
 Padding(
   padding: const EdgeInsets.all(8.0),
   child: Column(crossAxisAlignment: CrossAxisAlignment.center,
     children: [
       Text("Jumba",style: CustomTextStyle.popinstext,),
 Text("Female",style: CustomTextStyle.popinssmall0,),
     ],
   ),
 ),

            Row(
  mainAxisAlignment: MainAxisAlignment.end,
  crossAxisAlignment: CrossAxisAlignment.start,
  
  children: [
Image.asset("assets/image/edit0.png"),

Image.asset("assets/image/delete0.png")
],),
          ],
          )

          ],
          ),
        ),
      ),
    ),
 Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        // shape: BoxShape.circle,
        // border: Border.all(
        //   color: Colors.black12,
        // ),
        color: Colors.transparent,
        image: DecorationImage(
          fit: BoxFit.cover,
          image:AssetImage("assets/image/cutedogi.png")
         
                  // SvgPicture.asset("assets/image/avatardogyellow.svg"),
          // AssetImage("assets/image/avatardogyellow.png")
          
          
        ),
      ),
    ),
 
  ],
),












// Container(
//   // margin: EdgeInsets.all(10),
//   height: MediaQuery.of(context).size.height*0.3,
//   width: MediaQuery.of(context).size.width,

//   decoration: BoxDecoration(color:MyColors.white,
//                   borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight:Radius.circular(30) ),
//                 ),
// child: Row(children: [
// Column(children: [
//  Image.asset("assets/image/cutedog.png"),

//  Text("Jumba",style: CustomTextStyle.popinstext,),
//   Text("Female",style: CustomTextStyle.popinssmall0,)
// ],),
 

//   Column(crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//     Positioned(right: 0,
//       child: Container(
//         // alignment: Alignment.topRight,
//         height: MediaQuery.of(context).size.height*0.03,
//         width: MediaQuery.of(context).size.width*0.4,
//         decoration: BoxDecoration(color:MyColors.yellow,borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomLeft: Radius.circular(20))),
//        child: Center(child: Text("2 Year 3 Month",style: CustomTextStyle.popinssmall0,)), ),
//     )
// ,


// SizedBox(height: 3,),
// Text("09/04/2021",style:CustomTextStyle.popinssmall1,),
// SizedBox(height: 3,),
// Text("Jarman safed",style:CustomTextStyle.popinssmall1,),
// SizedBox(height: 3,),
// Row(
//   //mainAxisAlignment: MainAxisAlignment.end,
  
//   children: [
// Image.asset("assets/image/edit0.png"),

// Image.asset("assets/image/delete0.png")
// ],)

//   ],)
// ]),

// )
   
   
   
   
                          ],),
              ),),
            ),
           
           
           
           
            ]    )
          
          ],),
      
      );
    }}