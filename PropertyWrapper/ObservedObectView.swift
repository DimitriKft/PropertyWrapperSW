//
//  ObservableObjectView.swift
//  PropertyWrapper
//
//  Created by dimitri on 09/10/2023.
//

import SwiftUI

struct ObservedObectView: View {
    @ObservedObject var counter = Counter()

       var body: some View {
           NavigationStack {
               VStack {
                   Text(" @ObservedObject var counter = Counter()")
                       .font(.system(size: 14, design: .monospaced))
                       .fontWeight(.bold)
                       .foregroundStyle(.purple)
                       .padding()
                   Text("@ObservedObject est utilisé pour créer une propriété qui fait référence à un objet observable (conformant au protocole ObservableObject). Lorsque l'objet observable est mis à jour, la vue qui l'utilise se met à jour également.")
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
    ObservedObectView()
}

struct ChildView: View {
    @ObservedObject var counter: Counter

    var body: some View {
        VStack {
            Text("Compteur: \(counter.value)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.yellow)
            Button(action: {
                counter.decrement()
            }, label: {
                Text("Décrémenter")
                    .fontWeight(.semibold)
            })
        }
    }
}

