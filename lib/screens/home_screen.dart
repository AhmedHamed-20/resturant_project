import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant/components/popular_widget.dart';
import 'package:resturant/models/bloc/cubits/cubit.dart';
import 'package:resturant/models/bloc/states/states.dart';
import 'package:resturant/models/class_models/login_model.dart';
import 'package:resturant/models/dio/end_points.dart';
import 'package:resturant/screens/detailes_screen.dart';
import 'package:resturant/widgets/all_fodods.dart';
import 'package:resturant/widgets/navigate.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = Appcubit.get(context);

    return BlocConsumer<Appcubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return EndPoints.allRecipiesMap.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 10),
                    child: Text(
                      'Popular Foods',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Batka',
                      ),
                    ),
                  ),
                  popularWidget(context),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 10),
                    child: Text(
                      'All Recipes',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Batka',
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: ListView.builder(
                      itemCount: EndPoints.allRecipiesMap['results'],
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigate(
                              context: context,
                              Screen: DetailesScreen(
                                index: index,
                                name: EndPoints.allRecipiesMap['data']['data']
                                    [index]['name'],
                                imageurl: EndPoints.allRecipiesMap['data']
                                    ['data'][index]['imageCover'],
                                price: EndPoints.allRecipiesMap['data']['data']
                                        [index]['price']
                                    .toString(),
                                descripthion: EndPoints.allRecipiesMap['data']
                                    ['data'][index]['slug'],
                                Ingridients: EndPoints.allRecipiesMap['data']
                                    ['data'][index]['ingredients'],
                                email: EndPoints.loginModel.data.user.email,
                                userId: EndPoints.loginModel.data.user.id,
                              ),
                            );
                          },
                          child: allFoods(
                            name: EndPoints.allRecipiesMap['data']['data']
                                [index]['name'],
                            context: context,
                            state: state,
                            index: index,
                            imageurl: EndPoints.allRecipiesMap['data']['data']
                                [index]['imageCover'],
                            price: EndPoints.allRecipiesMap['data']['data']
                                    [index]['price']
                                .toString(),
                            description: EndPoints.allRecipiesMap['data']
                                ['data'][index]['slug'],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
      },
    );
  }
}
