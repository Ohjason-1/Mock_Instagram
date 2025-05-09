//
//  NotificationType.swift
//  Mock Instagram
//
//  Created by Jaewon Oh on 5/8/25.
//

import Foundation

enum NotificationType: Int, Codable {
    case like
    case comment
    case follow
    
    var notificationMessage: String {
        switch self {
        case .like: return "liked one of your posts."
        case .comment: return "commented on one of your posts."
        case .follow: return "started following you."
        }
    }
}
