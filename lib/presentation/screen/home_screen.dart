import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webtoon/core/ui.dart';
import 'package:webtoon/data/model/webtoon_model.dart';
import 'package:webtoon/logic/cubit/webtoon_cubit.dart';
import 'package:webtoon/logic/cubit/webtoon_state.dart';
import 'package:webtoon/presentation/screen/detail_screen.dart';
import 'package:webtoon/presentation/screen/fav_screen.dart';
import 'package:webtoon/presentation/widgets/custom_card.dart';
// Your custom themes

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override

State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<String> genres = [
    'Action', 'Fantasy', 'Romance', 'Comedy', 'Manhwa', 'Magic', 'Reincarnation'
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: genres.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Webtoon Explorer', style: TextStyle(color: AppColors.accent),), actions: [
    IconButton(
      icon: const Icon(Icons.favorite),
   onPressed: () async {
           
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoriteScreen(),
                ),
              );
            },

    ),
  ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          indicatorColor: AppColors.accent,
          labelColor: AppColors.accent,
          unselectedLabelColor: AppColors.textLight,
          tabs: genres.map((genre) => Tab(text: genre)).toList(),
        ),
      ),
      body: BlocBuilder<WebtoonCubit, WebtoonState>(
        builder: (context, state) {
          
        
          if (state is WebtoonLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WebtoonErrorState) {
            return Center(child: Text('Error: ${state.message}'));
          } else if (state is WebtoonLoadedState) {
           
            return TabBarView(
              controller: _tabController,
              children: genres.map((genre) {
                final webtoonsByGenre = state.webtoons
                    .where((webtoon) => webtoon.genres.contains(genre))
                    .toList();

                if (webtoonsByGenre.isEmpty) {
                  return const Center(child: Text('No webtoons available for this genre.'));
                }

                return ListView.builder(
                  itemCount: webtoonsByGenre.length,
                  itemBuilder: (context, index) {
                    final webtoon = webtoonsByGenre[index];
               
                    return
                    
                    WebtoonCard(thumbnail:webtoon. thumbnail, title:webtoon. title, totalChapters:webtoon. totalChapters, summary:webtoon. summary, webtoon: webtoon);
                  },
                );
              }).toList(),
            );
          }

          return const Center(child: Text('No data available.'));
        },
      ),
    );
  }
}
