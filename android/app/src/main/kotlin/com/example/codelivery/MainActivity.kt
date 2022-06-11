package com.example.codelivery

import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.os.Build.VERSION
import android.os.Build.VERSION_CODES
import android.os.Bundle
import android.util.Log

import androidx.annotation.NonNull

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.BasicMessageChannel
import io.flutter.plugin.common.StringCodec
import io.flutter.plugins.GeneratedPluginRegistrant

import com.android.volley.RequestQueue
import com.android.volley.Response
import com.android.volley.Request
import com.android.volley.toolbox.StringRequest
import com.android.volley.toolbox.Volley

var userId = ""

fun cancelMatch() {
    val stringRequest = object : StringRequest(
        Request.Method.POST,
        "http://3.39.141.110:8080/match/cancel",
        Response.Listener<String> {
            System.out.println(it)
            Log.d("kkang", "server data : $it")
        },
        Response.ErrorListener { error ->
            System.out.println(error)
            Log.d("kkang", "error......$error")
        }) {
        override fun getParams(): MutableMap<String, String> {
            return mutableMapOf<String, String>("userId" to userId)
            // MutableMap 객체에 전달할 데이터 담아서 반환하면 서버에 요청할 때 알아서 함께 전송해 줌
        }
    }
    System.out.println(userId)
}

class MainActivity : FlutterActivity() {
    private val CHANNEL = "androidApplicationLifeCycle"
    lateinit var channel: BasicMessageChannel<String>

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        print("got at create");
        Log.e("MainActivity", "onCreate()")
        System.out.println("onCreate")
        configureFlutterEngine(FlutterEngine(this))
    }

    override fun onDestroy() {
        super.onDestroy()
    }

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        channel = BasicMessageChannel(
            flutterEngine.dartExecutor.binaryMessenger, CHANNEL, StringCodec.INSTANCE
        )

        channel.setMessageHandler { message, reply ->
            System.out.println("messageHandler $message")
            userId = message as String
            reply.reply(userId)
        }


        startService(Intent(this, UnCatchTaskService::class.java));
    }
}