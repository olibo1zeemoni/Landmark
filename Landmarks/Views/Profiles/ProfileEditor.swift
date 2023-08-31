//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by Olibo moni on 30/08/2023.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: +1, to: profile.goalDate)!
        return min...max
    }
    
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
                .pickerStyle(.segmented)
            }
            
            DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
                Text("Goal Date")
                    .bold()
            }
            
        }
    }
    
}



#Preview("Profile Editor") {
    ProfileEditor(profile: .constant(.default))
}
