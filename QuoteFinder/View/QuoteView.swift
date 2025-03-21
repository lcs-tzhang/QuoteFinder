//
//  ContentView.swift
//  QuoteFinder
//
//  Created by xinyu zhang on 2025-03-03.
//

import SwiftUI

struct QuoteView: View {
    
    @State var viewModel = QuoteViewModel()
    
    @State var authorOpacity = 0.0
    
    @State var buttonOpacity = 0.0

    @State var authorTimer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()

    @State var buttonTimer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            if let currentQuote = viewModel.currentQuote{
                Group{
                    Text(currentQuote.quoteText)
                        .padding(.bottom, 100)
                    Text(currentQuote.quoteAuthor)
                        .opacity(authorOpacity)
                        .onReceive(authorTimer) { _ in
                            
                            withAnimation {
                                authorOpacity = 1.0
                            }
                            
                            // Stop the timer
                           authorTimer.upstream.connect().cancel()
                        }
                }
                .font(.title)
                .multilineTextAlignment(.center)
                
                Button {
                 
                    // Hide punchline and button
                    withAnimation {
                        viewModel.currentQuote = nil
                       authorOpacity = 0.0
                        buttonOpacity = 0.0
                    }
                                        
                    // Get a new joke
                    Task {
                        await viewModel.fetchQuote()
                    }
                    
                    // Restart timers
                    authorTimer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
                    buttonTimer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
                    
                } label: {
                 
                    Text("New Quote")
                    
                }
                .buttonStyle(.borderedProminent)
                .opacity(buttonOpacity)
                .onReceive(buttonTimer) { _ in
                    
                    withAnimation {
                        buttonOpacity = 1.0
                    }
                    
                    // Stop the timer
                    buttonTimer.upstream.connect().cancel()
                }
            }
        }
        .padding()
    }
}

#Preview {
    QuoteView()
}
