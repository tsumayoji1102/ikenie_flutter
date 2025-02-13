package com.example.ikenie_flutter

import android.app.Activity
import android.content.Intent
import android.provider.MediaStore
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "photo_manager"
    private var selectedImageIds: ArrayList<String> = ArrayList()
    private val PICK_IMAGES_REQUEST = 1
    private var methodResult: MethodChannel.Result? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            methodResult = result
            when (call.method) {
                "select_photo" -> {
                    selectPhoto()
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }

    private fun selectPhoto() {
        val intent = Intent(Intent.ACTION_GET_CONTENT).apply {
            type = "image/*"
            putExtra(Intent.EXTRA_ALLOW_MULTIPLE, true)
        }
        startActivityForResult(intent, PICK_IMAGES_REQUEST)
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        
        if (requestCode == PICK_IMAGES_REQUEST && resultCode == Activity.RESULT_OK) {
            selectedImageIds.clear()
            
            if (data?.clipData != null) {
                val count = data.clipData!!.itemCount
                println("Selected count: $count")
                for (i in 0 until count) {
                    val uri = data.clipData!!.getItemAt(i).uri
                    getImageId(uri)?.let { id ->
                        println("Selected ID: $id")
                        selectedImageIds.add(id)
                    }
                }
            } else if (data?.data != null) {
                getImageId(data.data!!)?.let { id ->
                    println("Selected ID: $id")
                    selectedImageIds.add(id)
                }
            }

            println("Selected IDsss: $selectedImageIds")
            methodResult.success(selectedImageIds)
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
                    val result = cursor.getString(idColumn)
                    println("ID: $result")
                    result
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