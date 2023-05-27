import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class SearchVideosCall {
  static Future<ApiCallResponse> call({
    String? keyWord = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'SearchVideos',
      apiUrl: 'https://www.googleapis.com/youtube/v3/search',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'key': "AIzaSyAc0ps6HcyMR4C3sCKDk3McHN-84ZLnGXg",
        'q': keyWord,
        'part': "snippet",
        'maxResults': 40,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic itemVideos(dynamic response) => getJsonField(
        response,
        r'''$.items''',
        true,
      );
  static dynamic itemSnippets(dynamic response) => getJsonField(
        response,
        r'''$.items[:].snippet''',
        true,
      );
  static dynamic titles(dynamic response) => getJsonField(
        response,
        r'''$.items[:].snippet.title''',
        true,
      );
  static dynamic thumbnails(dynamic response) => getJsonField(
        response,
        r'''$.items[:].snippet.thumbnails.default.url''',
        true,
      );
  static dynamic highThumbnails(dynamic response) => getJsonField(
        response,
        r'''$.items[:].snippet.thumbnails.high.url''',
        true,
      );
  static dynamic channelTitle(dynamic response) => getJsonField(
        response,
        r'''$.items[:].snippet.channelTitle''',
        true,
      );
  static dynamic videoId(dynamic response) => getJsonField(
        response,
        r'''$.items[:].id.videoId''',
        true,
      );
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

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
