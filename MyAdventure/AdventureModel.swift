//
//  AdventureModel.swift
//  MyAdventure
//
//  Created by Meghan Murphy on 6/20/25.
//

import Foundation

struct AdventureChoice {
    let title: String?
    let description: String
    let nextChoices: [AdventureChoice]?
    let isEnding: Bool
    let endingMessage: String?
}
var hasLaunchedBefore = false


// ----------------ALL POSSIBLE ENDINGS----------------------

let endingPlotTwist = AdventureChoice(title: "You're a fraud.", description: "Why'd you even start this game if you did it?", nextChoices: nil, isEnding: true, endingMessage: "Restart and dont pick this again")

let endingSuccess = AdventureChoice(
    title: "Murder Solved",
    description: "You solved the murder! The police arrive just in time to arrest the culprit thanks to your quick thinking.",
    nextChoices: nil,
    isEnding: true,
    endingMessage: "Case closed. Justice is served."
)

let endingFail = AdventureChoice(
    title: "The Killer Escaped",
    description: "The killer got away... You missed a key clue and the trail has gone cold.",
    nextChoices: nil,
    isEnding: true,
    endingMessage: "The mystery remains unsolved."
)
let endingDead = AdventureChoice(title: "The Killer Struck Again", description: "You let your guard down and paid the ultimate price.", nextChoices: nil, isEnding: true, endingMessage: "The mystery remains unsolved, and you fell victim to the crime.")


// --------------INVESTIGATING CRIME SCENE----------------------


// follow the note after examining the body for evidence
//POSSIBLE ENDINGS: Dead
let doWhatNoteSays = AdventureChoice(
    title: "Follow the Note",
    description: "You get to the Cellar and Lady Belle, Mr. Greenwich's wife, is already there. She removes her gloves and reveals her hands - bloody and trembling. You begin to walk towards Lady Belle, suddenly you look down and notice you've been stabbed. Before you can turn around, you're already pushed to the ground and left for dead.",
    nextChoices: [endingDead],
    isEnding: false,
    endingMessage: nil
)

// ignore the note after examining the body for evidence
//POSSIBLE ENDINGS: Fail
let ignoreNote = AdventureChoice(
    title: "Ignore the Note",
    description: "You chose not to act on the note. Later, you learn it pointed directly to the killer. It's too late now.",
    nextChoices: [endingFail],
    isEnding: false,
    endingMessage: nil
)


//choose to examine the body for any clues instead of speaking with guests or following footsteps
//POSSIBLE ENDINGS: Fail, Dead
let lookAtBody = AdventureChoice(
    title: "Look for clues on the body",
    description: "You inspect the victim’s body and find a crumpled note in their hand. It reads: 'Meet me in the cellar – 9 PM.' Do you act on the clue?",
    nextChoices: [
        doWhatNoteSays,
        ignoreNote
    ],
    isEnding: false,
    endingMessage: nil
)
    

// choose to follow bloody footsteps headed towards the study rather than checking the body or questioning guests
//POSSIBLE ENDINGS: Success, Fail, Dead
let followFootsteps = AdventureChoice(
    title: "Follow the trail of blood",
    description: "You follow the trail of bloody footprints down the hall to a locked study. Do you pick the lock or go back to the body?",
    nextChoices: [
        AdventureChoice(title: "Pick the Lock",
                        description: "You decided to pick the lock. You go through unopened, threatening letters to Mr. Greenwich from Lady Belle, his wife.",
                        nextChoices: [AdventureChoice(title: "Confront Lady Belle", description: "You confront Lady Belle and she confesses to the murder.", nextChoices: [endingSuccess], isEnding: false, endingMessage: nil)],
                        isEnding: false,
                        endingMessage: nil),
        AdventureChoice(title: "Go back to the Body",
                        description: "You decided not to break into the locked study, so you went back to the body for clues.",
                        nextChoices: [lookAtBody],
                        isEnding: false,
                        endingMessage: nil),
        ],
    isEnding: false,
    endingMessage: nil
)

