import 'package:flutter_unipark_client/bloc/base.dart';
import 'package:flutter_unipark_client/model/item_model.dart';
import 'package:rxdart/rxdart.dart';


class MovieListBloc extends BaseBloc<ItemModel> {

  Observable<ItemModel> get movieList => fetcher.stream;

  fetchMovieList(String type) async {
    ItemModel itemModel = await repository.fetchMovieList(type);
    fetcher.sink.add(itemModel);
  }
}

final movieListBloc = MovieListBloc();