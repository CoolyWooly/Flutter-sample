import 'package:flutter_unipark_client/resources/repository.dart';
import 'package:flutter_unipark_client/model/base_model.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseBloc<T extends BaseModel> {
  final repository = Repository();
  final fetcher = PublishSubject<T>();

  dispose() {
    fetcher.close();
  }
}