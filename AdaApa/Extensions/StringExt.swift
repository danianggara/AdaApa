//
//  StringExt.swift
//  AdaApa
//
//  Created by Dani Anggara on 05/08/22.
//

import Foundation

enum DateFormat: String {
    case date = "yyyy-MM-dd"
    case dateTime = "yyyy-MM-dd HH:mm:ss"
    case dateTimeISO8601 = "yyyy-MM-dd'T'HH:mm:ss'Z'"
}

extension String {
    func date(format: DateFormat) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        return dateFormatter.date(from: self)
    }
}
