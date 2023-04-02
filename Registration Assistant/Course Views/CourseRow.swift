//
//  CourseRow.swift
//  Registration Assistant
//
//  Created by Ryan Russell on 3/31/23.
//

import SwiftUI

struct CourseRow: View {
    var course: Course
    var body: some View {
        NavigationStack {
            NavigationLink {
                DetailedCourseView(course: course)
            } label: {
                    CourseView(course:course)
//                        .padding(.vertical)
            }
        }
        
    }
}

struct CourseRow_Previews: PreviewProvider {
    static var previews: some View {
        CourseRow(course: Course.sampleCourse)
    }
}
