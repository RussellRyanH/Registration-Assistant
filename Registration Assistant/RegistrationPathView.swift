//
//  RegistrationPathView.swift
//  Registration Assistant
//
//  Created by Ryan Russell on 4/1/23.
//

import SwiftUI

struct RegistrationPathView: View {
    @State var allCourses = Course.allCourses
    var body: some View {
        NavigationStack {
            ZStack {
                TitleView("Path Planner")
                
                VStack {
                    Spacer()
                        .frame(height: 100)
                    
                    Text("Select a course to configure the path during registration.")
                        .padding(.horizontal)
                    
                    List(allCourses) { course in
                        NavigationLink {
                            SuccessOrFailureView(course: course)
                        } label: {
                            CourseView(course: course)
                        }
                    }
                    .onAppear {
                        allCourses = Course.allCourses
                    }
                }
            }
        }
    }
}

struct RegistrationPathView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationPathView()
    }
}
