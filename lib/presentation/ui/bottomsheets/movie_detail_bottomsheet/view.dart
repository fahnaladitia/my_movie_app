import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_app/di.dart';
import 'package:my_movie_app/domain/models/models.dart';
import 'package:my_movie_app/presentation/components/components.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'bloc/movie_video_bloc.dart';

Future<void> showMovieDetailBottomsheet(BuildContext context, {required Movie movie}) async {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    constraints: BoxConstraints(
      maxHeight: MediaQuery.of(context).size.height * 0.92,
      minWidth: MediaQuery.of(context).size.width,
    ),
    builder: (_) => _MovieDetailBottomsheet(movie: movie),
  );
}

class _MovieDetailBottomsheet extends StatefulWidget {
  final Movie movie;
  const _MovieDetailBottomsheet({required this.movie});

  @override
  State<_MovieDetailBottomsheet> createState() => __MovieDetailBottomsheetState();
}

class __MovieDetailBottomsheetState extends State<_MovieDetailBottomsheet> {
  late final MovieVideoBloc _movieVideoBloc;

  @override
  void initState() {
    super.initState();
    _movieVideoBloc = getIt<MovieVideoBloc>();
    _movieVideoBloc.add(MovieVideoEventFetch(widget.movie.id));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: BlocBuilder<MovieVideoBloc, MovieVideoState>(
                bloc: _movieVideoBloc,
                builder: (context, state) {
                  if (state is MovieVideoLoading) {
                    return SizedBox(
                      width: double.infinity,
                      child: BasicShimmer.aspectRatio(aspectRatio: 16 / 9),
                    );
                  }

                  if (state is MovieVideoLoaded) {
                    return YoutubePlayer(
                      controller: state.controller,
                      showVideoProgressIndicator: true,
                      bottomActions: [
                        CurrentPosition(),
                        ProgressBar(isExpanded: true),
                        RemainingDuration(),
                      ],
                    );
                  }

                  if (state is MovieVideoError) {
                    return Center(
                      child: Text(state.message),
                    );
                  }
                  if (state is MovieVideoEmpty) {
                    return AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Container(
                        width: double.infinity,
                        color: Colors.grey,
                        child: Center(
                          child: Text(
                            'No video found',
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                ),
                          ),
                        ),
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.movie.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  widget.movie.description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
