//
//  DetailedCourseView.swift
//  Registration Assistant
//
//  Created by Ryan Russell on 3/31/23.
//

import SwiftUI

struct DetailedCourseView: View {
    @ObservedObject var viewModel = shuffledList()
    
    var course: Course
    var showDeleteButton: Bool
    
    @State private var isPresentingConfirm = false
    @Environment(\.dismiss) private var dismiss
    
    init(course: Course, showDeleteButton: Bool = true) {
        self.course = course
        self.showDeleteButton = showDeleteButton
    }
    
    var body: some View {
        @State var isFirstCourse = (course == Course.firstCourse)
        ZStack {
            
            NavigationStack {
                Spacer()
                    .frame(height: 100)
                Text(course.title)
                    .font(.title2)
                
                Text(course.time)
                    .font(.subheadline)
                if isFirstCourse {
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.accentColor)
                        Text("This is the first course")
                            .font(.title2)
                            
                        Image(systemName: "star.fill")
                            .foregroundColor(.accentColor)
                    }
                    .padding(.all)
                } else {
                    Button {
                        Course.setFirstCourse(course)
                        viewModel.shuffle()
                    } label: {
                        HStack {
                            Text("Set First Course")
                                .font(.title2)
                            Image(systemName: "1.square")
                        }
                    }
                    .padding(.all)
                }
                
                WeekView()
                    .padding(.all)
                
                Text("Next Course")
                    .font(.title2)
                HStack {
                    VStack {
                        Text("if Successful")
                            .font(.title3)
                            .padding([.leading, .bottom, .trailing])
                        if let sucCourse = course.successSubCourse{
                            Text("\(sucCourse.name)")
                        } else {
                            Text("N/A")
                        }
                    }
                    .frame(width: 200, height: 60)
                    
                    VStack {
                        Text("if Unuccessful")
                            .font(.title3)
                            .padding([.leading, .bottom, .trailing])
                        if let failCourse = course.failureSubCourse{
                            Text("\(failCourse.name)")
                        } else {
                            Text("N/A")
                        }
                    }
                    .frame(width: 200, height: 60)
                }
                
                Spacer()
                
                if showDeleteButton {
                    Button("Delete Course", role: .destructive) {
                        isPresentingConfirm = true
                    }
                    .confirmationDialog("Delete \(course.name)?", isPresented: $isPresentingConfirm) {
                        Button("Delete", role: .destructive) {
                            dismiss()
                            Course.removeCourse(course)
                        }
                    } message: {
                        Text("This cannot be undone.")
                    }
                    
                    Spacer()
                }
            }
            
            TitleView(course.name)
        }
    }
}

class shuffledList : ObservableObject {
    @Published var list = ["1", "2", "3"]
    
    func shuffle() {
        list.shuffle()
    }
}

struct DetailedCourseView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedCourseView(course: Course.sampleCourse2)
    }
}
