import 'package:flutter/material.dart';
import 'package:flutter_act13_20220244/model/movie_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Buscador',
      debugShowCheckedModeBanner: false,
      home: SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

// dummy movie list XD!
class _SearchPageState extends State<SearchPage> {
  static List<MovieModel> mainMoviesList = [
    MovieModel("La Guerra de las Galaxias", 1977, 8.6,
        "https://m.media-amazon.com/images/M/MV5BZDM5OTAwMGQtYTYwMS00OGQyLTg4YTctNWFjMGY1ODFkMjkwXkEyXkFqcGdeQXVyMTYzMDM0NTU@._V1_QL75_UY562_CR12,0,380,562_.jpg"),
    MovieModel("El pianista", 2002, 8.5,
        "https://m.media-amazon.com/images/M/MV5BZTBmZWVmZjYtNjRkMC00YjEwLWE0ZTctMDBjNjhhMjViMzIxXkEyXkFqcGdeQXVyMTAxNTQzMDM4._V1_QL75_UX380_CR0,4,380,562_.jpg"),
    MovieModel("Interstellar", 2014, 8.7,
        "https://m.media-amazon.com/images/M/MV5BZjdkOTU3MDktN2IxOS00OGEyLWFmMjktY2FiMmZkNWIyODZiXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_QL75_UX380_CR0,0,380,562_.jpg"),
    MovieModel("El señor de los Anillos: El Retorno del Rey", 2003, 9.0,
        "https://m.media-amazon.com/images/M/MV5BNGJjODMxZGMtOTFlNC00MjI4LThiZWUtZTU3ZGIxYzcxMTBiXkEyXkFqcGdeQXVyODc0OTEyNDU@._V1_QL75_UY562_CR19,0,380,562_.jpg"),
    MovieModel("Pulp Fiction", 1994, 8.9,
        "https://m.media-amazon.com/images/M/MV5BYzFkMzk5YTEtNGZjMC00ZjU0LWFlZjUtZjJjOTRiZmUxODAxXkEyXkFqcGdeQXVyMTYzMDM0NTU@._V1_QL75_UY562_CR14,0,380,562_.jpg"),
    MovieModel("El Bueno el Feo y el Malo", 1966, 8.8,
        "https://m.media-amazon.com/images/M/MV5BNzEzNWJiOTctOGIyYi00Y2QyLTgxYjItMWU5ZDIzYTUyYzJkXkEyXkFqcGdeQXVyMTYzMDM0NTU@._V1_QL75_UX380_CR0,4,380,562_.jpg"),
    MovieModel("Origen", 2010, 8.8,
        "https://m.media-amazon.com/images/M/MV5BMTUzMzUyOTktNmYyNS00YTA1LWIxNmQtMGIzZDYxZGI3OTliXkEyXkFqcGdeQXVyMTYzMDM0NTU@._V1_QL75_UY562_CR7,0,380,562_.jpg"),
    MovieModel("Matrix", 1999, 8.7,
        "https://m.media-amazon.com/images/M/MV5BYWQxMzg0OGYtNGE3Yi00OGY4LWJjZDktZWZiODE2N2MyODgzXkEyXkFqcGdeQXVyMTYzMDM0NTU@._V1_QL75_UY562_CR25,0,380,562_.jpg"),
    MovieModel("Gladiador", 2000, 8.5,
        "https://m.media-amazon.com/images/M/MV5BYTllNmQ3MWYtNzE5Ny00N2UwLTg1MDgtMWIyY2FjNTNlMDEzXkEyXkFqcGdeQXVyMTYzMDM0NTU@._V1_FMjpg_UX220_.jpg"),
    MovieModel("Whiplash", 2014, 8.5,
        "https://m.media-amazon.com/images/M/MV5BNTAxYzE0OTAtYzk2OS00YzZkLWEyYWYtMTE5MzU0NjZiZWNiXkEyXkFqcGdeQXVyMTYzMDM0NTU@._V1_FMjpg_UY5000_.jpg"),
  ];

// lista que se mostrará y filtrará
  List<MovieModel> displayList = List.from(mainMoviesList);

// Funcion para filtrar lista
  void updateList(String value) {
    setState(() {
      displayList = mainMoviesList
          .where((element) =>
              element.movieTitle!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1f1545),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1f1545),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Busca una película',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              onChanged: (value) => updateList(value),
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFF302360),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9.0),
                  borderSide: BorderSide.none,
                ),
                hintText: "Buscar",
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: displayList.isEmpty
                  ? const Center(
                      child: Text(
                        "No Hay Resultados",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  : ListView.builder(
                      itemCount: displayList.length,
                      itemBuilder: (context, index) => ListTile(
                        contentPadding: const EdgeInsets.all(8.0),
                        title: Text(
                          displayList[index].movieTitle!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          '${displayList[index].releaseYear!}',
                          style: const TextStyle(color: Colors.white60),
                        ),
                        trailing: Text(
                          "${displayList[index].rating}",
                          style: const TextStyle(color: Colors.amber),
                        ),
                        leading: Image.network(displayList[index].posterUrl!),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
