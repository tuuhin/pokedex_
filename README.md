# 😽Pokedex App

A fully cross-platform app made with flutter

## 🤝Credits

A pokedex app was one of the first [project](https://github.com/tuuhin/pokemon_) that I had work on,I previously made it using `python` and `kivy`.It will b a great project if made with flutter ,so taking the advantage of flutter which can ship to literally anything `mobile`,`desktop` or `web`.I have made the simplest yet the complete version of the app

## 🍮 Inspiration

As per the UI design that I have followed found on [dribble.com](https://dribbble.com/shots/6545819-Pokedex-App/attachments/6545819-Pokedex-App?mode=media),most of the parts are implemented the other parts are customized by myself.

## 🧱 Structure

For better understanding of the project the project is divided into specific features,those features includes:

- 🍎 **App**

    The main module of the application,acting as a wrapper for all the featutes

- 🔵 **Core**

    This section contains the resusable that are used over by most of the features like `paginator` ,`resulable-dto` ,`helper classes` and some `resulable widgets`.
- 🏗️ **Features**
    These are the features which includes `pokedex`, `ability`,`moves`,`item`,`type-charts` and `location` , all those features follows the simple api call and shows the data collected over [pokeapi.com](https://pokeapi.co/api/v2/) as cards, as the work is simply that ,Its worth mentioning them as a whole.

### 🚒 Get Stared

To start this project on your local computer,primarily you should have [flutter](https://flutter.dev) installed.

- Clone this repository

    ```bash
        git clone 'https://github.com/tuuhin/pokedex_'
        cd pokedex_
    ```

- Get **dependencies**

    ```bash
        flutter pub get 
    ```

> Getting a lot of erros right 🤔. There is no problem with the code, just that some  files are to be generated. Follow this step to generate those files

- Generate `*.g.dart` and `*.freezed.dart` files

    ```bash
        flutter pub run build_runner build --delete-conflicting-outputs
    ```

You are all **done** here, you can now run the project.
