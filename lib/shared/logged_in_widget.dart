import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:webrtc_signaling_server/screens/blind_vs_volunteer_screen.dart';
import 'package:webrtc_signaling_server/shared/google_sign_in_provider.dart';

class LoggedInWidget extends StatefulWidget {
  const LoggedInWidget({Key? key}) : super(key: key);

  @override
  _LoggedInWidgetState createState() => _LoggedInWidgetState();
}

class _LoggedInWidgetState extends State<LoggedInWidget> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('Logged In',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
        TextButton(
          child: Text(
          'Logout',
          style: TextStyle(
            color: Colors.blue,
          ),
          ),
          onPressed: (){
            final provider = Provider.of<GoogleSignInProvider>(context, listen:false);
            provider.logout();
          },
        ),
        ],

      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.blueGrey.shade900,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome '+user.displayName!,
              style: TextStyle(
                  fontSize: 24,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 32.0,),
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(user.photoURL!),
            ),
            SizedBox(height: 8,),
            Text(
              'Name: '+user.displayName!,
              style: TextStyle(color: Colors.white,fontSize: 16),
            ),
            SizedBox(height: 8,),
            Text(
              'Email: '+user.email!,
              style: TextStyle(color: Colors.white,fontSize: 16),
            ),
            SizedBox(height: 32.0,),
            ElevatedButton.icon(
              icon: Icon(
                FontAwesomeIcons.video,
                color: Colors.red,
              ),
              label: Text(
                'Start VideoCall',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
               primary: Colors.blueGrey.shade700,
               onPrimary: Colors.black,
               minimumSize: Size(
                 double.infinity,
                 50,
            ),),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlindVSVolunteerScreen(),
                  ),
                );
                 },

            ),
              ],

        ),
      ),
    );
  }
}
