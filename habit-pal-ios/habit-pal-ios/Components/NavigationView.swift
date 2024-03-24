//
//  NavigationView.swift
//  habit-pal-ios
//
//  Created by Yannian Liu on 25/3/2024.
//

import Foundation
import UIToolbox
import SwiftUI

struct NavigationView: View {
    
    let configuration: NavigationViewConfiguration
    
    var body: some View {
        ZStack {
            
            TextView(textConfiguration: configuration.textConfiguration)
            if let closeButton = configuration.closeButton {
                HStack {
                    Spacer()
                    StatableButtonView(configuration: closeButton)
                }
            }
        }
    }
}

class NavigationViewConfiguration {
    public var textConfiguration: TextConfiguration
    public var closeButton: StatableButtonViewConfiguration<Image>?
    
    init(title: String, closeAction: (()->Void)?) {
        textConfiguration = .init(
            title: title,
            contentConfiguration: .navigation,
            plateConfiguration: nil
        )
        
        if let closeAction = closeAction {
            closeButton = StatableButtonViewConfiguration<Image>.closeButton {
                closeAction()
            }
        }
    }
}

