//
//  GameView.swift
//  ScoreKeeper Watch App
//
//  Created by Mason Horne on 3/23/23.
//

import SwiftUI

struct GameView: View {
    // Variables for tracking game state
    var GAME_OVER_DELAY: Int = 2;
    @State var gameOver: Bool = false;
    @State var opponentWins: Int = 0;
    @State var userWins: Int = 0;
    @State var opponentScore: Int = 0;
    @State var userScore: Int = 0;
    @State var maxScore: Int;

    // Helper function for updating user wins on game over
    func setGameOver() {
        self.gameOver = true;
        if(self.userScore >= self.maxScore) {
            self.userWins += 1;
        } else {
            self.opponentWins += 1;
        }
    }
    
    var body: some View {
        VStack {
            // If the game is going, display the Game View
            if !gameOver {
                VStack {
                    HStack {
                        Spacer();
                        Text("User");
                        Spacer();
                        Text("Rival");
                        Spacer();
                    }
                    Spacer();
                    HStack {
                        Spacer();
                        Text("\(self.userWins)");
                        Spacer();
                        Text("Total Wins");
                        Spacer();
                        Text("\(self.opponentWins)");
                        Spacer();
                    }
                    Spacer().padding(0);
                    HStack {
                        VStack {
                            Button(action: {
                                self.userScore += 1;
                                if(self.userScore >= self.maxScore) {
                                    setGameOver();
                                }
                            }) {
                                Text("+");
                            };
                            Text("\(userScore)")
                                .padding([.trailing, .leading], 2);
                            Button(action: {self.userScore -= 1;}) {
                                Text("-");
                            };
                        }
                        VStack{
                            Text("Score").font(.system(size: 12));
                        }
                        Spacer();
                        VStack {
                            Button(action: {
                                self.opponentScore += 1;
                                if(self.opponentScore >= self.maxScore) {
                                    setGameOver();
                                }
                            }) {
                                Text("+");
                            };
                            Text("\(self.opponentScore)")
                                .padding([.trailing, .leading], 2);
                            Button(action: { self.opponentScore -= 1;}) {
                                Text("-");
                            };
                        }
                    }
                }.padding(.top, 20);
            } else {
                // Otherwise, display end game message
                VStack {
                    if(self.userScore >= self.maxScore) {
                        Text("You Win!");
                    } else {
                        Text("You Lose!");
                    }
                    Spacer();
                    Button(action: {
                        self.gameOver = false;
                        self.userScore = 0;
                        self.opponentScore = 0;
                        
                    }) {
                        Text("Tap to Continue");
                    };
                }
            }
        }.animation(.default, value: self.gameOver)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(maxScore: 5);
    }
}
