import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:musicfindapp/bloc/findmusic_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FindMusicBloc, FindMusicState>(
      builder: (context, state) {
        if (state.song != null) {
          return Scaffold(
              appBar: AppBar(
                title: Text(state.song['title']),
                actions: [
                  IconButton(
                      onPressed: () {
                        try {
                          state.favorites.contains(state.song)
                              ?
                              //Show dialog
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title:
                                          const Text('Eliminar de favoritos'),
                                      content: const Text(
                                          'El elemento será eliminado de favoritos ¿Quieres continuar?'),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              //Close dialog
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Cancelar')),
                                        TextButton(
                                            onPressed: () {
                                              BlocProvider.of<FindMusicBloc>(
                                                      context)
                                                  .add(RemoveFavorite(
                                                      title:
                                                          state.song['title'],
                                                      artist: state
                                                          .song['artist']));
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Aceptar')),
                                      ],
                                    );
                                  })
                              : BlocProvider.of<FindMusicBloc>(context).add(
                                  AddFavorite(
                                      favorites: state.favorites,
                                      song: state.song));
                        } catch (e) {
                          print('Error al agregar favoritos: $e');
                        }
                      },
                      icon: state.favorites.contains(state.song)
                          ? const Icon(Icons.favorite)
                          : const Icon(Icons.favorite_border)),
                  // IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert)),
                ],
              ),
              body: Column(
                children: [
                  Image.network(
                      state.song['spotify']['album']['images'][1]['url']),
                  Text(state.song['artist'],
                      style: const TextStyle(fontSize: 20)),
                  Text(state.song['album'],
                      style: const TextStyle(fontSize: 20)),
                  Text(state.song['release_date'],
                      style: const TextStyle(fontSize: 20)),
                  const Divider(),
                  const SizedBox(height: 30),
                  const Center(
                      child: Text(
                    'Abrir con:',
                    style: TextStyle(fontSize: 20),
                  )),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //Create 3 buttons with the same size
                      IconButton(
                        onPressed: () async {
                          //Open url
                          await launchUrl(Uri.parse(state.song['spotify']
                              ['external_urls']['spotify']));
                        },
                        icon: const FaIcon(FontAwesomeIcons.spotify),
                        iconSize: 35,
                      ),
                      IconButton(
                        onPressed: () async {
                          //Open url
                          await launchUrl(Uri.parse(state.song['song_link']));
                        },
                        icon: const FaIcon(FontAwesomeIcons.podcast),
                        iconSize: 35,
                      ),
                      IconButton(
                        onPressed: () async {
                          //Open url
                          await launchUrl(
                              Uri.parse(state.song['apple_music']['url']));
                        },
                        icon: const FaIcon(FontAwesomeIcons.apple),
                        iconSize: 35,
                      ),
                    ],
                  )
                ],
              ));
        } else {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Error'),
            ),
            body: const Center(
              child: Text('Error al cargar la información'),
            ),
          );
        }
      },
    );
  }
}
