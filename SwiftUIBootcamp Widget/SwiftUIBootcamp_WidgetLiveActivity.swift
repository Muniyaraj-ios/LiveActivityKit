//
//  SwiftUIBootcamp_WidgetLiveActivity.swift
//  SwiftUIBootcamp Widget
//
//  Created by Munish on 21/04/25.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct SwiftUIBootcamp_WidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct SwiftUIBootcamp_WidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: SwiftUIBootcamp_WidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension SwiftUIBootcamp_WidgetAttributes {
    fileprivate static var preview: SwiftUIBootcamp_WidgetAttributes {
        SwiftUIBootcamp_WidgetAttributes(name: "World")
    }
}

extension SwiftUIBootcamp_WidgetAttributes.ContentState {
    /*fileprivate*/ static var smiley: SwiftUIBootcamp_WidgetAttributes.ContentState {
        SwiftUIBootcamp_WidgetAttributes.ContentState(emoji: "😀")
     }
     
     /*fileprivate*/ static var starEyes: SwiftUIBootcamp_WidgetAttributes.ContentState {
         SwiftUIBootcamp_WidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: SwiftUIBootcamp_WidgetAttributes.preview) {
   SwiftUIBootcamp_WidgetLiveActivity()
} contentStates: {
    SwiftUIBootcamp_WidgetAttributes.ContentState.smiley
    SwiftUIBootcamp_WidgetAttributes.ContentState.starEyes
}
