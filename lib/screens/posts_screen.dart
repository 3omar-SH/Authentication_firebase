import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_app/services/auth_service.dart';


class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: FirebaseAuth.instance.currentUser!.emailVerified == true
        ? verifiedUserView(context)
        : notVerifiedUserView(context),
        ),
    );
  }

  Column verifiedUserView(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Welcome ${FirebaseAuth.instance.currentUser!.displayName} in posts screen"),
        Text('Email: ${FirebaseAuth.instance.currentUser!.email}'),
        Text('is verified: ${FirebaseAuth.instance.currentUser!.emailVerified}'),
        ElevatedButton(
          onPressed: ()  async{
            await AuthService().userLogOut(context: context);
          },
          child: const Text("Log out"),
        ),
      ],
    );
  }

  Column notVerifiedUserView(BuildContext context){
        return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('your email ${FirebaseAuth.instance.currentUser!.email} is not verified please check your email for verification link'),
        ElevatedButton(
          onPressed: ()  async{
            await FirebaseAuth.instance.currentUser!.sendEmailVerification();
          },
          child: const Text("Resend verification link"),
        ),
        ElevatedButton(
          onPressed: ()  async{
            await AuthService().userLogOut(context: context);
          },
          child: const Text("Log out"),
        ),
        ElevatedButton(
          onPressed: ()  async{
            await FirebaseAuth.instance.currentUser!.reload();
            setState((){});
          },
          child: const Text("Reload status"),
        ),
      ],
    );
  }
}