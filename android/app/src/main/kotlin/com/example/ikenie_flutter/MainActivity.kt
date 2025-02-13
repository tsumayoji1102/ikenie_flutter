package com.example.ikenie_flutter

import android.app.Activity
import android.content.Intent
import androidx.activity.result.ActivityResultLauncher
import androidx.activity.result.contract.ActivityResultContracts
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
// // 追加のimport
// import androidx.activity.ComponentActivity
// import androidx.activity.result.contract.ActivityResultContract
// import androidx.core.app.ActivityOptionsCompat

class MainActivity : FlutterActivity() {
    private val CHANNEL = "photo_manager"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        // Method Channelの設定
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "select_photo" -> {
                    result.success("aaaaa")
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }
}