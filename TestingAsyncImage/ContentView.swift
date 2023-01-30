//
//  ContentView.swift
//  TestingAsyncImage
//
//  Created by Filip Jabłoński on 30/01/2023.
//

import SwiftUI

struct Model: Identifiable {
    let id: Int
    
    let iconURL: URL
}

final class MainViewModel: ObservableObject {
    var model: Model
    init(model: Model) {
        self.model = model
    }
}

struct ContentView: View {
    @ObservedObject var viewModel:
    MainViewModel
    var body: some View {
        VStack {
            AsyncImage(url: viewModel.model.iconURL)
            { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill) // Displays the loaded image.
                } else if phase.error != nil {
                    Color.red // Indicates an error.
                } else {
                    Color.blue // Acts as a placeholder.
                }
            }
            
            .padding()
        }
    }
}
