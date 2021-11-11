import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/components/layout.dart';
import '../../../shared/theme/app_colors.dart';
import '../../../shared/theme/app_typography.dart';
import 'controller/select_section_controller.dart';

class SelectSectionPage extends GetView<SectionFilterController> {
  @override
  Widget build(BuildContext context) {
    return Layout(
      body: controller.obx(
        (state) {
          return ListView.builder(
            itemCount: state.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(
                      "/professionfilter",
                      parameters: {"id": state[index].id},
                    );
                  },
                  child: SizedBox(
                      height: 50,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: AppColors.colorLightPrimary,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(state[index].name,
                                style: AppTypography.normalPrimaryWhite)),
                      )),
                ),
              );
            },
          );
        },
      ),
    );
  }
}