//
//  MonthlyWidget.swift
//  MonthlyWidget
//
//  Created by Shantanu Taro on 05/07/25.
//

import WidgetKit
import SwiftUI

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> DayEntry {
        DayEntry(date: Date())
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> DayEntry {
        DayEntry(date: Date())
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<DayEntry> {
        var entries: [DayEntry] = []

        let currentDate = Date()
        for dayOffset in 0 ..< 7 {
            let entryDate = Calendar.current.date(byAdding: .day, value: dayOffset, to: currentDate)!
            let startOfDay = Calendar.current.startOfDay(for: entryDate)
            let entry = DayEntry(date: startOfDay)
            entries.append(entry)
        }

        return Timeline(entries: entries, policy: .atEnd)
    }

//    func relevances() async -> WidgetRelevances<ConfigurationAppIntent> {
//        // Generate a list containing the contexts this widget is relevant in.
//    }
}

struct DayEntry: TimelineEntry {
    let date: Date
}

struct MonthlyWidgetEntryView : View {
    var entry: DayEntry
    var config: MonthConfig
    
    init(entry: DayEntry) {
        self.entry = entry
        self.config = MonthConfig.determineConfig(from: entry.date)
    }

    var body: some View {
        ZStack {
            VStack(spacing: 12){
                HStack(spacing: 4){
                    Text(config.emojiText)
                        .font(.title)
                    Text(entry.date.weekdayDisplayFormat)
                        .font(.title2)
                        .fontWeight(.bold)
                        .lineLimit(1)
                        .minimumScaleFactor(0.6)
                        .foregroundColor(config.weekdayTextColor)
                }

                Text(entry.date.dayMonthDisplayFormat)
                    .font(.system(size: 40, weight: .heavy))
                    .foregroundColor(config.dayTextColor)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
            }
        }
        .containerBackground(for: .widget){
            ContainerRelativeShape()
                .fill(config.backgroundColor.gradient)
        }
    }
}

struct MonthlyWidget: Widget {
    let kind: String = "MonthlyWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, provider: Provider()) { entry in
            MonthlyWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Monthly Style Widget")
        .description("The theme of widget changes based on month")
        .supportedFamilies([.systemSmall])
    }
}

struct MonthlyWidget_Preview: PreviewProvider {
    
    static var previews: some View{
        MonthlyWidgetEntryView(entry: DayEntry(date: dateToDisplay(month: 3, day: 2)))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
    static func dateToDisplay(month: Int, day: Int)->Date{
        let components = DateComponents(calendar: Calendar.current, year: 2025, month: month, day: day)
        
        return Calendar.current.date(from: components)!
    }
}


#Preview(as: .systemSmall) {
    MonthlyWidget()
} timeline: {
    DayEntry(date: .now)
}

extension Date{
    var weekdayDisplayFormat: String {
        return formatted(.dateTime.weekday(.wide))
    }
    var dayMonthDisplayFormat: String {
        return formatted(.dateTime.day(.twoDigits) .month(.twoDigits))
    }
}
