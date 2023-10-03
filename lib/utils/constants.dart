class Constants {
  static const BASE_URL = "https://canine.hirectjob.in";
  static const API_V1_PATH = "/api/v1";
 
  static const GET_USER_SERVICES =
      "$BASE_URL${API_V1_PATH}/banners/service_category";
 static const GET_USER_MYSERVICES = "$BASE_URL${API_V1_PATH}/banners/get_allservicebooking";
    static const SALESMAN_IMAGEPATH_URL = "$BASE_URL/storage/app/public/delivery-man/";
    static const USERPROFILE_IMAGEPATH_URL = "$BASE_URL/storage/app/public/profile/";

  static const GET_SUBSCRIPTION =
      "$BASE_URL${API_V1_PATH}/auth/get_subscription";
   static const GET_USER_VETERNIARY = "$BASE_URL${API_V1_PATH}/banners/get_veterinary";
static const GET_USER_PRODUCTDETAILS = "$BASE_URL${API_V1_PATH}/items/details/";
static const GET_USER_MYCARTLIST = "$BASE_URL${API_V1_PATH}/customer/wish-list/add_to_card/";
static const GET_USER_MYCARTLISTDELETE = "$BASE_URL${API_V1_PATH}/customer/wish-list/remove_product/";
static const GET_USER_ALLADDRESSLIST = "$BASE_URL${API_V1_PATH}/customer/address/list/";
static const GET_USER_ADDRESS_DELETE = "$BASE_URL${API_V1_PATH}/customer/address/delete/";
static const GET_USER_COUPON = "$BASE_URL${API_V1_PATH}/coupon/list";
static const GET_USER_TOY = "$BASE_URL${API_V1_PATH}/items/subcty_product?";
static const GET_USER_PROFILE = "$BASE_URL${API_V1_PATH}/auth/my_profile/";
static const GET_WHOLESELLER_PROFILE = "$BASE_URL${API_V1_PATH}/auth/wholesaler_profile/";
static const GET_WHOLESELLER_UPDATE_PROFILE = "$BASE_URL${API_V1_PATH}/auth/wholesaler_update";
static const GET_PARTNER_PROFILE = "$BASE_URL${API_V1_PATH}/vendor/profile/";

static const GET_SALES_PROFILE = "$BASE_URL${API_V1_PATH}/auth/delivery-man/deliveryman_profile/";
  static const GET_USER_CATEGORIES = "/categories";
  static const GET_USER_PROPERTIES = "/items/latest";
   static const GET_USER_SUBPRODUCT = "$BASE_URL${API_V1_PATH}/items/product/";
   static const GET_ORDER_TRACKER = "$BASE_URL${API_V1_PATH}/customer/order/tracking/";
   static const GET_USER_OURBRANDPRODUCT = "$BASE_URL${API_V1_PATH}/banners/brand_product_filter/";
   static const GET_USER_SUBCATEGORY = "/categories/subcategories";
  static const SERVICES_IMAGE_PATH = "/storage/app/public/service/";
  static const CATEGORIES_IMAGE_PATH = "/storage/app/public/category/";
  static const BRAND_IMAGE_PATH ="/storage/app/public/brand/";
   static const BRANDLOGO_IMAGE_PATH ="/storage/app/public/brand_logo/";
  static const NOTIFICATION_IMAGE_PATH = "/storage/app/public/notification/";
  static const PRODUCT_IMAGE_PATH = "/storage/app/";
  // static const PRODUCT_IMAGE_PATH = "/storage/app/public/banner/";
  static const BANNER_IMAGE_PATH = "$BASE_URL/storage/app/";
  static const GET_STATE_LIST = "$BASE_URL${API_V1_PATH}/auth/state";
  static const GET_ZONE_LIST = "$BASE_URL${API_V1_PATH}/zone/list";
  static const GET_MODULE_LIST = "$BASE_URL${API_V1_PATH}/module";
  static const GET_PET_CATEGORY_LIST = "$BASE_URL${API_V1_PATH}/categories";
  static const GET_CITY_LIST = "$BASE_URL${API_V1_PATH}/auth/city?state=";
  static const USER_LOGIN = "$BASE_URL${API_V1_PATH}/auth/customer";
  static const PARTNER_LOGIN = "$BASE_URL${API_V1_PATH}/auth/login";
    static const SALESMAN_LOGIN = "$BASE_URL${API_V1_PATH}/auth/delivery-man/login";
   static const SALESMAN_REGISTER = "$BASE_URL${API_V1_PATH}/auth/delivery-man/store";

  static const PARTNER_REGISTER = "$BASE_URL${API_V1_PATH}/auth/register";
   static const WHOLESALER_REGISTER = "$BASE_URL${API_V1_PATH}/auth/wholesaler_register";
  static const USER_LOGIN_OTP = "$BASE_URL${API_V1_PATH}/auth/otp_verify";
  static const WHOLESALER_LOGIN = "$BASE_URL${API_V1_PATH}/auth/wholesaler_login";
  static const GET_USER_BANNER = "$BASE_URL${API_V1_PATH}/banners";
   static const GET_WHOLE_TOTALORDER = "$BASE_URL${API_V1_PATH}/auth/wholesaler_orders/";
   static const GET_WHOLESELLER_TOTAL = "$BASE_URL${API_V1_PATH}/auth/wholesaler_list/";
  static const GET_PRODUCTBYPARTNER = "$BASE_URL${API_V1_PATH}/vendor/all_vendor";
  static const GET_USERREVIEW = "$BASE_URL${API_V1_PATH}/items/get_reviewitem/";
  static const GET_TOTALPRODUCT_PARTNER = "$BASE_URL${API_V1_PATH}/auth/get_vendorproduct/";
static const GET_PRODUCT_PARTNER_ITEM= "$BASE_URL${API_V1_PATH}/vendor/get-items-list/";
  static const GET_TOTALORDER_PARTNER = "$BASE_URL${API_V1_PATH}/auth/get_vendororder/";

     static const GET_TOTALSELLER_ORDER = "$BASE_URL${API_V1_PATH}/auth/seller_orders/";

  static const GET_OUR_BRAND = "$BASE_URL${API_V1_PATH}/auth/brand";
  static const GET_MY_ORDER = "$BASE_URL${API_V1_PATH}/customer/order/list?id=";
  static const GET_ORDER_DETAILS = "$BASE_URL${API_V1_PATH}/customer/order/detail/";
  static const GET_LIFESTAGE = "$BASE_URL${API_V1_PATH}/auth/all_life_stage/";
    static const GET_HEALTH_CONDITION = "$BASE_URL${API_V1_PATH}/auth/health_condition";
      static const GET_USER_NOTIFy =
      "$BASE_URL${API_V1_PATH}/items/notify_list/";
    static const GET_USER_NOTIFy_DELETE =
      "$BASE_URL${API_V1_PATH}/items/notify_delete/";
  static const GET_USER_NOTIFICATION =
      "$BASE_URL${API_V1_PATH}/customer/notifications?tergat=customer";
  static const GET_STORE_NOTIFICATION =
      "$BASE_URL${API_V1_PATH}/customer/notifications?tergat=store";
  static const GET_SERVICES_CATEGORIES =
      "$BASE_URL${API_V1_PATH}/banners/service";
  static const GET_All_BOOKED_SERVICES =
      "$BASE_URL${API_V1_PATH}/banners/get_allservicebooking";
  static const PETS_CATEGORY_IMAGE_PATH =
      "$BASE_URL/storage/app/public/category/";
  static const GET_CATEGORY_BREED = "$BASE_URL${API_V1_PATH}/auth/breed";
 static const USER_UPDATE_PROFILE =
      "$BASE_URL${API_V1_PATH}/auth/update-profile";
       static const PARTNER_UPDATE_PROFILE =
      "$BASE_URL${API_V1_PATH}/vendor/update-profile";
       static const SALES_UPDATE_PROFILE =
      "$BASE_URL${API_V1_PATH}/auth/delivery-man/deliveryman_update";
  static const ADD_PET_USER = "$BASE_URL${API_V1_PATH}/auth/pets_add";
  static const GET_PET_USER = "$BASE_URL${API_V1_PATH}/auth/get_pet/";
  static const GET_PET_SERVICES = "$BASE_URL${API_V1_PATH}/auth/get_pet";
  static const SERVICE_BOOKING =
      "$BASE_URL${API_V1_PATH}/banners/service_booking";
  static const VETERINARY_BOOKING =
      "$BASE_URL${API_V1_PATH}/banners/veterinary_booking";
  static const ADD_PRODUCT =
      "$BASE_URL${API_V1_PATH}/customer/wish-list/add_product";
        static const ADD_ADDRESS =
      "$BASE_URL${API_V1_PATH}/customer/address/add";
       static const ADD_Notify =
      "$BASE_URL${API_V1_PATH}/items/notify";
        static const PURCHASE_PLAN =
      "$BASE_URL${API_V1_PATH}/auth/purchace_plan";
       static const REVIEW =
      "$BASE_URL${API_V1_PATH}/items/reviews/submit";
       static const REFUND_URL  =
      "$BASE_URL${API_V1_PATH}/customer/order/refund-request";
         static const PLACE_ORDER =
      "$BASE_URL${API_V1_PATH}/customer/order/place";
        static const ADD_UPDATE_ADDRESS =
      "$BASE_URL${API_V1_PATH}/customer/address/update";
  static const ALL_CITY = "$BASE_URL${API_V1_PATH}/auth/all_city";
  static const USER_ADD_TO_FAV =
      "$BASE_URL${API_V1_PATH}/customer/wish-list/add";
  static const USER_REMOVE_FROM_FAV =
      "$BASE_URL${API_V1_PATH}/customer/wish-list/remove/";
  static const USER_GET_WISHLIST =
      "$BASE_URL${API_V1_PATH}/customer/wish-list";
  static const PRODUCT_HOME_IMAGE_PATH =
      "$BASE_URL/storage/app/public/product";
  static const USER_PET_IMAGE_PATH =
      "$BASE_URL/public";
      static const SUBSCRIPTION_IMAGE_PATH =
      "$BASE_URL/uploads/subscription/";
}
// https://canine.hirectjob.in/storage/app/public/product/
