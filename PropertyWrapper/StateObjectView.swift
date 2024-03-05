//
//  StateObjectView.swift
//  PropertyWrapper
//
//  Created by dimitri on 10/10/2023.
//

import SwiftUI

struct StateObjectView: View {
    @StateObject var counter = Counter()
       var body: some View {
           NavigationStack {
               VStack {
                   Text("@StateObject var counter = Counter()")
                       .font(.system(size: 16, design: .monospaced))
                       .fontWeight(.bold)
                       .foregroundStyle(.pink)
                       .padding()
                   Text(" @StateObject est un property wrapper utilisé pour créer et gérer l'état d'une instance d'une classe qui conforme au protocole ObservableObject.")
                       .padding()
                       .fontWeight(.bold)
                   Text("Compteur: \(counter.value)")
                       .font(.largeTitle)
                       .fontWeight(.semibold)
                       .foregroundStyle(.yellow)
                    Button(action: {
                        counter.increment()
                    }, label: {
                        Text("Incrémenter")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundStyle(.purple)
                    })
                    NavigationLink {
                        ChildView(counter: counter)
                    } label: {
                        Text("Vers la vue enfant")
                            .fontWeight(.semibold)
                    }
               }
           }
       }
}





#Preview {
    StateObjectView()
}
