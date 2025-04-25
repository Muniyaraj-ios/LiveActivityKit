//
//  HomeView.swift
//  SwiftUIBootCamp
//
//  Created by MacBook on 26/11/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color.orange
                .ignoresSafeArea()
            
            HStack {
                ForEach(0..<4) { i in
                    VStack {
                        Circle()
                            .frame(width: 80, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                }
            }
            .padding(.horizontal, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            
        }
    }
}

#Preview {
    HomeView()
}
