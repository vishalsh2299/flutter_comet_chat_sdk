import Flutter
import UIKit
import CometChatPro

public class SwiftFlutterCometChatSdkPlugin: NSObject, FlutterPlugin {
    private var loginEventTrigger: EventChannelHandler?
    private var loginEventListener: EventChannelHandler?
    private var loginListener: LoginListener?
    
    private var loginLogoutHelper: LoginLogoutHelper?
    
    public override init() {
        super.init()
    }
    
  public static func register(with registrar: FlutterPluginRegistrar) {
      let instance = SwiftFlutterCometChatSdkPlugin()
      instance.setupChannel(registrar: registrar)
  }
    
  private func setupChannel(registrar: FlutterPluginRegistrar){
      loginEventTrigger = EventChannelHandler(
          id: "plugins.flutter.io/login_event_trigger",
          messenger: registrar.messenger()
      )
      
      loginEventListener = EventChannelHandler(
          id: "plugins.flutter.io/login_event_listener",
          messenger: registrar.messenger()
      )
      
      loginLogoutHelper = LoginLogoutHelper(handler: loginEventTrigger)
      
      let channel = FlutterMethodChannel(name: "plugins.flutter.io/comet_chat_dart", binaryMessenger: registrar.messenger())
      registrar.addMethodCallDelegate(self, channel: channel)
    }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      let args = call.arguments as? [String: Any]

      switch call.method {
      case "initialize":
          let appId = args?["appId"] as? String
          let appSettings = args?["appSettings"] as? Dictionary<String, Any>
          
          let res = loginLogoutHelper?.initialize(appId: appId, appSettings: appSettings)
          result(res)
          
      case "login":
          let uid = args?["UID"] as? String
          let authKey = args?["authKey"] as? String
          let authToken = args?["authToken"] as? String
          
          loginLogoutHelper?.selectLoginMethod(authToken: authToken, authKey: authKey, UID: uid)
          result("success")
          
      case "logout":
          loginLogoutHelper?.logout()
          result("success")
          
      case "add_login_listeners":
          loginListener = LoginListener(handler: loginEventListener)
          result("success")
          
      case "remove_login_listeners":
          let _ = loginEventListener?.onCancel(withArguments: nil)
          result("success")
      default:
          result(FlutterMethodNotImplemented)
      }
  }
}


extension Dictionary {
    var jsonStringRepresentation: String? {
        guard let theJSONData = try? JSONSerialization.data(withJSONObject: self,
                                                            options: [.prettyPrinted]) else {
            return nil
        }

        return String(data: theJSONData, encoding: .ascii)
    }
}
