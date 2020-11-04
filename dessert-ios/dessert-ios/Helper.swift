//Helpher.swift created on 04/11/2020.

import Foundation

class Helper {
    public static func parseDate(dateToParse: String) -> String {
        let regex = try! NSRegularExpression(pattern: "T.")
        let range = NSRange(location: 0, length: dateToParse.count)
        
        if regex.firstMatch(in: dateToParse, options: [], range: range) != nil {
            return regex.stringByReplacingMatches(
                in: dateToParse, options: [],
                range: range, withTemplate: ""
            )
        } else {
            return "invalid date"
        }
    }
}
