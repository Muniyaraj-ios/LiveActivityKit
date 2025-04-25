//
//  ContentView.swift
//  SwiftUIBootCamp
//
//  Created by Munish on 21/04/25.
//

import SwiftUI
import ActivityKit

struct ContentView: View {
    
    @State private var activity: Activity<TimeAttribute>? = nil
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            Button {
                startActivity()
            } label: {
                Text("Start Activity")
            }
            
            Button {
                stopActivity()
            } label: {
                Text("Stop Activity")
            }

        }.task {
            await requestLiveActivityAuthorization()
        }
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
    }
    
    
    func requestLiveActivityAuthorization() async {
        let isEnabled = await ActivityAuthorizationInfo().areActivitiesEnabled
        print("Live Activity enabled: \(isEnabled)")
    }
    
    func startActivity() {
        let attributes = TimeAttribute(timerName: "Dummy Timer")
        let endTime: Date = .now // countdown from 60 seconds
        
        let contentState = TimeAttribute.TimerStatus(endTime: endTime)
        let content = ActivityContent(state: contentState, staleDate: .now.addingTimeInterval(5)) // Valid for 2 mins
        
        do {
            activity = try Activity<TimeAttribute>.request(attributes: attributes, content: content, pushType: nil)
            print("Live Activity started with ID: \(activity?.id ?? "N/A")")
        } catch {
            print("Failed to start activity: \(error.localizedDescription)")
        }
    }

    func stopActivity() {
        guard let activity = activity else {
            print("No activity to stop.")
            return
        }
        
        let finalState = TimeAttribute.TimerStatus(endTime: .now)
        let finalContent = ActivityContent(state: finalState, staleDate: .now)
        
        Task {
            await activity.end(finalContent, dismissalPolicy: .immediate)
            print("Live Activity ended.")
        }
    }

}
