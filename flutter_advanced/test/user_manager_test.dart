import 'package:flutter/cupertino.dart';
import 'package:flutter_advanced/303/generic_learn.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  setUp((){});
  test('User Calculate Test',(){

    final users = [
      GenericUser('vk','11',20),
      GenericUser('vk2','21',10),
      GenericUser('vk3','22',30),
    ];

    final result = UserManagement(AdminUser('vadmin','1',15,1)).calculateMoney(users);

    final response = UserManagement(AdminUser('vadmin','1',15,1)).showNames<String>(users);
    expect(result,75);
  });
}