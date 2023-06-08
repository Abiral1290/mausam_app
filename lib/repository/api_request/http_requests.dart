import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mausamapp/utilities/constants.dart';

import 'exceptions.dart';
import 'package:mausamapp/utilities/constants.dart';

class HttpRequests {
  // static const String urlbase = "192.168.99.21";
  static  String localbase = "https://api.openweathermap.org/data/2.5/weather?lat=${Constants.latitude}&lon=${Constants.longitude}&appid=d0a8f0380713cab72017106625c48621";
  //     "https://api.openweathermap.org/data/3.0/onecall?lat=${Constants.latitude}&lon=${Constants.longitude
  // }&exclude=hourly,daily&appid=d0a8f0380713cab72017106625c48621";
  // static const String localbase = "api.staging.rojgari.com";
  // static const String urlbase = "api.staging.rojgari.com";

  //static const String urlbase = "api.rojgari.com";
  static const bool localServer = true;

  static final Connectivity _connectivity = Connectivity();

  static Future<Map<String, String>> createHeaders([requiresHeader = true, isContent = true]) async {
    String? token = '';
    Map<String, String> headers = <String, String>{};
    if (isContent) {
      headers['Content-Type'] = 'application/json; charset=UTF-8';
      headers['Accept'] = 'application/json';
    }
    if (token != null && requiresHeader) {
      headers['Authorization'] = 'Bearer  $token';
    }
    return headers;
  }

  static Future<http.Response> requestGet(String api, {Map<String, dynamic>? query, requiresHeader = true}) async {
    ConnectivityResult connection = await _connectivity.checkConnectivity();
    if (connection != ConnectivityResult.none) {
      try {
        log('url${localbase}');
        // final Uri url;
        //
        //   url = Uri.https(localbase, api, query);
        //
        //
        // final headers = await createHeaders(requiresHeader);
        //log(url.toString(), name: 'Get request send', zone: Zone.current);

        final resp = await http.get(Uri.parse(localbase) ).timeout(const Duration(seconds: 60), onTimeout: () {
          throw TimeoutException('The connection has timed out, Please try again!');
        });

        debugPrint('------------------ API Response Start ----------------------');
        log(resp.body, name: localbase.toString(), zone: Zone.current);
        return responseErrorChecker(resp);
      } on SocketException {
        throw NetworkConnectionError();
      } on HandleUncaughtErrorHandler {
        log(name: 'uncaught error', 'Error', stackTrace: StackTrace.current);
        throw 'Unhandled error occured';
      }
    } else {
      throw NetworkConnectionError;
    }
  }

  static Future<http.Response> requestPost(String api, dynamic body, [requiresHeader = true]) async {
    ConnectivityResult connection = await _connectivity.checkConnectivity();
    if (connection != ConnectivityResult.none) {
      try {
        final Uri url;
        if (localServer) {
          url = Uri.http(localbase, api);
        } else {
          url = Uri.https(urlbase, api);
        }

        var headers = await createHeaders(requiresHeader);
        log('------------------ API Request Start ----------------------');
        log("POST: $url");
        log("Headers: $headers");
        log("Parameters: $body");
        log('------------------ API Request End ----------------------');
        var resp = await http
            .post(
          url,
          body: jsonEncode(body),
          headers: headers,
        )
            .timeout(const Duration(seconds: 60), onTimeout: () {
          throw TimeoutException('The connection has timed out, Please try again!');
        });
        log('------------------ API Response Start ----------------------');
        log('$url');
        log('Response: ${resp.body}');
        log('------------------- API Response End ----------------------');
        return responseErrorChecker(resp);
      } on SocketException {
        throw NetworkConnectionError();
      } on HandleUncaughtErrorHandler {
        throw 'Unhandled error occured';
      }
    } else {
      throw NetworkConnectionError();
    }
  }

