import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

import 'OTPController.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
{
 String dailCodeDigits = "+00";
 final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100,),
            Padding(
              padding: const EdgeInsets.only(left: 28.0, right: 28.0),
              child: Image.asset("images/phone.jpg"),
            ),

            Container(
              margin: const EdgeInsets.only(top:10),
              child: const Center(
                child: Text(
                  "Phone (OTP) Authentication",
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),

                ),
              ),
            ),
            const SizedBox(height: 50,),

            SizedBox(
              width: 400,
              height: 60,
              child: CountryCodePicker(
                onChanged: (country){
                  setState(() {
                    dailCodeDigits =country.dialCode!;
                  });
                },
                initialSelection: "IT",
                showCountryOnly: false,
                showOnlyCountryWhenClosed: false,
                favorite: const ["+1","US","92","Pak"],

              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10 ,right: 10,left: 10),
              child: TextField(
              decoration: InputDecoration(
                hintText: "Phone Number",
                prefix: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Text(dailCodeDigits),
                )
              ),
                maxLength: 12,
                keyboardType: TextInputType.number,
                controller: _controller,
            )
            ),

            Container(
              margin: EdgeInsets.all(15),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (c) => OTPControllerScreen(
                    phone:_controller.text,
                    codeDigits:dailCodeDigits,
                  )));
  
                },
                child: const Text('Next',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              ),
            )
          ],
        ),
      ),
    );
  }
}




