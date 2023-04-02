//
//  RegistrationView.swift
//  Registration Assistant
//
//  Created by Ryan Russell on 4/2/23.
//

import SwiftUI

struct RegistrationView: View {
    @State var course: Course? = Course.currentCourse
    var body: some View {
        ZStack {
            NavigationStack {
                VStack {
                    Spacer()
                        .frame(height: 100)
                    if let curCourse = course {
                        if !Course.allCourses.isEmpty {
                            Text(curCourse.name)
                                .font(.title)
                                .padding(.bottom)
                            
                            Text(curCourse.title)
                                .font(.title2)
                            
                            Text(curCourse.time)
                                .font(.subheadline)
                        }
                    }
                    else {
                        Text("You do not have any courses entered, or you have not set a first course.")
                    }
                Spacer()
                
                HStack {
                    NavigationLink {
//                        RegistrationView(course: course?.successSubCourse)
                        if let successSub = course?.successSubCourse {
                            RegistrationView(course: successSub)
                        }
                    } label: {
                        Button("Success") {
                            Course.currentCourse = course?.successSubCourse
                        }
//                        Text("Success")
                        .font(.title)
                    }
                    .padding(.all)
                    .disabled(course?.successSubCourse == nil)
                    
                    NavigationLink {
//                        RegistrationView(course: course?.successSubCourse)
                        if let failSub = course?.failureSubCourse {
                            RegistrationView(course: failSub)
                        }
                    } label: {
                        Button("Failure") {
                            Course.currentCourse = course?.failureSubCourse
                        }
//                        Text("Failure")
                        .font(.title)
                    }
                    .padding(.all)
                    .disabled(course?.failureSubCourse == nil)
                }
                    Spacer()
                    Spacer()
                }
            }
            TitleView("Registration")
            }
            .onAppear() {
                course = Course.currentCourse
                print("Appear")
                if let courseval = course {
                    print(courseval.name)
                }
        }
            .onDisappear() {
                print("Disappear")
            }
        
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView(course: Course.sampleCourse)
    }
}
