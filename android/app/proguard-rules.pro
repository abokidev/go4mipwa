# WebView and Flutter Plugin Rules
-keep class io.flutter.embedding.** { *; }
-keep class io.flutter.plugins.** { *; }
-keep class io.flutter.app.FlutterApplication { *; }
-keep class com.google.android.play.core.** { *; }
-keep interface com.google.android.play.core.** { *; }
-keepclassmembers class * extends java.lang.Object {
    public void *(...);
}