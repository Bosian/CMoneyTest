//
//  DateExtension.swift
//  CMoneyTest
//
//  Created by 劉柏賢 on 2021/9/25.
//

import Foundation

extension Date {
    
    /// 轉字串
    ///
    /// - Parameters:
    ///   - format: "yyyy/MM/dd HH:mm:ss" or "yyy/MM/dd" (民國年)
    ///   - locale: 地區
    ///   - timeZone: 時區
    ///   - calendar: 日曆
    /// - Returns: String
    public func toString(_ format: String, locale: Locale? = nil, timeZone: TimeZone = TimeZone.current, calendar: Calendar = Calendar(identifier: Calendar.Identifier.gregorian)) -> String {

        let locale: Locale = locale ?? Locale(identifier: "en_US_POSIX")

        let dateFormater: DateFormatter = DateFormatter()

        dateFormater.locale = locale
        dateFormater.dateFormat = format
        dateFormater.timeZone = timeZone
        dateFormater.calendar = calendar

        return dateFormater.string(from: self)
    }
}
