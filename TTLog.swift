//
//  TTLog.swift
//
//  Created by Jinya on 2018/3/25.
//  Copyright (c) 2018 Jinya
//
//  https://github.com/jinyax/ttlog || http://jinya.me

import Foundation

struct TTLog {
    
    public enum TTLogType {
        case verbose, info, warning, debug, error
        
        var description: String {
            return String(describing: self).uppercased()
        }
        
        var stringWithColor: String {
            switch self {
            case .verbose: return self.description.withColor("#C8C8C8")
            case .info:    return self.description.withColor("#0000FF")
            case .warning: return self.description.withColor("#00FF00")
            case .debug:   return self.description.withColor("#FFFB00")
            case .error:   return self.description.withColor("#FF0000")
            }
        }
    }
    
    public func verbose(_ items: Any..., separator: String = "", terminator: String = "\n", file: String = #file, line: Int = #line, function: String = #function) {
        log(.verbose, items, separator, terminator, file, line, function)
    }
    
    public func info(_ items: Any..., separator: String = "", terminator: String = "\n", file: String = #file, line: Int = #line, function: String = #function) {
        log(.info, items, separator, terminator, file, line, function)
    }
    
    public func warning(_ items: Any..., separator: String = "", terminator: String = "\n", file: String = #file, line: Int = #line, function: String = #function) {
        log(.warning, items, separator, terminator, file, line, function)
    }
    
    public func debug(_ items: Any..., separator: String = "", terminator: String = "\n", file: String = #file, line: Int = #line, function: String = #function) {
        log(.debug, items, separator, terminator, file, line, function)
    }
    
    public func error(_ items: Any..., separator: String = "", terminator: String = "\n", file: String = #file, line: Int = #line, function: String = #function) {
        log(.error, items, separator, terminator, file, line, function)
    }
    
    private func log(_ type: TTLogType ,_ items: [Any], _ separator: String, _ terminator: String, _ file: String, _ line: Int, _ function: String) {
//        #if DEBUG
//        #endif
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
        let dateString = dateFormatter.string(from: date)
        let fileString = file.lastPathComponent
        let lineString = line
        let columnString = column
        let typeString = type.stringWithColor
        let message = items.map({ String(describing: $0) }).joined(separator: separator)
        
        // Coming soon
    }
}

extension String {
    // The last path component of the receiver.
    var lastPathComponent: String {
        return NSString(string: self).lastPathComponent
    }
 
    // A new string made by deleting the extension from the receiver.
    var stringByDeletingPathExtension: String {
        return NSString(string: self).deletingPathExtension
    }
 
    /**
     Returns a string colored with the specified color.
 
     - parameter color: The string representation of the color. e.g. #
 
     - returns: A string colored with the specified color.
     */
    func withColor(_ color: String) -> String {
        return "\u{001b}[fg\(color);\(self)\u{001b}[;"
    }
}

