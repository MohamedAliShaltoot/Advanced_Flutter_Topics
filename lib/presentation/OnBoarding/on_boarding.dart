import 'package:advanced_flutter_projects/presentation/resources/assets_manager.dart';
import 'package:advanced_flutter_projects/presentation/resources/color_manager.dart';
import 'package:advanced_flutter_projects/presentation/resources/constants_manager.dart';
import 'package:advanced_flutter_projects/presentation/resources/strings_manager.dart';
import 'package:advanced_flutter_projects/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late final List<SliderObjects> _list = _getListItems();

  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  List<SliderObjects> _getListItems() {
    return [
      SliderObjects(AppStrings.onBoardingSubTitle1,
          AppStrings.onBoardingSubTitle1, ImageAssets.onboardingLogo1),
      SliderObjects(AppStrings.onBoardingSubTitle2,
          AppStrings.onBoardingSubTitle2, ImageAssets.onboardingLogo2),
      SliderObjects(AppStrings.onBoardingSubTitle3,
          AppStrings.onBoardingSubTitle3, ImageAssets.onboardingLogo3),
      SliderObjects(AppStrings.onBoardingSubTitle4,
          AppStrings.onBoardingSubTitle4, ImageAssets.onboardingLogo4),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: AppSize.s0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: _list.length,
        onPageChanged: (value) {
          setState(() {});
          currentIndex = value;
        },
        itemBuilder: (context, index) {
          return OnBoardingPage(_list[index]);
        },
      ),
      bottomSheet: Container(
        color: ColorManager.primary,
        height: AppSize.s100,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    AppStrings.skip,
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  ),
            ),

            //bottom sheet widgets
            getBottomSheetWidgets(),
          ],
        ),
      ),
    );
  }

  Widget getBottomSheetWidgets() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      //left arrow
      Padding(
        padding: const EdgeInsets.all(AppSize.s14),
        child: SizedBox(
          width: AppSize.s20,
          height: AppSize.s20,
          child: GestureDetector(
            onTap: () {
              _pageController.animateToPage(getPreviousIndex(),
                  duration:
                      Duration(milliseconds: AppConstants.sliderAnimationTime),
                  curve: Curves.bounceInOut);
            },
            child: SvgPicture.asset(ImageAssets.leftArrowIc),
          ),
        ),
      ),

      Row(
        children: [
          for (int i = 0; i < _list.length; i++)
            Padding(
              padding: const EdgeInsets.all(AppPadding.p8),
              child: getProperCircle(i),
            ),
        ],
      ),

//right arrow
      Padding(
        padding: const EdgeInsets.all(AppSize.s14),
        child: SizedBox(
          width: AppSize.s20,
          height: AppSize.s20,
          child: GestureDetector(
            onTap: () {
              _pageController.animateToPage(getNextIndex(),
                  duration:
                      Duration(milliseconds: AppConstants.sliderAnimationTime),
                  curve: Curves.bounceInOut);
            },
            child: SvgPicture.asset(ImageAssets.rightArrowIc),
          ),
        ),
      ),
    ]);
  }

  Widget getProperCircle(int index) {
    if (currentIndex == index) {
      return SvgPicture.asset(ImageAssets.hollowCircleIc);
    } else {
      return SvgPicture.asset(ImageAssets.solidCircleIc);
    }
  }

  int getPreviousIndex() {
    int previousIndex = --currentIndex ;
    if (previousIndex == -1) {
      currentIndex = _list.length - 1;
    }
    return currentIndex;
  }

  int getNextIndex() {
    int nextIndex =++ currentIndex ;
    if (nextIndex >= _list.length) {
      currentIndex = 0;
    }
    return currentIndex;
  }
}

class OnBoardingPage extends StatelessWidget {
  final SliderObjects _sliderObject;
  const OnBoardingPage(
    this._sliderObject, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      SizedBox(
        height: AppSize.s40,
      ),
      Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: Text(
          _sliderObject.title,
          style: Theme.of(context).textTheme.headlineLarge,
          textAlign: TextAlign.center,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: Text(
          _sliderObject.subTitle,
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
      ),
      SizedBox(
        height: AppSize.s60,
      ),
      SvgPicture.asset(_sliderObject.image)
    ]);
  }
}

class SliderObjects {
  String title;
  String subTitle;
  String image;

  SliderObjects(this.title, this.subTitle, this.image);
}
