//
//  RemoveConfirmationView.swift
//  Registration Assistant
//
//  Created by Ryan Russell on 4/1/23.
//

import SwiftUI

/// - Depreciated
struct RemoveConfirmationView: View {
    var course: Course
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 350, height: 300)
                    .foregroundColor(.menuGray)
                
                VStack {
                    HStack {
                        Text("Are you sure you want to delete the following course?")
                            .multilineTextAlignment(.leading)
                        .padding(.vertical)
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    Text("\(course.name): \(course.title)")
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    HStack {
                        Button() {
                            dismiss()
                        } label: {
                            Text("Cancel")
                                .frame(width:120, height: 30)
                        }
                        .padding(.all)
                        .buttonStyle(.borderedProminent)
                        .grayscale(1)
                        
                        
                        Spacer()
                        
                        Button() {
                            dismiss()
                            Course.removeCourse(course)
                        } label: {
                            Text("Delete")
                                .frame(width:120, height: 30)
                        }
                        .padding(.all)
                        .buttonStyle(.bordered)
                        .foregroundColor(.red)
                    }
                }
                .frame(width: 340, height: 290)
                .padding(.all)
            }
            .padding(.vertical)
            
            Spacer()
        }
    }
}

struct RemoveConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        RemoveConfirmationView(course: Course.sampleCourse)
    }
}
