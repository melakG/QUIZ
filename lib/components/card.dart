import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import '../constants/user_result_status.dart';
import '../services/api_client.dart';
import '../constants/app_constant.dart';
import '../theme/app_theme.dart';

enum CardType { login, registration, greeting, result }

class CardWithAvatar extends StatelessWidget {
  final String? title;
  final String? navto;
  final String imageUrl;
  final CardType type;
  final String? firstName;
  final String? lastName;
  final double? scoreInPercent;

  const CardWithAvatar(
      {super.key,
      this.title,
      this.navto,
      required this.imageUrl,
      required this.type,
      this.firstName,
      this.lastName,
      this.scoreInPercent = 0.0});
  @override
  Widget build(BuildContext context) {
    return type == CardType.login
        ? Container(
            width: double.infinity,
            height: 350,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.fitHeight,
                alignment: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 20.0, top: 60),
                      child: const Icon(Icons.arrow_back),
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 10.0, top: 60),
                        child: Text(
                          navto!,
                          style: const TextStyle(
                              fontSize: 16,
                              fontFamily: 'Inter',
                              color: Color(0xFF000000)),
                        ))
                  ],
                ),
                Container(
                  width: 250,
                  margin: const EdgeInsets.only(left: 20.0, top: 40),
                  child: Text(
                    title!,
                    style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Inter',
                        color: Color(0xFF000000)),
                  ),
                ),
              ],
            ))
        : type == CardType.registration
            ? Container(
                width: double.infinity,
                height: 300,
                margin: const EdgeInsets.only(bottom: 10, top: 25),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/business-thumbs-up.png"),
                    fit: BoxFit.fitHeight,
                    alignment: Alignment.bottomRight,
                  ),
                ),
                child: Column(children: [
                  Container(
                      margin: const EdgeInsets.only(left: 60.0, top: 25),
                      child: Row(children: const [
                        Image(image: AssetImage('assets/images/phone.png')),
                        Spacer(),
                        Image(
                            image:
                                AssetImage('assets/images/lit_light_bulb.png'))
                      ])),
                  const Spacer(),
                  Row(children: [
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 0, bottom: 20),
                          child: const Image(
                            image: AssetImage('assets/images/target.png'),
                            height: 90,
                            alignment: Alignment.bottomCenter,
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 50, right: 10),
                          child: const Image(
                            image: AssetImage(
                                'assets/images/yellow_lightning.png'),
                            height: 80,
                          ),
                        )
                      ],
                    )
                  ]),
                ]))
            : type == CardType.greeting
                ? Container(
                    width: double.infinity,
                    height: AppTheme.profileCardHeight,
                    margin: AppTheme.profileCardMargin,
                    child: Column(children: [
                      Expanded(
                        child: Container(
                            margin: AppTheme.profileLabelTextMargin,
                            child: Row(children: [
                              const Text(profileLabelText,
                                  style: AppTheme.labelTextStyle),
                              const Spacer(),
                              InkWell(
                                child: const Icon(FeatherIcons.logOut),
                                onTap: () {
                                  ApiClient.userSignOut(context);
                                },
                              )
                            ])),
                      ),
                      Row(children: [
                        Column(
                          children: [
                            Container(
                                width: AppTheme.greetingCardWidth,
                                margin: AppTheme.profileGreetingCardMargin,
                                alignment: Alignment.topLeft,
                                child: Text(
                                  greetingText,
                                  textAlign: TextAlign.left,
                                  style: AppTheme.greetingTextStyle,
                                )),
                            firstName!.length + lastName!.length < 10
                                ? Container(
                                    width: AppTheme.greetingCardWidth,
                                    margin: AppTheme.profileGreetingCardMargin,
                                    child: Text(
                                      textAlign: TextAlign.left,
                                      '${firstName!} ${lastName!}',
                                      style: AppTheme.profileInfoTextStyle,
                                    ))
                                : Column(
                                    children: [
                                      Container(
                                          width: AppTheme.greetingCardWidth,
                                          margin: AppTheme
                                              .profileGreetingCardMargin,
                                          child: Text(
                                            textAlign: TextAlign.left,
                                            firstName!,
                                            style:
                                                AppTheme.profileInfoTextStyle,
                                          )),
                                      Container(
                                          width: AppTheme.greetingCardWidth,
                                          margin: AppTheme
                                              .profileGreetingCardMargin,
                                          child: Text(
                                            textAlign: TextAlign.left,
                                            lastName!,
                                            style:
                                                AppTheme.profileInfoTextStyle,
                                          ))
                                    ],
                                  ),
                          ],
                        ),
                        const Spacer(),
                        Container(
                          margin: AppTheme.profileBannerMargin,
                          alignment: Alignment.center,
                          width: AppTheme.profileBannerWidth,
                          height: AppTheme.profileBannerHeight,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(profileBannerImageUrl),
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        )
                      ]),
                    ]))
                : type == CardType.result
                    ? Container(
                        width: double.infinity,
                        height: 300,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                "assets/images/businessman-in-dark-blue-suit-applauding.png"),
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.bottomRight,
                          ),
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                margin:
                                    const EdgeInsets.only(top: 96, left: 32),
                                child: const Text(
                                  "Result",
                                  style: TextStyle(
                                      color: Color.fromRGBO(32, 52, 39, 1),
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Container(
                                width: 258,
                                height: 75,
                                margin:
                                    const EdgeInsets.only(top: 30, left: 32),
                                child: UserResultStatus(score: scoreInPercent!),
                              )
                            ]),
                      )
                    : Container();
  }
}
