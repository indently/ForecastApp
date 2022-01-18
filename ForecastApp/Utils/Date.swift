//
//  Utils.swift
//  ForecastApp
//
//  Created by Federico on 18/01/2022.
//

import Foundation

func formatDate(_ date: Date) -> String {
        let components = Calendar.current.dateComponents([.hour, .minute, .day, .month, .year], from: date)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
        let day = components.day ?? 0
        let month = components.month ?? 0
        let year = components.year ?? 0
        
        return "\(day)/\(month) (\(hour):00)"
    }
