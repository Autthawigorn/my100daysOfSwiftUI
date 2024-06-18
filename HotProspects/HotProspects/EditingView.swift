//
//  EditingView.swift
//  HotProspects
//
//  Created by Autthawigorn Yortpiboot on 18/6/2567 BE.
//

import SwiftUI
import SwiftData

struct EditingView: View {
    @Bindable var prospect: Prospect
    
    var body: some View {
        Form {
            TextField("Name", text: $prospect.name)
            TextField("Email Address", text: $prospect.emailAddress)
            Toggle("Contacted", isOn: $prospect.isContacted)
        }
        .navigationTitle("Edit Prospect")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Prospect.self, configurations: config)
        let example = Prospect(name: "บักหรรม", emailAddress: "bughum@humgug.com", isContacted: false)
        
        return EditingView(prospect: example)
            .modelContainer(container)
    } catch {
        return Text("Fail to create preview \(error.localizedDescription)")
    }
}
