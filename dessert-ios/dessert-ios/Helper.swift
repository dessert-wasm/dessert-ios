//Helpher.swift created on 04/11/2020.

import Foundation

class Helper {
    public static func parseDate(dateToParse: String) -> String {
        let regex = try! NSRegularExpression(pattern: "T.*")
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
    
    public static func githubToRaw(link: String) -> String? {
        let regex = try! NSRegularExpression(pattern: "github.com", options: .caseInsensitive)
        let range = NSRange(location: 0, length: link.count)
        
        if regex.firstMatch(in: link, options: [], range: range) != nil {
            return regex.stringByReplacingMatches(
                in: link, options: [],
                range: range, withTemplate: "raw.githubusercontent.com"
            )
        } else {
            return nil
        }
    }
    
    // link must be github.com link
    public static func githubReadMe(link: String) -> String {
        return link + "/master/README.md"
    }
    
    //
    public static func removeGIFs(markdown: String) -> String {
        let regex = try! NSRegularExpression(pattern: "!\\[GIF\\]\\(.*\\)", options: [])
        let range = NSRange(location: 0, length: markdown.count)
        
        return (
            regex.stringByReplacingMatches(
                in: markdown, options: [],
                range: range, withTemplate: ""
            )
        )
    }
    
    public static func stepUpToHTTPS(markdown: String) -> String {
        let regex = try! NSRegularExpression(pattern: "http:", options: .caseInsensitive)
        let range = NSRange(location: 0, length: markdown.count)
        
        return (
            regex.stringByReplacingMatches(
                in: markdown, options: [],
                range: range, withTemplate: "https:"
            )
        )
    }
}
