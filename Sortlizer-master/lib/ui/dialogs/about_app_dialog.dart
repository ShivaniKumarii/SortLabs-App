import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sorting_visualizer/ui/ui_theme.dart';
import 'package:sorting_visualizer/utils/app_info.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutAppDialog extends StatelessWidget {
  final DialogRequest dialogRequest;
  final Function(DialogResponse) onDialogTap;

  const AboutAppDialog(
      {Key? key, required this.dialogRequest, required this.onDialogTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          // borderRadius: new BorderRadius.all(new Radius.circular(0.0)),
          gradient: darkGradient,
        ),
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(dialogRequest.title!,
                    style: theme.textTheme.titleMedium
                        ?.copyWith(color: Colors.white)),
                Spacer(),
                Container(
                  width: 25,
                  height: 25,
                  child: FloatingActionButton(
                    onPressed: () =>
                        onDialogTap(DialogResponse(confirmed: true)),
                    mini: true,
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.green,
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            RichText(
                text: TextSpan(
                    text: "Hi, This is  ",
                    style: theme.textTheme.titleSmall
                        ?.copyWith(color: Colors.white70),
                    children: [
                  TextSpan(
                    text: "$developerName 👋",
                    style: theme.textTheme.titleSmall
                        ?.copyWith(color: Colors.green),
                  )
                ])),
            SizedBox(height: 20),
            Text(dialogRequest.description!,
                style:
                    theme.textTheme.titleSmall?.copyWith(color: Colors.white70)),
            SizedBox(height: 0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () async {
                    await canLaunchUrl(Uri.parse(readMeLink))
                        ? await launchUrl(Uri.parse(readMeLink), mode: LaunchMode.externalApplication)
                        : SnackbarService()
                            .showSnackbar(message: "Error");
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text("Connect :",
                style:
                    theme.textTheme.titleSmall?.copyWith(color: Colors.white70)),
            SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                SocialHandleWidget(
                  widget: Container(
                    width: 20,
                    height: 20,
                    child: Center(
                        child: Text('in',
                            style: theme.textTheme.titleSmall
                                ?.copyWith(color: Colors.white))),
                    decoration: BoxDecoration(
                        color: Color(0xff0A66C2),
                        borderRadius: BorderRadius.all(Radius.circular(2))),
                  ),
                  handleName: "LinkedIn",
                  handleUrl: linkedInProfileUrl,
                ),
                SocialHandleWidget(
                  widget: Container(
                    width: 25,
                    height: 25,
                    child: SvgPicture.asset("assets/images/ic_github.svg"),
                  ),
                  handleName: "GitHub",
                  handleUrl: githubProfileUrl,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SocialHandleWidget extends StatelessWidget {
  final Widget widget;
  final String handleName;
  final String handleUrl;

  SocialHandleWidget(
      {Key? key,
      required this.widget,
      required this.handleName,
      required this.handleUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await canLaunchUrl(Uri.parse(handleUrl))
            ? await launchUrl(Uri.parse(handleUrl), mode: LaunchMode.externalApplication)
            : SnackbarService().showSnackbar(message: "Could not load Url");
      },
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        widget,
        SizedBox(width: 5),
        Text(handleName,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Colors.white, letterSpacing: 0.5))
      ]),
    );
  }
}
