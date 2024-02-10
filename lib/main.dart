import 'package:country_names/search_country.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:country_names/grapql_config.dart';

Future<void> main() async{


WidgetsFlutterBinding.ensureInitialized();

    final service = GraphQLService();

  runApp( MyApp(client: ValueNotifier( service.client())));
}

class MyApp extends StatelessWidget {

  // bu provider uchun kerak 
  final ValueNotifier <GraphQLClient>? client;
  const MyApp({
    Key? key,
   required this.client,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(

      client: client,
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
       
        home:  SearchCountry(),
      ),
    );
  }
}
