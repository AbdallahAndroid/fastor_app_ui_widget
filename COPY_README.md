# basm Allah ElRahman ElRahim

# Steps To Copy to your project 

1. copy files and make replace all for import package name of your project name

2. in gradle "project android level" 
``` 

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

// Some plugins (e.g. clipboard 3.0.14) hardcode compileSdk 33, but the Flutter embedding's
// AndroidX dependencies (androidx.window 1.2.0, ...) require compileSdk >= 34, so
// :<plugin>:checkDebugAarMetadata fails. Raise compileSdk for plugin library modules.
// This must stay BEFORE the evaluationDependsOn block below, and uses afterEvaluate so it runs
// after the plugin's own android { compileSdk = 33 } line. 36 is the highest level AGP 9.1.0
// resolves here (android-36 is installed).
subprojects {
    val raiseCompileSdk: Project.() -> Unit = {
        val androidExt = extensions.findByName("android")
        if (androidExt is com.android.build.gradle.LibraryExtension) {
            val current = androidExt.compileSdkVersion?.removePrefix("android-")?.toIntOrNull() ?: 0
            if (current < 36) {
                androidExt.compileSdk = 36
            }
        }
    }
    if (state.executed) {
        raiseCompileSdk()
    } else {
        afterEvaluate { raiseCompileSdk() }
    }
}
```

3. gradle app level 
```
android {
 
    compileOptions {
 
        isCoreLibraryDesugaringEnabled = true 
    }

```