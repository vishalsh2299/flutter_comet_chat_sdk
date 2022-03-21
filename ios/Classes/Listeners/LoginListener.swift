//
//  LoginListener.swift
//  flutter_comet_chat_sdk
//
//  Created by Vishal Singh on 20/03/22.
//

import Foundation
import CometChatPro

public class LoginListener: CometChatLoginDelegate {
    private var eventChannelHandler: EventChannelHandler?
    
    public init(handler: EventChannelHandler?) {
        self.eventChannelHandler = handler
        CometChat.logindelegate = self
    }
    
    public func onLoginSuccess(user: User) {
       print("LOGIN SUCCESS")
        do {
            try eventChannelHandler?.success(
                event: ["loginSuccess":  Helper.userToJson(user: user)]
            )
        } catch {
            eventChannelHandler?.error(
                code: "loginFailure",
                message: error.localizedDescription
            )
        }
    }
    
    public func onLoginFailed(error: CometChatException?) {
        do {
            print("LOGIN FAILED LISTNERER")
            try eventChannelHandler?.success(
                event: ["loginFailure":  error?.errorDescription]
            )
        } catch {
            eventChannelHandler?.error(
                code: "loginFailure",
                message: error.localizedDescription
            )
        }
    }
    
    public func onLogoutSuccess() {
        do {
            print("LOGOUT SUCCESS LISTNERER")
            try eventChannelHandler?.success(
                event: ["logoutSuccess":  "success"]
            )
        } catch {
            eventChannelHandler?.error(
                code: "logoutSuccess",
                message: error.localizedDescription
            )
        }
    }
    
    public func onLogoutFailed(error: CometChatException?) {
        do {
            print("LOGOUT FAILED LISTNERER")
            try eventChannelHandler?.success(
                event: ["logoutFailure":  error?.errorDescription]
            )
        } catch {
            eventChannelHandler?.error(
                code: "logoutFailure",
                message: error.localizedDescription
            )
        }
    }
}
