package com.example.flutter_comet_chat_sdk.Helper;

import com.cometchat.pro.core.CometChat;
import com.cometchat.pro.exceptions.CometChatException;
import com.cometchat.pro.models.User;
import com.example.flutter_comet_chat_sdk.EventChannelHelper;

import java.util.HashMap;
import java.util.Map;

import io.flutter.Log;

public class LoginLogoutHelper {
    private String UID;
    private String authKey;
    private String authToken;
    private String uniqueLoginListenerID;
    private static final String TAG = "CometChat";
    private EventChannelHelper loginEventTrigger;
    private EventChannelHelper loginEventListener;

    public LoginLogoutHelper(EventChannelHelper loginEventTrigger, EventChannelHelper loginEventListener) {
        this.loginEventTrigger = loginEventTrigger;
        this.loginEventListener = loginEventListener;
    }

    public void selectLoginMethod(String authToken, String authKey, String UID) {
        this.authKey = authKey;
        this.authToken = authToken;
        this.UID = UID;
        if (authToken != null) {
            loginWithAuthToken();
        } else {
            login();
        }
    }

    public void loginWithAuthToken() {
        Map<String, Object> map = new HashMap<>();

        CometChat.login(authToken, new CometChat.CallbackListener<User>() {
            @Override
            public void onSuccess(User user) {
                Log.d(TAG, "Login Successful : " + user);
                map.put("loginSuccess", user.toJson().toString());
                loginEventTrigger.success(map);
            }

            @Override
            public void onError(CometChatException e) {
                Log.d(TAG, "Login failed with exception: " + e.getMessage());
                map.put("loginFailure", e.toString());
                loginEventTrigger.error(e.getCode(), e.getMessage(), map);
            }
        });
    }

    public void login() {
        Map<String, Object> map = new HashMap<>();

        CometChat.login(UID, authKey, new CometChat.CallbackListener<User>() {
            @Override
            public void onSuccess(User user) {
                map.put("loginSuccess", user.toJson().toString());
                loginEventTrigger.success(map);
            }

            @Override
            public void onError(CometChatException e) {
                Log.d(TAG, "Login failed with exception: " + e.getMessage());
                map.put("loginFailure", e.toString());
                loginEventTrigger.error(e.getCode(), e.getMessage(), map);
            }
        });

    }

    public void logout() {
        Map<String, Object> map = new HashMap<>();
        CometChat.logout(new CometChat.CallbackListener<String>() {
            @Override
            public void onSuccess(String successMessage) {
                map.put("logoutSuccess", "success");
                loginEventTrigger.success(map);
            }

            @Override
            public void onError(CometChatException e) {
                // Log.d(TAG, "Logout failed with exception: " + e.getMessage());
                map.put("error", e.toString());
                loginEventTrigger.error(e.getCode(), e.getMessage(), map);
            }
        });
    }

    public void addLoginListener(String uniqueLoginListenerId) {
        Map<String, Object> map = new HashMap<>();
        uniqueLoginListenerID = uniqueLoginListenerId;
        CometChat.addLoginListener(uniqueLoginListenerID, new CometChat.LoginListener() {
            @Override
            public void loginSuccess(User user) {
                map.clear();
                map.put("loginSuccess", user.toJson().toString());
                loginEventListener.success(map);
            }

            @Override
            public void loginFailure(CometChatException e) {
                map.clear();
                map.put("loginFailure", e.toString());
                loginEventListener.error(e.getCode(), e.getMessage(), map);
            }

            @Override
            public void logoutSuccess() {
                map.clear();
                map.put("logoutSuccess", "success");
                loginEventListener.success(map);
            }

            @Override
            public void logoutFailure(CometChatException e) {
                map.clear();
                map.put("logoutFailure", e.toString());
                loginEventListener.error(e.getCode(), e.getMessage(), map);
            }
        });
    }

    public void removeLoginListener() {
        CometChat.removeLoginListener(uniqueLoginListenerID);
    }
}
