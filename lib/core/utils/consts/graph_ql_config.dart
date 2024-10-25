import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQlConfig {
  factory GraphQlConfig() => _instance;
  GraphQlConfig._();
  static final _instance = GraphQlConfig._();

  static HttpLink link = HttpLink('https://anemo.productsearch.app/graphql');

  GraphQLClient get client => GraphQLClient(
        link: link,
        cache: GraphQLCache(),
      );
}
