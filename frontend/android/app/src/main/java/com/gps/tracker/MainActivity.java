package com.gps.tracker;

import android.widget.Toast;
import com.getcapacitor.BridgeActivity;

public class MainActivity extends BridgeActivity {
    private long lastBackPressTime = 0;

    @SuppressWarnings("deprecation")
    @Override
    public void onBackPressed() {
        if (getBridge() == null || getBridge().getWebView() == null) {
            super.onBackPressed();
            return;
        }

        // Check current page via JavaScript to determine if on tab/root page
        getBridge().getWebView().evaluateJavascript(
            "(function(){var h=window.location.href;var isTab=h.indexOf('index/index')>-1||h.indexOf('function/index')>-1||h.indexOf('profile/index')>-1||h.indexOf('login/index')>-1;return isTab?'tab':'sub';})()",
            result -> {
                runOnUiThread(() -> {
                    String val = result != null ? result.replace("\"", "") : "";
                    if ("tab".equals(val)) {
                        // On tab page - double tap to exit
                        long now = System.currentTimeMillis();
                        if (now - lastBackPressTime < 2000) {
                            finish();
                        } else {
                            lastBackPressTime = now;
                            Toast.makeText(MainActivity.this, "\u518d\u6309\u4e00\u6b21\u9000\u51fa\u5e94\u7528", Toast.LENGTH_SHORT).show();
                        }
                    } else {
                        // On sub page - normal back navigation
                        getBridge().getWebView().goBack();
                    }
                });
            }
        );
    }
}