  static Future<http.Response> requestPut(String api, dynamic body, [requiresHeader = true]) async {
    try {
      final Uri url;
      if (localServer) {
        url = Uri.http(localbase, api);
      } else {
        url = Uri.https(urlbase, api);
      }
      Map<String, String> headers = await createHeaders(requiresHeader);
      log('------------------ API Request Start ----------------------');
      log("POST: $url");
      log("Headers: $headers");
      log("Parameters: $body");
      log('------------------ API Request End ----------------------');
      var resp = await http
          .put(
        url,
        body: jsonEncode(body),
        headers: headers,
      )
          .timeout(const Duration(seconds: 60), onTimeout: () {
        throw TimeoutException('The connection has timed out, Please try again!');
      });
      log('------------------ API Response Start ----------------------');
      log('$url');
      log('Response: ${resp.body}');
      log('------------------- API Response End ----------------------');
      return responseErrorChecker(resp);
    } on SocketException {
      throw NetworkConnectionError();
    } on HandleUncaughtErrorHandler {
      throw 'Unhandled error occured';
    }
  }

  static http.Response responseErrorChecker(http.Response resp) {
    if (resp.statusCode == 400) {
      // if(resp.body..toString() == "User Doesn't Exists."){
      //   throw resp.body;
      // }
      throw resp.body;
    }
    if (resp.statusCode == 403) throw ForbiddenError();
    if (resp.statusCode == 404) throw NotFoundError();
    if (resp.statusCode >= 500) throw InternalServerError();
    return resp;
  }
}

const String urlbase = "192.168.99.21";

Future<Map<String, String>> createHeaders([requiresHeader = true, isContent = true]) async {
  String? token = '';
  Map<String, String> headers = <String, String>{};
  if (isContent) {
    headers['Content-Type'] = 'application/json; charset=UTF-8';
    headers['Accept'] = 'application/json';
  }
  if (token != null && requiresHeader) {
    headers['Authorization'] = 'Bearer  $token';
  }
  return headers;
}

Future<http.Response> requestGet(String api, [Map<String, dynamic>? query, requiresHeader = true]) async {
  try {
    log(query.toString());
    final url = Uri.http(urlbase, api, query);
    final headers = await createHeaders(requiresHeader);
    log(url.toString(), name: 'Get request send', zone: Zone.current);

    final resp = await http.get(url, headers: headers).timeout(const Duration(seconds: 60), onTimeout: () {
      throw TimeoutException('The connection has timed out, Please try again!');
    });

    debugPrint('------------------ API Response Start ----------------------');
    log(resp.body, name: url.toString(), zone: Zone.current);
    return responseErrorChecker(resp);
  } on SocketException {
    throw NetworkConnectionError();
  } on HandleUncaughtErrorHandler {
    log(name: 'uncaught error', 'Error', stackTrace: StackTrace.current);
    throw 'Unhandled error occured';
  }
}

Future<http.Response> requestPost(String api, dynamic body, [requiresHeader = true]) async {
  try {
    var url = Uri.http(urlbase, api);
    var headers = await createHeaders(requiresHeader);
    log('------------------ API Request Start ----------------------');
    log("POST: $url");
    log("Headers: $headers");
    log("Parameters: $body");
    log('------------------ API Request End ----------------------');
    var resp = await http
        .post(
      url,
      body: jsonEncode(body),
      headers: headers,
    )
        .timeout(const Duration(seconds: 60), onTimeout: () {
      throw TimeoutException('The connection has timed out, Please try again!');
    });
    log('------------------ API Response Start ----------------------');
    log('$url');
    log('Response: ${resp.body}');
    log('------------------- API Response End ----------------------');
    return responseErrorChecker(resp);
  } on SocketException {
    throw NetworkConnectionError();
  } on HandleUncaughtErrorHandler {
    throw 'Unhandled error occured';
  }
}

http.Response responseErrorChecker(http.Response resp) {
  if (resp.statusCode == 400) throw BadRequestError();
  if (resp.statusCode == 403) throw ForbiddenError();
  if (resp.statusCode == 404) throw NotFoundError();
  if (resp.statusCode >= 500) throw InternalServerError();
  if (resp.statusCode < 200) throw ResponseError();
  return resp;
}
