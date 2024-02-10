import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLService {

  final httplink =  HttpLink('https://countries.trevorblades.com/graphql');  // grapql linki beriladi 
  // final httplink =  HttpLink('https://spacex-production.up.railway.app/');  // grapql linki beriladi 

  GraphQLClient client () =>  GraphQLClient(
    link: httplink, 
    cache: GraphQLCache(),
    );


}