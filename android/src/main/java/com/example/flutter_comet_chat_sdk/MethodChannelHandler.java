package com.example.flutter_comet_chat_sdk;

import android.content.Context;

import com.cometchat.pro.core.AppSettings;
import com.cometchat.pro.core.CometChat;
import com.cometchat.pro.exceptions.CometChatException;
import com.example.flutter_comet_chat_sdk.Helper.CallingHelpers;
import com.example.flutter_comet_chat_sdk.Helper.GetValue;
import com.example.flutter_comet_chat_sdk.Helper.LoginLogoutHelper;

import java.util.HashMap;
import java.util.Map;

import io.flutter.Log;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class MethodChannelHandler extends FlutterActivity implements MethodChannel.MethodCallHandler {
    private Context applicationContext;
    private EventChannelHelper loginEventTrigger;
    private EventChannelHelper loginEventListener;
    private EventChannelHelper callingEventHelper;

    private CallingHelpers callingHandler;

    private LoginLogoutHelper loginHandler;

    private GetValue getValue;

    public MethodChannelHandler(Context context, EventChannelHelper loginEventTrigger, EventChannelHelper loginEventListener,  EventChannelHelper callingEventHelper) {
        this.getValue = new GetValue();

        this.applicationContext = context;
        this.loginEventTrigger = loginEventTrigger;
        this.loginEventListener = loginEventListener;
        this.loginHandler = new LoginLogoutHelper(loginEventTrigger, loginEventListener);

        this.callingEventHelper = callingEventHelper;
        this.callingHandler = new CallingHelpers(callingEventHelper);
    }

    @Override
    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
        switch (call.method) {
            case "initialize":
                initializeApp(result, getValue.getValue(call, "appId"), getValue.getAppSettings(call, "appSettings"));
                break;
            case "login":
                loginHandler.selectLoginMethod(getValue.getValue(call, "authToken"), getValue.getValue(call, "authKey"),
                        getValue.getValue(call, "UID"));
                result.success("Success");
                break;
            case "logout":
                loginHandler.logout();
                result.success("Success");
                break;
            case "add_login_listeners":
                loginHandler.addLoginListener(getValue.getValue(call, "uniqueId"));
                result.success("Success");
                break;
            case "remove_login_listeners":
                loginHandler.removeLoginListener();
                result.success("Success");
                break;
            case "start_call":
                callingHandler.startCall(getValue.getValue(call, "sessionID"),
                        getValue.getBooleanValue(call, "enableDefaultLayout"), getValue.getBooleanValue(call, "audioOnly"));
            case "initiate_call":
                callingHandler.initiateCall(getValue.getValue(call, "receiverID"), getValue.getValue(call, "receiverType"),
                        getValue.getValue(call, "callType"));
                result.success("Success");
                break;
            case "add_call_listener":
                callingHandler.addCallListener(getValue.getValue(call, "listenerId"), applicationContext);
                result.success("Success");
                break;
            case "remove_call_listener":
                callingHandler.removeCallListener(getValue.getValue(call, "listenerId"));
                result.success("Success");
                break;
            case "accept_call":
                callingHandler.acceptCall(getValue.getValue(call, "sessionID"));
                result.success("Success");
                break;
            case "reject_call":
                callingHandler.rejectCall(getValue.getValue(call, "sessionID"), getValue.getValue(call, "status"));
                result.success("Success");
                break;
            default:
                result.notImplemented();
        }
    }

    private void initializeApp(MethodChannel.Result result, String appID, AppSettings appSettings) {
        CometChat.init(applicationContext, appID, appSettings, new CometChat.CallbackListener<String>() {
            @Override
            public void onSuccess(String successMessage) {
                Log.d("Initilisation", "Initialization completed successfully");
                result.success(true);
            }

            @Override
            public void onError(CometChatException e) {
                Log.d("Initilisation", "Initialization failed with exception: " + e.getMessage());
                result.success(e.toString());
            }
        });
    }
}
