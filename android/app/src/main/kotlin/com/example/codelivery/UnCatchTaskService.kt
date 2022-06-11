package com.example.codelivery

import kotlinx.coroutines.*

import android.app.Service
import android.content.Intent
import android.os.Handler
import android.os.IBinder

class UnCatchTaskService : Service() {

    override fun onBind(intent: Intent): IBinder {
        TODO()
    }

    override fun onTaskRemoved(rootIntent: Intent) {
        System.out.println("before onTaskRemoved")
        Thread(Runnable {
            System.out.println("before thread")
            cancelMatch()
            System.out.println("after thread")
        }).start()
        Thread.sleep(2000L)
        System.out.println("after onTaskRemoved")
        stopSelf();
    }
}

