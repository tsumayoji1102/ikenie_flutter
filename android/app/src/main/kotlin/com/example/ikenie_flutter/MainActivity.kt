package com.example.ikenie_flutter

import android.app.Activity
import android.content.Intent
import android.provider.MediaStore
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.content.ContentUris

class MainActivity : FlutterActivity() {
    private val CHANNEL = "photo_manager"
    private val PICK_IMAGES_REQUEST = 1
    private var methodResult: MethodChannel.Result? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            methodResult = result
            when (call.method) {
                "select_photo" -> {
                    val args = call.arguments as? Map<String, Any>
                    println("args: $args")
                    if(args == null) {
                        result.error("INVALID_ARGUMENT", "Arguments is null", null)
                        return@setMethodCallHandler
                    }
                    selectPhoto(args)
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }

    private fun selectPhoto(args: Map<String, Any>) {
        val selectedIds = args["selectedIds"] as List<String>
        val maxCount = args["maxCount"] as Int

        // val intent = Intent(Intent.ACTION_GET_CONTENT).apply {
        //     type = "image/*"
        //     putExtra(Intent.EXTRA_ALLOW_MULTIPLE, true)
        // }

        // try {
        //     intent.putExtra("android.intent.extra.INITIAL_INTENTS", selectedIds.toTypedArray())
        // } catch (e: Exception) {
        //     e.printStackTrace()
        // }
        // val intent = Intent(Intent.ACTION_PICK, MediaStore.Images.Media.EXTERNAL_CONTENT_URI).apply {
        //     type = "image/*"
        //     putExtra(Intent.EXTRA_ALLOW_MULTIPLE, true)
        //     // 選択上限を設定
        //     putExtra(Intent.EXTRA_LOCAL_ONLY, true)
        //     putExtra("android.intent.extra.INITIAL_INTENTS", selectedImageIds.toTypedArray())
        //     // 選択順を保持するためのフラグ
        //     putExtra("android.intent.extra.ORDERING", true)
        // }

        // try {
        //     intent.putExtra("multi-pick", true)
        //     intent.putExtra("max-items", maxCount)
        //     // すでに選択されている画像のIDを渡す
        //     intent.putExtra("selected-items", selectedImageIds.toTypedArray())
        // } catch (e: Exception) {
        //     e.printStackTrace()
        // }
        val intent = Intent(Intent.ACTION_PICK, MediaStore.Images.Media.EXTERNAL_CONTENT_URI).apply {
            type = "image/*"
            putExtra(Intent.EXTRA_ALLOW_MULTIPLE, true)
            
            // 選択上限を設定
            putExtra("android.intent.extra.LOCAL_ONLY", true)
            
            try {
                // すでに選択されている写真IDを設定
                // 注：全てのデバイスでサポートされているわけではありません
                putExtra("android.intent.extra.INITIAL_INTENTS", selectedIds.toTypedArray())
            } catch (e: Exception) {
                e.printStackTrace()
            }
        }
        startActivityForResult(intent, PICK_IMAGES_REQUEST)
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        
        if (requestCode == PICK_IMAGES_REQUEST && resultCode == Activity.RESULT_OK) {
            val selectedImageIds = mutableListOf<String>()
            
            if (data?.clipData != null) {
                val count = data.clipData!!.itemCount
                for (i in 0 until count) {
                    val uri = data.clipData!!.getItemAt(i).uri
                    getImageId(uri)?.let { id ->
                        selectedImageIds.add(id)
                    }
                }
            } else if (data?.data != null) {
                getImageId(data.data!!)?.let { id ->
                    selectedImageIds.add(id)
                }
            }
            methodResult!!.success(selectedImageIds)
        }
    }

    private fun getImageId(uri: android.net.Uri): String? {
        val projection = arrayOf(MediaStore.Images.Media._ID)
        return try {
            contentResolver.query(
                uri,
                projection,
                null,
                null,
                null
            )?.use { cursor ->
                if (cursor.moveToFirst()) {
                    val idColumn = cursor.getColumnIndexOrThrow(MediaStore.Images.Media._ID)
                    cursor.getString(idColumn)
                } else {
                    null
                }
            }
        } catch (e: Exception) {
            e.printStackTrace()
            null
        }
    }
}