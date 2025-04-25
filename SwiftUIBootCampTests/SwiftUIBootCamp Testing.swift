//
//  SwiftUIBootCamp Testing.swift
//  SwiftUIBootCampTests
//
//  Created by Munish on 23/04/25.
//

import Testing

struct SwiftUIBootCamp_Testing {

    @Test func shouldCheckValuesMatches() async throws {
        
        let value: Int = 20 * 1
        
        let value_added: Int = 40 / 2 * 2
        
        #expect(value == value_added, "Both value are same")
    }

}
