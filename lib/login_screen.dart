import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_last/bloc.dart';
import 'package:flutter_last/states.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class LoginScreen extends StatelessWidget {
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('${AppLocalizations.of(context)?.login}'),
              actions: [
                IconButton(
                    onPressed: () {
                      AppCubit().get(context).changetheme();
                    },
                    icon: Icon(Icons.dark_mode)),
                PopupMenuButton(
                  itemBuilder: (context) => AppLocalizations.supportedLocales
                      .map((e) => PopupMenuItem(value: e, child: Text('$e')))
                      .toList(),
                  onSelected: (value) =>
                      AppCubit().get(context).changeLang(value),
                )
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
            ),
            body: Form(
              key: formkey,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: emailcontroller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'it must not be empty';
                      }
                    },
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: passwordcontroller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'it must not be empty';
                      }
                    },
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          AppCubit().get(context).login(
                              emailcontroller.text, passwordcontroller.text);
                        }
                      },
                      child: Text('${AppLocalizations.of(context)?.login}'))
                ],
              ),
            ),
          );
        });
  }
}
