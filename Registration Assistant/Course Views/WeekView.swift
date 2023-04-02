//
//  WeekView.swift
//  Registration Assistant
//
//  Created by Ryan Russell on 3/31/23.
//

import SwiftUI

struct WeekView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .padding(.all)
                .aspectRatio(CGSize(width: 0.12, height: 0.09), contentMode: .fill)
            .foregroundColor(.accentColor)
            .frame(height: 265)
            
            Text("Week View")
                .foregroundColor(.white)
                .font(.title)
        }
    }
}

struct WeekView_Previews: PreviewProvider {
    static var previews: some View {
        WeekView()
    }
}
