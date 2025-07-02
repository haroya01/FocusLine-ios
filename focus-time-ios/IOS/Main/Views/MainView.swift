//
//  MainView.swift
//  focus-time-ios
//
//  Created by 김동현 on 7/3/25.
//

import SwiftUI

struct MainView: View {
    @StateObject private var mainViewModel = MainViewModel()
    
    var body: some View {
        Group {
            if mainViewModel.isLoading {
                ZStack {
                    Color.black.ignoresSafeArea()
                    
                    VStack {
                        Text("으악")
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(.white)
                        
                        ProgressView()
                            .tint(.white)
                            .padding(.top, 20)
                    }
                }
            } else if mainViewModel.isLoggedIn {
                VStack {
                    Text("로그인 성공!")
                        .font(.title)
                        .padding()
                    
                    Button("로그아웃") {
                        mainViewModel.logout()
                    }
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
            } else {
                LoginView(onLoginSuccess: {
                    mainViewModel.checkLoginStatus()
                })
            }
        }
    }
}

#Preview {
    MainView()
}
