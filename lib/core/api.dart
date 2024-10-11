import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';


// Base URL and default headers for the API
const String Base_Url = 'https://mangaverse-api.p.rapidapi.com/manga/';
const Map<String, dynamic> DEAFULT_HEADERS = {
  'Content-Type': 'Application/json',
  "x-rapidapi-key": "a31857185emshb84419158150cf0p108f73jsn2be1370dac0e",
   "x-rapidapi-host": "mangaverse-api.p.rapidapi.com"
};

// API class for setting up Dio with interceptors and configuration
class Api {
  final Dio _dio = Dio();

  Api() {
    // Set base URL and headers
    _dio.options.baseUrl = Base_Url;
    _dio.options.headers = DEAFULT_HEADERS;

    // Add logging interceptor for debugging API requests and responses
    _dio.interceptors.add(PrettyDioLogger(
      responseBody: true,
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
    ));
  }

  // Expose Dio instance for making HTTP requests
  Dio get sendRequest => _dio;
}

// ApiResponse class to handle API responses and extract data
class ApiResponse {
  final int code; // Status code for the response
  final dynamic data; // Can be List or single object depending on the response
  final String? message; // Error or success message

  // Constructor to initialize the ApiResponse object
  ApiResponse({
    required this.code,
    this.data,
    this.message,
  });

  // Factory constructor to create an ApiResponse from Dio's Response object
  factory ApiResponse.fromResponse(Response response) {
    final Map<String, dynamic> responseData = response.data as Map<String, dynamic>;
    return ApiResponse(
      code: responseData['code'] ?? 0,
      data: responseData['data'], // Webtoon data from the API
      message: responseData['message'] ?? 'Unexpected Error',
    );
  }

//   // Convenience method to check if the API response is successful
  bool get isSuccess => code == 200;

//   // Method to extract webtoon list from API response
//   List<WebtoonModel> toWebtoonList() {
//     if (data is List<dynamic>) {
//       return (data as List<dynamic>).map((json) => WebtoonModel.fromJson(json)).toList();
//     } else {
//       throw Exception('Expected a list of webtoons, but got something else.');
//     }
//   }
// }
}