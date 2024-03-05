//
//  EnvironmentObjectView.swift
//  PropertyWrapper
//
//  Created by dimitri on 10/10/2023.
//

import SwiftUI

class UserManager: ObservableObject {
    @Published var isLoggedIn = false
}

struct EnvironmentObjectView: View {
    @EnvironmentObject var userManager: UserManager

      var body: some View {
          NavigationStack {
              VStack {
                  if userManager.isLoggedIn {
                      Text("Vous êtes connecté")
                          .font(.largeTitle)
                          .fontWeight(.semibold)
                          .foregroundStyle(.yellow)
                  }else{
                      Text("Vous êtes déconnecté")
                          .font(.largeTitle)
                          .fontWeight(.semibold)
                          .foregroundStyle(.yellow)
                  }
                  Text("  @EnvironmentObject var userManager: UserManager")
                      .font(.system(size: 11, design: .monospaced))
                      .fontWeight(.bold)
                      .foregroundStyle(.purple)
                      .padding()
                  Text("@EnvironmentObject est un property wrapper qui est utilisé pour injecter une instance d'une classe observable (qui adhère au protocole ObservableObject) dans la hiérarchie de vue, permettant ainsi à ces vues d’observer des changements dans cet objet.")
                      .padding()
                      .fontWeight(.bold)
                 
                  if userManager.isLoggedIn {
                      NavigationLink {
                          LoggedInView()
                      } label: {
                          Text("Vérification de la connxion")
                              .fontWeight(.semibold)
                      }
                     
                  } else {
                      NavigationLink {
                          LoginView()
                      } label: {
                          Text("Vérification de la connxion")
                              .fontWeight(.semibold)
                      }
                  }
              }
          }
      }
}


struct LoginView: View {
    @EnvironmentObject var userManager: UserManager
    var body: some View {
            VStack {
                Button("Connexion") {
                    userManager.isLoggedIn = true
                }
                .fontWeight(.semibold)
            }
        }
    }

struct LoggedInView: View {
    @EnvironmentObject var userManager: UserManager

    var body: some View {
        VStack {
            Button("Déconnexion") {
                userManager.isLoggedIn = false
            }
        }
    }
}



#Preview {
    EnvironmentObjectView()
        .environmentObject(UserManager())
}
