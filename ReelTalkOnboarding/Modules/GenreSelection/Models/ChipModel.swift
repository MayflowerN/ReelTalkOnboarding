//
//  ChipModel.swift
//  ReelTalkOnboarding
//
//  Created by Ellie on 10/6/23.
//

import Foundation
import SwiftUI


struct ChipModel: Identifiable {
    // Indicates whether the chip is selected.
    var isSelected: Bool
    // Unique identifier for the chip.
    let id = UUID()
    // Localized title for the chip.
    let titleKey: LocalizedStringKey
}
