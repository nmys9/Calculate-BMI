import 'dart:io';

void main() {
  Loop:
  for (;;) {
    print('\t----------------BMI body mass index calculator----------------');
    print(
        'If you want to calculate your BMI in kilograms and meters (or centimetres) : choose 1');
    print('If you want to calculate your BMI in Pounds and inches : choose 2');
    var choose = int.parse(stdin.readLineSync()!);
    switch (choose) {
      case 1:
        try {
          print('Enter the width in kg : ');
          var width = double.parse(stdin.readLineSync()!);
          print('Enter your height in metar : ');
          var height = double.parse(stdin.readLineSync()!);
          if (height <= 0.0)
            throw FormatException('Height should be greater than zero !');
          double bmi =
              double.parse(calculate_BMI_1(width, height).toStringAsFixed(2));
          print('Your body mass index (BMI) is ${bmi}');
          print(
              'The interpretation of your body mass index (BMI) is: ${interpret_BMI(bmi)}');
        } catch (e) {
          throw e;
        }
        break;
      case 2:
        try {
          print('Enter the width in Ib : ');
          var width = double.parse(stdin.readLineSync()!);
          print('Enter your height in in : ');
          var height = double.parse(stdin.readLineSync()!);
          double bmi =
              double.parse(calculate_BMI_2(width, height).toStringAsFixed(2));
          print('Your body mass index (BMI) is ${bmi}');
          print(
              'The interpretation of your body mass index (BMI) is: ${interpret_BMI(bmi)}');
        } catch (e) {
          throw e;
        }
        break;
      default:
        throw 'Not an option\nChoose 1 or 2 only';
    }
    continue Loop;
  }
}

calculate_BMI_1(width, height) {
  if (height > 240) {
    print('Height unvalid');
  }
  if (width > 300) {
    print('Width unvalid');
  }
  if (height > 100) {
    return width / ((height / 100) * (height / 100));
  }
  return width / (height * height);
}

calculate_BMI_2(width, height) {
  if (height > 85) {
    print('Height unvalid');
  }
  if (width > 660) {
    print('Width unvalid');
  }
  return (width / (height * height)) * 703;
}

interpret_BMI(bmi) {
  if (bmi >= 0 && bmi < 18.5) {
    return 'calculate_BMI';
  } else if (bmi >= 18.5 && bmi < 25) {
    return 'Healthy Weight';
  } else if (bmi >= 25 && bmi < 30) {
    return 'Overweight';
  } else if (bmi >= 30) {
    return 'Obesity';
  }
}

