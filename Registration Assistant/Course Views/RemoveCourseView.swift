//
//  RemoveCourseView.swift
//  Registration Assistant
//
//  Created by Ryan Russell on 4/1/23.
//

import SwiftUI

struct RemoveCourseView: View {
    @State private var allCourses = Course.allCourses
    
    var body: some View {
        ZStack {
            TitleView("Remove Courses")
            
            VStack {
                Spacer()
                    .frame(height: 100)
                
                if allCourses.isEmpty {
                    Text("No remaining courses")
                        .font(.title2)
                        .foregroundColor(.red)
                }
                
                NavigationStack {
                    List(allCourses) { course in
                        NavigationLink {
                            RemoveConfirmationView(course: course)
                        } label: {
                            CourseView(course: course)
                        }
                        .buttonStyle(.plain)
                    }
                    .onAppear {
                        allCourses = Course.allCourses
                    }
                }
                
//                Button("DEBUG Print Courses") {
//                    print(allCourses)
//                }
            }
        }
    }
}

struct RemoveCourseView_Previews: PreviewProvider {
    static var previews: some View {
        RemoveCourseView()
    }
}
