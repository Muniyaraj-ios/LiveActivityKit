//
//  SwiftUIBootcamp_Widget.swift
//  SwiftUIBootcamp Widget
//
//  Created by Munish on 21/04/25.
//

import WidgetKit
import ActivityKit
import SwiftUI

struct TimerActivityView: View {
    
    let context: ActivityViewContext<TimeAttribute>
    
    var body: some View {
        NotificationView()
            .onTapGesture {
                print("from timer activity")
            }
    }
    
}

struct SwiftUIBootcamp_Widget: Widget {
    
    let kind: String = "SwiftUIBootcamp_Widget"

    var body: some WidgetConfiguration {
        
        ActivityConfiguration(for: TimeAttribute.self) { context in
            TimerActivityView(context: context)
        } dynamicIsland: { context in
            // Dynamic Island UI (not a regular View)
            DynamicIsland {
                // Expanded region
                DynamicIslandExpandedRegion(.leading) {
                    Text("⏱")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text(context.attributes.timerName)
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text(context.state.endTime, style: .timer)
                        .font(.headline)
                }
            } compactLeading: {
                Text("⏱")
            } compactTrailing: {
                Text(context.state.endTime, style: .timer)
            } minimal: {
                Text("⏱")
            }
        }
        
    }
}
