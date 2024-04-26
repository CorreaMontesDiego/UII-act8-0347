import 'package:flutter/material.dart';

void main() => runApp(const AppMiTabBar());

class AppMiTabBar extends StatelessWidget {
  const AppMiTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ejemplo TabBar Diego Correa",
      theme: ThemeData(primarySwatch: Colors.red),
      home: const MiPaginaInicial(),
    );
  }
} //Fin AppMiTabBar

//Stateful
class MiPaginaInicial extends StatefulWidget {
  const MiPaginaInicial({Key? key}) : super(key: key);

  @override
  State<MiPaginaInicial> createState() => _MiPaginaInicialState();
} //MiPaginaInicial

class _MiPaginaInicialState extends State<MiPaginaInicial> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Tabbar Cmd cars imagenes"),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Ej.1",
                icon: Icon(Icons.add_alarm),
              ),
              Tab(
                text: "Ej.2",
                icon: Icon(Icons.accessible_forward_outlined),
              ),
              Tab(
                text: "Ej.3",
                icon: Icon(Icons.add_a_photo),
              ),
              Tab(
                text: "Ej.4",
                icon: Icon(Icons.forklift),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            _StyledImage(
              imageUrl:
                  "https://raw.githubusercontent.com/CorreaMontesDiego/img_IOS/main/mazda-rx7-removebg-preview.png",
              description: "Ejemplo 1",
              color: Colors.blue, // Custom color for this image
              borderRadius: 25.0, // Custom border radius
            ),
            _MultipleImages(),
            _StyledImage(
              imageUrl:
                  "https://raw.githubusercontent.com/CorreaMontesDiego/img_IOS/main/silvia_s15.jpg",
              description: "Ejemplo 3",
              color: Colors.orange, // Custom color for this image
              borderRadius: 100.0, // Custom border radius
            ),
            _StyledImage(
              imageUrl:
                  "https://raw.githubusercontent.com/CorreaMontesDiego/img_IOS/main/gtr.jpg",
              description: "Ejemplo 4",
              color: Colors.purple, // Custom color for this image
              borderRadius: 15.0, // Custom border radius
            ),
          ],
        ),
      ),
    );
  }
}

class _StyledImage extends StatelessWidget {
  final String imageUrl;
  final String description;
  final Color color; // Custom color
  final double borderRadius; // Custom border radius
  const _StyledImage(
      {required this.imageUrl,
      required this.description,
      required this.color,
      required this.borderRadius,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 400,
            height: 200,
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
              borderRadius: BorderRadius.circular(
                  borderRadius), // Use custom border radius
              color: color, // Use custom color
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                  borderRadius), // Use custom border radius
              child: Image(
                image: imageUrl.startsWith('http')
                    ? NetworkImage(imageUrl)
                    : AssetImage(imageUrl) as ImageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(description),
        ],
      ),
    );
  }
}

class _MultipleImages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _SingleImage(
                imageUrl:
                    "https://raw.githubusercontent.com/CorreaMontesDiego/img_IOS/main/mitsubishi-bravo.jpg",
                description: "Ejemplo 2 - Imagen 1",
                color: Colors.green,
                borderRadius: 0.0,
              ),
              _SingleImage(
                imageUrl:
                    "https://raw.githubusercontent.com/CorreaMontesDiego/img_IOS/main/mitsubishi-bravo.jpg",
                description: "Ejemplo 2 - Imagen 2",
                color: Colors.green,
                borderRadius: 0.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SingleImage extends StatelessWidget {
  final String imageUrl;
  final String description;
  final Color color;
  final double borderRadius;
  const _SingleImage({
    required this.imageUrl,
    required this.description,
    required this.color,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(borderRadius),
        color: color,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Image(
          image: imageUrl.startsWith('http')
              ? NetworkImage(imageUrl)
              : AssetImage(imageUrl) as ImageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
