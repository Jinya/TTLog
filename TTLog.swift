//
//  TTLog.swift
//
//  Created by Jinya on 2018/3/25.
//  Copyright (c) 2018 Jinya
//
//  https://github.com/jinyax/ttlog || http://jinya.me

import Foundation

struct TTLog {
    
    private static let logDateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
    private static let logTextFormat = "[%@] %@:%@ %@ %@: %@"
    
    public enum TTLogType {
        case verbose, info, warning, debug, error
        
        var description: String {
            return String(describing: self).uppercased()
        }
        
        var tagText: String {
            switch self {
            case .verbose: return "📣" + self.description
            case .info:    return "ℹ️" + self.description
            case .warning: return "⚠️" + self.description
            case .debug:   return "👻" + self.description
            case .error:   return "❌" + self.description
            }
        }
    }
    
    public static func verbose(_ items: Any..., separator: String = " ", terminator: String = "\n", file: String = #file, line: Int = #line, function: String = #function) {
        log(.verbose, items, separator, terminator, file, line, function)
    }
    
    public static func info(_ items: Any..., separator: String = " ", terminator: String = "\n", file: String = #file, line: Int = #line, function: String = #function) {
        log(.info, items, separator, terminator, file, line, function)
    }
    
    public static func warning(_ items: Any..., separator: String = " ", terminator: String = "\n", file: String = #file, line: Int = #line, function: String = #function) {
        log(.warning, items, separator, terminator, file, line, function)
    }
    
    public static func debug(_ items: Any..., separator: String = " ", terminator: String = "\n", file: String = #file, line: Int = #line, function: String = #function) {
        log(.debug, items, separator, terminator, file, line, function)
    }
    
    public static func error(_ items: Any..., separator: String = " ", terminator: String = "\n", file: String = #file, line: Int = #line, function: String = #function) {
        log(.error, items, separator, terminator, file, line, function)
    }
    
    private static func log(_ type: TTLogType ,_ items: [Any], _ separator: String, _ terminator: String, _ file: String, _ line: Int, _ function: String) {
        #if DEBUG
        DispatchQueue(label: "TTLog").async {
            let date = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = logDateFormat
            let dateString = dateFormatter.string(from: date)
            
            let arguments: [CVarArg] = [dateString,
                                        file.lastPathComponent,
                                        String(line),
                                        function,
                                        type.tagText,
                                        items.map({ String(describing: $0) }).joined(separator: separator),
                                        ]
            let result = String(format: logTextFormat, arguments: arguments) + terminator
            Swift.print(result, separator: "", terminator: "")
        }
        #endif
    }
}

extension String {
    var lastPathComponent: String {
        return NSString(string: self).lastPathComponent
    }
}

