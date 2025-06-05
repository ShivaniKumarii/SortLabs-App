import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sorting_visualizer/ui/ui_theme.dart';
import 'package:sorting_visualizer/ui/views/home_viewmodel.dart';
import 'package:sorting_visualizer/ui/widgets/custom_round_btn.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Container(
        decoration: BoxDecoration(gradient: darkGradient),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Sorting',
                                  style: theme.textTheme.headlineSmall?.copyWith(
                                      color: Colors.green.shade300, letterSpacing: 1)),
                              SizedBox(
                                height: 50,
                                width: 80,
                                child: Lottie.asset("assets/animation_lnbvolmp.json"),
                              ),
                            ],
                          ),

                          Text('Visualizer',
                              style: theme.textTheme.headlineMedium?.copyWith(
                                  color: Colors.white, letterSpacing: 1)),
                        ],
                      ),
                      ExpandableButtons(
                        onAboutBtnTap: model.showAboutApp,
                        onShareBtnTap: model.onShareBtnTap,
                        onReviewBtnTap: model.onReviewBtnTap,
                      ),
                    ],
                  ),
                  // Spacer(),
                  Transform(
                      transform: Matrix4.translationValues(0, -20, 0),
                      child: GetProgrammingQuote()),
                  SizedBox(height: 30),
                  Center(
                    child: CustomRoundButton(
                      onTap: model.moveToVisualizerView,
                      icon: Icon(
                        Icons.play_arrow_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                      btnSize: 70,
                      btnColor:  Color(0xFF56B870),
                      isPressed: true,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Tap to Get Started',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleSmall
                        ?.copyWith(color: Colors.white70),
                  ),
                  Spacer(),
                  Text(
                    "Visualize Algorithms to Reality",
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleSmall
                        ?.copyWith(color: lightGrayColor, letterSpacing: 0.5),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        color: Color(0xFF56B870),
                        borderRadius: BorderRadius.circular(20.0)),
                    child: AnimatedTextKit(
                      animatedTexts: [ TyperAnimatedText(
                        model.getAlgorithmsList(),
                        textStyle: theme.textTheme.titleMedium?.copyWith(color: Colors.white, letterSpacing: 1), // Updated TextTheme
                        speed: Duration(milliseconds: 50),
                      ),
              ],
                    ),
                  ),
                  // SizedBox(height: 20),
                  // Text(model.getAppVersion(), style: theme.textTheme.labelSmall?.copyWith(color: lightGrayColor)),
                  // SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}

class ExpandableButtons extends StatefulWidget {
  final Function onAboutBtnTap;
  final Function onShareBtnTap;
  final Function onReviewBtnTap;

  const ExpandableButtons(
      {Key? key,
      required this.onAboutBtnTap,
      required this.onShareBtnTap,
      required this.onReviewBtnTap})
      : super(key: key);

  @override
  _ExpandableButtonsState createState() => _ExpandableButtonsState();
}

class _ExpandableButtonsState extends State<ExpandableButtons>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;
  late AnimationController _animationController;
  late Animation<double> _animationIcon;
  late Animation<double> _translateBtn;
  double _fabHeight = 55.0;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          });
    _animationIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _translateBtn = Tween<double>(begin: 0, end: _fabHeight).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.0, 0.75, curve: Curves.easeOut)));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void animate() {
    isOpened ? _animationController.reverse() : _animationController.forward();
    isOpened = !isOpened;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blueGrey,
      height: 220,
      child: Stack(
        clipBehavior: Clip.none,
        // mainAxisSize: MainAxisSize.min,
        children: [
          Transform(
            transform:
            Matrix4.translationValues(0.0, _translateBtn.value * 2.0, 0.0),
            child: ActionButton(
              color: Color(0xff0CAA7F),
              toolTipText: 'Share',
              iconData: Icons.share,
              btnElevation: isOpened ? 5 : 0,
              onTap: () {
                widget.onShareBtnTap();
                animate();
              },
            ),
          ),
          Transform(
            transform:
                Matrix4.translationValues(0.0, _translateBtn.value * 1.0, 0.0),
            child: ActionButton(
              color: Color(0xFFFF7F00),
              toolTipText: 'About',
              iconData: Icons.info_outline,
              btnElevation: isOpened ? 5 : 0,
              onTap: () {
                widget.onAboutBtnTap();
                animate();
              },
            ),
          ),


          Container(
            width: 55,
            height: 55,
            padding: const EdgeInsets.only(top: 8.0),
            child: FittedBox(
              child: FloatingActionButton(
                onPressed: () {
                  animate();
                },
                heroTag: 'Menu',
                backgroundColor: darkGrayColor,
                child: AnimatedIcon(
                  icon: AnimatedIcons.menu_close,
                  progress: _animationIcon,
                  color: Colors.white,
                ),
                tooltip: 'Menu',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final String? toolTipText;
  final Color? color;
  final IconData? iconData;
  final Function? onTap;
  final double btnSize;
  final double? btnElevation;

  const ActionButton(
      {Key? key,
      this.toolTipText,
      this.color,
      this.iconData,
      this.onTap,
      this.btnSize = 55,
      this.btnElevation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: btnSize,
      height: btnSize,
      padding: const EdgeInsets.only(top: 8.0),
      child: FittedBox(
        child: FloatingActionButton(
          onPressed: () {
            print('Clicked');
            if (onTap != null) onTap!();
          },
          heroTag: toolTipText,
          elevation: btnElevation ?? 5,
          backgroundColor: color,
          child: Icon(
            iconData,
            size: 25,
            color: Colors.white,
          ),
          tooltip: toolTipText,
        ),
      ),
    );
  }
}

class GetProgrammingQuote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 800,
        height: 200,
        child: Lottie.asset("assets/animation_lnboijf5.json"),
      ),
    );
  }
}
