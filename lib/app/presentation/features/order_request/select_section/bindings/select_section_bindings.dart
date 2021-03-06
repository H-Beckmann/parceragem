import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../../../domain/repositories/section_repository.dart';
import '../../../../../infra/core/http/parceragem_client.dart';
import '../../../../../infra/repositories/i_section_repository_impl.dart';
import '../controller/select_section_controller.dart';

class SelectSectionBindings implements Bindings {
  ParceragemClient client = new ParceragemClient();

  @override
  void dependencies() {
    Get.put(Dio());
    Get.put<SectionRepository>(ISectionRepositoryImpl(client));
    Get.put(SelectSectionController(Get.find()));
  }
}
