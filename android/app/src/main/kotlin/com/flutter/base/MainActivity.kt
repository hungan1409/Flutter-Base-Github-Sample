package com.flutter.base

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    companion object {
        private const val CHANNEL = "com.flutter.base.sample/native_channel"
        private const val METHOD_GET_FLAVOR = "GET_FLAVOR"
    }

    private lateinit var channel: MethodChannel

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
        channel.setMethodCallHandler { methodCall: MethodCall, result: MethodChannel.Result ->
            if (methodCall.method == METHOD_GET_FLAVOR) {
                result.success(BuildConfig.FLAVOR);
            } else {
                result.notImplemented()
            }
        }
    }
}
