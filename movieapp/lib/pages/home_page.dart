import 'package:flutter/material.dart';
import 'package:movieapp/widgets/palomitas_card.dart';

import '../widgets/movie_item.dart';

class HomePage extends StatelessWidget {
   HomePage({
    super.key,
  });




  final List<Map<String, String>> _listElements = [
    {
      "title": "Star wars",
      "description": "Ranking: ★★★",
      "image": "https://i.imgur.com/tpHc9cS.jpg",
    },
    {
      "title": "Black widow",
      "description": "Ranking: ★★★★",
      "image": "https://i.imgur.com/0NTTbFn.jpg",
    },
    {
      "title": "Frozen 2",
      "description": "Ranking: ★★★",
      "image": "https://i.imgur.com/noNCN3V.jpg",
    },
    {
      "title": "Joker",
      "description": "Ranking: ★★★★",
      "image": "https://i.imgur.com/trdzMAl.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies App'),
      ),
      body: Container(
        color: Colors.blue[900],
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            const Text('Seleccione su película favorita', style: TextStyle(fontSize: 26, color: Colors.white, fontWeight: FontWeight.bold),),
            const SizedBox(height: 20,),
            SizedBox(
              height: 250,
              child: ListView.builder(
                itemCount: _listElements.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return MovieItem(
                    title: _listElements[index]["title"]!,
                    description: _listElements[index]["description"]!,
                    image: _listElements[index]["image"]!,);
                },
              ),
            ),
            const SizedBox(height: 50,),
            const PalomitasCard()
          ],
        ),
      ),
    );
  }
}
