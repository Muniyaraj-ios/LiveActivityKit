//
//  TimeAttribute.swift
//  SwiftUIBootCamp
//
//  Created by Munish on 21/04/25.
//


import ActivityKit
import SwiftUI

struct TimeAttribute: ActivityAttributes{
    public typealias TimerStatus = ContentState
    
    public struct ContentState: Codable, Hashable{
        var endTime: Date
    }
    
    var timerName: String
}
