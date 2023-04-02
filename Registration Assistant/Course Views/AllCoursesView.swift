//
//  AllCoursesView.swift
//  Registration Assistant
//
//  Created by Ryan Russell on 4/1/23.
//

import SwiftUI

struct AllCoursesView: View {
    @State private var allCourses = Course.allCourses
    
    var body: some View {
        NavigationStack {
            ZStack {
                TitleView("All Courses")
                
                VStack {
                    Spacer()
                        .frame(height: 100)
                    
                    NavigationLink {
                        AddCourseView()
                    } label: {
                        HStack {
                            Text("Add New")
                                .font(.title3)
                            Image(systemName: "plus")
                        }
                        .frame(width: 200)
                    }
                    .buttonStyle(.bordered)
                    .padding([.horizontal, .bottom])
                
                    List(allCourses) { course in
                        NavigationLink {
                            DetailedCourseView(course: course)
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

struct AllCoursesView_Previews: PreviewProvider {
    static var previews: some View {
        AllCoursesView()
    }
}
