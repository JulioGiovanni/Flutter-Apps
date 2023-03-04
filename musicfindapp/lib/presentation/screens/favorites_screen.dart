import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicfindapp/bloc/findmusic_bloc.dart';
import 'package:musicfindapp/presentation/screens/details_screen.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis favoritos'),
      ),
      body: Center(child: BlocBuilder<FindMusicBloc, FindMusicState>(
        builder: (context, state) {
          print(state.favorites);
          return state.favorites.isEmpty
              ? const Text('No hay favoritos')
              : GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const DetailScreen()));
                  },
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: state.favorites.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Image.network(
                            state.song['spotify']['album']['images'][1]['url']),
                        title: Text(state.favorites[index]['title']),
                        subtitle: Text(state.favorites[index]['artist']),
                      );
                    },
                  ),
                );
        },
      )),
    );
  }
}
