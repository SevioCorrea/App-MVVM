//
//  ContentView.swift
//  MVVM
//
//  Created by Sévio on 19/09/22.
//

import SwiftUI

// MARK - View
struct ContentView: View {
    
    // Monitorando a ViewModel com @State
    @State var viewModel = ProfileViewModel()
    
    var body: some View {
        VStack {
            
            // Perfil
            Image(viewModel.user.picture)
                .resizable()
                .frame(width: 250, height: 250)
                .padding(.bottom, 10)
            
            Text(viewModel.user.name)
                .font(.system(size: 30, weight: .bold))
            
            Text(viewModel.user.nick)
                .font(.system(size: 23, weight: .regular))
                .foregroundColor(.gray)
            
            Text(viewModel.userFollowers)
                .font(.system(size: 50, weight: .light))
                .padding(40)
            
            VStack {
                // Botões - Seguir
                Button{viewModel.followToggle()} label: {
                    Label(!viewModel.isFollowing ? "Follow" : "Unfollow", systemImage: "person.fill.badge.plus")
                        .font(.title3)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .tint(!viewModel.isFollowing ? .blue : .black)
                
                // Botões
                Button{} label: {
                    Label("Enviar Mensagem", systemImage: "bubble.right.fill")
                        .font(.title3)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .disabled(!viewModel.isFollowing)
            }
            .padding(20)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
