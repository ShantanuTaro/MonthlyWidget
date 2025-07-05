//
//  MonthlyWidgetBundle.swift
//  MonthlyWidget
//
//  Created by Shantanu Taro on 05/07/25.
//

import WidgetKit
import SwiftUI

@main
struct MonthlyWidgetBundle: WidgetBundle {
    var body: some Widget {
        MonthlyWidget()
        MonthlyWidgetControl()
        MonthlyWidgetLiveActivity()
    }
}
