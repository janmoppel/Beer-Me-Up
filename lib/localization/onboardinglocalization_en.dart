import 'package:beer_me_up/localization/localization.dart';

class LocalizationEN implements Localization {
  @override String get onboardingFirstTitle => "Ever wondered...";
  @override String get onboardingFirstSubText => "\"What was that beer I drank last time that tasted so good?\"";
  @override String get onboardingFirstCTA => "Yeah! Totally!";
  @override String get onboardingSecondTitle => "How does it work?";
  @override String get onboardingSecondFirstExplainFirst => "Create an account";
  @override String get onboardingSecondFirstExplainSecond => ", to save and retreive your beer check-ins at any time";
  @override String get onboardingSecondSecondExplainFirst => "2. Every time you drink a beer, just ";
  @override String get onboardingSecondSecondExplainSecond => "check-in it";
  @override String get onboardingSecondSecondExplainThird => " into the app";
  @override String get onboardingSecondThirdExplainFirst => "3. Get a full ";
  @override String get onboardingSecondThirdExplainSecond => "history";
  @override String get onboardingSecondThirdExplainThird => ", with ";
  @override String get onboardingSecondThirdExplainFourth => "stats";
  @override String get onboardingSecondThirdExplainFifth => ", about your all the beers you drank";
  @override String get onboardingSecondSubText => "And that's it! That easy!";
  @override String get onboardingSecondCTA => "Let's go";

  @override String get loginCreateYourAccount => "Create your account";
  @override String get loginSignUpCTA => "Sign-up";
  @override String get loginPrivacyExplain => "Like privacy? We feel you. We don’t use or sell your data.";
  @override String get loginPrivacyReadCTA => "Touch to read our privacy policy.";
  @override String get loginOr => "OR";
  @override String get loginSignInGoogle => "Sign-in with Google";
  @override String get loginSignInFacebook => "Sign-in with Facebook";
  @override String get loginAlreadyHaveAccountCTA => "Already have an account? Sign-in";
  @override String get loginSignIn => "Sign-in with your account";
  @override String get loginSignInCTA => "Sign-in";
  @override String get loginForgotPasswordCTA => "Forgot password?";
  @override String get loginNoAccountCTA => "Don't have an account yet? Sign-up";

  @override String get forgotPasswordTitle => "Retrieve password";
  @override String get forgotPasswordExplain => "Enter your login email and we'll send you instructions to reset your password";
  @override String get forgotPasswordResetCTA => "Reset password";
  @override String get forgotPasswordNoEmailTitle => "Empty email";
  @override String get forgotPasswordNoEmailExplain => "Please provide an email";
  @override String get forgotPasswordSuccessMessage => "Email with instructions has been send.";
  @override String get forgotPasswordErrorMessage => "An error occurred while sending the email with instructions";

  @override String get consentTitle => "Create your account";
  @override String get consentTOSExplain => "By creating your account, you agree to the Terms of Service and Privacy Policy.";
  @override String get consentAgeExplain => "You also certify to be over legal drinking age (18 or 21 depending on your country), using this app is prohibited for underage people.";
  @override String get consentWarningExplain => "Finally, we remind you that alcohol is dangerous for you and other people: drink responsibly.";
  @override String get consentAcceptCTA => "Create the account";

  @override String get tosTitle => "ToS and Privacy Policy";

  @override String get settingsHaptic => "Haptic feedback (vibration) on touch";
  @override String get settingsAnalytics => "Help enhance experience by sending usage statistics";

  @override String get email => "Email";
  @override String get password => "Password";
  @override String get cancel => "Cancel";
  @override String get settings => "Settings";
  @override String get account => "Account";
  @override String get logout => "Logout";
}