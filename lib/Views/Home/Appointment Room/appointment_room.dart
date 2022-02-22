import 'dart:io';

import 'package:appointz_client/Services/ColorPicker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Meeting extends StatefulWidget {
  const Meeting({Key? key}) : super(key: key);

  @override
  _MeetingState createState() => _MeetingState();
}

class _MeetingState extends State<Meeting> {
  final serverText = TextEditingController();
  final roomText = TextEditingController(text: 'roomId generic');
  final subjectText = TextEditingController(text: "Online Appointment");
  final nameText = TextEditingController(text: 'Me');
  final emailText = TextEditingController(text: "fake@email.com");
  final iosAppBarRGBAColor =
      TextEditingController(text: "#0080FF80"); //transparent blue
  bool isAudioOnly = false;
  bool isAudioMuted = false;
  bool isVideoMuted = false;

  SharedPreferences? _sharedPreferences;
  String? firstNameSP;
  String? emailSP;
  String? customerIdSP;
  String? _roomId;

  @override
  void initState() {
    super.initState();
    _sharedPref();
    JitsiMeet.addListener(JitsiMeetingListener(
        onConferenceWillJoin: _onConferenceWillJoin,
        onConferenceJoined: _onConferenceJoined,
        onConferenceTerminated: _onConferenceTerminated,
        onError: _onError));
  }

