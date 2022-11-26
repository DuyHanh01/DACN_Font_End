// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `VHIT Sneaker`
  String get titleAppBar {
    return Intl.message(
      'VHIT Sneaker',
      name: 'titleAppBar',
      desc: '',
      args: [],
    );
  }

  /// `Order`
  String get order {
    return Intl.message(
      'Order',
      name: 'order',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Contacts`
  String get contacts {
    return Intl.message(
      'Contacts',
      name: 'contacts',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logout {
    return Intl.message(
      'Log Out',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get category {
    return Intl.message(
      'Category',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `Suggest for you`
  String get suggest {
    return Intl.message(
      'Suggest for you',
      name: 'suggest',
      desc: '',
      args: [],
    );
  }

  /// `Popular`
  String get popular {
    return Intl.message(
      'Popular',
      name: 'popular',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get favorite {
    return Intl.message(
      'Favorite',
      name: 'favorite',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Your cart`
  String get cart {
    return Intl.message(
      'Your cart',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `items`
  String get items {
    return Intl.message(
      'items',
      name: 'items',
      desc: '',
      args: [],
    );
  }

  /// `Buy Now`
  String get buy {
    return Intl.message(
      'Buy Now',
      name: 'buy',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Screen Mode`
  String get screenMode {
    return Intl.message(
      'Screen Mode',
      name: 'screenMode',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Help Center`
  String get helpCenter {
    return Intl.message(
      'Help Center',
      name: 'helpCenter',
      desc: '',
      args: [],
    );
  }

  /// `My Account`
  String get myAccount {
    return Intl.message(
      'My Account',
      name: 'myAccount',
      desc: '',
      args: [],
    );
  }

  /// `Selling`
  String get selling {
    return Intl.message(
      'Selling',
      name: 'selling',
      desc: '',
      args: [],
    );
  }

  /// `Expensive\n-> Cheap`
  String get expensive {
    return Intl.message(
      'Expensive\n-> Cheap',
      name: 'expensive',
      desc: '',
      args: [],
    );
  }

  /// `Cheap\n-> Expensive`
  String get cheap {
    return Intl.message(
      'Cheap\n-> Expensive',
      name: 'cheap',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get firstName {
    return Intl.message(
      'First Name',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get lastName {
    return Intl.message(
      'Last Name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Edit your profile`
  String get editYourProfile {
    return Intl.message(
      'Edit your profile',
      name: 'editYourProfile',
      desc: '',
      args: [],
    );
  }

  /// `OrderId`
  String get orderId {
    return Intl.message(
      'OrderId',
      name: 'orderId',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `CreateDate`
  String get createDate {
    return Intl.message(
      'CreateDate',
      name: 'createDate',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get status {
    return Intl.message(
      'Status',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get payment {
    return Intl.message(
      'Payment',
      name: 'payment',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Rate`
  String get rate {
    return Intl.message(
      'Rate',
      name: 'rate',
      desc: '',
      args: [],
    );
  }

  /// `Paid`
  String get paid {
    return Intl.message(
      'Paid',
      name: 'paid',
      desc: '',
      args: [],
    );
  }

  /// `unpaid`
  String get unpaid {
    return Intl.message(
      'unpaid',
      name: 'unpaid',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Quantity`
  String get quantity {
    return Intl.message(
      'Quantity',
      name: 'quantity',
      desc: '',
      args: [],
    );
  }

  /// `You don't rate this product now`
  String get toastRate {
    return Intl.message(
      'You don\'t rate this product now',
      name: 'toastRate',
      desc: '',
      args: [],
    );
  }

  /// `Add to bag`
  String get addToBag {
    return Intl.message(
      'Add to bag',
      name: 'addToBag',
      desc: '',
      args: [],
    );
  }

  /// `Select Size`
  String get selectSize {
    return Intl.message(
      'Select Size',
      name: 'selectSize',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Comment`
  String get comment {
    return Intl.message(
      'Comment',
      name: 'comment',
      desc: '',
      args: [],
    );
  }

  /// `Add comment in this product`
  String get addComment {
    return Intl.message(
      'Add comment in this product',
      name: 'addComment',
      desc: '',
      args: [],
    );
  }

  /// `Shoes purchased together`
  String get shoesPurchasedTogether {
    return Intl.message(
      'Shoes purchased together',
      name: 'shoesPurchasedTogether',
      desc: '',
      args: [],
    );
  }

  /// `Check Out`
  String get checkout {
    return Intl.message(
      'Check Out',
      name: 'checkout',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message(
      'Sign In',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get forgotPass {
    return Intl.message(
      'Forgot Password',
      name: 'forgotPass',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Email`
  String get enterYourEmail {
    return Intl.message(
      'Enter Your Email',
      name: 'enterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Password`
  String get enterYourPass {
    return Intl.message(
      'Enter Your Password',
      name: 'enterYourPass',
      desc: '',
      args: [],
    );
  }

  /// `Don’t have an Account`
  String get DontHaveAnAccount {
    return Intl.message(
      'Don’t have an Account',
      name: 'DontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Already have an Account`
  String get AlreadyHaveAnAccount {
    return Intl.message(
      'Already have an Account',
      name: 'AlreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Enter Email`
  String get enterEmail {
    return Intl.message(
      'Enter Email',
      name: 'enterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter Password`
  String get enterPass {
    return Intl.message(
      'Enter Password',
      name: 'enterPass',
      desc: '',
      args: [],
    );
  }

  /// `Enter RePassword`
  String get enterRePass {
    return Intl.message(
      'Enter RePassword',
      name: 'enterRePass',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Enter current password`
  String get enterCurrentPass {
    return Intl.message(
      'Enter current password',
      name: 'enterCurrentPass',
      desc: '',
      args: [],
    );
  }

  /// `Enter new password`
  String get enterNewPass {
    return Intl.message(
      'Enter new password',
      name: 'enterNewPass',
      desc: '',
      args: [],
    );
  }

  /// `Enter your firstname`
  String get enterYourFirstName {
    return Intl.message(
      'Enter your firstname',
      name: 'enterYourFirstName',
      desc: '',
      args: [],
    );
  }

  /// `Enter your lastname`
  String get enterYourLastName {
    return Intl.message(
      'Enter your lastname',
      name: 'enterYourLastName',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone`
  String get enterYourPhone {
    return Intl.message(
      'Enter your phone',
      name: 'enterYourPhone',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Address`
  String get enterYourAddress {
    return Intl.message(
      'Enter your Address',
      name: 'enterYourAddress',
      desc: '',
      args: [],
    );
  }

  /// `Enter a note`
  String get enterANote {
    return Intl.message(
      'Enter a note',
      name: 'enterANote',
      desc: '',
      args: [],
    );
  }

  /// `Contact the shop to order!`
  String get contactTheShop {
    return Intl.message(
      'Contact the shop to order!',
      name: 'contactTheShop',
      desc: '',
      args: [],
    );
  }

  /// `Notify`
  String get notify {
    return Intl.message(
      'Notify',
      name: 'notify',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to sign out`
  String get signOut {
    return Intl.message(
      'Do you want to sign out',
      name: 'signOut',
      desc: '',
      args: [],
    );
  }

  /// `Complete Profile`
  String get completeProfile {
    return Intl.message(
      'Complete Profile',
      name: 'completeProfile',
      desc: '',
      args: [],
    );
  }

  /// `Login Success`
  String get loginSuccess {
    return Intl.message(
      'Login Success',
      name: 'loginSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Enter OTP`
  String get enterOTP {
    return Intl.message(
      'Enter OTP',
      name: 'enterOTP',
      desc: '',
      args: [],
    );
  }

  /// `Request OTP`
  String get requestOTP {
    return Intl.message(
      'Request OTP',
      name: 'requestOTP',
      desc: '',
      args: [],
    );
  }

  /// `time`
  String get time {
    return Intl.message(
      'time',
      name: 'time',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify {
    return Intl.message(
      'Verify',
      name: 'verify',
      desc: '',
      args: [],
    );
  }

  /// `Purchased`
  String get purchased {
    return Intl.message(
      'Purchased',
      name: 'purchased',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPass {
    return Intl.message(
      'New Password',
      name: 'newPass',
      desc: '',
      args: [],
    );
  }

  /// `Please choose size!`
  String get chooseSize {
    return Intl.message(
      'Please choose size!',
      name: 'chooseSize',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to remove the item from the cart?`
  String get removeItem {
    return Intl.message(
      'Do you want to remove the item from the cart?',
      name: 'removeItem',
      desc: '',
      args: [],
    );
  }

  /// `Are You Sure?`
  String get areYouSure {
    return Intl.message(
      'Are You Sure?',
      name: 'areYouSure',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `This product is available in store`
  String get productIsAvailable {
    return Intl.message(
      'This product is available in store',
      name: 'productIsAvailable',
      desc: '',
      args: [],
    );
  }

  /// `This product is not available in store`
  String get productIsNotAvailable {
    return Intl.message(
      'This product is not available in store',
      name: 'productIsNotAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Upload an image`
  String get upLoadAnImage {
    return Intl.message(
      'Upload an image',
      name: 'upLoadAnImage',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vn'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
