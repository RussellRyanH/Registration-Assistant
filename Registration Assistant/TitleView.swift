//
//  TitleView.swift
//  Registration Assistant
//
//  Created by Ryan Russell on 4/1/23.
//

import SwiftUI

/**
 Creates a uniform title format for each main screen in the app
 */
struct TitleView: View {
    var title: String
    
    init(_ title: String) {
        self.title = title
    }
    
    var body: some View {
        VStack {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .frame(height: 100)
            
            Spacer()
        }

    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView("Example Title")
    }
}
