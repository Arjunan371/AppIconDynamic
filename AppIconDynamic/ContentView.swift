//
//  ContentView.swift
//  AppIconDynamic
//
//  Created by Arjunan on 06/07/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    // filter: #Predicate<Swiftdatas>{ student in student.name == "name1" }
    @State var vm = ViewModel()
    @Query(sort: \Swiftdatas.name, order: .forward) var student: [Swiftdatas]
    
    var body: some View {
        VStack {
            Button {
                changeAppIcon()
            } label: {
                Text("Change New App Icon")
                    .foregroundStyle(Color.blue)
            }
            listView
        }
        .onAppear {
            //           print(stringToString("03-03-2003"))
            //            let _ = ConfirmedProtocol()
            //            let con = ConfirmedProtocol()
            //            let val = con
            //            val.name = "Arjunan"
            //            let mod = Model()
            //            var copiedMod = mod
            //            copiedMod.name = "Arjun"
            //            print(mod.name)
            //            print(copiedMod.name)
//            for index in 1..<10 {
//                let data = Swiftdatas(name: "name\(index)", age: 10, id: "\(index + 1)")
//                context.insert(data)
//            }
            let _ = Person()
        }
        
    }
    
    var listView: some View {
        List(student) {
            ChildView(model: $0, vm: vm)
                .equatable()
            Text($0.name ?? "")
                .padding(10)
        }
    }
    
    func changeAppIcon() {
        UIApplication.shared.setAlternateIconName(appIconName) { error in
            if let error = error {
                print("Appicon change failed: \(error.localizedDescription)")
            } else {
                print("Appicon changed successfully")
            }
        }
    }
    
    var appIconName: String? {
        if UIApplication.shared.alternateIconName == nil {
            return "AppIcon1"
        }
        
        return nil
    }
}

#Preview {
    ContentView()
}

func stringToString(_ value: String) -> String {
    let dateformatter = DateFormatter()
    dateformatter.dateFormat = "dd-MM-yyyy"
    guard let date = dateformatter.date(from: value) else { return ""}
    dateformatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    return dateformatter.string(from: date)
}

struct Model {
    var name: String = "Sathish"
}


struct Student: Equatable {

    let id: UUID

    let name: String
    
//    static func == (lhs: Self, rhs: Self) -> Bool {
//        lhs.id == rhs.id
//    }

}

let s1 = Student(id: UUID(), name: "Arjunan")

let s2 = Student(id: UUID(), name: "Arjunan")

//print(s1 == s2)

class Person {

    func introduce() {

        print(self)

        print(Self.self)

    }

}

@Observable
class ViewModel {
    var name: String = ""
    @ObservationIgnored
    var age: Int = 0
}

struct ChildView: View, Equatable {
    
var model: Swiftdatas
    @Bindable var vm: ViewModel
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.model.name == rhs.model.name &&
        lhs.vm.age == rhs.vm.age
    }
    var body: some View {
        
    }
}
