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
        }
    }
}

#Preview {
    ProfileEditor(profile: .constant(ModelData().profile))
}
