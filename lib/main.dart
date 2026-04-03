import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// ---------------- APP ROOT ----------------
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi Screen Navigation',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

// ---------------- HOME SCREEN ----------------
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String returnedData = "No data received yet";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Navigate to Details Screen
            ElevatedButton(
              child: Text("Go to Details Screen"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetailsScreen(message: "Hello from Home Screen!"),
                  ),
                );
              },
            ),

            SizedBox(height: 20),

            // Navigate to Profile Screen and receive data
            ElevatedButton(
              child: Text("Go to Profile Screen"),
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );

                setState(() {
                  returnedData = result ?? "No data returned";
                });
              },
            ),

            SizedBox(height: 30),

            Text(
              "Returned Data:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            Text(
              returnedData,
              style: TextStyle(fontSize: 16, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------- DETAILS SCREEN ----------------
class DetailsScreen extends StatelessWidget {
  final String message;

  DetailsScreen({required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details Screen")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Message from Home:", style: TextStyle(fontSize: 18)),

            SizedBox(height: 10),

            Text(message, style: TextStyle(fontSize: 16, color: Colors.green)),

            SizedBox(height: 30),

            ElevatedButton(
              child: Text("Go Back"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------- PROFILE SCREEN ----------------
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile Screen")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("This is Profile Screen", style: TextStyle(fontSize: 18)),

            SizedBox(height: 30),

            ElevatedButton(
              child: Text("Return Data to Home"),
              onPressed: () {
                Navigator.pop(context, "User Updated Successfully!");
              },
            ),

            SizedBox(height: 20),

            ElevatedButton(
              child: Text("Go Back"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
