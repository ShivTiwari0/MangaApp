import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import Bloc for managing states
import 'package:webtoon/core/ui.dart';
import 'package:webtoon/data/model/webtoon_model.dart';
import 'package:webtoon/logic/cubit/webtoon_cubit.dart'; // Import your WebtoonCubit for favorite management

class DetailScreen extends StatefulWidget {
  final WebtoonModel webtoon;

  const DetailScreen({super.key, required this.webtoon});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.webtoon.isFavorite; // Initialize the favorite status from the model
  }

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite; // Toggle the favorite status in the UI

      // Update the favorite status in the Cubit
     context.read<WebtoonCubit>().toggleFavorite(widget.webtoon.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.webtoon.title,
          style: TextStyles.heading2.copyWith(color: AppColors.accent),
        ),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.white,
            ),
            onPressed: _toggleFavorite, // Call the function to toggle favorite
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Webtoon Thumbnail
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                  imageUrl:   widget.webtoon.thumbnail,
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Title
              Text(widget.webtoon.title, style: TextStyles.heading1),
              const SizedBox(height: 10),
              // Genres
              Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: widget.webtoon.genres.map((genre) {
                  return Chip(
                    label: Text(genre),
                    backgroundColor: AppColors.accent.withOpacity(0.2),
                    labelStyle: TextStyles.body2.copyWith(color: AppColors.accent),
                  );
                }).toList(),
              ),
              const SizedBox(height: 10),
              // Total Chapters
              Text('Total Chapters: ${widget.webtoon.totalChapters}', style: TextStyles.body1),
              const SizedBox(height: 20),
              // Summary
              Text('Summary', style: TextStyles.heading3),
              const SizedBox(height: 8),
              Text(widget.webtoon.summary, style: TextStyles.body1),
            ],
          ),
        ),
      ),
    );
  }
}
