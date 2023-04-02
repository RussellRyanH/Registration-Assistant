//
//  ContentView.swift
//  Registration Assistant
//
//  Created by Ryan Russell on 3/31/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView() {
            HomeView()
                .tabItem() {
                    Label("Home", systemImage: "house")
                }
            AllCoursesView()
                .tabItem() {
                    Label("My Courses", systemImage: "list.bullet")
                }
            RegistrationPathView()
                .tabItem() {
                    Label("Path", systemImage: "signpost.right.and.left")
                }
            RegistrationView()
                .tabItem() {
                    Label("Registration", systemImage: "birthday.cake")
                }
            HelpView()
                .tabItem() {
                    Label("Help", systemImage: "questionmark")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
