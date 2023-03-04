import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicfindapp/presentation/screens/details_screen.dart';
import 'package:musicfindapp/presentation/screens/favorites_screen.dart';
import 'package:musicfindapp/bloc/findmusic_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    //Get height of the screen
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Center(
      child: BlocConsumer<FindMusicBloc, FindMusicState>(
        listener: (context, state) {
          if (state is FindMusicFound) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const DetailScreen()));
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              SizedBox(height: height * 0.1),
              Text(state.isRecording ? 'Escuchando' : 'Toque para escuchar',
                  style: const TextStyle(fontSize: 20)),
              SizedBox(height: height * 0.15),
              AvatarGlow(
                glowColor: Colors.red,
                endRadius: 150.0,
                animate: true,
                duration: const Duration(milliseconds: 2000),
                repeat: true,
                showTwoGlows: true,
                repeatPauseDuration: const Duration(milliseconds: 100),
                child: Material(
                  // Replace this child with your own
                  // elevation: 10.0,
                  shape: const CircleBorder(),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[100],
                    radius: 100.0,
                    child: IconButton(
                      color: Colors.red,
                      icon: state.isRecording
                          ? const Icon(Icons.stop)
                          : const Icon(Icons.mic),
                      iconSize: 100,
                      onPressed: () {
                        //Start recording
                        BlocProvider.of<FindMusicBloc>(context)
                            .add(IsRecording(isRecording: !state.isRecording));
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.1),
              //Circled button
              CircleAvatar(
                backgroundColor: Colors.grey[100],
                radius: 35.0,
                child: IconButton(
                  color: Colors.black,
                  icon: const Icon(Icons.favorite),
                  iconSize: 40,
                  onPressed: () {
                    //navigate to favorites screen
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const FavoritesScreen()));
                  },
                ),
              )
            ],
          );
        },
      ),
    ));
  }
}
