import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hive_flutter/adapters.dart';

import 'package:webtoon/core/ui.dart';
import 'package:webtoon/logic/cubit/favourite_cubit.dart/Favourite_webtoon_cubit.dart';
import 'package:webtoon/logic/services/hive_webtoon_model.dart';
import 'package:webtoon/logic/cubit/webtoon_cubit.dart';
import 'package:webtoon/presentation/screen/home_screen.dart';

Future<void> main() async {  
  WidgetsFlutterBinding.ensureInitialized();
  
  // Use only Hive.initFlutter() which includes path initialization
  await Hive.initFlutter();

  Hive.registerAdapter(HiveWebtoonModelAdapter());  
  await Hive.openBox<HiveWebtoonModel>('webtoonsBox');
  
  Bloc.observer = MyBlocObserver();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => WebtoonCubit(),
  ), 
      BlocProvider(create: (context) => FavoriteWebToonsCubit( BlocProvider.of<WebtoonCubit>(context)),)],
      child: MaterialApp(debugShowCheckedModeBanner: false, 
        title: 'Flutter Demo',
        theme:Themes.defaultTheme,
        home: const HomeScreen(),
      ),
    );
  }
}
class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    log("Created: $bloc");
    super.onCreate(bloc);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    log("Change in $bloc: $change");
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log("Change in $bloc: $transition");
    super.onTransition(bloc, transition);
  }

  @override
  void onClose(BlocBase bloc) {
    log("Closed: $bloc");
    super.onClose(bloc);
  }
}
