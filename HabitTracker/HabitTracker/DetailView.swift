//
//  DetailView.swift
//  HabitTracker
//
//  Created by Autthawigorn Yortpiboot on 27/4/2567 BE.
//

import SwiftUI

struct DetailView: View {
  
  var activityItem: ActivityItem
  
  var body: some View {
    NavigationView {
      VStack {
          Text(activityItem.title)
          Text(activityItem.category)
          Text(String(activityItem.amount))
        Text(activityItem.detail)

          
      }
      .navigationTitle("\(activityItem.title)")
    }
  }
}

#Preview {
  DetailView(activityItem: ActivityItem(title: "Sample Activity", category: "Study", detail: "This is a sample description", amount: 10))
}
