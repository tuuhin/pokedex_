# 😽Pokedex App

A fully cross-platform app made with flutter

<div align="center">
  <img width="32%" src="screenshots\Screenshot_1669646822.png" />
  <img width="32%" src="screenshots\Screenshot_1669646830.png" />
  <img width="32%" src="screenshots\Screenshot_1669646838.png" />
</div>

For more 📸 screnshots head to `screenshot` folder.

## 📰 Description

The name is self sufficient to describe the project. This is a `cross-platform` pokedex app. A user can look for pokemon data such as the  `pokemon` itself,`moves`,`ability`,`item`,`location`,`types-charts`.
> Souce of data: [pokeapi.co](https://pokeapi.co/api/v2/).

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
    These are the features which includes `pokedex`, `ability`,`moves`,`item`,`type-charts` and `location` , all those features follows the simple api call and shows the data collected over [pokeapi.co](https://pokeapi.co/api/v2/) as cards, as the work is simply that ,Its worth mentioning them as a whole.

### 🏁Todos

Most of the app is complete but there is some features left out,thus creating a todo to be done latter

- [ ] 🎛️ **Responsive**
    As the app is targetting all the platforms, its should be responsive to all the types of screen sizes.

- [ ] ♻️ **Other features**
    [pokeapi.co](https://pokeapi.co/api/v2/) comes with a lot of api endpoints thus other features can be too added to the app.

- [ ] 🧹 **Cleaner UI**
    The UI of the other features other than that of `pokedex` can be made more cleaner

- [ ] 🦀 **Proper Error Messages**
    Currently if a error occurs the user is unable to know the reason of the error,there should be a proper propagation of the error.

- [ ] 👓 **Search Features**
    A user is able to search for a `pokemon` to be specific and the user will be driven to details page if the name is a valid pokemon name.
- [ ] 💗 **Favourite**
    A pokemon can be favourite by the user,Thus there will be case where the user can view `his/her` favouite pokemons

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

🤔 This will take some time, go fetch some water for the movement.

You are all **done** here, you can now run the project.

- **Run** the app

## 🔚 Conclusion

The project is quite complete. And can be extended in any way possible.
