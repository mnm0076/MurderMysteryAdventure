# Murder at Greenwich Estate

A spooky, interactive SwiftUI text-based adventure game where **you** solve a murder... or die trying.

## Overview

Mr. Greenwich has been murdered. Thunder shakes the estate. You're the only one who can solve the mystery — or cover your tracks...

This branching narrative game puts you in charge of the story:  
- Investigate the crime scene  
- Question suspicious guests  
- Or run... (only available on your first launch)

Every choice has consequences — some lead to justice, some lead to death.

## Features

- **Multiple Endings**: Good, bad, and really unfortunate.
- **Sound FX**: Thunder, screams, and more for immersion (using AVFoundation)
- **Dynamic Story**: Choices appear/disappear depending on game state (ex: “Run for it” only shows on first launch).
- **Model-View-Controller Architecture**: Organized, clean, and grade-worthy.

## Tech Stack

- **SwiftUI** – for the UI
- **AVFoundation** – for sound effects
- **MVC Pattern** – separates data (Model), game logic (Controller), and interface (View)

## How It Works

- The game is powered by a tree of `AdventureChoice` structs.
- Each choice has its own title, description, optional next steps, and can lead to one of several endings.
- Audio effects are triggered at specific game points (ex: thunder at start, screams at death).
- Game state is managed by `AdventureController`.

## Getting Started

1. Clone the repo:
   ```bash
   git clone https://github.com/mnm0076/MurderMysteryAdventure.git
