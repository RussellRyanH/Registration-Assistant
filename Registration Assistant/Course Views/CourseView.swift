//
//  CourseView.swift
//  Registration Assistant
//
//  Created by Ryan Russell on 3/31/23.
//

import SwiftUI

struct CourseView: View {
    var course: Course
    var body: some View {
        HStack {
            Text("\(course.prefix) \(course.number):\t\t\(course.title)")
                .lineLimit(1)
//                .padding(.horizontal)
        }
    }
}

struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        CourseView(course: Course.sampleCourse)
    }
}
