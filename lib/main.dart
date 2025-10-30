// --------------------------------------------
// Hangman Game (Flutter Version)
// Author: Het Patel
// Date: October 2025
// --------------------------------------------
// This Hangman game is fully written by me.
// Basic logic inspired by classic Hangman rules.
// --------------------------------------------

import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const HangmanApp());
}

// Main App Widget
class HangmanApp extends StatelessWidget {
  const HangmanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hangman Game',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HangmanHome(),
    );
  }
}

// Home screen for the Hangman game
class HangmanHome extends StatefulWidget {
  const HangmanHome({super.key});

  @override
  State<HangmanHome> createState() => _HangmanHomeState();
}

class _HangmanHomeState extends State<HangmanHome> {
  // List of words to guess
  final List<String> wordList = [
    "happy", "reflect", "flutter", "computer", "science",
    "college", "school", "mobile", "project"
  ];

  late String currentWord;           // Word for current game
  List<String> currentWordDisplay = []; // _ or revealed letters
  List<String> guessedLetters = [];  // All letters guessed so far
  int wrongCount = 0;                // Wrong guesses
  final int maxWrong = 6;            // Maximum wrong guesses allowed
  bool gameOver = false;
  String resultMessage = "";         // Win/Loss message

  @override
  void initState() {
    super.initState();
    startNewGame();  // Start first game automatically
  }

  // Function to start a new game
  void startNewGame() {
    setState(() {
      final random = Random();
      currentWord = wordList[random.nextInt(wordList.length)].toUpperCase();
      currentWordDisplay = List.filled(currentWord.length, "_");
      guessedLetters.clear();
      wrongCount = 0;
      gameOver = false;
      resultMessage = "";
    });
  }

  // Function to handle a guessed letter
  void guessLetter(String letter) {
    // Ignore if game is over or letter already guessed
    if (gameOver || guessedLetters.contains(letter)) return;

    setState(() {
      guessedLetters.add(letter);

      if (currentWord.contains(letter)) {
        // Correct guess: reveal all positions of the letter
        for (int i = 0; i < currentWord.length; i++) {
          if (currentWord[i] == letter) currentWordDisplay[i] = letter;
        }
      } else {
        // Wrong guess counts once
        wrongCount++;
      }

      // Check for win
      if (!currentWordDisplay.contains("_")) {
        gameOver = true;
        resultMessage = "🎉 You WON!";
      }
      // Check for loss
      else if (wrongCount >= maxWrong) {
        gameOver = true;
        resultMessage = "😢 You LOST! The word was $currentWord";
      }
    });
  }

  // Build letter buttons (keyboard)
  Widget buildKeyboard() {
    const letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Wrap(
      alignment: WrapAlignment.center,
      children: letters.split("").map((letter) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: ElevatedButton(
            onPressed: guessedLetters.contains(letter) || gameOver
                ? null
                : () => guessLetter(letter),
            child: Text(letter),
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hangman Game")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the current state of the word
            Text(
              "Word: ${currentWordDisplay.join(" ")}",
              style: const TextStyle(fontSize: 28, letterSpacing: 2),
            ),
            const SizedBox(height: 20),

            // Show guessed letters
            Text(
              "Guessed letters: ${guessedLetters.join(", ")}",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),

            // Show wrong guesses count
            Text(
              "Wrong guesses: $wrongCount / $maxWrong",
              style: const TextStyle(fontSize: 18, color: Colors.redAccent),
            ),
            const SizedBox(height: 20),

            // Display win/loss message and "Play Again" button
            if (gameOver)
              Column(
                children: [
                  Text(
                    resultMessage,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: startNewGame,
                    child: const Text("Play Again"),
                  ),
                ],
              ),

            // Show keyboard only if game is not over
            if (!gameOver) buildKeyboard(),
          ],
        ),
      ),
    );
  }
}
