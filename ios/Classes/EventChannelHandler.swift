//
//  EventChannelHandler.swift
//  flutter_comet_chat_sdk
//
//  Created by Vishal Singh on 15/03/22.
//

import Foundation
import Flutter

public class EventChannelHandler: NSObject, FlutterStreamHandler {
    private var eventSink: FlutterEventSink?
    
    public func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        self.eventSink = events
        return nil
    }
    
    public func onCancel(withArguments arguments: Any?) -> FlutterError? {
        eventSink = nil
        return nil
    }
    
    public init(id: String, messenger: FlutterBinaryMessenger) {
        super.init()
        let eventChannel = FlutterEventChannel(name: id, binaryMessenger: messenger)
        eventChannel.setStreamHandler(self)
    }
    
    
    public func success(event: Any?) throws {
        if eventSink != nil {
            eventSink?(event)
        }
    }
    
    public func error(code: String, message: String?, details: Any? = nil) {
        if eventSink != nil {
            eventSink?(FlutterError(code: code, message: message, details: details))
        }
    }
    
}
