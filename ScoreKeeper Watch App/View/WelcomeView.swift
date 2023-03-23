//
//  WelcomeView.swift
//  ScoreKeeper Watch App
//
//  Created by Mason Horne on 3/23/23.
//

import SwiftUI

struct WelcomeView: View {
    // Count for max score
    @State var count: Int = 1;
    // Boolean for whether we are currently in a game
    @State var inGame: Bool = false;
    var body: some View {
        VStack {
            // If not in game, display the welcome counter
            if !inGame {
                VStack {
                    Text("ScoreKeeper")
                        .padding(15)
                        .fontDesign(.monospaced)
                        .blur(radius: 0.3);
                    VStack{
                        Text("Max Score").foregroundColor(.gray);
                        HStack {
                            Button(action: { self.count -= self.count > 1 ? 1 : 0; }) {
                                Text("-");
                            };
                            Text("\(count)")
                                .padding([.trailing, .leading], 2);
                            Button(action: {self.count += 1;}) {
                                Text("+");
                            };
                        }.padding([.bottom, .leading, .trailing], 10);
                    }
                    Button(action: { self.inGame = true; }) {
                        Text("Start Game");
                    };
                }
            } else {
                // Otherwise, display the Game View
                GameView(maxScore: count).padding([.leading, .trailing, .top], 4);
                Text("End Session").onTapGesture {
                    self.inGame = false;
                }.font(.system(size: 12));
            }
        }.padding(10);
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
