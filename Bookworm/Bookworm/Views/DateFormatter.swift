//
//  DateFormatter.swift
//  Bookworm
//
//  Created by Autthawigorn Yortpiboot on 21/5/2567 BE.
//


import Foundation

struct CustomDateFormatter {
    
    var formatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
}
