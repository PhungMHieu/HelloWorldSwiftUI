//
//  InformationView.swift
//  HelloWorld
//
//  Created by iKame Elite Fresher 2025 on 9/7/25.
//

import SwiftUI

struct InformationView: View {
    var information: Information
    var fields: [(String, String)]{[
        ("First name",information.firstName ?? ""),
        ("Last name",information.lastName ?? ""),
        ("Gender",information.gender ?? ""),
        ("Weight",String(information.weight ?? 0)),
        ("Height",String(information.height ?? 0))
    ]}
    var body: some View {
        HStack(alignment: .top, spacing: 30){
            VStack {
                ForEach(0..<3) { index in
                    InformContentView(title: fields[index].0, content: fields[index].1)
                }
            }
            VStack {
                ForEach(3..<5) { index in
                    InformContentView(title: fields[index].0, content: fields[index].1)
                }
            }
        }
        .padding()
        
    }
}

#Preview {
    InformationView(information: Information(firstName: "Nam", lastName: "Van", gender: "Nữ", weight: 0, height: 0))
//    InformationView()
}

struct InformContentView: View {
    var title: String
    var content: String
    var body: some View {
        HStack {
            Text(title + ":")
            Spacer()
            Text(content)
        }
    }
}
