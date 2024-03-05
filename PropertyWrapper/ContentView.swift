//
//  ContentView.swift
//  PropertyWrapper
//
//  Created by dimitri on 08/10/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userManager: UserManager

    var body: some View {
        NavigationStack {
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
            List{
                NavigationLink {
                    PropertyView()
                } label: {
                    Text("Propriété statique")
                }
                NavigationLink {
                    StateView()
                } label: {
                    Text("@State")
                }
                NavigationLink {
                    BindingView()
                } label: {
                    Text("@Binding")
                }
                NavigationLink {
                    ObservedObectView()
                } label: {
                    Text("@ObservedObject")
                }
                NavigationLink {
                    StateObjectView()
                } label: {
                    Text("@StateObject")
                }
                NavigationLink {
                    EnvironmentObjectView()
                } label: {
                    Text("@EnvironmentObect")
                }
                NavigationLink {
                    EnvironemntView()
                } label: {
                    Text("@Environment")
                }
            }
            .navigationTitle("Property Wrapper")
        }
        .tint(.purple)
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
        .environmentObject(UserManager())
}
