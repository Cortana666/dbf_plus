import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  open var currentFile: String?
  
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
    let windowFrame = self.frame
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)

    let batteryChannel = FlutterMethodChannel(
      name: "samples.flutter.dev/battery",
      binaryMessenger: flutterViewController.engine.binaryMessenger
    )
    batteryChannel.setMethodCallHandler { (call, result) in
      switch call.method {
      case "getCurrentFile":
        if self.currentFile == nil {
          result(
            FlutterError(
              code: "UNAVAILABLE",
              message: "Current file not available",
              details: nil))
        }
        result(self.currentFile)
      default:
        result(FlutterMethodNotImplemented)
      }
    }

    RegisterGeneratedPlugins(registry: flutterViewController)

    super.awakeFromNib()
  }
}
