//
//  ContentView.swift
//  HelloWorld
//
//  Created by iKame Elite Fresher 2025 on 8/7/25.
//

import SwiftUI

struct ContentView: View {
    @State var information: Information = Information()
    @State var displayInfo: Information? = nil
    var fields: [(String, String, Binding<String>)] {[
        ("First name", "Enter first name", $information.firstName.string),
        ("Last name", "Enter last name", $information.lastName.string),
        ("Weight", "Enter weight", $information.weight.string),
        ("Height", "Enter height", $information.height.string)
    ]}
    var body: some View {
//        var nameField
        
        VStack (spacing: 40, content: {
            var informationView = InformationView(information: information)
            HStack(alignment: .top) {
                ForEach(0..<2) { index in
                    NameView(firstName: fields[index].2, title: fields[index].0, placeholder: fields[index].1)
                }
            }.padding(.horizontal, 20.0)
            GenderSelector(selectedGender: $information.gender.string)
            VStack {
                ForEach(2..<4) { index in
//                    var weightString = String(information.weight)
                    HeightWeightView(weightValue: fields[index].2, title: fields[index].0, placeholder: fields[index].1)
                }
            }
            .padding(.horizontal, 20)
//            informationView
            if let displayInfo {
                InformationView(information: displayInfo)
            }
            Button(action: {
                    displayInfo = information
//                informationView
            }, label: {
                Text("Complete")
            })
            .padding()
            .background(Color.red)
            .foregroundColor(Color.white)
            .cornerRadius(10)
//            Text(
//            Spacer()
        })
        .padding(.top, 100.0)
        
    }
}
struct GenderSelector: View {
    @Binding var selectedGender: String 
    let genders = ["Nam", "Nữ"]
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
    @Binding var weightValue: String
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
extension Binding where Value == Double{
    var string: Binding<String>{
        Binding<String>(
            get: {
                "\(self.wrappedValue)"
            }, set: {
                self.wrappedValue = Double($0) ?? 0
            }
        )
    }
}
extension Binding where Value == String?{
    var string: Binding<String>{
        Binding<String>(
            get: {
                if let val =  self.wrappedValue{
                    return val
                }else{
                    return ""
                }
            }, set: {
                self.wrappedValue = $0
            }
        )
    }
}
extension Binding where Value == Double?{
    var string: Binding<String>{
        Binding<String>(
            get: {
                if let val = self.wrappedValue{
                    return String(val)
                }else{
                    return ""
                }
            }, set: {
                if let v = Double($0){
                    self.wrappedValue = v
                }else{
                    self.wrappedValue = nil
                }
            }
        )
    }
}
