import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:smar_notes/Utils/app_colors.dart';
import 'package:smar_notes/Utils/app_constants.dart';
import 'package:smar_notes/Utils/app_text.dart';
import 'package:smar_notes/Views/Profile%20VIew/profile_view.dart';
import 'package:smar_notes/Views/Workbech%20View/workbenck_provider/workbenck_provider.dart';
import 'package:smar_notes/Widgets/custom_app_bar.dart';
import 'package:smar_notes/Widgets/main_body_container.dart';
import 'package:smar_notes/Widgets/main_drawer.dart';
import 'package:smar_notes/Widgets/small_custom_button.dart';

import '../../Widgets/decoration_button.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class WorkbenchView extends StatefulWidget {
  final String title;
  final List<String> details;
  const WorkbenchView({super.key, required this.title, required this.details});

  @override
  State<WorkbenchView> createState() => _WorkbenchViewState();
}

class _WorkbenchViewState extends State<WorkbenchView> {
  late List<TextEditingController> controllers;

  @override
  void initState() {
    super.initState();
    controllers = widget.details
        .map((detail) => TextEditingController(text: detail))
        .toList();
  }

  @override
  void dispose() {
    controllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: CustomAppBar(
        text: 'Workbench',
        onTapMenu: () {
          scaffoldKey.currentState!.openDrawer();
        },
        onTapProfile: () {
          Get.to(() => const ProfileView());
        },
      ),
      drawer: const MainDrawer(),
      body: MainBodyContainer(
          child: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Consumer<WorkbenchProvider>(
            builder: (context, workbenchProvider, child) {
              return Column(
                children: [
                  18.ht,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmallCustomButton(
                        onTap: () {
                          Get.back();
                        },
                        title: 'Back',
                      ),
                      SmallCustomButton(
                        onTap: () {},
                        title: 'Search',
                      ),
                      SmallCustomButton(
                        onTap: () {},
                        title: 'Share',
                      ),
                    ],
                  ),
                  20.ht,
                  EditingContainer(
                    title: widget.title,
                    onTapStopEditing: () {},
                    child: ListView.builder(
                      itemCount: widget.details.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return SmallTextFormField(
                          controllers: controllers[index],
                          color: workbenchProvider.changeColor
                              ? Colors.redAccent
                              : whiteColor,
                          fontWeight: workbenchProvider.isBold
                              ? FontWeight.bold
                              : FontWeight.normal,
                          decoration: workbenchProvider.underlineText
                              ? TextDecoration.underline
                              : TextDecoration.none,
                        );
                      },
                    ),
                  ),
                  10.ht,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DecorationButton(
                        onTap: () {},
                        icon: Icons.refresh,
                      ),
                      DecorationButton(
                        onTap: () {
                          workbenchProvider.toggleBold();
                        },
                        icon: Icons.format_bold,
                      ),
                      DecorationButton(
                        onTap: () {
                          workbenchProvider.textDecoration();
                        },
                        icon: Icons.format_underline,
                      ),
                      DecorationButton(
                        onTap: () {
                          workbenchProvider.changeColor1();
                        },
                        icon: Icons.brush,
                      ),
                      DecorationButton(
                        onTap: () {},
                        icon: Icons.list,
                      ),
                      DecorationButton(
                        onTap: () {},
                        icon: Icons.more_horiz,
                      ),
                      DecorationButton(
                        onTap: () {},
                        icon: Icons.ac_unit,
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      )),
    );
  }
}

class SmallTextFormField extends StatelessWidget {
  final TextEditingController controllers;
  final Color color;
  final FontWeight fontWeight;
  final TextDecoration decoration;
  const SmallTextFormField({
    super.key,
    required this.controllers,
    required this.color,
    required this.fontWeight,
    required this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 37.h,
      child: TextFormField(
        controller: controllers,
        style: TextStyle(
            color: color, fontWeight: fontWeight, decoration: decoration),
        decoration: const InputDecoration(border: InputBorder.none),
      ),
    );
  }
}

class EditingContainer extends StatelessWidget {
  final String title;
  final void Function() onTapStopEditing;
  final Widget child;
  const EditingContainer({
    super.key,
    required this.title,
    required this.onTapStopEditing,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 660.h,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: whiteColor, width: 3),
          borderRadius: BorderRadius.circular(15.r)),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: whiteColor, width: 3))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: 220,
                        child: Text20(text: title, textAlign: TextAlign.left)),
                    SmallCustomButton(
                      onTap: onTapStopEditing,
                      title: "Stop Editing",
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: child,
            )
          ],
        ),
      ),
    );
  }
}
