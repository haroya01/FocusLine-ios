//
//  TokenPair.swift
//  focus-time-ios
//
//  Created by 김동현 on 7/2/25.
//

import SwiftUI

struct SocialLoginButton: View {
    let title: String
    let icon: String
    let isSystemIcon: Bool
    let iconSize: CGFloat?
    let iconColor: Color?
    let backgroundColor: Color
    let foregroundColor: Color
    let font: Font
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 4) {
                if isSystemIcon {
                    if iconColor == nil {
                        Image(systemName: icon)
                            .font(.system(size: iconSize ?? 18, weight: .medium))
                            .foregroundStyle(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color(red: 0.4, green: 0.7, blue: 0.6),
                                        Color(red: 0.3, green: 0.5, blue: 0.7)
                                    ]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                    } else {
                        Image(systemName: icon)
                            .font(.system(size: iconSize ?? 18, weight: .medium))
                            .foregroundColor(iconColor)
                    }
                } else {
                    if iconColor == nil {
                        Image(icon)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: iconSize ?? 18, height: iconSize ?? 18)
                            .foregroundStyle(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color(red: 0.4, green: 0.7, blue: 0.6),
                                        Color(red: 0.3, green: 0.5, blue: 0.7)
                                    ]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                    } else {
                        Image(icon)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: iconSize ?? 18, height: iconSize ?? 18)
                            .foregroundColor(iconColor)
                    }
                }
                
                Text(title)
                    .font(font)
                    .foregroundColor(foregroundColor)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 44)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        }
    }
}

extension SocialLoginButton {
    static func google(action: @escaping () -> Void) -> SocialLoginButton {
        return SocialLoginButton(
            title: NSLocalizedString("google_login", comment: ""),
            icon: "google",
            isSystemIcon: false,
            iconSize: nil,
            iconColor: nil, 
            backgroundColor: Color(hex: "#555555"),
            foregroundColor: .white,
            font: .custom("Roboto-Medium", size: 16),
            action: action
        )
    }
    
    static func email(action: @escaping () -> Void) -> SocialLoginButton {
        SocialLoginButton(
            title: NSLocalizedString("email_login", comment: ""),
            icon: "envelope",
            isSystemIcon: true,
            iconSize: 16,
            iconColor: nil,
            backgroundColor: Color(hex: "#555555"),
            foregroundColor: .white,
            font: .system(size: 16, weight: .medium),
            action: action
        )
    }
}
