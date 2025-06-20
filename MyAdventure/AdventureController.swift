//
//  AdventureController.swift
//  MyAdventure
//
//  Created by Meghan Murphy on 6/20/25.
//

import Foundation
import AVFoundation

class AdventureController: NSObject, ObservableObject, AVAudioPlayerDelegate {
    @Published var currentChoice: AdventureChoice
    var backgroundPlayer: AVAudioPlayer?
    var sfxPlayer: AVAudioPlayer?

    override init() {
        self.currentChoice = AdventureController.generateRootAdventure()
        super.init()
    }

    func choose(_ choice: AdventureChoice) {
        currentChoice = choice
    }

    func restart() {
        currentChoice = AdventureController.generateRootAdventure()
    }

    static func generateRootAdventure() -> AdventureChoice {
        var initialChoices: [AdventureChoice] = [
            AdventureChoice(
                title: "Investigate the crime scene",
                description: "You decide to investigate the crime scene. What do you do first?",
                nextChoices: [followFootsteps, lookAtBody],
                isEnding: false,
                endingMessage: nil
            ),
            AdventureChoice(
                title: "Question the Guests",
                description: "You decide to question the guests. Who do you speak with?",
                nextChoices: [talkToMaid, talkToButler],
                isEnding: false,
                endingMessage: nil
            )
        ]

        if !hasLaunchedBefore {
            initialChoices.append(
                AdventureChoice(
                    title: "Run for it",
                    description: "You killed Mr. Greenwich?! What the heck dude",
                    nextChoices: [endingPlotTwist],
                    isEnding: false,
                    endingMessage: nil
                )
            )
            hasLaunchedBefore = true
        }

        return AdventureChoice(
            title: "Murder at Greenwich Estate",
            description: "Thunder rumbles through the dark halls. The host, Mr. Greenwich, has been found dead at the dinner table — a candlestick through the ribs. Do you investigate the crime scene or question the guests?",
            nextChoices: initialChoices,
            isEnding: false,
            endingMessage: nil
        )
    }

    func playSFX(named name: String) {
        backgroundPlayer?.pause()

        if let url = Bundle.main.url(forResource: name, withExtension: "wav") {
            do {
                sfxPlayer = try AVAudioPlayer(contentsOf: url)
                sfxPlayer?.delegate = self
                sfxPlayer?.play()
            } catch {
                print("Error playing sound effect: \(error.localizedDescription)")
            }
        } else if let url = Bundle.main.url(forResource: name, withExtension: "mp3") {
            do {
                sfxPlayer = try AVAudioPlayer(contentsOf: url)
                sfxPlayer?.delegate = self
                sfxPlayer?.play()
            } catch {
                print("Error playing sound effect: \(error.localizedDescription)")
            }
        }
    }

    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        backgroundPlayer?.play()
    }
}
