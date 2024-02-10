import 'package:country_names/country_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class SearchCountry extends StatefulWidget {
  const SearchCountry({super.key});

  @override
  State<SearchCountry> createState() => _SearchCountryState();
}

class _SearchCountryState extends State<SearchCountry> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: TextField(
              controller: controller,
              onEditingComplete: () {
                setState(() {});
              },
            ),
          ),
          Query(
              options: QueryOptions(
                  document: gql("""  





            query Query {
  country(code: "${controller.text}") {
    name
    native
    capital
    emoji
    currency
    languages {
      code
      name
    }
  }
}

"""
/*
query  {
  Page {
    media {
      siteUrl
      title {
        english
        native
      }
      description
    }
  }
  Media {
    id
    idMal
    type
    format
    status
    description
    
     
    season
    seasonYear
    
    episodes
    duration
    chapters
    volumes
    countryOfOrigin
    isLicensed
    source
    hashtag
    trailer {
      thumbnail
      site
      id
    }
    updatedAt
    coverImage {
      large
    }
    bannerImage
    genres
    synonyms
    averageScore
    meanScore
    popularity
    isLocked
    trending
    favourites
    isFavourite
    isFavouriteBlocked
    isAdult
    siteUrl
    autoCreateForumThread
    isRecommendationBlocked
    isReviewBlocked
    modNotes
  }
}

*/

                      )),
              builder: (result, {refetch, fetchMore}) {
                if (result.hasException) {
                  return const Expanded(
                      child: Center(
                    child: Text('Nimadir xato ketdi'),
                  ));
                }

                if (result.isLoading) {
                  return const Expanded(
                      child: Center(
                    child: CupertinoActivityIndicator(),
                  ));
                }

                print(result.data);
                print('==================');
                print(result.data);

                final data =
                    CountryClass.fromJson(result.data?['country'] ?? {});
                return Expanded(
                    child: Column(
                  children: [
                    Text(
                      """World name: ${data.name}""",
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      """Poytaxti: ${data.capital}""",
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      """Pul birligi: ${data.currency}""",
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      """Davlat tillari: ${data.languages}""",
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Center(
                      child: Text(
                        """ ${data.emoji}""",
                        style: const TextStyle(
                          fontSize: 50,
                        ),
                      ),
                    ),
                  ],
                ));
              }),
        ],
      ),
    );
  }
}
