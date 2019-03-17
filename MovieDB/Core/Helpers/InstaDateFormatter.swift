//
//  InstaDateFormatter.swift
//  MovieDB
//
//  Created by Mo-Ramadan Abdelhafez on 3/11/19.
//  Copyright © 2019 Mo-Ramadan Abdelhafez. All rights reserved.
//

import Foundation

//MARK: I created this shared DateFormatter as DateFormatter instantiation is too expensive
// I had a similar issue in our AgendaFeature, where each cell was creating a new date-formatter
// in order to perform some operations on dates! which was taking too many time when we analyzed it using TIME-PROFILER

class InstaDateFormatter {
    static let shared = InstaDateFormatter()
    private var formatter: DateFormatter
    private init() {
        formatter = DateFormatter()
        formatter.timeZone = TimeZone(abbreviation: "GMT")
        formatter.locale = Locale(identifier:  "en")
    }
    
    func getString(date: Date, format: String) -> String {
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
    
    func getDate(string: String, format: String) -> Date? {
        formatter.dateFormat = format
        return formatter.date(from: string)
    }
}
