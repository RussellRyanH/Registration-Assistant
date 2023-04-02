//
//  SuccessOrFailureView.swift
//  Registration Assistant
//
//  Created by Ryan Russell on 4/1/23.
//

import SwiftUI

struct SuccessOrFailureView: View {
    var course: Course
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Spacer()
                        .frame(height: 100)
                    Text(course.title)
                        .font(.title2)
                    
                    Text(course.time)
                        .font(.subheadline)
                    
                    Spacer()
                        .frame(height: 100)
                    
                    Text("Would you like to select the course that follows a SUCCESSFUL registration attempt, or the course that follows an UNSUCCESSFUL registration attempt?")
                        .padding(.all)
                    
                    NavigationLink(destination: PathConfigurationView(course: course, success: true)) {
                        HStack {
                            Spacer()
                                .frame(width: 20)
                            Text("Successful")
                            .font(.title2)
                            
                            Spacer()
                            
                            Image(systemName: "figure.run")
                            Spacer()
                                .frame(width: 20)
                        }
                            .frame(width: 250, height: 50)
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.all)
                        
                    
                    NavigationLink(destination: PathConfigurationView(course: course, success: false)) {
                        HStack {
                            Spacer()
                                .frame(width: 20)
                            Text("Unsuccessful")
                            .font(.title2)
                            
                            Spacer()
                            
                            Image(systemName: "tortoise")
                            Spacer()
                                .frame(width: 13)
                        }
                            .frame(width: 250, height: 50)
                    }
                        .buttonStyle(.borderedProminent)
                        .padding(.all)
                        .tint(.sadBlue)
                    
                    Spacer()
//                    Button("DEBUG PRINT CHILDREN COURSES") {
//                        var successName = "None"
//                        var failureName = "None"
//                        if let successCourse = course.successSubCourse?.name {
//                            successName = successCourse
//                        }
//                        if let failureCourse = course.failureSubCourse?.name {
//                            failureName = failureCourse
//                        }
//                        print("\(course.name):\n\tsuccess: \(successName)\n\tfailure: \(failureName)")
//                    }
                }
                TitleView(course.name)
            }
        }
    }
}

struct SuccessOrFailureView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessOrFailureView(course: Course.sampleCourse)
    }
}
