//
//  Helper.swift
//  flutter_comet_chat_sdk
//
//  Created by Vishal Singh on 15/03/22.
//

import Foundation
import CometChatPro

public class Helper {
    
    static func getAppSettings(value: Dictionary<String, Any>?) -> AppSettings {
        if(value != nil) {
        let region = value?["region"] as? String
        let subscriptionType = value?["subscriptionType"] as? String
        let roles = value?["roles"] as? [String]
            
        if let tRegion = region,
           let tSubscriptionType = subscriptionType {
            var appSettings: AppSettings = AppSettings.AppSettingsBuilder().setRegion(region: tRegion).build()
            
            switch tSubscriptionType {
            case "ALL_USERS":
                appSettings = AppSettings.AppSettingsBuilder().subscribePresenceForAllUsers().setRegion(region: tRegion).build()
                break
            case "FRIENDS":
                appSettings = AppSettings.AppSettingsBuilder().subscribePresenceForFriends().setRegion(region: tRegion).build()
                break
            case "ROLES":
                appSettings = AppSettings.AppSettingsBuilder().subcribePresenceForRoles(roles: roles ?? []).setRegion(region: tRegion).build()
                break
            case "NONE":
                appSettings = AppSettings.AppSettingsBuilder().setRegion(region: tRegion).build()
                break
            default:
                return appSettings
            }
            return appSettings
        }
        }
        return AppSettings.AppSettingsBuilder().subscribePresenceForAllUsers().setRegion(region: "US").build()
    }
    
    static func userToJson(user: User) -> Dictionary<String, Any?> {
        let mapData: Dictionary<String, Any?> = [
            "uid": user.uid,
            "name": user.name,
            "avatar": user.avatar,
            "link": user.link,
            "role": user.role,
            "status": user.status.rawValue,
            "statusMessage": user.statusMessage,
            "lastActiveAt": user.lastActiveAt,
            "hasBlockedMe": user.hasBlockedMe,
            "blockedByMe": user.blockedByMe,
            "metadata": user.metadata,
            "tags": user.tags,
            "deactivatedAt": user.deactivatedAt,
        ]
        
        return mapData
    }
}
