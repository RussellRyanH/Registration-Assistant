//
//  PathConfigurationView.swift
//  Registration Assistant
//
//  Created by Ryan Russell on 4/1/23.
//

import SwiftUI

struct PathConfigurationView: View {
    var course: Course
    var success: Bool
    
    @State private var showConfirmation = false
    @State private var courseToLink: Course? = nil
    @Environment(\.dismiss) private var dismiss
    
    func setChildCourse(_ childCourse: Course) {
//        print("Child Course = \(childCourse.name)")
        if success {
            course.successSubCourse = childCourse
        } else {
            course.failureSubCourse = childCourse
        }
        dismiss()
    }
    
    var body: some View {
        @State var otherCourses = Course.allCourses.filter { $0 != course }
        ZStack {
            let status = (success) ? "Successful" : "Unsuccessfull"
            VStack {
                Spacer()
                    .frame(height: 100)
                Text(course.title)
                    .font(.title2)
                
                Text(course.time)
                    .font(.subheadline)
                
                NavigationStack {
                    VStack {
                        Text("Select a course to follow this one in the event that you were \(status.uppercased()) in registering for this class.")
                            .padding(.all)
                        
                        List(otherCourses) { listCourse in
                            Button {
                                courseToLink = listCourse
                                showConfirmation = true
                            } label: {
                                CourseRow(course: listCourse)
                            }
                            .buttonStyle(.plain)
                        }
                        .confirmationDialog("Select Course", isPresented: $showConfirmation) {
                            Button("Confirm") {
                                if let subCourse = courseToLink {
                                    setChildCourse(subCourse)
                                }
                            }
                        }
                        message: {
                            if let subCourse = courseToLink {
                                Text("Are you sure you would like to set \(subCourse.name) as the next course in the event you are \(status.uppercased()) in registering for \(course.name)?")
                            }
                        }
                    }
                }
            }
            
            TitleView("\(course.name) - \(status)")
        }
    }
}

struct PathConfigurationView_Previews: PreviewProvider {
    static var previews: some View {
        PathConfigurationView(course: Course.sampleCourse4, success: false)
    }
}
