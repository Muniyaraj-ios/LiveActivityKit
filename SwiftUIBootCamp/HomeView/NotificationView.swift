//
//  NotificationView.swift
//  SwiftUIBootCamp
//
//  Created by Munish on 23/04/25.
//

import SwiftUI

struct NotificationView: View {
    
    var body: some View {
        HStack{
            VStack(alignment: .leading) {
                HStack {
                    Image("tik_tok").resizable()
                        .frame(width: 30, height: 30)
                    Text("TikTok")
                        .font(.footnote)
                }
                Text("Ghibli Artist")
                    .font(.headline)
                Text("Live Now")
                    .font(.callout)
                
                HStack {
                    Image(systemName: "pause.fill").resizable()
                        .frame(width: 20, height: 22)
                        .padding(.horizontal, 8)
                    Image(systemName: "multiply").resizable()
                        .frame(width: 20, height: 22)
                }
            }
            .padding(.leading, 15)
            
            Spacer()
            Image("artist").resizable()
                .frame(width: 145, height: 145)
                .overlay {
                    LinearGradient(colors: [Color.black.opacity(0.6), .clear],
                    startPoint: .leading, endPoint: .trailing)
                    //.blur(radius: 0)
                }
        }
        .foregroundStyle(.white)
        .background(Color.black.opacity(0.8))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    NotificationView()
}
