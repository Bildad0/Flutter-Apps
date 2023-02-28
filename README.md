# Flutter Apps

This is a collection of different flutter apps.
The Apps ranges from:-

1. Recepi app.
2. Music Play UI.
3. Personal Expenses App.
4. WhatsApp clone.

## Getting Started

To run different app, comment out any initial route component to get the respective App from main.dart

## Main.dart file

```Flutter
 '/': (ctx) => const TabsScreen(),
 '/': (ctx) => const MusicPlayUI(),
 '/': (ctx) => const HomePage(title: 'Personal Expenses'),
 '/': (ctx) => const MyHomePage(title: 'WhatsApp'),
```

Then execute:

```Bash:
Flutter run
```

## Thank you!
