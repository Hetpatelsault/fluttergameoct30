# Hangman Game - Flutter App

## Overview
This is a simple **Hangman game** developed using **Flutter**.  
The game allows users to guess letters of a hidden word. Players can **win** by guessing all letters correctly, or **lose** if they exceed the maximum number of wrong guesses.  

The app includes a **keyboard interface** for selecting letters and displays feedback on the current game status.

## Features
- Randomly selects a word from a predefined list.  
- Displays the word as underscores `_` for unguessed letters.  
- Updates the word display as correct letters are guessed.  
- Keeps track of guessed letters.  
- Counts wrong guesses and limits the number of attempts (6 by default).  
- Shows a **win** or **loss** message when the game ends.  
- Allows starting a new game without restarting the app.  
- Fully interactive keyboard interface for guessing letters.  

## Word List
The game includes the following predefined words:  
happy, reflect, flutter, computer, science, college, school, mobile, project

## How to Play
1. Launch the app.  
2. A word will be displayed as underscores representing each letter.  
3. Click a letter button on the keyboard to guess it.  
4. Correct letters will be revealed in the word.  
5. Wrong guesses are counted. You can make up to **6 wrong guesses**.  
6. The game ends when:  
   - All letters are guessed correctly → **You WON!**  
   - Wrong guesses reach 6 → **You LOST!** (the correct word is shown)  

## Code Structure
- **`main.dart`**: Main entry point of the app.  
- **`HangmanApp` (StatelessWidget)**: Sets up the MaterialApp and theme.  
- **`HangmanHome` (StatefulWidget)**: Main game screen.  
- **`startNewGame()`**: Initializes a new game with a random word.  
- **`guessLetter(String letter)`**: Handles letter guesses and updates game state.  
- **`buildKeyboard()`**: Builds the on-screen alphabet keyboard.  

## Dependencies
- **Flutter SDK**  
- **Dart programming language**  

## Customization
- Add more words to the `wordList` in `_HangmanHomeState` to expand the game.  
- Change `maxWrong` to increase or decrease difficulty.

## resources
-use ai to solve the error in the main dart file 
-also use to design the game in good way
-and also use it for enhance my code to make sure it will look good in the webpage while running
