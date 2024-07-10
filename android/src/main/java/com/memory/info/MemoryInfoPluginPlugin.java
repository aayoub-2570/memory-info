package com.memory.info;

import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;
import android.app.ActivityManager;
import android.content.Context;

@CapacitorPlugin(name = "MemoryInfoPlugin")
public class MemoryInfoPluginPlugin extends Plugin {

    private MemoryInfoPlugin implementation = new MemoryInfoPlugin();

    @PluginMethod
    public void echo(PluginCall call) {
        String value = call.getString("value");

        JSObject ret = new JSObject();
        ret.put("value", implementation.echo(value));
        call.resolve(ret);
    }

    @PluginMethod
    public void getRAMUsage(PluginCall call) {
        ActivityManager activityManager = (ActivityManager) getContext().getSystemService(Context.ACTIVITY_SERVICE);
        ActivityManager.MemoryInfo memoryInfo = new ActivityManager.MemoryInfo();
        activityManager.getMemoryInfo(memoryInfo);

        long totalRAM = memoryInfo.totalMem;
        long availableRAM = memoryInfo.availMem;
        long usedRAM = totalRAM - availableRAM;

        double totalRAMGB = totalRAM / 1_073_741_824.0;
        double availableRAMGB = availableRAM / 1_073_741_824.0;
        double usedRAMGB = usedRAM / 1_073_741_824.0;

        JSObject ret = new JSObject();
        ret.put("totalRAM", String.format("%.2f", totalRAMGB));
        ret.put("availableRAM", String.format("%.2f", availableRAMGB));
        ret.put("usedRAM", String.format("%.2f", usedRAMGB));

        call.resolve(ret);
    }
}
