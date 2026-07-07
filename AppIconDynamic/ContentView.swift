//
//  ContentView.swift
//  AppIconDynamic
//
//  Created by Arjunan on 06/07/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button {
             changeAppIcon()
        } label: {
            Text("Change New App Icon")
                .foregroundStyle(Color.blue)
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
