class Constants {
  static const BASE_URL = "https://canine.hirectjob.in";
  static const API_V1_PATH = "/api/v1";
  static const GET_USER_SERVICES =
      "$BASE_URL${API_V1_PATH}/banners/service_category";
  static const GET_USER_CATEGORIES = "/categories";
  static const GET_USER_PROPERTIES = "/items/latest";
  static const SERVICES_IMAGE_PATH = "/storage/app/public/service/";
  static const CATEGORIES_IMAGE_PATH = "/storage/app/public/category/";
  static const NOTIFICATION_IMAGE_PATH = "/storage/app/public/notification/";
  static const PRODUCT_IMAGE_PATH = "/storage/app/public/banner/";
  static const GET_STATE_LIST = "$BASE_URL${API_V1_PATH}/auth/state";
  static const GET_ZONE_LIST = "$BASE_URL${API_V1_PATH}/zone/list";
  static const GET_MODULE_LIST = "$BASE_URL${API_V1_PATH}/module";
  static const GET_CITY_LIST = "$BASE_URL${API_V1_PATH}/auth/city?state=";
  static const USER_LOGIN = "$BASE_URL${API_V1_PATH}/auth/customer";
  static const PARTNER_LOGIN = "$BASE_URL${API_V1_PATH}/auth/login";
  static const PARTNER_REGISTER = "$BASE_URL${API_V1_PATH}/auth/register";
  static const USER_LOGIN_OTP = "$BASE_URL${API_V1_PATH}/auth/otp_verify";
  static const GET_USER_BANNER = "$BASE_URL${API_V1_PATH}/banners";
  static const GET_OUR_BRAND = "$BASE_URL${API_V1_PATH}/auth/brand";
  static const GET_USER_NOTIFICATION =
      "$BASE_URL${API_V1_PATH}/customer/notifications?tergat=customer";
  static const GET_STORE_NOTIFICATION =
      "$BASE_URL${API_V1_PATH}/customer/notifications?tergat=store";
  static const GET_SERVICES_CATEGORIES =
      "$BASE_URL${API_V1_PATH}/banners/service";
}
