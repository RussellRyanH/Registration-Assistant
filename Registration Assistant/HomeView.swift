//
//  HomeView.swift
//  Registration Assistant
//
//  Created by Ryan Russell on 3/31/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            TitleView("Registration Assistant")
            VStack {
                Spacer()
                    .frame(height: 150)
                
                Image(systemName: "brain.head.profile")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color("AccentColor"))
                    .frame(width:200)
                    .padding(.all)
                
                Spacer()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
