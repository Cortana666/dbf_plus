import Cocoa
import FlutterMacOS

@NSApplicationMain
class AppDelegate: FlutterAppDelegate {
  override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
    return true
  }

  @MainActor
  override func application(_ sender: NSApplication, openFile filename: String) -> Bool {
    (mainFlutterWindow as! MainFlutterWindow).currentFile = filename
    return true
  }
}
