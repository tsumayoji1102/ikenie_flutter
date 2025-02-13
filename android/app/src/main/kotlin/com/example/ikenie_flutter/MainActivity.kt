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
        val selection = "${MediaStore.Images.Media._ID} = ?"
        val selectionArgs = arrayOf(ContentUris.parseId(uri).toString())
        return try {
            contentResolver.query(
                MediaStore.Images.Media.EXTERNAL_CONTENT_URI,
                projection,
                selection,
                selectionArgs,
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