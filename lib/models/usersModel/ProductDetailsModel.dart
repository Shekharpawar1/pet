class ProductDetailsModel{
int? id;
  String? price;
  String? discountprice;
  String? description;
  String? brandname;
  String? flavour;
  String? diettype;
  String? agerange;
  String? targetspace;
  String? itemfram;
   List<String>? variants; 
   
   ProductDetailsModel({this.id,this.price,this.discountprice,this.agerange,this.brandname,this.description,this.diettype,this.flavour,this.itemfram,this.targetspace,this.variants});
}
