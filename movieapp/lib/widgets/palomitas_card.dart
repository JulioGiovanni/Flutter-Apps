import 'package:flutter/material.dart';

class PalomitasCard extends StatefulWidget {
  const PalomitasCard({super.key});

  @override
  State<PalomitasCard> createState() => _PalomitasCardState();
}

class _PalomitasCardState extends State<PalomitasCard> {
  int _contador = 0;
  @override
  Widget build(BuildContext context) {
    return Card(

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.network('https://cdn0.recetasgratis.net/es/posts/8/6/1/palomitas_en_sarten_62168_orig.jpg', width: 100, height: 100, fit: BoxFit.cover,),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text('Palomitas (Medianas):',style: TextStyle(fontSize: 20),),
                          
                          const SizedBox(height: 15,),
                          
                          Text('$_contador',style: const TextStyle(fontSize: 20)),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () {
                                  setState(() {
                                    if (_contador > 0) _contador = (_contador - 1);
                                  });
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () {
                                  setState(() {
                                    _contador = (_contador + 1);
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            );
  }
}