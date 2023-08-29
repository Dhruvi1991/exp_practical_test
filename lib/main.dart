import 'package:exp_practical_test/pokemon/presentation/blocs/pokemon_details/pokemon_details_bloc.dart';
import 'package:exp_practical_test/pokemon/presentation/blocs/pokemon_list/pokemon_bloc.dart';
import 'package:exp_practical_test/pokemon/presentation/pages/pokemon_list.dart';
import 'package:exp_practical_test/shared/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injector_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<PokemonBloc>(
            create: (BuildContext context) => di.sl<PokemonBloc>(),
          ),
          BlocProvider<PokemonDetailsBloc>(
              create: (BuildContext context) => di.sl<PokemonDetailsBloc>())
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: primaryColor as MaterialColor,
          ),
          home: const MyHomePage(title: 'Pokemons'),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text(widget.title)),
        ),
        body: const PokemonList());
  }
}
