import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:resturant/models/bloc/cubits/admin_cubit.dart';
import 'package:resturant/models/bloc/states/admin_state.dart';
import 'package:resturant/models/cach/chach.dart';
import 'package:resturant/models/dio/end_points.dart';

class UsersAdmin extends StatelessWidget {
  const UsersAdmin({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameBottomSheet = TextEditingController();
    TextEditingController emailBottomSheet = TextEditingController();
    var cubit = AdminCubit.get(context);
    String token = CachFunc.getData('token');

    return BlocConsumer<AdminCubit, AdminState>(
        builder: (context, state) {
          return Column(
            children: [
              EndPoints.allUser.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : Expanded(
                      child: ListView.builder(
                          itemCount: EndPoints.allUser.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                showBottomSheet(
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.7,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(25),
                                            topRight: Radius.circular(25),
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Update ${EndPoints.allUser[index]['name']} profile data (:',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontFamily: 'Bakta',
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(15),
                                              child: TextField(
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                                cursorColor: Colors.black,
                                                controller: usernameBottomSheet,
                                                keyboardType:
                                                    TextInputType.text,
                                                onChanged: (value) {},
                                                onSubmitted: (val) {},
                                                decoration: InputDecoration(
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors
                                                            .orangeAccent),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    borderSide: BorderSide(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  labelText: 'UserName',
                                                  labelStyle: TextStyle(
                                                      color: Colors.black),
                                                  prefixIcon: Icon(
                                                    IconlyBroken.profile,
                                                    color: Colors.black,
                                                  ),
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                    color: Colors.black,
                                                  )),
                                                  disabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(15),
                                              child: TextField(
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                                cursorColor: Colors.black,
                                                controller: emailBottomSheet,
                                                keyboardType:
                                                    TextInputType.emailAddress,
                                                onChanged: (value) {},
                                                onSubmitted: (val) {},
                                                decoration: InputDecoration(
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors
                                                            .orangeAccent),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    borderSide: BorderSide(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  labelText: 'Email',
                                                  labelStyle: TextStyle(
                                                      color: Colors.black),
                                                  prefixIcon: Icon(
                                                    Icons.email,
                                                    color: Colors.black,
                                                  ),
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                    color: Colors.black,
                                                  )),
                                                  disabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 250,
                                              height: 50,
                                              child: MaterialButton(
                                                onPressed: () {
                                                  print(EndPoints.allUser[index]
                                                      ['_id']);
                                                  cubit.updateuser(
                                                    token,
                                                    EndPoints.allUser[index]
                                                        ['_id'],
                                                    usernameBottomSheet.text
                                                            .trim()
                                                            .isEmpty
                                                        ? EndPoints
                                                                .allUser[index]
                                                            ['name']
                                                        : usernameBottomSheet
                                                            .text
                                                            .trim(),
                                                    emailBottomSheet.text
                                                            .trim()
                                                            .isEmpty
                                                        ? EndPoints
                                                                .allUser[index]
                                                            ['email']
                                                        : emailBottomSheet.text
                                                            .trim(),
                                                    context,
                                                  );
                                                },
                                                child: Text(
                                                  'Update',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontFamily: 'Bakta',
                                                    fontWeight: FontWeight.w900,
                                                  ),
                                                ),
                                                color: Colors.orangeAccent,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    });
                              },
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 20,
                                  backgroundImage: NetworkImage(
                                      '${EndPoints.allUser[index]['photo']}'),
                                ),
                                title:
                                    Text('${EndPoints.allUser[index]['name']}'),
                                subtitle: Text(
                                    '${EndPoints.allUser[index]['email']}'),
                                trailing: MaterialButton(
                                  onPressed: () {
                                    cubit.deleteUserById(
                                        token, EndPoints.allUser[index]['_id']);
                                  },
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.orangeAccent,
                                  ),
                                ),
                              ),
                            );
                          }),
                    )
            ],
          );
        },
        listener: (context, state) {});
  }
}