import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start AclyTables Group Code

class AclyTablesGroup {
  static String getBaseUrl() =>
      'https://supa.3146577-db61528.twc1.net/rest/v1/';
  static Map<String, String> headers = {
    'Apikey':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.ewogICJyb2xlIjogImFub24iLAogICJpc3MiOiAic3VwYWJhc2UiLAogICJpYXQiOiAxNzE5NDM1NjAwLAogICJleHAiOiAxODc3MjAyMDAwCn0.YhTMdRh-QdDta2VmVGoPZs3BxwqyFVmbjdYbF9JSidk',
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.ewogICJyb2xlIjogImFub24iLAogICJpc3MiOiAic3VwYWJhc2UiLAogICJpYXQiOiAxNzE5NDM1NjAwLAogICJleHAiOiAxODc3MjAyMDAwCn0.YhTMdRh-QdDta2VmVGoPZs3BxwqyFVmbjdYbF9JSidk',
  };
  static TrainerSearchCall trainerSearchCall = TrainerSearchCall();
  static UserSearchCall userSearchCall = UserSearchCall();
  static TrainingSearchCall trainingSearchCall = TrainingSearchCall();
  static TrainingPlansSearchCall trainingPlansSearchCall =
      TrainingPlansSearchCall();
  static NutritionPlansSearchCall nutritionPlansSearchCall =
      NutritionPlansSearchCall();
  static DigiProdSearchCall digiProdSearchCall = DigiProdSearchCall();
  static TestPostCall testPostCall = TestPostCall();
}

class TrainerSearchCall {
  Future<ApiCallResponse> call({
    String? term = '',
    int? limit = 100,
  }) async {
    final baseUrl = AclyTablesGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'TrainerSearch',
      apiUrl:
          '${baseUrl}/combined_user_trainer_view?or=(user_name.ilike.*${term}*,user_surname.ilike.*${term}*,trainer_description.ilike.*${term}*)&limit=${limit}',
      callType: ApiCallType.GET,
      headers: {
        'Apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.ewogICJyb2xlIjogImFub24iLAogICJpc3MiOiAic3VwYWJhc2UiLAogICJpYXQiOiAxNzE5NDM1NjAwLAogICJleHAiOiAxODc3MjAyMDAwCn0.YhTMdRh-QdDta2VmVGoPZs3BxwqyFVmbjdYbF9JSidk',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.ewogICJyb2xlIjogImFub24iLAogICJpc3MiOiAic3VwYWJhc2UiLAogICJpYXQiOiAxNzE5NDM1NjAwLAogICJleHAiOiAxODc3MjAyMDAwCn0.YhTMdRh-QdDta2VmVGoPZs3BxwqyFVmbjdYbF9JSidk',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? photo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].user_photo''',
      ));
  List<bool>? active(dynamic response) => (getJsonField(
        response,
        r'''$[:].trainer_active''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
}

class UserSearchCall {
  Future<ApiCallResponse> call({
    String? term = '',
    int? limit = 100,
  }) async {
    final baseUrl = AclyTablesGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'UserSearch',
      apiUrl:
          '${baseUrl}/user_profile?or=(user_name.ilike.*${term}*,user_surname.ilike.*${term}*)&limit=${limit}',
      callType: ApiCallType.GET,
      headers: {
        'Apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.ewogICJyb2xlIjogImFub24iLAogICJpc3MiOiAic3VwYWJhc2UiLAogICJpYXQiOiAxNzE5NDM1NjAwLAogICJleHAiOiAxODc3MjAyMDAwCn0.YhTMdRh-QdDta2VmVGoPZs3BxwqyFVmbjdYbF9JSidk',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.ewogICJyb2xlIjogImFub24iLAogICJpc3MiOiAic3VwYWJhc2UiLAogICJpYXQiOiAxNzE5NDM1NjAwLAogICJleHAiOiAxODc3MjAyMDAwCn0.YhTMdRh-QdDta2VmVGoPZs3BxwqyFVmbjdYbF9JSidk',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? photo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].user_photo''',
      ));
}

