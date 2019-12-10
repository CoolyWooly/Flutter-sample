import 'dart:async';

import 'package:flutter_unipark_client/model/item_model.dart';
import 'package:flutter_unipark_client/model/movie_detail_model.dart';
import 'package:flutter_unipark_client/model/movie_image_model.dart';

import 'api_provider.dart';

class Repository {
  final moviesApiProvider = MovieApiProvider();

  Future<MovieDetailModel> fetchMovieDetail(int movieId) => moviesApiProvider.fetchMovieDetail(movieId);

  Future<MovieImageModel> fetchMovieImages(int movieId) => moviesApiProvider.fetchMovieImages(movieId);

  Future<ItemModel> fetchMovieList(String type) => moviesApiProvider.fetchMovieList(type);

}