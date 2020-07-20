//
//  ContentView.swift
//  Memorize14
//
//  Created by Tanveer Bashir on 7/19/20.
//

import SwiftUI

struct ContentView: View {
    var viewModel: MemoryGameViewModel
    let items = [GridItem(.adaptive(minimum: 75))]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: items) {
                    ForEach( viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(0.6, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card: card)
                            }
                    }
                }
                .padding()
                .foregroundColor(.orange)
                .navigationTitle(Text("Memorize - 🙊😀😂"))
            }
        }
    }
}

struct CardView:View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack{
            if card.isFaceup {
                RoundedRectangle(cornerRadius: 10).fill(Color.white)
                RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 3)
                Text(card.contentType).font(.custom("Avenir", size: 75, relativeTo: .largeTitle))
            } else {
                RoundedRectangle(cornerRadius: 10).fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: MemoryGameViewModel())
    }
}
