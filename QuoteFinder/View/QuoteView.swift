//
//  ContentView.swift
//  QuoteFinder
//
//  Created by xinyu zhang on 2025-03-03.
//

import SwiftUI

struct QuoteView: View {
    
    @State var viewModel = QuoteViewModel()
    var body: some View {
        VStack {
            if let currentQuote = viewModel.currentQuote{
                Group{
                    Text(currentQuote.quoteText ?? "")
                        .padding(.bottom, 100)
                    Text(currentQuote.quoteAuthor ?? "")
                }
                .font(.title)
                .multilineTextAlignment(.center)
            }
        }
        .padding()
    }
}

#Preview {
    QuoteView()
}
