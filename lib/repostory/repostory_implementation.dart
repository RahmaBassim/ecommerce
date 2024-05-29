

import 'package:e_commerce/repostory/repostory.dart';

import '../data/remote/remote_datasource.dart';
import '../shared/static/internet_checker.dart';

class RepositoryImplementation extends Repository{
  final RemoteDatasource remoteDatasource;
  final NetworkInfo networkInfo;

  RepositoryImplementation({
    required this.remoteDatasource,
    required this.networkInfo
  });

}