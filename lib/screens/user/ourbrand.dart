import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet/screens/user/oubranddetails.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:pet/screens/oubranddetails.dart';



class OurBrand extends StatefulWidget {
  const OurBrand({super.key});

  @override
  State<OurBrand> createState() => _OurBrandState();
}

class _OurBrandState extends State<OurBrand> {
   TextEditingController _searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
            elevation: 0,
          backgroundColor:Colors.transparent,
leading: Padding(
  padding:  EdgeInsets.only(left:20.0,top: 10,bottom: 10,right: 0),
  child:   InkWell(onTap: (){
    Navigator.pop(context);
  },
    child: Icon(Icons.arrow_back_ios,color: MyColors.black,size: 20,
    
    ),
  ),
),
             actions: [
            SvgPicture.asset("assets/image/notification.svg"),
            // Image.asset("assets/image/cartimg.png"),
            SizedBox(width: 20),
            Padding(
              padding:  EdgeInsets.only(right:20.0),
              child: SvgPicture.asset("assets/image/bag.svg"),
            ),
           
          ],
  
        title: Text("Our Brand",style: CustomTextStyle.appbartext,),
        ),
     body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
      
          
                  // SizedBox(height: MediaQuery.of(context).size.height*0.02,),
      
              Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,          
          children: [

          Container(
             height:45,
          width:265,
                   decoration: BoxDecoration(
          shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(17),
          
                        // border: Border.all(color:brandcolor ),
          
             color:MyColors.white,
       
          
                    ),
          
           
            
            child: TextFormField(
                                  controller: _searchcontroller,
                                                style: TextStyle(fontSize: 14,color: MyColors.voliet, fontFamily: "SF-Pro-Display",),
          
                               decoration: InputDecoration(
                                     
                                       contentPadding: EdgeInsets.only(left: 15),
                                      fillColor:MyColors.white,
                                      focusColor:MyColors.white,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        // borderRadius: BorderRadius.circular(50),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        //  borderRadius: BorderRadius.circular(50),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        //  borderRadius: BorderRadius.circular(50),
                                      ),
                                      hintText:"Search",
                                      prefixIcon:Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Image.asset("assets/image/searchnormal.png",width: 10,),
                                      ),
                                    
                                      hintStyle:
                                      TextStyle(color: Colors.grey, fontSize: 16,fontWeight: FontWeight.w400)
                                      
                                      ),
                                ),
          ),
     
    //  SizedBox(width: 10,),
     Container(width: 45,
height: 45,
decoration: BoxDecoration(
borderRadius: BorderRadius.circular(15),
color: Color(0xffffcc00)),
child: Padding(
  padding: const EdgeInsets.all(10.0),
  child:   Image.asset("assets/image/filter3.png",),
))

         ],),
     
     
          
     

    SizedBox(height: MediaQuery.of(context).size.height*0.02,),
          
 GridView(
                                                      physics:
                                                      NeverScrollableScrollPhysics(),
                                                      scrollDirection:
                                                      Axis.vertical,
                                                      gridDelegate:
                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount:
                                                          4,
                                                          crossAxisSpacing:
                                                          15,
                                                          mainAxisSpacing:
                                                          5,
                                                          
                                                          mainAxisExtent:
                                                         200),
                                                      children: [
                                                       
         InkWell(onTap: (){

                  Navigator.push(context, MaterialPageRoute(builder: (context)=>OurBrandDetails()));

         },
           child: Container(
                          height:MediaQuery.of(context).size.width*0.63,
                                    
                                      width: MediaQuery.of(context).size.width*0.46,
                                    
                                      decoration: BoxDecoration(
                                    
                                        borderRadius: BorderRadius.circular(30),
                                      // color:MyColors.white
                                      ),
                                     
                      child:
                          Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                // SizedBox(height: 140,),
                                Container(
                                    
                                      height:MediaQuery.of(context).size.width*0.6,
                                    
                                      width: MediaQuery.of(context).size.width*0.46,
                                    
                                      decoration: BoxDecoration(
                                    
                                        borderRadius: BorderRadius.circular(30),
                                      color: Colors.transparent
                                      ),
                                    
                                    child:
                                     Column(children: [
                                    
                                        Padding(
                                          padding: const EdgeInsets.only(top:25.0),
                                          child: Container(
                                                        //  height:MediaQuery.of(context).size.width*0.4,
                                    
                                      width: MediaQuery.of(context).size.width*0.46,                
                                                                          decoration: BoxDecoration(
                                                                        
                                          borderRadius: BorderRadius.circular(30),
                                color:MyColors.white
                                                                        
                                                                        
                                                                        
                                                                          ),
                                            child:
                                         //   SvgPicture.asset("assets/image/dogimg34.svg",fit: BoxFit.cover,height: 135)
                                          Image.asset("assets/image/dogimg34.png",fit: BoxFit.cover,height: 135),
                                          ),
                                        ),
                                        
                                    
                                    
                                    // SizedBox(height: 15,),
                                    
                                    
                                      Column( mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                       Text(
                                      'Reservation',
                                      style:   CustomTextStyle.  popinssmall0
                                    
                                    ),
                                     
                                ],
                                      )
                                    
                                    ],),
                                    
                                   ),
                             
                             
                              Positioned(
                                         top: 3,
                                child: 
                                Container(height: 50,width: 60,
                                decoration: BoxDecoration(color: Colors.white.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(20)
                                
                                
                                ),
                                child: Image.asset("assets/image/dog9.png",height: 50,)),
                              )
                              ],
                            ),
                        
                    ),
         ),
  
                     Container(
                        height:MediaQuery.of(context).size.width*0.63,
                                  
                                    width: MediaQuery.of(context).size.width*0.46,
                                  
                                    decoration: BoxDecoration(
                                  
                                      borderRadius: BorderRadius.circular(30),
                                    // color:MyColors.white
                                    ),
                                   
                    child:
                        Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              // SizedBox(height: 140,),
                              Container(
                                  
                                    height:MediaQuery.of(context).size.width*0.6,
                                  
                                    width: MediaQuery.of(context).size.width*0.46,
                                  
                                    decoration: BoxDecoration(
                                  
                                      borderRadius: BorderRadius.circular(30),
                                    color: Colors.transparent
                                    ),
                                  
                                  child:
                                   Column(children: [
                                  
                                      Padding(
                                        padding: const EdgeInsets.only(top:25.0),
                                        child: Container(
                                                                     
                                                                        decoration: BoxDecoration(
                                                                      
                                        borderRadius: BorderRadius.circular(30),
                              color:MyColors.white
                                                                      
                                                                      
                                                                      
                                                                        ),
                                          child:
                                          Image.asset("assets/image/food5.png",fit: BoxFit.cover,height: 135),
                                        ),
                                      ),
                                      
                                  
                                  
                                  // SizedBox(height: 15,),
                                  
                                  
                                    Column( mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                     Text(
                                    'Reservation',
                                    style:   CustomTextStyle.  popinssmall0
                                  
                                  ),
                                   
                              ],
                                    )
                                  
                                  ],),
                                  
                                 ),
                           
                           
                            Positioned(
                                       top: 3,
                              child: 
                              Container(height: 50,width: 60,
                              decoration: BoxDecoration(color: Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(20)
                              
                              
                              ),
                              child: Image.asset("assets/image/dog9.png",height: 50,)),
                            )
                            ],
                          ),
                      
                  ),
                          Container(
                        height:MediaQuery.of(context).size.width*0.63,
                                  
                                    width: MediaQuery.of(context).size.width*0.46,
                                  
                                    decoration: BoxDecoration(
                                  
                                      borderRadius: BorderRadius.circular(30),
                                    // color:MyColors.white
                                    ),
                                   
                    child:
                        Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              // SizedBox(height: 140,),
                              Container(
                                  
                                    height:MediaQuery.of(context).size.width*0.6,
                                  
                                    width: MediaQuery.of(context).size.width*0.46,
                                  
                                    decoration: BoxDecoration(
                                  
                                      borderRadius: BorderRadius.circular(30),
                                    color: Colors.transparent
                                    ),
                                  
                                  child:
                                   Column(children: [
                                  
                                      Padding(
                                        padding: const EdgeInsets.only(top:25.0),
                                        child: Container(
                                                                     
                                                                        decoration: BoxDecoration(
                                                                      
                                        borderRadius: BorderRadius.circular(30),
                              color:MyColors.white
                                                                      
                                                                      
                                                                      
                                                                        ),
                                          child:
                                          Image.asset("assets/image/ourdogimg.png",fit: BoxFit.cover,height: 135),
                                        ),
                                      ),
                                      
                                  
                                  
                                  // SizedBox(height: 15,),
                                  
                                  
                                    Column( mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                     Text(
                                    'Reservation',
                                    style:   CustomTextStyle.  popinssmall0
                                  
                                  ),
                                   
                              ],
                                    )
                                  
                                  ],),
                                  
                                 ),
                           
                           
                            Positioned(
                                       top: 3,
                              child: 
                              Container(height: 50,width: 60,
                              decoration: BoxDecoration(color: Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(20)
                              
                              
                              ),
                              child: Image.asset("assets/image/foodicon.png",height: 50,)),
                            )
                            ],
                          ),
                      
                  ),

    Container(
                        height:MediaQuery.of(context).size.width*0.63,
                                  
                                    width: MediaQuery.of(context).size.width*0.46,
                                  
                                    decoration: BoxDecoration(
                                  
                                      borderRadius: BorderRadius.circular(30),
                                    // color:MyColors.white
                                    ),
                                   
                    child:
                        Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              // SizedBox(height: 140,),
                              Container(
                                  
                                    height:MediaQuery.of(context).size.width*0.6,
                                  
                                    width: MediaQuery.of(context).size.width*0.46,
                                  
                                    decoration: BoxDecoration(
                                  
                                      borderRadius: BorderRadius.circular(30),
                                    color: Colors.transparent
                                    ),
                                  
                                  child:
                                   Column(children: [
                                  
                                      Padding(
                                        padding: const EdgeInsets.only(top:25.0),
                                        child: Container(
                                                                     
                                                                        decoration: BoxDecoration(
                                                                      
                                        borderRadius: BorderRadius.circular(30),
                              color:MyColors.white
                                                                      
                                                                      
                                                                      
                                                                        ),
                                          child:
                                          Image.asset("assets/image/food5.png",fit: BoxFit.cover,height: 135),
                                        ),
                                      ),
                                      
                                  
                                  
                                  // SizedBox(height: 15,),
                                  
                                  
                                    Column( mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                     Text(
                                    'Reservation',
                                    style:   CustomTextStyle.  popinssmall0
                                  
                                  ),
                                   
                              ],
                                    )
                                  
                                  ],),
                                  
                                 ),
                           
                           
                            Positioned(
                                       top: 3,
                              child: 
                              Container(height: 50,width: 60,
                              decoration: BoxDecoration(color: Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(20)
                              
                              
                              ),
                              child: Image.asset("assets/image/dog9.png",height: 50,)),
                            )
                            ],
                          ),
                      
                  ),
       
         Container(
                        height:MediaQuery.of(context).size.width*0.63,
                                  
                                    width: MediaQuery.of(context).size.width*0.46,
                                  
                                    decoration: BoxDecoration(
                                  
                                      borderRadius: BorderRadius.circular(30),
                                    // color:MyColors.white
                                    ),
                                   
                    child:
                        Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              // SizedBox(height: 140,),
                              Container(
                                  
                                    height:MediaQuery.of(context).size.width*0.6,
                                  
                                    width: MediaQuery.of(context).size.width*0.46,
                                  
                                    decoration: BoxDecoration(
                                  
                                      borderRadius: BorderRadius.circular(30),
                                    color: Colors.transparent
                                    ),
                                  
                                  child:
                                   Column(children: [
                                  
                                      Padding(
                                        padding: const EdgeInsets.only(top:25.0),
                                        child: Container(
                                                                     
                                                                        decoration: BoxDecoration(
                                                                      
                                        borderRadius: BorderRadius.circular(30),
                              color:MyColors.white
                                                                      
                                                                      
                                                                      
                                                                        ),
                                          child:
                                          Image.asset("assets/image/food5.png",fit: BoxFit.cover,height: 135),
                                        ),
                                      ),
                                      
                                  
                                  
                                  // SizedBox(height: 15,),
                                  
                                  
                                    Column( mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                     Text(
                                    'Reservation',
                                    style:   CustomTextStyle.  popinssmall0
                                  
                                  ),
                                   
                              ],
                                    )
                                  
                                  ],),
                                  
                                 ),
                           
                           
                            Positioned(
                                       top: 3,
                              child: 
                              Container(height: 50,width: 60,
                              decoration: BoxDecoration(color: Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(20)
                              
                              
                              ),
                              child: Image.asset("assets/image/dog9.png",height: 50,)),
                            )
                            ],
                          ),
                      
                  ),
  
                             
                             
                             
                             
                                    ],
                                                      padding:
                                                      EdgeInsets.all(
                                                          5),
                                                      shrinkWrap: true,
                                                    ),
       
       
       
       
       
       
        ]),
      ),
     ),

    );
  }
}