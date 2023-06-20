import 'dart:async';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

FutureOr<Response> onRequest(RequestContext context) async {
  final request = await context.request.body();
  print(request);
  switch (context.request.method) {
    case HttpMethod.get:
      return _get(context);
    case HttpMethod.post:
      return _post(context);
    case HttpMethod.delete:
    case HttpMethod.head:
    case HttpMethod.options:
    case HttpMethod.patch:
    case HttpMethod.put:
      return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

Future<Response> _post(RequestContext context) async {
  final json1 = await context.request.body();
  return Response.json(
    statusCode: HttpStatus.created,
    body: json1,
  );
}

Future<Response> _get(RequestContext context) async {
  final json1 = await context.request.body();
  return Response.json(
    statusCode: HttpStatus.created,
    body: json1,
  );
}
