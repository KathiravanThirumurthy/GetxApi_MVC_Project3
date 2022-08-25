import 'package:apiproject3/ApiService/Randomapi.dart';
import 'package:apiproject3/Model/Datamodel.dart';
import 'package:apiproject3/others/enums/loading_state.dart';
import 'package:apiproject3/others/enums/loading_types.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCtroller extends GetxController {
  Randomapi getApiData = Randomapi();

  var result = <Result>[].obs;
  ScrollController scrollController = ScrollController();
  /* final Rx<LoadingState> loadingState =
      LoadingState(loadingType: LoadingType.loading).obs;*/
  int _pageNo = 1;
  final isLoading = true.obs;
  // final _provider=Get.find<HomeProvider>();
  final loadingState = LoadingState(loadingType: LoadingType.stable).obs;
  Info inf = Info();

  void onInit() {
    getData();
    // scrollController.addListener(_scrollListener);
    super.onInit();
  }

  Future getData() async {
    try {
      var response = await getApiData.getUser();

      if (response != null) {
        result.value = response.results!;
        inf = response.info!;
        print((response.info!).runtimeType);
        print(response.info!.seed);
        print(result.value[0].email);
        print(inf.results);

        //result.addAll(response);
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  void _scrollListener() async {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      loadingState.value = LoadingState(loadingType: LoadingType.loading);
      try {
        await Future.delayed(Duration(seconds: 5));
        //final listOfData = await _provider.getData(++_pageNo);
        final listOfData = await result;
        //listOfData.clear();
        if (listOfData.isEmpty) {
          loadingState.value = LoadingState(
              loadingType: LoadingType.completed,
              completed: "there is no data");
        } else {
          result.addAll(listOfData);
          loadingState.value = LoadingState(loadingType: LoadingType.loaded);
        }
      } catch (err) {
        loadingState.value =
            LoadingState(loadingType: LoadingType.error, error: err.toString());
      }
    }
  }
}
