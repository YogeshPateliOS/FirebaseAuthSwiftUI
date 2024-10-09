//
//  ContentView.swift
//  FirebaseAuthYoutube
//
//  Created by Hemal Patel on 2024-09-28.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        Group {
            if authViewModel.userSession == nil {
                LoginView()
            }else {
                ProfileView()
            }
        }
        .environmentObject(authViewModel)                    
    }
}

#Preview {
    ContentView()
}
