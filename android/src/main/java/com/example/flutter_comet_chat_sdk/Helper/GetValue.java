package com.example.flutter_comet_chat_sdk.Helper;

import androidx.annotation.NonNull;

import com.cometchat.pro.core.AppSettings;
import com.cometchat.pro.models.User;

import org.json.JSONObject;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import io.flutter.plugin.common.MethodCall;

public class GetValue {
    // Gets the values of the argument from Method Channel
    public String getValue(@NonNull MethodCall call, String argument) {
        return call.argument(argument) != null ? call.argument(argument).toString() : null;
    }

    public AppSettings getAppSettings(@NonNull MethodCall call, String argument) {
        HashMap hashMap = call.argument(argument);
        if (hashMap != null && hashMap.get("region") != null && hashMap.get("subscriptionType") != null) {
            AppSettings appSettings = new AppSettings.AppSettingsBuilder().setRegion(hashMap.get("region").toString())
                    .build();
            ;

            switch (hashMap.get("subscriptionType").toString()) {
                case "ALL_USERS":
                    appSettings = new AppSettings.AppSettingsBuilder().subscribePresenceForAllUsers()
                            .setRegion(hashMap.get("region").toString()).build();
                    break;
                case "FRIENDS":
                    appSettings = new AppSettings.AppSettingsBuilder().subscribePresenceForFriends()
                            .setRegion(hashMap.get("region").toString()).build();
                    break;
                case "ROLES":
                    appSettings = new AppSettings.AppSettingsBuilder()
                            .subcribePresenceForRoles((List<String>) hashMap.get("roles"))
                            .setRegion(hashMap.get("region").toString()).build();
                    break;
                case "NONE":
                    appSettings = new AppSettings.AppSettingsBuilder().setRegion(hashMap.get("region").toString()).build();
                    break;
            }

            return appSettings;
        }
        return null;
    }



    User getUser(@NonNull MethodCall call, String argument) {
        HashMap hashMap = call.argument(argument);
        User user = new User();

        if (hashMap != null) {
            if (hashMap.get("uid") != null) {
                user.setUid(hashMap.get("uid").toString());
            }

            if (hashMap.get("name") != null) {
                user.setName(hashMap.get("name").toString());
            }
            if (hashMap.get("avatar") != null) {
                user.setAvatar(hashMap.get("avatar").toString());
            }
            if (hashMap.get("link") != null) {
                user.setLink(hashMap.get("link").toString());
            }
            if (hashMap.get("role") != null) {
                user.setRole(hashMap.get("role").toString());
            }
            if (hashMap.get("metadata") != null) {
                JSONObject metadata = new JSONObject((Map) hashMap.get("metadata"));
                user.setMetadata(metadata);
            }
            if (hashMap.get("status") != null) {
                user.setStatus(hashMap.get("status").toString());
            }
            if (hashMap.get("statusMessage") != null) {
                user.setStatus(hashMap.get("statusMessage").toString());
            }
            if (hashMap.get("lastActiveAt") != null) {
                user.setLastActiveAt(((Number) hashMap.get("lastActiveAt")).longValue());
            }
            if (hashMap.get("hasBlockedMe") != null) {
                user.setHasBlockedMe((Boolean) hashMap.get("hasBlockedMe"));
            }
            if (hashMap.get("blockedByMe") != null) {
                user.setBlockedByMe((Boolean) hashMap.get("blockedByMe"));
            }
            if (hashMap.get("tags") != null) {
                user.setTags((List<String>) hashMap.get("tags"));
            }
        }

        return user;
    }

    int getIntValue(@NonNull MethodCall call, String argument) {
        return call.argument(argument) != null ? call.argument(argument) : -1;
    }

    boolean getBooleanValue(@NonNull MethodCall call, String argument) {
        return call.argument(argument) != null ? call.argument(argument) : false;
    }

    List<String> getListValue(@NonNull MethodCall call, String argument) {
        return call.argument(argument) != null ? call.argument(argument) : null;
    }
}
