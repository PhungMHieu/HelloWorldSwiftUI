//
//  ContentView.swift
//  HelloWorld
//
//  Created by iKame Elite Fresher 2025 on 8/7/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        var nameField
        VStack (spacing: 40, content: {
            HStack(alignment: .top) {
                ExtractedView(title: "First name", placeholder: "Enter first name")
                ExtractedView(title: "Last name", placeholder: "Enter last name")
            }.padding(.horizontal, 20.0)
            GenderSelector()
            HStack {
                HeightWeightView(title: "Weight", placeholder: "Enter weight")
                HeightWeightView(title: "Height", placeholder: "Enter height")
//                HeightWeightView()
//                HeightWeightView()
            }
            .padding(.horizontal, 20)
            
        })
    }
}



struct GenderSelector: View {
    @State private var selectedGender = "Nam"
    let genders = ["Nam", "Nữ", "Không"]
    var body: some View {
        
//        Picker
        Picker("GenderSelector",selection: $selectedGender) {
            ForEach(genders, id: \.self){ gender in
                Text(gender).tag(gender)
            }
        }.pickerStyle(.segmented).padding()
    }
}

struct HeightWeightView: View {
    @State var weightValue: String = ""
    var title: String
    var placeholder: String
    var body: some View {
        VStack(alignment: .leading){
            Text(title)
            TextField(placeholder, text: $weightValue)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}
#Preview {
    ContentView()
//    ContentView().previewLayout(.fixed(width: 568, height: 320))
}
