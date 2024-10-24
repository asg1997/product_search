import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQlConfig {
  factory GraphQlConfig() => _instance;
  GraphQlConfig._();
  static final _instance = GraphQlConfig._();

  static final url = HttpLink('https://anemo.productsearch.app/graphql');

  GraphQLClient get client => GraphQLClient(
        link: url,
        cache: GraphQLCache(),
      );
}
