class UserManagement<T extends AdminUser>{
  final T admin;

  UserManagement(this.admin);

  void sayName(GenericUser user){
    print(user.name);
  }

  int calculateMoney(List<GenericUser> users){
    int sum = 0;
    for(var item in users){ // for-in for just reading
      sum += item.money;
    }
    //final sumMoney = users.map((e) => e.money)
    //    .fold<int>(0, (previousValue, element) => previousValue + element);

    int initialValue = admin.role == 1 ? admin.money : 0;

    final sumMoney = users.fold<int>
      (initialValue, (previousValue, element) => previousValue+element.money);
    return sumMoney;
  }

  Iterable<VKModel<R>>? showNames<R>(List<GenericUser> users){

    if(R == String){
      final names = users.map((e) => VKModel<R>(e.name.split('').toList().cast<R>())); // we dont need .toList(),thanks to Iterable
      return names;
    }
    return null;
  }
}

class VKModel<T>{
  final String name ='VK';
  final List<T> items;

  VKModel(this.items);
}

class GenericUser{
  final String name;
  final String id;
  final int money;
  GenericUser(this.name, this.id, this.money);
}

class AdminUser extends GenericUser{
  final int role;
  AdminUser(String name, String id, int money,this.role) : super(name, id, money);

}