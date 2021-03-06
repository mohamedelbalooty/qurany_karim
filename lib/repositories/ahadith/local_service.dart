import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:qurany_karim/model/error_result.dart';
import 'package:qurany_karim/model/hadith.dart';
import 'package:qurany_karim/repositories/ahadith/repository.dart';

class AhadithLocalService extends AhadithRepository {
  @override
  Future<Either<List<Hadith>, ErrorResult>> getAhadith(
      {required BuildContext context}) async {
    try {
      var response = await DefaultAssetBundle.of(context)
          .loadString('assets/json_db/hadith.json');
      List<dynamic> jsonData = jsonDecode(response);
      List<Hadith> ahadithList =
          jsonData.map((e) => Hadith.fromJson(e)).toList();
      return Left(ahadithList);
    } catch (exception) {
      ErrorResult error = ErrorResult(
          errorMessage: 'local_exception'.tr(),
          errorImage: 'assets/icons/storage_error.png');
      return Right(error);
    }
  }
}
