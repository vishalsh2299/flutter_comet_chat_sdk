package com.example.flutter_comet_chat_sdk.Helper;

import android.content.Context;
import android.content.Intent;
import android.util.Log;

import com.cometchat.pro.constants.CometChatConstants;
import com.cometchat.pro.core.Call;
import com.cometchat.pro.core.CometChat;
import com.cometchat.pro.exceptions.CometChatException;
import com.example.flutter_comet_chat_sdk.EventChannelHelper;
import com.example.flutter_comet_chat_sdk.MainActivity;

import java.util.HashMap;
import java.util.Map;
import io.flutter.embedding.android.FlutterActivity;


public class CallingHelpers extends FlutterActivity {

    private static final String TAG = "CometChat";
    private EventChannelHelper callDetails;
    private Context appContext;
    private String sessionId;

    public CallingHelpers(EventChannelHelper helper) {
        this.callDetails = helper;
    }

    public void startCall(String sessionID, boolean enableDefaultLayout, boolean audioOnly) {
        sessionId = sessionID;
        startNewActivity();
    }

    public void initiateCall(String receiverID, String receiverType, String callType) {
        receiverType = CometChatConstants.RECEIVER_TYPE_USER;
        callType = CometChatConstants.CALL_TYPE_VIDEO;

        Map<String, Object> map = new HashMap<>();
        Call call = new Call(receiverID, receiverType, callType);

        CometChat.initiateCall(call, new CometChat.CallbackListener<Call>() {
            @Override
            public void onSuccess(Call call) {
                Log.d(TAG, "Call initiated successfully: " + call.toString());
                map.put("call", call);
                callDetails.success(call);
            }

            @Override
            public void onError(CometChatException e) {
                Log.d(TAG, "Call initialization failed with exception: " + e.getMessage());
                map.put("call_error", e);
            }
        });
    }

    // ADD LISTENER TO RECEIVE CALLS
    public void addCallListener(String listenerId, Context context) {
        this.appContext = context;
        Map<String, Object> map = new HashMap<>();

        CometChat.addCallListener(listenerId, new CometChat.CallListener() {
            @Override
            public void onIncomingCallReceived(Call call) {
                Log.d(TAG, "Incoming call: " + call.toString());
                map.put("call", call);
                callDetails.success(call);
                acceptCall(call.getSessionId());
                startCall(call.getSessionId(), true, false);
            }

            @Override
            public void onOutgoingCallAccepted(Call call) {
                Log.d(TAG, "Outgoing call accepted: " + call.toString());
                map.put("call", call);
                callDetails.success(call);
                startCall(call.getSessionId(), true, false);
            }

            @Override
            public void onOutgoingCallRejected(Call call) {
                Log.d(TAG, "Outgoing call rejected: " + call.toString());
                map.put("call", call);
                callDetails.success(call);
            }

            @Override
            public void onIncomingCallCancelled(Call call) {
                Log.d(TAG, "Incoming call cancelled: " + call.toString());
                map.put("call", call);
                callDetails.success(call);
            }

        });
    }

    // REMOVE LISTENER
    public void removeCallListener(String listenerId) {
        CometChat.removeCallListener(listenerId);
    }

    // ACCEPT INCOMING CALL
    public void acceptCall(String sessionID) {
        Map<String, Object> map = new HashMap<>();

        CometChat.acceptCall(sessionID, new CometChat.CallbackListener<Call>() {
            @Override
            public void onSuccess(Call call) {
                Log.d(TAG, "Call accepted successfully: " + call.toString());
                map.put("call", call);
                callDetails.success(call);
            }

            public void onError(CometChatException e) {
                Log.d(TAG, "Call acceptance failed with exception: " + e.getMessage());
                map.put("call_error", e);
            }
        });
    }

    // REJECT INCOMING CALL
    public void rejectCall(String sessionID, String status) {
        // CANCEL OUTGOING CALL --> status = CometChatConstants.CALL_STATUS_CANCELLED

        Map<String, Object> map = new HashMap<>();

        CometChat.rejectCall(sessionID, status, new CometChat.CallbackListener<Call>() {
            @Override
            public void onSuccess(Call call) {
                Log.d(TAG, "Call rejected successfully with status: " + call.getCallStatus());
                map.put("call", call);
                callDetails.success(call);
            }

            @Override
            public void onError(CometChatException e) {
                Log.d(TAG, "Call rejection failed with exception: " + e.getMessage());
                map.put("call_error", e);
            }
        });
    }

    private void startNewActivity() {
        Intent intent = new Intent(appContext, MainActivity.class);
        intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        intent.putExtra("SESSION_ID", sessionId);
        appContext.startActivity(intent);
    }

}
