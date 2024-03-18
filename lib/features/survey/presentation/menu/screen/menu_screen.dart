import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:synapsissurvey/core/util/component/error_page.dart';
import 'package:synapsissurvey/core/util/component/loading_page.dart';
import 'package:synapsissurvey/features/survey/presentation/menu/component/item_list_survey.dart';
import 'package:synapsissurvey/features/survey/presentation/menu/controller/menu_contorller.dart';

class MenuScreen extends ConsumerStatefulWidget {
  const MenuScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MenuScreenState();
}

class _MenuScreenState extends ConsumerState<MenuScreen> {
  final controllerScroll = ScrollController();
  int index = 1;

  Future<void> addListenerScroll() async {
    final maxScroll = controllerScroll.position.maxScrollExtent;
    final currentScroll = controllerScroll.position.pixels;
    var stat = ref.read(providerMenu).value?.hasNextPage ?? false;
    print(stat);
    print(index);

    if (maxScroll - currentScroll <=
            controllerScroll.position.minScrollExtent &&
        stat) {
      setState(() {
        index += 1;
      });
      await ref
          .read(providerMenu.notifier)
          .getMoreListAssessment(index.toString());
    }
  }

  @override
  void initState() {
    controllerScroll.addListener(addListenerScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getFirst();
    });
    super.initState();
  }

  Future<void> getFirst() async {
    setState(() {
      index = 1;
    });
    await ref.read(providerMenu.notifier).getListAssessment();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: 100.w,
        height: 100.h,
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Gap(kToolbarHeight),
            Text(
              "Halaman Assessment",
              style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            const Gap(24),
            Consumer(builder: (context, ref, _) {
              var result = ref.watch(providerMenu);
              return result.when(loading: () {
                return const Expanded(child: LoadingPage());
              }, data: (data) {
                print(data);
                final resultFix = data.data;
                return Expanded(
                    child: RefreshIndicator(
                        onRefresh: () async {
                          await getFirst();
                        },
                        child: ListView.builder(
                          itemCount: resultFix?.length,
                          controller: controllerScroll,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ItemListSurvey(
                                result: resultFix!.elementAt(index),
                                callback: () {
                                  context.push("/assesment", extra: {
                                    "id": resultFix.elementAt(index).id
                                  });
                                },
                                callbackDownload: () {
                                  ref
                                      .read(providerMenu.notifier)
                                      .getDownloadData(
                                          resultFix.elementAt(index).id!,
                                          resultFix.elementAt(index).name!);
                                });
                          },
                        )));
              }, error: (error, trace) {
                return ErrorPage(message: error.toString());
              });
            }),
          ],
        ),
      )),
    );
  }
}
