import 'package:flutter_unipark_client/bloc/base.dart';
import 'package:flutter_unipark_client/model/movie_detail_model.dart';
import 'package:rxdart/rxdart.dart';

class MovieDetailBloc extends BaseBloc<MovieDetailModel> {
  Observable<MovieDetailModel> get movieDetail => fetcher.stream;

  fetchMovieDetail(int movieId) async {
    MovieDetailModel itemModel = await repository.fetchMovieDetail(movieId);
    fetcher.sink.add(itemModel);
  }
}

final movieDetailBloc = MovieDetailBloc();