//
//  ContentView.swift
//  MyAdventure
//
//  Created by Meghan Murphy on 6/20/25.
//

import SwiftUI
import AVFoundation

/*struct ContentView: View
    @State private var currentChoice: AdventureChoice = generateRootAdventure()
    
    @State private var backgroundPlayer: AVAudioPlayer?
    @State private var sfxPlayer: AVAudioPlayer?
    @State private var audioDelegate: AVDelegate?
    
var body: some View {
        ZStack {
            // Background
            LinearGradient(
                gradient: Gradient(colors: [Color.black, Color(red: 0.2, green: 0, blue: 0), Color(red: 0.3, green: 0, blue: 0)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                playSFX(named: "thunder")
            }
            
            // Foreground content
            VStack(spacing: 30) {
                if let title = currentChoice.title {
                    Text(title)
                        .font(.largeTitle)
                        .foregroundColor(Color(red: 0.7, green: 0, blue: 0))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                
                Text(currentChoice.description)
                    .font(.title2)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
                
                if let choices = currentChoice.nextChoices {
                    ForEach(choices.indices, id: \.self) { index in
                        Button(action: {
                            currentChoice = choices[index]
                        }) {
                            Text(choices[index].title ?? choices[index].description)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color(red: 0.6, green: 0, blue: 0))
                                .foregroundColor(.white)
                                .cornerRadius(12)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.white.opacity(0.4), lineWidth: 1)
                                )
                        }
                    }
                } else if currentChoice.isEnding, let message = currentChoice.endingMessage {
                    Text(message)
                        .font(.headline)
                        .foregroundColor(.red)
                        .padding()
                        .onAppear {
                            if currentChoice.title == "Murder Solved" {
                                playSFX(named: "success")
                            } else if currentChoice.title == "The Killer Escaped" {
                                playSFX(named: "fail")
                            } else if currentChoice.title == "The Killer Struck Again" {
                                playSFX(named: "scream")
                            } else if currentChoice.title == "You're a fraud." {
                                playSFX(named: "fart")
                            }
                        }
                    
                    Button("Restart") {
                        currentChoice = generateRootAdventure()
                    }
                    .padding()
                    .background(Color.white.opacity(0.2))
                    .foregroundColor(.red)
                    .cornerRadius(10)
                }
            }
            .padding()
        }
    }
        
    func playSFX(named name: String) {
        var url = Bundle.main.url(forResource: name, withExtension: "mp3")
        if url == nil {
            url = Bundle.main.url(forResource: name, withExtension: "wav")
        }

        guard let finalURL = url else {
            print("Could not find \(name).mp3 or .wav in bundle")
            return
        }

        do {
            sfxPlayer = try AVAudioPlayer(contentsOf: finalURL)
            sfxPlayer?.play()
            print("Playing \(name)")
        } catch {
            print("Error playing sound effect: \(error.localizedDescription)")
        }
    }
        
        
        class AVDelegate: NSObject, AVAudioPlayerDelegate {
            var onFinish: () -> Void
            
            init(onFinish: @escaping () -> Void) {
                self.onFinish = onFinish
            }
            
            func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
                onFinish()
            }
        }
        
    }*/

struct ContentView: View {
    @StateObject private var controller = AdventureController()

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.black, Color(red: 0.2, green: 0, blue: 0), Color(red: 0.3, green: 0, blue: 0)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                controller.playSFX(named: "thunder")
            }

            VStack(spacing: 30) {
                if let title = controller.currentChoice.title {
                    Text(title)
                        .font(.largeTitle)
                        .foregroundColor(Color(red: 0.7, green: 0, blue: 0))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }

                Text(controller.currentChoice.description)
                    .font(.title2)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()

                if let choices = controller.currentChoice.nextChoices {
                    ForEach(choices.indices, id: \.self) { index in
                        Button(action: {
                            controller.choose(choices[index])
                        }) {
                            Text(choices[index].title ?? choices[index].description)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color(red: 0.6, green: 0, blue: 0))
                                .foregroundColor(.white)
                                .cornerRadius(12)
                        }
                    }
                } else if controller.currentChoice.isEnding, let message = controller.currentChoice.endingMessage {
                    Text(message)
                        .font(.headline)
                        .foregroundColor(.red)
                        .padding()
                        .onAppear {
                            if controller.currentChoice.title == "Murder Solved" {
                                controller.playSFX(named: "success")
                            } else if controller.currentChoice.title == "The Killer Escaped" {
                                controller.playSFX(named: "fail")
                            } else if controller.currentChoice.title == "The Killer Struck Again" {
                                controller.playSFX(named: "scream")
                            } else if controller.currentChoice.title == "You're a fraud." {
                                controller.playSFX(named: "fart")
                            }
                        }

                    Button("Restart") {
                        controller.restart()
                    }
                    .padding()
                    .background(Color.white.opacity(0.2))
                    .foregroundColor(.red)
                    .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}

