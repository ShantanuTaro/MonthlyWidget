//
//  MonthConfig.swift
//  Monthly
//
//  Created by Shantanu Taro on 05/07/25.
//

import SwiftUI

struct MonthConfig {
    let backgroundColor: Color
    let emojiText: String
    let weekdayTextColor: Color
    let dayTextColor: Color
    
    static func determineConfig(from date: Date) -> MonthConfig {
        let monthInt = Calendar.current.component(.month, from: date)
        
        switch monthInt {
        case 1: // January - Winter
            return MonthConfig(backgroundColor: .winterBlue, emojiText: "❄️", weekdayTextColor: .white.opacity(0.6), dayTextColor: .white.opacity(0.8))
        case 2: // February - End of winter
            return MonthConfig(backgroundColor: .lightGray, emojiText: "☁️", weekdayTextColor: .white.opacity(0.7), dayTextColor: .white)
        case 3: // March - Spring
            return MonthConfig(backgroundColor: .paleYellow, emojiText: "🌼", weekdayTextColor: .black.opacity(0.6), dayTextColor: .black)
        case 4: // April - Hot & dry
            return MonthConfig(backgroundColor: .burntOrange, emojiText: "🌞", weekdayTextColor: .white.opacity(0.6), dayTextColor: .white)
        case 5: // May - Peak summer
            return MonthConfig(backgroundColor: .sunsetRed, emojiText: "🔥", weekdayTextColor: .white.opacity(0.5), dayTextColor: .white)
        case 6: // June - Start of monsoon
            return MonthConfig(backgroundColor: .monsoonBlue, emojiText: "🌧️", weekdayTextColor: .white.opacity(0.7), dayTextColor: .white)
        case 7: // July - Rainy
            return MonthConfig(backgroundColor: .darkCloud, emojiText: "☔️", weekdayTextColor: .white.opacity(0.8), dayTextColor: .white)
        case 8: // August - Humid & lush
            return MonthConfig(backgroundColor: .lushGreen, emojiText: "🌿", weekdayTextColor: .white.opacity(0.6), dayTextColor: .white)
        case 9: // September - Post monsoon
            return MonthConfig(backgroundColor: .mintGreen, emojiText: "🌦️", weekdayTextColor: .black.opacity(0.6), dayTextColor: .black)
        case 10: // October - Pleasant autumn
            return MonthConfig(backgroundColor: .autumnOrange, emojiText: "🍁", weekdayTextColor: .black.opacity(0.7), dayTextColor: .black)
        case 11: // November - Diwali season
            return MonthConfig(backgroundColor: .diwaliGold, emojiText: "🪔", weekdayTextColor: .white.opacity(1), dayTextColor: .white)
        case 12: // December - Cold & festive
            return MonthConfig(backgroundColor: .coolPurple, emojiText: "🎄", weekdayTextColor: .white.opacity(0.6), dayTextColor: .white)
        default:
            return MonthConfig(backgroundColor: .gray, emojiText: "📆", weekdayTextColor: .white, dayTextColor: .white)
        }
    }
}
