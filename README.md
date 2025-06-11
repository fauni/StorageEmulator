# 📚 Mi Book Review – Flutter + Firebase Emulator

Este proyecto es una app Flutter que permite a los usuarios registrarse, iniciar sesión, subir una imagen de perfil y almacenar datos en Firestore. Todo está configurado para ejecutarse con Firebase Emulator Suite de forma local.

---

## 🔧 Configuración del Firebase Emulator

Este proyecto utiliza la siguiente configuración en el archivo `firebase.json`:

```json
{
  "emulators": {
    "auth": {
      "host": "0.0.0.0",
      "port": 9099
    },
    "firestore": {
      "host": "0.0.0.0",
      "port": 8080
    },
    "storage": {
      "host": "0.0.0.0",
      "port": 9199
    },
    "ui": {
      "host": "0.0.0.0",
      "enabled": true,
      "port": 4000
    },
    "singleProjectMode": true
  },
  "firestore": {
    "rules": "firestore.rules"
  },
  "storage": {
    "rules": "storage.rules"
  },
  "flutter": {
    "platforms": {
      "android": {
        "default": {
          "projectId": "mibookreview",
          "appId": "1:102226961719:android:4d02759c2f10ebe4a0a6b2",
          "fileOutput": "android/app/google-services.json"
        }
      },
      "dart": {
        "lib/firebase_options.dart": {
          "projectId": "mibookreview",
          "configurations": {
            "android": "1:102226961719:android:4d02759c2f10ebe4a0a6b2",
            "ios": "1:102226961719:ios:af0cffeaf592776ea0a6b2",
            "macos": "1:102226961719:ios:af0cffeaf592776ea0a6b2",
            "web": "1:102226961719:web:0a7cd4e6d8e21b69a0a6b2",
            "windows": "1:102226961719:web:2d221b41ba35a57ca0a6b2"
          }
        }
      }
    }
  }
}
