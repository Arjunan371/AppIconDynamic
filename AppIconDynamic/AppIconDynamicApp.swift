//
//  AppIconDynamicApp.swift
//  AppIconDynamic
//
//  Created by Arjunan on 06/07/26.
//

import SwiftUI
import SwiftData

@main
struct AppIconDynamicApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
          ContentView()
                .modelContainer(for: [Swiftdatas.self, SampleModel.self])
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func applicationDidFinishLaunching(_ application: UIApplication) {
        
    }
}

protocol SampleProtocol: AnyObject {
    func sampleFunc(val: String)
}

class DefineProtocol {
    
    weak var delegate: SampleProtocol?
    
    init() {
        callDelegate()
    }
    
    func callDelegate() {
        delegate?.sampleFunc(val: "Success")
    }
}

class ConfirmedProtocol: SampleProtocol {
    var vc = DefineProtocol()
    var name = "Arjun"
    init() {
        vc.delegate = self
        vc.callDelegate()
    }
    
    func sampleFunc(val: String) {
        print(val)
    }
    func api() throws {
        let url = URL(string: "jf")
        guard let url else { throw URLError.init(.badURL)}
    }
        
}

@Model
class Swiftdatas: Identifiable {
    @Attribute(.unique) var id: String?
    var name: String?
    var age: Int?
    @Relationship(deleteRule: .cascade)
    var sample: [SampleModel]?
    
    init(name: String? = nil, age: Int? = nil, id: String? = nil, sample: [SampleModel] = []) {
        self.name = name
        self.age = age
        self.id = id
        self.sample = sample
    }
}

@Model
class SampleModel {
    var name: String?
    var age: Int?
    var id: String?
    
    init(name: String? = nil, age: Int? = nil, id: String? = nil) {
        self.name = name
        self.age = age
        self.id = id
    }
}
