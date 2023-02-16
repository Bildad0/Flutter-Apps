# Flutter Apps

A collection of Flutter Apps

## Getting Started

To run different app, comment out from main.dart

## Home:const HomePage(title: 'Personal Expenses App')

Then run

```Bash:
Flutter run
```

```Flutter
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        //add fonts later.
        //fontFamily: 'Quicksand',

        secondaryHeaderColor: const Color.fromARGB(255, 87, 157, 90),
        primarySwatch: Colors.purple,
        backgroundColor: Colors.transparent,
        errorColor: Colors.red,
      ),
      home: const HomePage(title: 'Personal Expenses App'),
      //home: const MyHomePage(title: 'WhatsApp'),
    );
  }
```
