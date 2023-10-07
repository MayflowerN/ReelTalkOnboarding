//
//  ChipModel.swift
//  ReelTalkOnboarding
//
//  Created by Ellie on 10/6/23.
//

import Foundation
import SwiftUI

struct ChipModel: Identifiable {
    var isSelected: Bool
    let id = UUID()
    let titleKey: LocalizedStringKey
}
