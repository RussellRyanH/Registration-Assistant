//
//  Course.swift
//  Registration Assistant
//
//  Created by Ryan Russell on 3/31/23.
//

import Foundation

class Course: Identifiable, CustomStringConvertible, Equatable {
    init(prefix: String, number: String, title: String, time: String) {
        self.prefix = prefix
        self.number = number
        self.title = title
        self.time = time
    }
    
    let id = UUID()
    var prefix: String
    var number: String
    /// Verbal description of course, eg: "Algorithms"
    var title: String
    var time: String
    
    var successSubCourse: Course? = nil
    var failureSubCourse: Course? = nil
    
    /// Combination of course Prefix and Number
    var name: String { prefix + " " + number }
    
    var description: String {
        "\(prefix) \(number) '\(title)' Time: \(time)"
    }
    
    static func == (lhs: Course, rhs: Course) -> Bool {
        return
            lhs.id == rhs.id ||
            (lhs.prefix == rhs.prefix &&
            lhs.number == rhs.number &&
            lhs.title == rhs.title &&
            lhs.time == rhs.time)
    }
    
    // STATIC CLASS VARIABLES AND METHODS
    
    static let sampleCourse = Course(prefix: "MATH", number: "214", title: "Foundations of Mathematics", time: "MW 14:00-15:30")
    static let sampleCourse2 = Course(prefix: "CSCI", number: "304", title: "Computer Organization", time: "TR 9:30-10:50")
    static let sampleCourse3 = Course(prefix: "MATH", number: "351", title: "Probability and Statistics for Scientists", time: "W 1:00-6:00")
    static let sampleCourse4 = Course(prefix: "PHYS", number: "208", title: "Classical Mechanics of Particles and Waves", time: "TR 11:00-12:20, W 1:00-1:50")
    static let sampleCourse5 = Course(prefix: "LING", number: "220", title: "Study of Language", time: "MWF 9:00-9:50")
    
    static var firstCourse: Course? = sampleCourse
//    static var firstCourse: Course? = nil
    static var currentCourse: Course? = sampleCourse
//    static var currentCourse: Course? = nil

    static var allCourses = [sampleCourse, sampleCourse2, sampleCourse3, sampleCourse4, sampleCourse5]
//    static var allCourses: [Course] = []
    
    static func addCourse(_ course: Course) {
        if allCourses.isEmpty {
            setFirstCourse(course)
        }
        allCourses.append(course)
    }
    
    static func removeCourse(_ course: Course) {
        let index = allCourses.firstIndex(of: course)
        allCourses.remove(at: index!)
        if course == firstCourse {
            if allCourses.isEmpty {
                firstCourse = nil
                currentCourse = nil
            } else {
                setFirstCourse(allCourses[0])
            }
            
        }
    }
    
    static func setFirstCourse(_ course:Course) {
        firstCourse = course
        currentCourse = course
    }
}
