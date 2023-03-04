

import 'package:amphibians/providers/amphibian_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';





class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
      ),
      body: ListView.separated(
        itemCount: context.watch<AmphibiansProvider>().getAmphibiansList.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(child: Text(
              context.watch<AmphibiansProvider>().getAmphibiansList[index].name![0],

            )),
            title: Text(context.watch<AmphibiansProvider>().getAmphibiansList[index].name!),
            subtitle: Text(context.watch<AmphibiansProvider>().getAmphibiansList[index].description!),
          ) ;
        },
      ),
    );
  }

  
}
