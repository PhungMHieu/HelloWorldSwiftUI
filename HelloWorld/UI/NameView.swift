//
//  ExtractView.swift
//  HelloWorld
//
//  Created by iKame Elite Fresher 2025 on 8/7/25.
//
import SwiftUI


struct NameView: View {
    @Binding var firstName: String
    var title: String
    var placeholder: String
    var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            Text(title)
            //                .font(.headline)
            TextField(placeholder, text: $firstName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .padding(.trailing, 8.0)
        }
//        .padding(.trailing, 8.0 )
    }
}
