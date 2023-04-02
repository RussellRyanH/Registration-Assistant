//
//  RegistrationSubView.swift
//  Registration Assistant
//
//  Created by Ryan Russell on 4/2/23.
//

//import SwiftUI
//
//struct RegistrationSubView: View {
//    @State var course: Course?
//    var body: some View {
//        VStack {
//            Spacer()
//                .frame(height: 100)
//            if let curCourse = course {
//                if !Course.allCourses.isEmpty {
//                    Text(curCourse.name)
//                        .font(.title)
//                        .padding(.bottom)
//                    
//                    Text(curCourse.title)
//                        .font(.title2)
//                    
//                    Text(curCourse.time)
//                        .font(.subheadline)
//                }
//            }
//            else {
//                Text("You do not have any courses entered.")
//            }
//            Spacer()
//            
//            NavigationStack {
//                    HStack {
//                        NavigationLink {
////                            RegistrationSubView(course: course?.successSubCourse)
//                            if let successSub = course?.successSubCourse {
//                                RegistrationSubView(course: successSub)
//                            }
//                        } label: {
//                            Button("Success") {
//                                
//                            }
//                            .font(.title)
//                            .disabled(course?.successSubCourse == nil)
//                        }
//                        .padding(.all)
//                        
//                        NavigationLink {
////                            RegistrationSubView(course: course?.successSubCourse)
//                            if let failSub = course?.failureSubCourse {
//                                RegistrationSubView(course: failSub)
//                            }
//                        } label: {
//                            Button("Failure") {
//                                
//                            }
//                            .font(.title)
//                            .disabled(course?.failureSubCourse == nil)
//                        }
//                        .padding(.all)
//                    }
//            }
//            
//            Spacer()
//        }
//    }
//}
//
//struct RegistrationSubView_Previews: PreviewProvider {
//    static var previews: some View {
//        RegistrationSubView(course: Course.sampleCourse2)
//    }
//}
