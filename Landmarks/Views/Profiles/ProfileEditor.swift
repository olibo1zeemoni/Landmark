//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by Olibo moni on 30/08/2023.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    
    var body: some View {
        List {
            HStack {
                Text("Username").bold()
                Divider()
                TextField("Username", text: $profile.username)
            }
            
            
            Toggle(isOn: $profile.prefersNotifications, label: {
                Text("Enable Notification")
                    .bold()
            })
            
            VStack(alignment: .leading, spacing: 20) {
                Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                    ForEach(Profile.Season.allCases) { season in
                        Text(season.rawValue)
                            .tag(season)
                    }
                }
                .pickerStyle(.palette)
            }
            
        }
    }
}

#Preview {
    ProfileEditor(profile: .constant(.default))
}
