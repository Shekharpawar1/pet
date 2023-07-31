
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';

class AlltoyPage extends StatefulWidget {
  const AlltoyPage({super.key});

  @override
  State<AlltoyPage> createState() => _AlltoyPageState();
}

class _AlltoyPageState extends State<AlltoyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            elevation: 0,
          backgroundColor:Colors.transparent,
leading: Padding(
  padding:  EdgeInsets.only(left:5.0,top: 10,bottom: 10,right: 0),
  child:   InkWell(onTap: (){
    Navigator.pop(context);
  },
    child: Icon(Icons.arrow_back_ios,color: MyColors.black,size: 20,
    
    ),
  ),
),
         
        title: Center(child: Text("All Toy",style: CustomTextStyle.appbartext,)),
        ),

        body:SingleChildScrollView(child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(children: [
            // SizedBox(height: MediaQuery.of(context).size.height*0.01),
        
             GridView(
                                                        physics:
                                                        NeverScrollableScrollPhysics(),
                                                        scrollDirection:
                                                        Axis.vertical,
                                                        gridDelegate:
                                                        SliverGridDelegateWithFixedCrossAxisCount(
                                                            crossAxisCount:
                                                            2,
                                                            crossAxisSpacing:
                                                            15,
                                                            mainAxisSpacing:
                                                            15,
                                                            mainAxisExtent:
                                                            276),
                                                        children: [
                                                         
                           
  InkWell(
    onTap: (){
        // Navigator.push(context, MaterialPageRoute(builder: (context)=>OurBrand()));
    },
    child:           Container(
          
            height:MediaQuery.of(context).size.width*0.7,
          
            width: MediaQuery.of(context).size.width*0.46,
          
            decoration: BoxDecoration(
          
              borderRadius: BorderRadius.circular(25),
  color:MyColors.white
            ),
          
          child: Column(children: [
          
                        Container(
         
            decoration: BoxDecoration(
          
              borderRadius: BorderRadius.circular(30),
    color:MyColors.white
          
          
          
            ),
                          child:
                          Image.asset("assets/image/food.png",fit: BoxFit.cover,height: 135),
                        ),
                        
          
          
          // SizedBox(height: 15,),
          
          
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column( mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
               Text(
                      'Mars Petcare Inc',
                      style:  CustomTextStyle.  popinsmedium
                    
                    ),
                        Text(
                      'Lorem Ipsum is simply dummy',
                      style:  CustomTextStyle.  popinssmall0
                    
                    ),
                // SizedBox(height: 3),

                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  
                  children: [

                  Text("₹ 260.00",style: CustomTextStyle.popinsmedium,),

                  Image.asset("assets/image/yellowbag.png",height: 80,)

                
                ],)
                ],
              ),
            )
          
          ],),
          
          ),
        ),


                   Container(
          
            height:MediaQuery.of(context).size.width*0.7,
          
            width: MediaQuery.of(context).size.width*0.46,
          
            decoration: BoxDecoration(
          
              borderRadius: BorderRadius.circular(25),
  color:MyColors.white
            ),
          
          child: Column(children: [
          
                        Container(
         
            decoration: BoxDecoration(
          
              borderRadius: BorderRadius.circular(30),
    color:MyColors.white
          
          
          
            ),
                          child:
                          Image.asset("assets/image/food.png",fit: BoxFit.cover,height: 135),
                        ),
                        
          
          
          // SizedBox(height: 15,),
          
          
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column( mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
               Text(
                      'Mars Petcare Inc',
                      style:  CustomTextStyle.  popinsmedium
                    
                    ),
                        Text(
                      'Lorem Ipsum is simply dummy',
                      style:  CustomTextStyle.  popinssmall0
                    
                    ),
                // SizedBox(height: 3),

                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  
                  children: [

                  Text("₹ 260.00",style: CustomTextStyle.popinsmedium,),

                  Image.asset("assets/image/yellowbag.png",height: 80,)

                
                ],)
                ],
              ),
            )
          
          ],),
          
          ),
       
                  Container(
          
            height:MediaQuery.of(context).size.width*0.7,
          
            width: MediaQuery.of(context).size.width*0.46,
          
            decoration: BoxDecoration(
          
              borderRadius: BorderRadius.circular(25),
  color:MyColors.white
            ),
          
          child: Column(children: [
          
                        Container(
         
            decoration: BoxDecoration(
          
              borderRadius: BorderRadius.circular(30),
    color:MyColors.white
          
          
          
            ),
                          child:
                          Image.asset("assets/image/food.png",fit: BoxFit.cover,height: 135),
                        ),
                        
          
          
          // SizedBox(height: 15,),
          
          
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column( mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
               Text(
                      'Mars Petcare Inc',
                      style:  CustomTextStyle.  popinsmedium
                    
                    ),
                        Text(
                      'Lorem Ipsum is simply dummy',
                      style:  CustomTextStyle.  popinssmall0
                    
                    ),
                // SizedBox(height: 3),

                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  
                  children: [

                  Text("₹ 260.00",style: CustomTextStyle.popinsmedium,),

                  Image.asset("assets/image/yellowbag.png",height: 80,)

                
                ],)
                ],
              ),
            )
          
          ],),
          
          ),
       
     
                      
               
               
                                                        ],
                                                        padding:
                                                        EdgeInsets.all(
                                                            5),
                                                        shrinkWrap: true,
                                                      ),
            
          ],),
        ),)
    );
  }
}