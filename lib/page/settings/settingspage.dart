import 'package:meta/meta.dart';

import 'package:flutter/material.dart';

import 'package:beer_me_up/service/authenticationservice.dart';
import 'package:beer_me_up/common/mvi/viewstate.dart';
import 'package:beer_me_up/common/widget/loadingwidget.dart';
import 'package:beer_me_up/common/widget/materialflatbutton.dart';

import 'model.dart';
import 'intent.dart';
import 'state.dart';

const String SETTINGS_PAGE_ROUTE = "/account";

class SettingsPage extends StatefulWidget {
  final SettingsIntent intent;
  final SettingsViewModel model;

  SettingsPage._({
    Key key,
    @required this.intent,
    @required this.model}) : super(key: key);

  factory SettingsPage({Key key,
    SettingsIntent intent,
    SettingsViewModel model,
    AuthenticationService userService}) {

    final _intent = intent ?? SettingsIntent();
    final _model = model ?? SettingsViewModel(
      userService ?? AuthenticationService.instance,
      _intent.logout,
      _intent.toggleHapticFeedback,
      _intent.toggleAnalytics,
    );

    return SettingsPage._(key: key, intent: _intent, model: _model);
  }

  @override
  State<StatefulWidget> createState() => _SettingsPageState(intent: intent, model: model);
}

class _SettingsPageState extends ViewState<SettingsPage, SettingsViewModel, SettingsIntent, SettingsState> {

  _SettingsPageState({
    @required SettingsIntent intent,
    @required SettingsViewModel model
  }) : super(intent, model);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (BuildContext context, AsyncSnapshot<SettingsState> snapshot) {
        if (!snapshot.hasData) {
          return Container();
        }

        return snapshot.data.join(
          (loading) => _buildLoadingScreen(),
          (load) => _buildAccountScreen(load.email, load.hapticFeedbackEnabled, load.analyticsEnabled),
        );
      },
    );
  }

  Widget _buildAccountScreen(String email, bool hapticFeedbackEnabled, bool analyticsEnabled) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: _buildAppBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
        children: <Widget>[
          Center(
            child:  ConstrainedBox(
              constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height / 3),
              child: Image.asset("images/large_logo.png"),
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 30.0)),
          const Text(
            "Settings",
            style: TextStyle(
              fontSize: 18.0,
              fontFamily: "Google Sans",
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          Offstage(
            offstage: Theme.of(context).platform != TargetPlatform.iOS,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Expanded(
                  child: Text(
                    "Haptic feedback (vibration) on touch",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(right: 16.0)),
                Switch(
                  value: hapticFeedbackEnabled,
                  onChanged: intent.toggleHapticFeedback,
                  activeColor: Colors.white,
                  inactiveThumbColor: Theme.of(context).primaryColorDark,
                ),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Expanded(
                child: Text(
                  "Help enhance experience by sending usage statistics",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.only(right: 16.0)),
              Switch(
                value: analyticsEnabled,
                onChanged: intent.toggleAnalytics,
                activeColor: Colors.white,
                inactiveThumbColor: Theme.of(context).primaryColorDark,
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.only(top: 30.0)),
          const Text(
            "Account",
            style: TextStyle(
              fontSize: 18.0,
              fontFamily: "Google Sans",
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 10.0)),
          Text(
            email,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 14.0)),
          Center(
            child: MaterialFlatButton(
              text: "Logout",
              onPressed: intent.logout,
              textColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingScreen() {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: _buildAppBar(),
      body: Center(
        child: LoadingWidget(),
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text(
        "Settings",
        style: TextStyle(
          fontFamily: "Google Sans",
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

}