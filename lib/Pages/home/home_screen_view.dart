import 'dart:convert';
import 'dart:developer';
import 'package:audio_kumbh/Wigetes/app_bottomnavigation.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:audio_kumbh/Wigetes/app_custumappbar.dart';
import 'package:audio_kumbh/Wigetes/app_text.dart';
import 'package:audio_kumbh/constant/assets_constant.dart';
import 'package:audio_kumbh/constant/string_constant.dart';
import 'package:audio_kumbh/model/home_model.dart';
import 'package:audio_kumbh/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  List<Banners>? banner;
  List<Category>? category;
  int pageIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    var response = await ResponseServices.postRestUrl(
        RestConstant.endpoint, ResponseServices.Bodymap);
    log('response ---------->$response');
    if (response != null) {
      HomepageModel mymodel = HomepageModel.fromJson(jsonDecode(response));
      banner = mymodel.data.banner;
      category = mymodel.data.category;
    }
    setState(() {});
  }

 static List audiobook = [
    AssetsConstant.book9,
    AssetsConstant.book2,
    AssetsConstant.book3,
    AssetsConstant.book4,
    AssetsConstant.book5,
    AssetsConstant.book1
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: CustumAppbar(),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(15.0),
        children: [
          banner != null && banner!.isNotEmpty
              ? carouselIndicator()
              : const Center(
                  child: CircularProgressIndicator(
                  color: Colors.grey,
                  strokeWidth: 1.0,
                )),
          Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.topLeft,
            child: const AppText(
              fontWeight: FontWeight.bold,
              text: StringConstant.categories,
            ),
          ),
          category != null && category!.isNotEmpty
              ? categories()
              : const Center(
                  child: CircularProgressIndicator(
                  color: Colors.grey,
                  strokeWidth: 1.0,
                )),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: AppText(
              fontWeight: FontWeight.bold,
              text: StringConstant.recentlyPlayed,
            ),
          ),
          playedBooks(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: const AppText(
                    fontWeight: FontWeight.bold,
                    text: StringConstant.audioBooks,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        alignment: Alignment.topLeft,
                        child: AppText(
                          text: StringConstant.resentlyAdded,
                          fontSize: 15.sp,
                          color: Colors.brown,
                        )),
                    Container(
                        alignment: Alignment.topLeft,
                        child: AppText(
                          text: StringConstant.viewAll,
                          fontSize: 15.sp,
                          color: Colors.brown,
                        )),
                  ],
                ),
              ],
            ),
          ),
          audioBooks(),
        ],
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }

  static audioBooks() {
    return SizedBox(
      height: 25.h,
      width: 12.w,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: audiobook.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset(
              audiobook[index],
              fit: BoxFit.fill,
            ),
          );
        },
      ),
    );
  }

  categories() {
    return category != null && category!.isNotEmpty
        ? SizedBox(
            height: 95,
            child: ListView.builder(
              itemCount: category!.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: NetworkImage(category![index].img),
                        fit: BoxFit.fill,
                      )),
                  height: 100,
                  alignment: Alignment.topLeft,
                  width: 120,
                  margin: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        AppText(
                          text: category![index].name,
                          fontSize: 15,
                          color: Colors.white,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          height: 1.5,
                          color: Colors.white,
                          width: 28,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                              text:
                                  "${category![index].total.toString()} AudioBooks",
                              color: Colors.white,
                              fontSize: 11,
                            ),
                            Container(
                              height: 15,
                              width: 15,
                              alignment: Alignment.bottomRight,
                              child: SvgPicture.asset(AssetsConstant.next),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        : const SizedBox(
            height: 100,
          );
  }

  playedBooks() {
    return SizedBox(
      height: 20.h,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: audiobook.length,
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.all(5),
            width: 50.w,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              children: [
                Expanded(
                  child: Baseline(
                    baseline: 105,
                    baselineType: TextBaseline.ideographic,
                    child: Container(
                      margin: const EdgeInsets.only(left: 15),
                      child: Image.asset(
                        audiobook[index],
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.topRight,
                          child: Image.asset(AssetsConstant.union),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: AppText(
                            text: StringConstant.colorBook,
                            fontSize: 15.sp,
                            fontFamily: 'f2',
                          ),
                        ),
                        AppText(text: StringConstant.kenAms, fontSize: 15.sp),
                        AppText(text: StringConstant.chapter, fontSize: 15.sp),
                        AppText(text: StringConstant.history, fontSize: 15.sp),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                  thumbColor: Colors.transparent,
                                  trackHeight: 2,
                                  overlayShape: const RoundSliderOverlayShape(
                                      overlayRadius: 0.0),
                                  thumbShape: const RoundSliderThumbShape(
                                      enabledThumbRadius: 0),
                                ),
                                child: Slider(
                                  activeColor: Colors.brown,
                                  value: 6,
                                  max: 10,
                                  onChanged: (value) {},
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.pause_circle,
                              color: Colors.brown,
                              size: 18,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  carouselIndicator() {
    return Column(
      children: [
        banner != null && banner!.isNotEmpty
            ? Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                width: double.infinity,
                height: 130,
                child: PageView.builder(
                  itemCount: banner!.length,
                  itemBuilder: (context, index) {
                    return Image(
                      image: NetworkImage(banner![index].img),
                      fit: BoxFit.fill,
                    );
                  },
                  onPageChanged: (index) {
                    setState(() {
                      pageIndex = index;
                    });
                  },
                ),
              )
            : const SizedBox(),
        const SizedBox(
          height: 5,
        ),
        DotsIndicator(
          decorator: DotsDecorator(
              color: Colors.grey, activeColor: Colors.brown.shade700),
          dotsCount: banner!.length,
          position: pageIndex,
        ),
      ],
    );
  }
}
