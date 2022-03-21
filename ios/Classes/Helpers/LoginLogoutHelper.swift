//
//  LoginLogoutHelper.swift
//  flutter_comet_chat_sdk
//
//  Created by Vishal Singh on 21/03/22.
//

import Foundation
import CometChatPro

public class LoginLogoutHelper {
    private var eventChannelHandler: EventChannelHandler?
    
    public init(handler: EventChannelHandler?) {
        self.eventChannelHandler = handler
    }
    
    public func initialize(appId: String?, appSettings: Dictionary<String, Any>?) -> Any {
        let mySettings: AppSettings = Helper.getAppSettings(value: appSettings)
        var result: Any = "success";
  
        if let tAppId = appId {
            CometChat.init(appId: tAppId ,appSettings: mySettings, onSuccess: { (isSuccess) in
                      if (isSuccess) {
                          print("CometChat Pro SDK intialise successfully.")
                          result = true
                      }
                  }) { (error) in
                          print("CometChat Pro SDK failed intialise with error: \(error.errorDescription)")
                      result = error.errorDescription
                  }
        }
        return result
    }
    
    public func selectLoginMethod(authToken: String?, authKey: String?, UID: String?) {
        if let tAuthToken = authToken {
            loginWithAuthToken(tAuthToken: tAuthToken)
        } else if let tUID = UID,
                  let tAuthKey = authKey {
           loginWithAuthKey(tUID: tUID, tAuthKey: tAuthKey)
        }
    }
    
    private func loginWithAuthToken(tAuthToken: String) {
        if CometChat.getLoggedInUser() == nil {
          
          CometChat.login(authToken: tAuthToken , onSuccess: { (user) in
              do {
                  try self.eventChannelHandler?.success(event: ["loginSuccess": Helper.userToJson(user: user)])
              } catch {
                  self.eventChannelHandler?.error(code: "loginFailure", message: error.localizedDescription)
              }

          }) { (error) in
            print("Login failed with error: " + error.errorDescription);
              do {
                  try self.eventChannelHandler?.success(event: ["loginFailure" : error.errorDescription])
              } catch {
                  self.eventChannelHandler?.error(code: "loginFailure", message: error.localizedDescription)
              }
          }
          
        }
    }
    
    private func loginWithAuthKey(tUID: String, tAuthKey: String) {
    
        if CometChat.getLoggedInUser() == nil {
            CometChat.login(UID: tUID, authKey: tAuthKey,onSuccess: { (user) in

                print("Login successful : " + user.stringValue())
                do {
                    try self.eventChannelHandler?.success(event: ["loginSuccess":  Helper.userToJson(user: user)])
                } catch {
                    self.eventChannelHandler?.error(code: "loginFailure", message: error.localizedDescription)
                }

            }) { (error) in
              print("Login failed with error: " + error.errorDescription);
                do {
                    try self.eventChannelHandler?.success(event: ["loginFailure" : error.errorDescription])
                } catch {
                    self.eventChannelHandler?.error(code: "loginFailure", message: error.localizedDescription)
                }
            }
        }
    }
    
    public func logout() {
        CometChat.logout(onSuccess: { (response) in
          print("Logout successfully.")
            do {
                try self.eventChannelHandler?.success(event: ["logoutSuccess": "success"])
            } catch {
                self.eventChannelHandler?.error(code: "logoutFailure", message: error.localizedDescription)
            }

        }) { (error) in

          print("logout failed with error: " + error.errorDescription);
            do {
                try self.eventChannelHandler?.success(event: ["logoutFailure" : error.errorDescription])
            } catch {
                self.eventChannelHandler?.error(code: "logoutFailure", message: error.localizedDescription)
            }
        }
    }
}
