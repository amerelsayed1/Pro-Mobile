import 'dart:ffi';

import 'package:get/get.dart';

import '../../../../core/state/data_state.dart';
import '../../domain/repositories/experts_repository.dart';

class BookingSlotController extends GetxController implements GetxService {


  final ExpertsRepository expertsRepository;

  BookingSlotController({
    required this.expertsRepository,
  });

  final bookingNewSlotState = DataState<Bool>.initial(
    "Initial state",
  ).obs;


  Future<void> fetchMainHomeData(int? id) async {
    /*try {
      bookingNewSlotState.value = DataState.loading("Loading news");


      final newsData = await categoryRepository.categories();

      newsData.insert(
          0,
          CategoryModel(
            nameEn: "All",
            nameAr: "الكل",
          ));

      categoriesState.value = DataState.completed(newsData);

      final expertsData = await expertsRepository.getExperts(id);
      expertsState.value = DataState.completed(expertsData);
    } catch (e) {
      categoriesState.value = DataState.error("Error loading news: $e");
      expertsState.value = DataState.error("Error loading experts: $e");
    }*/
  }
}