  @override
  void dispose() {
    super.dispose();
    JitsiMeet.removeAllListeners();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios_new_rounded)),
          title: const Text(
            'Appointment Room',
            textScaleFactor: 1.0,
          ),
          backgroundColor: cleanDarkBlueGrey,
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: kIsWeb
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: width * 0.30,
                        child: meetConfig(),
                      ),
                      SizedBox(
                          width: width * 0.60,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                                color: Colors.white54,
                                child: SizedBox(
                                  width: width * 0.60 * 0.70,
                                  height: width * 0.60 * 0.70,
                                  child: JitsiMeetConferencing(
                                    extraJS: const [
                                      // extraJs setup example
                                      '<script>function echo(){console.log("echo!!!")};</script>',
                                      '<script src="https://code.jquery.com/jquery-3.5.1.slim.js" integrity="sha256-DrT5NfxfbHvMHux31Lkhxg42LY6of8TaYyK50jnxRnM=" crossorigin="anonymous"></script>'
                                    ],
                                  ),
                                )),
                          ))
                    ],
                  )
                : meetConfig(),
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 50.0,
          width: double.maxFinite,
          child: ElevatedButton(
            onPressed: () {
              _joinMeeting();
            },
            child: const Text(
              "Join Meeting",
              textScaleFactor: 1,
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateColor.resolveWith((states) => cleanDarkBlueGrey),
            ),
          ),
        ),
      ),
    );
  }

  Widget meetConfig() {
    return ListView(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          'assests/logo.png',
          scale: 2.0,
          color: cleanDarkBlueGrey,
        ),

        const Divider(
          height: 48.0,
          thickness: 2.0,
        ),
        CheckboxListTile(
          title: const Text("Audio Only", textScaleFactor: 1),
          value: isAudioOnly,
          activeColor: cleanDarkBlueGrey,
          onChanged: _onAudioOnlyChanged,
        ),
        const SizedBox(
          height: 14.0,
        ),
        CheckboxListTile(
          title: const Text("Audio Muted", textScaleFactor: 1),
          value: isAudioMuted,
          activeColor: cleanDarkBlueGrey,
          onChanged: _onAudioMutedChanged,
        ),
        const SizedBox(
          height: 14.0,
        ),
        CheckboxListTile(
          title: const Text("Video Muted", textScaleFactor: 1),
          value: isVideoMuted,
          activeColor: cleanDarkBlueGrey,
          onChanged: _onVideoMutedChanged,
        ),
        const Divider(
          height: 48.0,
          thickness: 2.0,
        ),
      ],
    );
  }

  _onAudioOnlyChanged(bool? value) {
    setState(() {
      isAudioOnly = value!;
    });
  }

  _onAudioMutedChanged(bool? value) {
    setState(() {
      isAudioMuted = value!;
    });
  }

  _onVideoMutedChanged(bool? value) {
    setState(() {
      isVideoMuted = value!;
    });
  }

  _joinMeeting() async {
    String? serverUrl = serverText.text.trim().isEmpty ? null : serverText.text;

    // Enable or disable any feature flag here
    // If feature flag are not provided, default values will be used
    // Full list of feature flags (and defaults) available in the README
    Map<FeatureFlagEnum, bool> featureFlags = {
      FeatureFlagEnum.WELCOME_PAGE_ENABLED: false,
      FeatureFlagEnum.LIVE_STREAMING_ENABLED: false,
      FeatureFlagEnum.CLOSE_CAPTIONS_ENABLED: false,
      FeatureFlagEnum.INVITE_ENABLED: false,
      FeatureFlagEnum.ADD_PEOPLE_ENABLED: false,
      FeatureFlagEnum.CALENDAR_ENABLED: false,
      FeatureFlagEnum.IOS_RECORDING_ENABLED: false,
      FeatureFlagEnum.MEETING_PASSWORD_ENABLED: false,
      FeatureFlagEnum.RECORDING_ENABLED: false,
      FeatureFlagEnum.TOOLBOX_ALWAYS_VISIBLE: false,
      FeatureFlagEnum.CALL_INTEGRATION_ENABLED: false,
    };
    if (!kIsWeb) {
      // Here is an example, disabling features for each platform
      if (Platform.isAndroid) {
        // Disable ConnectionService usage on Android to avoid issues (see README)
        featureFlags[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false;
      } else if (Platform.isIOS) {
        // Disable PIP on iOS as it looks weird
        featureFlags[FeatureFlagEnum.PIP_ENABLED] = false;
      }
    }
    // Define meetings options here
    var options = JitsiMeetingOptions(room: "2822_appointzz")
      ..serverURL = serverUrl
      ..subject = subjectText.text
      ..userDisplayName = "firstNameSP"
      ..userEmail = "emailSP"
      ..iosAppBarRGBAColor = iosAppBarRGBAColor.text
      ..audioOnly = isAudioOnly
      ..audioMuted = isAudioMuted
      ..videoMuted = isVideoMuted
      ..featureFlags.addAll(featureFlags)
      ..webOptions = {
        "roomName": "2822_appointzz",
        "width": "100%",
        "height": "100%",
        "enableWelcomePage": false,
        "chromeExtensionBanner": null,
        //Todo:
        "userInfo": {"displayName": "firstNameSP"}
      };

    debugPrint("JitsiMeetingOptions: $options");
    await JitsiMeet.joinMeeting(
      options,
      listener: JitsiMeetingListener(
          onConferenceWillJoin: (message) {
            debugPrint("${options.room} will join with message: $message");
          },
          onConferenceJoined: (message) {
            debugPrint("${options.room} joined with message: $message");
          },
          onConferenceTerminated: (message) {
            debugPrint("${options.room} terminated with message: $message");
          },
          genericListeners: [
            JitsiGenericListener(
                eventName: 'readyToClose',
                callback: (dynamic message) {
                  debugPrint("readyToClose callback");
                }),
          ]),
    );
  }

  void _onConferenceWillJoin(message) {
    debugPrint("_onConferenceWillJoin broadcasted with message: $message");
  }

  void _onConferenceJoined(message) {
    if (kDebugMode) {
      print('closing meeting...');
    }
    Future.delayed(const Duration(minutes: 20), () {
      if (kDebugMode) {
        print('closed');
      }
      JitsiMeet.closeMeeting();
    });
    debugPrint("_onConferenceJoined broadcasted with message: $message");
  }

  void _onConferenceTerminated(message) {
    debugPrint("_onConferenceTerminated broadcasted with message: $message");
  }

  _onError(error) {
    debugPrint("_onError broadcasted: $error");
  }

  Future _sharedPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      debugPrint(_sharedPreferences!.getString("first_name"));
      debugPrint(_sharedPreferences!.getString("email"));
      debugPrint(_sharedPreferences!.getString("costumer_id"));

      firstNameSP = _sharedPreferences!.getString("first_name");
      emailSP = _sharedPreferences!.getString("email");
      customerIdSP = _sharedPreferences!.getString("costumer_id");

      debugPrint('checking type $emailSP ');
      _makeUserEndId();
    });
  }

  _makeUserEndId() {
    _roomId = (customerIdSP.toString() + '_appointzz');
    if (kDebugMode) {
      print('_roomId created! with user end --- $_roomId');
    }
  }
}
// 24776_healthSolutions
// 24776_healthSolutions
