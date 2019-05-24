import 'package:graphql/client.dart';

final HttpLink _httpLink = HttpLink(
  uri: 'https://github.com/graphql'
);

final AuthLink _authLink = AuthLink(
  getToken: () async => '',
);

final Link _link = _authLink.concat(_httpLink as Link);

final GraphQLClient client = GraphQLClient(
  cache: InMemoryCache(),
  link: _link,
);