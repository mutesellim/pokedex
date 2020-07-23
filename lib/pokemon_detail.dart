import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_mobile_app/models/pokedex.dart';

class PokemonDetail extends StatelessWidget {
  Pokemon pokemon;

  PokemonDetail({this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          pokemon.name,
          textAlign: TextAlign.center,
        ),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return dikeyBody(context);
          } else {
            return yatayBody(context);
          }
        },
      ),
    );
  }

  Stack dikeyBody(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          height: MediaQuery.of(context).size.height * (6 / 8),
          width: MediaQuery.of(context).size.width - 20,
          left: 10,
          top: MediaQuery.of(context).size.height / 10,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  height: 100,
                ),
                Text(
                  pokemon.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Text(
                  "Height : " + pokemon.height,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Text(
                  "Width : " + pokemon.weight,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Text(
                  "Types : ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.type
                      .map((tip) => Chip(
                            backgroundColor: Colors.black,
                            label: Text(
                              tip,
                              style: TextStyle(color: Colors.yellow),
                            ),
                          ))
                      .toList(),
                ),
                Text(
                  "Pre Evolution",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.prevEvolution != null
                      ? pokemon.prevEvolution
                          .map((prev) => Chip(
                                backgroundColor: Colors.black,
                                label: Text(
                                  prev.name,
                                  style: TextStyle(color: Colors.yellow),
                                ),
                              ))
                          .toList()
                      : [
                          Text(
                            "İlk Hali",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                ),
                Text(
                  "Next Evolution",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.nextEvolution != null
                      ? pokemon.nextEvolution
                          .map((evo) => Chip(
                                backgroundColor: Colors.black,
                                label: Text(
                                  evo.name,
                                  style: TextStyle(color: Colors.yellow),
                                ),
                              ))
                          .toList()
                      : [
                          Text(
                            "Son Hali",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                ),
                Text(
                  "Weakness",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.weaknesses != null
                      ? pokemon.weaknesses
                          .map((weak) => Chip(
                                backgroundColor: Colors.black,
                                label: Text(
                                  weak,
                                  style: TextStyle(color: Colors.yellow),
                                ),
                              ))
                          .toList()
                      : [
                          Text(
                            "Zayıflığı Yok",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                )
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Hero(
            tag: pokemon.img,
            child: Container(
              width: 200,
              height: 200,
              child: Image.network(
                pokemon.img,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget yatayBody(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 20,
      height: MediaQuery.of(context).size.height * (3 / 4),
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(15),
          color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Hero(
              tag: pokemon.img,
              child: Container(
                width: 200,
                height: 200,
                child: Image.network(
                  pokemon.img,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    pokemon.name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Text(
                    "Height : " + pokemon.height,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text(
                    "Width : " + pokemon.weight,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text(
                    "Types : ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.type
                        .map((tip) => Chip(
                              backgroundColor: Colors.black,
                              label: Text(
                                tip,
                                style: TextStyle(color: Colors.yellow),
                              ),
                            ))
                        .toList(),
                  ),
                  Text(
                    "Pre Evolution",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.prevEvolution != null
                        ? pokemon.prevEvolution
                            .map((prev) => Chip(
                                  backgroundColor: Colors.black,
                                  label: Text(
                                    prev.name,
                                    style: TextStyle(color: Colors.yellow),
                                  ),
                                ))
                            .toList()
                        : [
                            Text(
                              "İlk Hali",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                  ),
                  Text(
                    "Next Evolution",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.nextEvolution != null
                        ? pokemon.nextEvolution
                            .map((evo) => Chip(
                                  backgroundColor: Colors.black,
                                  label: Text(
                                    evo.name,
                                    style: TextStyle(color: Colors.yellow),
                                  ),
                                ))
                            .toList()
                        : [
                            Text(
                              "Son Hali",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                  ),
                  Text(
                    "Weakness",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.weaknesses != null
                        ? pokemon.weaknesses
                            .map((weak) => Chip(
                                  backgroundColor: Colors.black,
                                  label: Text(
                                    weak,
                                    style: TextStyle(color: Colors.yellow),
                                  ),
                                ))
                            .toList()
                        : [
                            Text(
                              "Zayıflığı Yok",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