// ----------------------TALK TO GUESTS-------------------------

// follow the maid after hearing her story
//POSSIBLE ENDINGS: Dead
let maidFollow = AdventureChoice(
    title: "Follow her to the Garden",
    description: "You and the maid descend into the Garden. Hidden behind some bushes, you find a bloodied glove matching that of the butler’s uniform. You go to take a picture, and the door slams shut behind you. All of a sudden theres an intense strike against the top of your head.",
    nextChoices: [endingDead],
    isEnding: false,
    endingMessage: nil)

//trust the maid after hearing her story
//POSSIBLE ENDINGS: Fail
let maidTrust = AdventureChoice(
    title: "Trust her story",
    description: "You thank the maid and move on. Later, you learn she may have withheld key information.",
    nextChoices: [
        AdventureChoice(title: "Try to find the maid again", 
                        description: "You find out from the other guests that the maid snuck out after you released her from questioning.",
                        nextChoices: [endingFail],
                        isEnding: false,
                        endingMessage: nil)
    ],
    isEnding: false,
    endingMessage: nil
)

//talk to the maid after choosing to talk to guests
//POSSIBLE ENDINGS: Fail, Dead
let talkToMaid = AdventureChoice(
    title: "Talk to the Maid",
    description: "The maid wrings her hands nervously. 'I saw someone slip out into the garden before the lights came back on,' she whispers. Do you follow her or trust her story?",
    nextChoices: [
                maidFollow,
                maidTrust
            ],
    isEnding: false,
    endingMessage: nil
    )

//secretly follow the butler after he told you his story
//POSSIBLE ENDINGS: Success
let butlerFollow = AdventureChoice(
    title: "Quietly follow the Butler",
    description: "You follow the butler into the garden. He digs up a bloodied glove from behind a bush. You've caught him red-handed.",
    nextChoices: [
        AdventureChoice(
            title: "Take a picture of him holding the bloody glove",
            description: "You caught the Butler trying to hide evidence! You caught the murderer.",
            nextChoices: [endingSuccess],
            isEnding: false,
            endingMessage: nil
        )
    ],

    isEnding: false,
    endingMessage: nil
    )

//choose to trust the butlers story after speaking with him
//POSSIBLE ENDINGS: Dead
let butlerTrust = AdventureChoice(
    title: "Trust the Butler",
    description: "You trust the butler’s story. But he disappears before you can ask more questions. Something doesn’t add up.",
    nextChoices: [
        AdventureChoice(
            title: "Try to find the Butler",
            description: "You search the estate, but the butler has vanished without a trace. As you search, you turn a corner and feel a sharp pain in your lower back. The ground gets closer and closer and that's the end of it.",
            nextChoices: [endingDead],
            isEnding: false,
            endingMessage: nil
        )
    ],
    isEnding: false,
    endingMessage: nil
)

//select talk to the butler after question guests
//POSSIBLE ENDINGS: Dead, Success
let talkToButler = AdventureChoice(
    title: "Talk to the Butler",
    description: "The butler adjusts his vest. 'I was in the kitchen when the lights went out. Sir Greenwich was difficult, but I wouldn’t kill him.' Do you follow him or trust his story?",
    nextChoices: [
                butlerFollow,
                butlerTrust
            ],
    isEnding: false,
    endingMessage: nil
)

//select question guests
// POSSIBLE ENDINGS: Success, Dead, Fail
let questionGuests = AdventureChoice(
    title: "Questioning the Guests",
    description: "You decide to question the guests. Who do you speak with?",
    nextChoices: [talkToMaid, talkToButler],
    isEnding: false,
    endingMessage: nil
)

// -----------------------OPENING PAGE------------------------

//The option of you being the murderer only comes up the first time you launch the app.

func generateRootAdventure() -> AdventureChoice {
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
