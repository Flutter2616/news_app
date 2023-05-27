import 'package:news_app/model/shared_pre_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sharepre
{
  Future<void> loginget_data(
      {String? name,
      String? email,
      String? phone,
      String? password,
      bool? firstuser})
  async {
    SharedPreferences share=await SharedPreferences.getInstance();
    share.setString('name', name!);
    share.setString('email', email!);
    share.setString('phone', phone!);
    share.setString('password', password!);
    share.setBool('usertype', firstuser!);
  }


  Future<Sharedmodel> getdata()
  async {
    SharedPreferences share=await SharedPreferences.getInstance();
    String? name=share.getString('name');
    String? email=share.getString('email');
    String? phone=share.getString('phone');
    String? password=share.getString('password');
    bool? user=share.getBool('usertype');

    return Sharedmodel(password: password,email: email,phone: phone,name: name,usertype: user);
  }
}