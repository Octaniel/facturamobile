import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';

import 'package:facturamobile/app/modules/venda/venda_repository.dart';

class MockClient extends Mock implements Dio {}

void main() {
  VendaRepository repository;
  // MockClient client;

  setUp(() {
    // repository = VendaRepository();
    // client = MockClient();
  });

  group('VendaRepository Test', () {
    //  test("First Test", () {
    //    expect(repository, isInstanceOf<VendaRepository>());
    //  });

    test('returns a Post if the http call completes successfully', () async {
      //    when(client.get('https://jsonplaceholder.typicode.com/posts/1'))
      //        .thenAnswer((_) async =>
      //            Response(data: {'title': 'Test'}, statusCode: 200));
      //    Map<String, dynamic> data = await repository.fetchPost(client);
      //    expect(data['title'], 'Test');
    });
  });
}
