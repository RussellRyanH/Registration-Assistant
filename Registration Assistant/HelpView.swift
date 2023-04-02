//
//  HelpView.swift
//  Registration Assistant
//
//  Created by Ryan Russell on 4/1/23.
//

import SwiftUI

struct HelpView: View {
    var body: some View {
        ZStack {
            TitleView("Assistance")
            
            VStack {
                Spacer()
                    .frame(height: 100)
                Text("lmao nice try 💀")
                    .font(.largeTitle)
                Spacer()
                    .frame(height: 200)
            }
        }
    }
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
    }
}
