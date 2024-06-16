import 'package:flutter/material.dart';
import 'package:sample_project/screens/homePage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _mobileNumberController = TextEditingController();
  final _countryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50, bottom: 20),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            AssetImage('assets/images/profilepic.jpg'),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Edit Profile',
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyLarge!.color,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 12),
                      TextButton.icon(
                        onPressed: () {
                          
                        },
                        icon: Icon(
                          Icons.edit, 
                          color: Theme.of(context).textTheme.bodyLarge!.color,
                        ),
                        label: Text(
                          'Edit Profile Photo',
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyLarge!.color,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      labelStyle: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.primary,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 16.0,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:Theme.of(context).colorScheme.secondary, width: 1.0),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Theme.of(context).colorScheme.onPrimary, width: 2.0),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12), 
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0), 
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.primary,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 12.0, 
                        horizontal: 16.0,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:Theme.of(context).colorScheme.secondary, width: 1.0),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Theme.of(context).colorScheme.onPrimary, width: 2.0),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    obscureText: true,
                  ),
                ),
                SizedBox(height: 12), 
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0), 
                  child: TextField(
                    controller: _mobileNumberController,
                    decoration: InputDecoration(
                      labelText: 'Mobile Number',
                      labelStyle: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.primary,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 16.0,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:Theme.of(context).colorScheme.secondary, width: 1.0),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.onPrimary, width: 2.0),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    obscureText: true,
                  ),
                ),
                SizedBox(height: 12), 
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0), 
                  child: TextField(
                    controller: _countryController,
                    decoration: InputDecoration(
                      labelText: 'Country',
                      labelStyle: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.primary,
                      contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0,),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:Theme.of(context).colorScheme.secondary, width: 1.0),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.onPrimary, width: 2.0),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    obscureText: true,
                  ),
                ),
                SizedBox(height: 12), 
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0), 
                  child: TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.primary,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 12.0, 
                        horizontal: 16.0,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:Theme.of(context).colorScheme.secondary, width: 1.0),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Theme.of(context).colorScheme.onPrimary, width: 2.0),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    obscureText: true,
                  ),
                ),
                SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    foregroundColor: Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Text('Save Profile'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

