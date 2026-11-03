import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/models/user_settings.dart';

void main() {
  test('default UserSettings has empty and false values', () {
    const UserSettings settings = UserSettings();
    expect(settings.name, isEmpty);
    expect(settings.address, isEmpty);
    expect(settings.email, isEmpty);
    expect(settings.receiveNewsletter, isFalse);
  });

  test('UserSettings stores values passed into the constructor', () {
    const UserSettings settings = UserSettings(
      name: 'John Dart',
      address: '123 Placename Road',
      email: 'johndart42@gmail.com',
      receiveNewsletter: true,
    );

    expect(settings.name, 'John Dart');
    expect(settings.address, '123 Placename Road');
    expect(settings.email, 'johndart42@gmail.com');
    expect(settings.receiveNewsletter, isTrue);
  });
}