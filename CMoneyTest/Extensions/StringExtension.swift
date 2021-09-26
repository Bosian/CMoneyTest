//
//  StringExtension.swift
//  CMoneyTest
//
//  Created by 劉柏賢 on 2021/9/25.
//

import Foundation

extension String {

    /**
     * 清除空白
     */
    public var trim: String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }

    /**
     轉Date
     
     - parameter dateformat:
     - parameter locale:
     
     - returns: NSDate
     */

    /// 轉Date
    ///
    /// - Parameters:
    ///   - format: "yyyy/MM/dd HH:mm:ss" or "yyy/MM/dd" (民國年)
    ///   - locale: 地區
    ///   - timeZone: 時區
    ///   - calendar: 日曆
    /// - Returns: Date
    public func toDate(_ format: String, locale: Locale = Locale.current, timeZone: TimeZone = TimeZone.current, calendar: Calendar = Calendar(identifier: Calendar.Identifier.gregorian)) -> Date? {
        guard !self.trim.isEmpty else {
            return nil
        }

        let dateFormater = DateFormatter()

        dateFormater.locale = locale
        dateFormater.dateFormat = format
        dateFormater.timeZone = timeZone
        dateFormater.calendar = calendar

        return dateFormater.date(from: self)
    }
}
