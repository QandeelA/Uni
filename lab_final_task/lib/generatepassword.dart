import 'dart:math';
String generatePassword(int WithLetters,int WithUppercase,int WithNumbers,int WithSpecial)
{
  String password = '';
  print('Upercase $WithUppercase');
  print('Lowercase $WithLetters');
  print('SpecialSymbol $WithSpecial');
  print('Numbers $WithNumbers');
  print(Uppercase(WithUppercase));
  print(Lowercase(WithLetters));
  print(specialss(WithSpecial));
  print(numberss(WithNumbers));
  password = Uppercase(WithUppercase) + Lowercase(WithLetters) + specialss(WithSpecial) + numberss(WithNumbers);
  return password;
}

String Uppercase(int withUppercase, {
  bool letter = true,
}) {
   ;
  final length = withUppercase;
  final letterUpperCase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  String chars = "";
  if (letter) chars += '$letterUpperCase';
  return List.generate(length, (index) {
    final indexRandom = Random.secure().nextInt(chars.length);
    return chars [indexRandom];
  }).join('');
}


String Lowercase(int withLowercase,{
  bool letter = true,
}) {
  final length = withLowercase;
  final letterLowerCase = "abcdefghijklmnopqrstuvwxyz";
  String chars = "";
  if (letter) chars += '$letterLowerCase';
  return List.generate(length, (index) {
    final indexRandom = Random.secure().nextInt(chars.length);
    return chars [indexRandom];
  }).join('');
}

String numberss(int withNumber, {bool isNumber = true})
{
  final length = withNumber;
  final number = '0123456789';
  String chars = "";
  if (isNumber) chars += '$number';
  return List.generate(length, (index) {
    final indexRandom = Random.secure().nextInt(chars.length);
    return chars [indexRandom];
  }).join('');
}


String specialss(int withSpecial, {bool isSpecial = true,})
{
  final length = withSpecial;
  final special = '@#%^*>\$@?/[]=+';
  String chars = "";
  if (isSpecial) chars += '$special';
  return List.generate(length, (index) {
    final indexRandom = Random.secure().nextInt(chars.length);
    return chars [indexRandom];
  }).join('');
}