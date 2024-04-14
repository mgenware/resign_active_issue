import Flutter
import UIKit

public class ResignActivePlugin: NSObject, FlutterPlugin, UIDocumentInteractionControllerDelegate {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "resign_active", binaryMessenger: registrar.messenger())
        let instance = ResignActivePlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "pushViewController":
            let fileURL = createTemporaryFile()
            let documentInteractionController = UIDocumentInteractionController(url: fileURL!)
            documentInteractionController.delegate = self
            documentInteractionController.presentPreview(animated: true)
        default:
            result(FlutterMethodNotImplemented)
        }
    }
    
    public func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController {
        return UIApplication.topViewController()!
    }
}

func createTemporaryFile() -> URL? {
    let fileName = "tempFile.txt"
    let fileURL = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(fileName)
    
    // Attempt to write "haha" to the temporary file
    do {
        try "haha".write(to: fileURL, atomically: true, encoding: .utf8)
        return fileURL
    } catch {
        print("Error writing to temporary file: \(error)")
        return nil
    }
}

extension UIApplication {
    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}