class TrainingSearchCall {
  Future<ApiCallResponse> call({
    String? term = '',
    int? limit = 100,
  }) async {
    final baseUrl = AclyTablesGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'TrainingSearch',
      apiUrl:
          '${baseUrl}/combined_trainings_view?or=(training_name.ilike.*${term}*,training_description.ilike.*${term}*)&limit=${limit}',
      callType: ApiCallType.GET,
      headers: {
        'Apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.ewogICJyb2xlIjogImFub24iLAogICJpc3MiOiAic3VwYWJhc2UiLAogICJpYXQiOiAxNzE5NDM1NjAwLAogICJleHAiOiAxODc3MjAyMDAwCn0.YhTMdRh-QdDta2VmVGoPZs3BxwqyFVmbjdYbF9JSidk',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.ewogICJyb2xlIjogImFub24iLAogICJpc3MiOiAic3VwYWJhc2UiLAogICJpYXQiOiAxNzE5NDM1NjAwLAogICJleHAiOiAxODc3MjAyMDAwCn0.YhTMdRh-QdDta2VmVGoPZs3BxwqyFVmbjdYbF9JSidk',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? photo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].user_photo''',
      ));
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$[:].user_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? surname(dynamic response) => (getJsonField(
        response,
        r'''$[:].user_surname''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? trainingname(dynamic response) => (getJsonField(
        response,
        r'''$[:].training_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? trainingdescription(dynamic response) => (getJsonField(
        response,
        r'''$[:].training_description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? trainingphoto1(dynamic response) => (getJsonField(
        response,
        r'''$[:].training_photo1''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? trainingid(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<bool>? status(dynamic response) => (getJsonField(
        response,
        r'''$[:].training_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  List<bool>? publish(dynamic response) => (getJsonField(
        response,
        r'''$[:].training_publish''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  List<bool>? traineractive(dynamic response) => (getJsonField(
        response,
        r'''$[:].trainer_active''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
}

class TrainingPlansSearchCall {
  Future<ApiCallResponse> call({
    String? term = '',
    int? limit = 100,
  }) async {
    final baseUrl = AclyTablesGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'TrainingPlansSearch',
      apiUrl:
          '${baseUrl}/combined_trainingplans_view?or=(training_plan_name.ilike.*${term}*,training_plan_description.ilike.*${term}*)&limit=${limit}',
      callType: ApiCallType.GET,
      headers: {
        'Apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.ewogICJyb2xlIjogImFub24iLAogICJpc3MiOiAic3VwYWJhc2UiLAogICJpYXQiOiAxNzE5NDM1NjAwLAogICJleHAiOiAxODc3MjAyMDAwCn0.YhTMdRh-QdDta2VmVGoPZs3BxwqyFVmbjdYbF9JSidk',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.ewogICJyb2xlIjogImFub24iLAogICJpc3MiOiAic3VwYWJhc2UiLAogICJpYXQiOiAxNzE5NDM1NjAwLAogICJleHAiOiAxODc3MjAyMDAwCn0.YhTMdRh-QdDta2VmVGoPZs3BxwqyFVmbjdYbF9JSidk',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? photo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].user_photo''',
      ));
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$[:].user_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? surname(dynamic response) => (getJsonField(
        response,
        r'''$[:].user_surname''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? trainingplanname(dynamic response) => (getJsonField(
        response,
        r'''$[:].training_plan_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? trainingplandescription(dynamic response) => (getJsonField(
        response,
        r'''$[:].training_plan_description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? trainingplanphoto1(dynamic response) => (getJsonField(
        response,
        r'''$[:].training_plan_photo1''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? trainingplanprice(dynamic response) => (getJsonField(
        response,
        r'''$[:].training_plan_price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? planid(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<bool>? status(dynamic response) => (getJsonField(
        response,
        r'''$[:].training_plan_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  List<bool>? publish(dynamic response) => (getJsonField(
        response,
        r'''$[:].training_plan_publish''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  List<bool>? traineractive(dynamic response) => (getJsonField(
        response,
        r'''$[:].trainer_active''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
}

class NutritionPlansSearchCall {
  Future<ApiCallResponse> call({
    String? term = '',
    int? limit = 100,
  }) async {
    final baseUrl = AclyTablesGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'NutritionPlansSearch',
      apiUrl:
          '${baseUrl}/combined_nutritionplans_view?or=(nutrition_plan_name.ilike.*${term}*,nutrition_plan_description.ilike.*${term}*)&limit=${limit}',
      callType: ApiCallType.GET,
      headers: {
        'Apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.ewogICJyb2xlIjogImFub24iLAogICJpc3MiOiAic3VwYWJhc2UiLAogICJpYXQiOiAxNzE5NDM1NjAwLAogICJleHAiOiAxODc3MjAyMDAwCn0.YhTMdRh-QdDta2VmVGoPZs3BxwqyFVmbjdYbF9JSidk',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.ewogICJyb2xlIjogImFub24iLAogICJpc3MiOiAic3VwYWJhc2UiLAogICJpYXQiOiAxNzE5NDM1NjAwLAogICJleHAiOiAxODc3MjAyMDAwCn0.YhTMdRh-QdDta2VmVGoPZs3BxwqyFVmbjdYbF9JSidk',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? photo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].user_photo''',
      ));
  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].user_name''',
      ));
  String? surname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].user_surname''',
      ));
  String? nutritionname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].nutrition_plan_name''',
      ));
  String? nutritiondescription(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].nutrition_plan_description''',
      ));
  String? nutritionphoto1(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].nutrition_plan_photo1''',
      ));
  int? nutritionprice(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].nutrition_plan_price''',
      ));
  int? nutritionplanid(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].id''',
      ));
  List<bool>? status(dynamic response) => (getJsonField(
        response,
        r'''$[:].nutrition_plan_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  List? publish(dynamic response) => getJsonField(
        response,
        r'''$[:].nutrition_plan_publish''',
        true,
      ) as List?;
  List<bool>? traineractive(dynamic response) => (getJsonField(
        response,
        r'''$[:].trainer_active''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
}

class DigiProdSearchCall {
  Future<ApiCallResponse> call({
    String? term = '',
    int? limit = 100,
  }) async {
    final baseUrl = AclyTablesGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'DigiProdSearch',
      apiUrl:
          '${baseUrl}/combined_digitalproduct_view?or=(digital_product_name.ilike.*${term}*,digital_product_description.ilike.*${term}*)&limit=${limit}',
      callType: ApiCallType.GET,
      headers: {
        'Apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.ewogICJyb2xlIjogImFub24iLAogICJpc3MiOiAic3VwYWJhc2UiLAogICJpYXQiOiAxNzE5NDM1NjAwLAogICJleHAiOiAxODc3MjAyMDAwCn0.YhTMdRh-QdDta2VmVGoPZs3BxwqyFVmbjdYbF9JSidk',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.ewogICJyb2xlIjogImFub24iLAogICJpc3MiOiAic3VwYWJhc2UiLAogICJpYXQiOiAxNzE5NDM1NjAwLAogICJleHAiOiAxODc3MjAyMDAwCn0.YhTMdRh-QdDta2VmVGoPZs3BxwqyFVmbjdYbF9JSidk',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? photo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].user_photo''',
      ));
  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].user_name''',
      ));
  String? surname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].user_surname''',
      ));
  int? digiprodid(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].digital_product_id''',
      ));
  String? digiprodname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].digital_product_name''',
      ));
  String? digiproddescription(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].digital_product_description''',
      ));
  String? digiprodphoto1(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].digital_product_photo1''',
      ));
  int? digiprodprice(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].digital_product_price''',
      ));
  List<bool>? status(dynamic response) => (getJsonField(
        response,
        r'''$[:].digital_product_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  List? publish(dynamic response) => getJsonField(
        response,
        r'''$[:].digital_product_publish''',
        true,
      ) as List?;
  List<bool>? traineractive(dynamic response) => (getJsonField(
        response,
        r'''$[:].trainer_active''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
}

class TestPostCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = AclyTablesGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "input_id": 197
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'TestPost',
      apiUrl: '${baseUrl}/rpc/bulk_book_training_slots',
      callType: ApiCallType.POST,
      headers: {
        'Apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.ewogICJyb2xlIjogImFub24iLAogICJpc3MiOiAic3VwYWJhc2UiLAogICJpYXQiOiAxNzE5NDM1NjAwLAogICJleHAiOiAxODc3MjAyMDAwCn0.YhTMdRh-QdDta2VmVGoPZs3BxwqyFVmbjdYbF9JSidk',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.ewogICJyb2xlIjogImFub24iLAogICJpc3MiOiAic3VwYWJhc2UiLAogICJpYXQiOiAxNzE5NDM1NjAwLAogICJleHAiOiAxODc3MjAyMDAwCn0.YhTMdRh-QdDta2VmVGoPZs3BxwqyFVmbjdYbF9JSidk',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End AclyTables Group Code

class GetUserRoleCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetUserRole',
      apiUrl: 'https://supa.3146577-db61528.twc1.net/rest/v1/user_roles_view',
      callType: ApiCallType.GET,
      headers: {
        'Apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.ewogICJyb2xlIjogImFub24iLAogICJpc3MiOiAic3VwYWJhc2UiLAogICJpYXQiOiAxNzE5NDM1NjAwLAogICJleHAiOiAxODc3MjAyMDAwCn0.YhTMdRh-QdDta2VmVGoPZs3BxwqyFVmbjdYbF9JSidk',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.ewogICJyb2xlIjogImFub24iLAogICJpc3MiOiAic3VwYWJhc2UiLAogICJpYXQiOiAxNzE5NDM1NjAwLAogICJleHAiOiAxODc3MjAyMDAwCn0.YhTMdRh-QdDta2VmVGoPZs3BxwqyFVmbjdYbF9JSidk',
        'Range': '0-9',
      },
      params: {
        'user_id': userId,
        'select': "*",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? userRole(dynamic response) => (getJsonField(
        response,
        r'''$[:].roles''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class SearchUsersCall {
  static Future<ApiCallResponse> call({
    String? searchString = ' ',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'SearchUsers',
      apiUrl:
          'https://supa.3146577-db61528.twc1.net/rest/v1/user_profile?user_name=ilike.*${searchString}*&select*',
      callType: ApiCallType.GET,
      headers: {
        'Apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.ewogICJyb2xlIjogImFub24iLAogICJpc3MiOiAic3VwYWJhc2UiLAogICJpYXQiOiAxNzE5NDM1NjAwLAogICJleHAiOiAxODc3MjAyMDAwCn0.YhTMdRh-QdDta2VmVGoPZs3BxwqyFVmbjdYbF9JSidk',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.ewogICJyb2xlIjogImFub24iLAogICJpc3MiOiAic3VwYWJhc2UiLAogICJpYXQiOiAxNzE5NDM1NjAwLAogICJleHAiOiAxODc3MjAyMDAwCn0.YhTMdRh-QdDta2VmVGoPZs3BxwqyFVmbjdYbF9JSidk',
        'Range': '0-9',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
