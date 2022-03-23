package com.example.flutter_comet_chat_sdk;

import android.os.Handler;
import android.os.Looper;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.EventChannel;

public class EventChannelHelper {
    public Handler handler;
    private EventChannel.EventSink eventSink;

    public EventChannelHelper(BinaryMessenger messenger, String id) {
        handler = new Handler(Looper.getMainLooper());
        EventChannel eventChannel = new EventChannel(messenger, id);
        eventChannel.setStreamHandler(new EventChannel.StreamHandler() {
            @Override
            public void onListen(final Object arguments, final EventChannel.EventSink eventSink) {
                synchronized (EventChannelHelper.this) {
                    EventChannelHelper.this.eventSink = eventSink;
                }
            }

            @Override
            public void onCancel(final Object arguments) {
                synchronized (EventChannelHelper.this) {
                    eventSink = null;
                }
            }
        });
    }

    public synchronized void error(String errorCode, String errorMessage, Object errorDetails) {
        if (eventSink == null)
            return;
        handler.post(() -> eventSink.error(errorCode, errorMessage, errorDetails));
    }

    public synchronized void success(Object event) {
        if (eventSink == null)
            return;
        handler.post(() -> eventSink.success(event));
    }
}
