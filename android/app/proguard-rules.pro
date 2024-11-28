# WebView and Flutter Plugin Rules
-keep class io.flutter.embedding.** { *; }
-keep class io.flutter.plugins.** { *; }
-keep class io.flutter.app.FlutterApplication { *; }
-keepclassmembers class * extends java.lang.Object {
    public void *(...);
}