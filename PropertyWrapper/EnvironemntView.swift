//
//  EnvronemntView.swift
//  PropertyWrapper
//
//  Created by dimitri on 09/10/2023.
//

import SwiftUI

struct EnvironemntView: View {
    @Environment(\.colorScheme) var colorScheme
     
     var body: some View {
         VStack {
             Text("@Environment(\\.colorScheme) var colorScheme")
                 .font(.system(size: 13, design: .monospaced))
                 .fontWeight(.bold)
                 .foregroundStyle(.purple)
                 .padding()
             Text("@Environment fournit un moyen de gérer et de transmettre des données pertinentes pour l'ensemble de l'application ou pour des parties spécifiques de l'application, telles que les thèmes, les paramètres de localisation, l'orientation de la mise en page ou d'autres valeurs de configuration. ")
                 .padding()
                 .fontWeight(.bold)
             if colorScheme == .dark{
                 Text("Dark mode activé !")
                     .background(colorScheme == .dark ? Color.black : Color.white)
                 .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                 .font(.title)
                 .fontWeight(.semibold)
             }else{
                 Text("Ligth mode activé !")
                     .background(colorScheme == .dark ? Color.black : Color.white)
                 .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                 .font(.title)
                 .fontWeight(.semibold)
             }
         }
     }
}

#Preview {
    EnvironemntView()
        .preferredColorScheme(.dark)

}
