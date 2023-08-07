//
//  ContentView.swift
//  AnotherRockScissorsPaper
//
//  Created by Vladimir Dvornikov on 07/08/2023.
//
// Где можно упростить логику?
import SwiftUI

struct ContentView: View {
    
    let moves = [["✊", "✋"], ["✌️", "✊"], ["✋", "✌️"]]
    
    @State private var computerChoice = Int.random(in: 0..<3)
    @State private var shouldWin = Bool.random()
    
    @State private var score = 0
    @State private var round = 1
    @State private var gameOver = false
    
    var body: some View {
        VStack {
            Text("Score: \(score)")
                .font(.largeTitle)
            Spacer()
            
            Text("Computer choice is:")
            Text(moves[computerChoice][0])
                .font(.system(size: 200))
            Spacer()
            
            if shouldWin {
                Text("Which one is win?")
                    .foregroundColor(.green)
                    .font(.title)
            } else{
                Text("Which one is lose?")
                    .foregroundColor(.red)
                    .font(.title)
            }
            
            HStack {
                ForEach(0..<3) { number in
                    Button(moves[number][0]) {
                        play(number)
                    }
                    .font(.system(size: 70))
                    .padding()
                }
            }
        }
        .padding()
        .alert("Game over!", isPresented: $gameOver) {
            Button("Play new game") {
                reset()
            }
        } message: {
            Text("Your score is \(score)")
    }
}
    

func play(_ number: Int) {
    
    if moves[number][0] != moves[computerChoice][0] {
        if shouldWin {
            if moves[number][0] == moves[computerChoice][1] {
                score += 1
            } else {
                score -= 1
            }
        } else {
            if moves[number][0] == moves[computerChoice][1] {
                score -= 1
            } else {
                score += 1
            }
        }
    }

    if round != 10 {
        computerChoice = Int.random(in: 0..<3)
        shouldWin.toggle()
        round += 1
    } else {
        gameOver = true
    }
}

func reset() {
    score = 0
    round = 1
    computerChoice = Int.random(in: 0..<3)
    shouldWin.toggle()
}
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
