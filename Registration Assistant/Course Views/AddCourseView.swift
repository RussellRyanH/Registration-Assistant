//
//  AddCourseView.swift
//  Registration Assistant
//
//  Created by Ryan Russell on 3/31/23.
//

import SwiftUI

struct AddCourseView: View {
    @State private var name = ""
    @State private var title = ""
    @State private var time = ""
    
    func addCourse() {
        let nameArray = name.split(separator: " ")
        let prefix = String(nameArray[0])
        var number: String
        if nameArray.count < 2 {
            number = ""
        } else {
            number = String(nameArray[1])
        }
        Course.addCourse(Course(prefix: prefix, number: number, title: title, time: time))
    }
    
    func resetInput() {
        name = ""
        title = ""
        time = ""
    }
    
    var body: some View {
        ZStack {
            TitleView("Add Course")
            
            VStack {
                Spacer()
                    .frame(height: 100)
                
                HStack {
                    Text("Course prefix and number e.g. 'CSCI 141'")
                        .font(.callout)
                    Spacer()
                }
                TextField("e.g. PHYS 303", text: $name)
                    .padding(.all)
                    .background(Color.menuGray)
                
                HStack {
                    Text("Course title e.g. 'Computational Problem Solving'")
                        .font(.callout)
                    Spacer()
                }
                TextField("e.g. Quantum Mechanics", text: $title)
                    .padding(.all)
                    .background(Color.menuGray)
                
                HStack {
                    Text("Course time e.g. 'TR 2:00-3:20'")
                        .font(.callout)
                    Spacer()
                }
                TextField("e.g. MWF 10:00-10:50", text: $time)
                    .padding(.all)
                    .background(Color.menuGray)
                
                Button {
                    addCourse()
                    print(Course.allCourses)
                    resetInput()
                } label: {
                    Text("Add Course")
                        .font(.title3)
                        .frame(width: 200, height: 50)
                }
                .buttonStyle(.borderedProminent)
                .disabled(name.isEmpty)
                .padding(.vertical)
                
                Spacer()
            }
            .padding(.horizontal)
        }
    }
}

struct AddCourseView_Previews: PreviewProvider {
    static var previews: some View {
        AddCourseView()
    }
}
