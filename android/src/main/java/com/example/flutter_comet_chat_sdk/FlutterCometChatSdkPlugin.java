package com.example.flutter_comet_chat_sdk;

import android.content.Context;

import androidx.annotation.NonNull;

import com.example.flutter_comet_chat_sdk.Helper.CallingHelpers;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** FlutterCometChatSdkPlugin */
public class FlutterCometChatSdkPlugin implements FlutterPlugin {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
  private EventChannelHelper loginEventTrigger;
  private EventChannelHelper loginEventListener;

  private EventChannelHelper callingEventHelper;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPlugin.FlutterPluginBinding flutterPluginBinding) {
    setupChannels(flutterPluginBinding.getBinaryMessenger(), flutterPluginBinding.getApplicationContext());
//    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "flutter_comet_chat_sdk");
//    channel.setMethodCallHandler(this);
  }


  private void setupChannels(BinaryMessenger messenger, Context context) {
    channel = new MethodChannel(messenger, "plugins.flutter.io/comet_chat_dart");
    loginEventTrigger = new EventChannelHelper(messenger, "plugins.flutter.io/login_event_trigger");
    loginEventListener = new EventChannelHelper(messenger, "plugins.flutter.io/login_event_listener");
    callingEventHelper = new EventChannelHelper(messenger, "plugins.flutter.io/calling_details");

    MethodChannelHandler methodChannelHandler = new MethodChannelHandler(context, loginEventTrigger,loginEventListener,  callingEventHelper);
    channel.setMethodCallHandler(methodChannelHandler);
  }


//  @Override
//  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
//    if (call.method.equals("getPlatformVersion")) {
//      result.success("Android " + android.os.Build.VERSION.RELEASE);
//    } else {
//      result.notImplemented();
//    }
//  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPlugin.FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
}
