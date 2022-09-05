package com.example.flutter_comet_chat_sdk;

import android.Manifest;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.util.Log;
import android.widget.RelativeLayout;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;

import com.cometchat.pro.core.Call;
import com.cometchat.pro.core.CallSettings;
import com.cometchat.pro.core.CometChat;
import com.cometchat.pro.exceptions.CometChatException;
import com.cometchat.pro.models.AudioMode;
import com.cometchat.pro.models.User;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MainActivity extends AppCompatActivity {

    private static final int CHECK_PERMISSION_CODE = 100;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Map<String, Object> map = new HashMap<>();
        String sessionID = getIntent().getStringExtra("SESSION_ID") != null  ?  getIntent().getStringExtra("SESSION_ID") : "12345";
        RelativeLayout callView = this.findViewById(R.id.relative_layout);



        CallSettings callSettings = new CallSettings.CallSettingsBuilder(this, callView)
                .setSessionId(sessionID)
                .build();

        String permissions[] = {Manifest.permission.CAMERA,Manifest.permission.WRITE_EXTERNAL_STORAGE,Manifest.permission.RECORD_AUDIO};
        checkPermission(permissions,
                CHECK_PERMISSION_CODE);


        CometChat.startCall(callSettings, new CometChat.OngoingCallListener() {
            @Override
            public void onUserJoined(User user) {
                Log.d("COMETCHAT", "onUserJoined: Name " + user.getName());
                map.put("user", user);
            }

            @Override
            public void onUserLeft(User user) {
                Log.d("COMETCHAT", "onUserLeft: " + user.getName());
            }

            @Override
            public void onError(CometChatException e) {
                Log.d("COMETCHAT", "onError: " + e.getMessage());
            }

            @Override
            public void onCallEnded(Call call) {
                Log.d("COMETCHAT", "onCallEnded: " + call.toString());
            }

            @Override
            public void onUserListUpdated(List<User> list) {

            }

            @Override
            public void onAudioModesUpdated(List<AudioMode> list) {

            }

        });
    }

    // Function to check and request permission
    public void checkPermission(String[] permission, int requestCode)
    {
        boolean temp = true;
        for(int i=0;i<permission.length ;i++){
            if (ContextCompat.checkSelfPermission(
                    MainActivity.this,
                    permission[i])
                    == PackageManager.PERMISSION_DENIED) {
                temp = false;
                break;
            }
        }
        if (temp == false) {
            ActivityCompat
                    .requestPermissions(
                            MainActivity.this,
                            permission,
                            requestCode);
        }
        else {
            Toast
                    .makeText(MainActivity.this,
                            "Permission already granted",
                            Toast.LENGTH_SHORT)
                    .show();
        }


    }


    @Override
    public void onRequestPermissionsResult(int requestCode,
                                           @NonNull String[] permissions,
                                           @NonNull int[] grantResults)
    {
        super
                .onRequestPermissionsResult(requestCode,
                        permissions,
                        grantResults);

        if (requestCode == CHECK_PERMISSION_CODE) {
            if (grantResults.length > 0
                    && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                Toast.makeText(MainActivity.this,
                        "Permission Granted",
                        Toast.LENGTH_SHORT)
                        .show();
            }
            else {
                Toast.makeText(MainActivity.this,
                        "Permission Denied",
                        Toast.LENGTH_SHORT)
                        .show();
            }
        }


    }

}
