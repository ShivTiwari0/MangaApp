
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import 'package:webtoon/logic/cubit/favourite_cubit.dart/Favourite_webtoon_cubit.dart';
import 'package:webtoon/logic/cubit/favourite_cubit.dart/favourite_state.dart';

import 'package:webtoon/presentation/widgets/custom_card.dart';

class FavoriteScreen extends StatelessWidget {

  static const routeName = "favorite";

  const FavoriteScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Blogs'),
      ),
      body: BlocBuilder<FavoriteWebToonsCubit, FavoriteWebToonsState>(
        builder: (context, state) {
          if (state is FavoriteWebToonsLoadingState) {
            return  Center(child: Lottie.asset(
            'assets/animated/Animation - 1722927455635.json', fit: BoxFit.fitHeight),);
          } else if (state is FavoriteWebToonsLoadedState) {
            return ListView.builder(
              itemCount: state.favoriteWebToons.length,
              itemBuilder: (context, index) {
                 final webtoon = state.favoriteWebToons[index];
                return WebtoonCard(
                  thumbnail: webtoon.thumbnail,
                  title: webtoon.title,
                  totalChapters: webtoon.totalChapters,
                  summary: webtoon.summary,
                  webtoon: webtoon,
                );
              },
            );
          } else if (state is FavoriteWebToonsErrorState) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return const Center(child: Text('No favorites found'));
          }
        },
      ),
    );
  }
}
