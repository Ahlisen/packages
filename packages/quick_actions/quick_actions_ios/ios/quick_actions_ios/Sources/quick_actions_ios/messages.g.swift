// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
// Autogenerated from Pigeon (v20.0.1), do not edit directly.
// See also: https://pub.dev/packages/pigeon

import Foundation

#if os(iOS)
  import Flutter
#elseif os(macOS)
  import FlutterMacOS
#else
  #error("Unsupported platform.")
#endif

/// Error class for passing custom error details to Dart side.
final class PigeonError: Error {
  let code: String
  let message: String?
  let details: Any?

  init(code: String, message: String?, details: Any?) {
    self.code = code
    self.message = message
    self.details = details
  }

  var localizedDescription: String {
    return
      "PigeonError(code: \(code), message: \(message ?? "<nil>"), details: \(details ?? "<nil>")"
  }
}

private func wrapResult(_ result: Any?) -> [Any?] {
  return [result]
}

private func wrapError(_ error: Any) -> [Any?] {
  if let pigeonError = error as? PigeonError {
    return [
      pigeonError.code,
      pigeonError.message,
      pigeonError.details,
    ]
  }
  if let flutterError = error as? FlutterError {
    return [
      flutterError.code,
      flutterError.message,
      flutterError.details,
    ]
  }
  return [
    "\(error)",
    "\(type(of: error))",
    "Stacktrace: \(Thread.callStackSymbols)",
  ]
}

private func createConnectionError(withChannelName channelName: String) -> PigeonError {
  return PigeonError(
    code: "channel-error", message: "Unable to establish connection on channel: '\(channelName)'.",
    details: "")
}

private func isNullish(_ value: Any?) -> Bool {
  return value is NSNull || value == nil
}

private func nilOrValue<T>(_ value: Any?) -> T? {
  if value is NSNull { return nil }
  return value as! T?
}

/// Home screen quick-action shortcut item.
///
/// Generated class from Pigeon that represents data sent in messages.
struct ShortcutItemMessage {
  /// The identifier of this item; should be unique within the app.
  var type: String
  /// Localized title of the item.
  var localizedTitle: String
  /// Name of native resource to be displayed as the icon for this item.
  var icon: String? = nil

  // swift-format-ignore: AlwaysUseLowerCamelCase
  static func fromList(_ __pigeon_list: [Any?]) -> ShortcutItemMessage? {
    let type = __pigeon_list[0] as! String
    let localizedTitle = __pigeon_list[1] as! String
    let icon: String? = nilOrValue(__pigeon_list[2])

    return ShortcutItemMessage(
      type: type,
      localizedTitle: localizedTitle,
      icon: icon
    )
  }
  func toList() -> [Any?] {
    return [
      type,
      localizedTitle,
      icon,
    ]
  }
}
private class messagesPigeonCodecReader: FlutterStandardReader {
  override func readValue(ofType type: UInt8) -> Any? {
    switch type {
    case 129:
      return ShortcutItemMessage.fromList(self.readValue() as! [Any?])
    default:
      return super.readValue(ofType: type)
    }
  }
}

private class messagesPigeonCodecWriter: FlutterStandardWriter {
  override func writeValue(_ value: Any) {
    if let value = value as? ShortcutItemMessage {
      super.writeByte(129)
      super.writeValue(value.toList())
    } else {
      super.writeValue(value)
    }
  }
}

private class messagesPigeonCodecReaderWriter: FlutterStandardReaderWriter {
  override func reader(with data: Data) -> FlutterStandardReader {
    return messagesPigeonCodecReader(data: data)
  }

  override func writer(with data: NSMutableData) -> FlutterStandardWriter {
    return messagesPigeonCodecWriter(data: data)
  }
}

class messagesPigeonCodec: FlutterStandardMessageCodec, @unchecked Sendable {
  static let shared = messagesPigeonCodec(readerWriter: messagesPigeonCodecReaderWriter())
}

/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol IOSQuickActionsApi {
  /// Sets the dynamic shortcuts for the app.
  func setShortcutItems(itemsList: [ShortcutItemMessage]) throws
  /// Removes all dynamic shortcuts.
  func clearShortcutItems() throws
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class IOSQuickActionsApiSetup {
  static var codec: FlutterStandardMessageCodec { messagesPigeonCodec.shared }
  /// Sets up an instance of `IOSQuickActionsApi` to handle messages through the `binaryMessenger`.
  static func setUp(
    binaryMessenger: FlutterBinaryMessenger, api: IOSQuickActionsApi?,
    messageChannelSuffix: String = ""
  ) {
    let channelSuffix = messageChannelSuffix.count > 0 ? ".\(messageChannelSuffix)" : ""
    /// Sets the dynamic shortcuts for the app.
    let setShortcutItemsChannel = FlutterBasicMessageChannel(
      name:
        "dev.flutter.pigeon.quick_actions_ios.IOSQuickActionsApi.setShortcutItems\(channelSuffix)",
      binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      setShortcutItemsChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let itemsListArg = args[0] as! [ShortcutItemMessage]
        do {
          try api.setShortcutItems(itemsList: itemsListArg)
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      setShortcutItemsChannel.setMessageHandler(nil)
    }
    /// Removes all dynamic shortcuts.
    let clearShortcutItemsChannel = FlutterBasicMessageChannel(
      name:
        "dev.flutter.pigeon.quick_actions_ios.IOSQuickActionsApi.clearShortcutItems\(channelSuffix)",
      binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      clearShortcutItemsChannel.setMessageHandler { _, reply in
        do {
          try api.clearShortcutItems()
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      clearShortcutItemsChannel.setMessageHandler(nil)
    }
  }
}
/// Generated protocol from Pigeon that represents Flutter messages that can be called from Swift.
protocol IOSQuickActionsFlutterApiProtocol {
  /// Sends a string representing a shortcut from the native platform to the app.
  func launchAction(
    action actionArg: String, completion: @escaping (Result<Void, PigeonError>) -> Void)
}
class IOSQuickActionsFlutterApi: IOSQuickActionsFlutterApiProtocol {
  private let binaryMessenger: FlutterBinaryMessenger
  private let messageChannelSuffix: String
  init(binaryMessenger: FlutterBinaryMessenger, messageChannelSuffix: String = "") {
    self.binaryMessenger = binaryMessenger
    self.messageChannelSuffix = messageChannelSuffix.count > 0 ? ".\(messageChannelSuffix)" : ""
  }
  var codec: messagesPigeonCodec {
    return messagesPigeonCodec.shared
  }
  /// Sends a string representing a shortcut from the native platform to the app.
  func launchAction(
    action actionArg: String, completion: @escaping (Result<Void, PigeonError>) -> Void
  ) {
    let channelName: String =
      "dev.flutter.pigeon.quick_actions_ios.IOSQuickActionsFlutterApi.launchAction\(messageChannelSuffix)"
    let channel = FlutterBasicMessageChannel(
      name: channelName, binaryMessenger: binaryMessenger, codec: codec)
    channel.sendMessage([actionArg] as [Any?]) { response in
      guard let listResponse = response as? [Any?] else {
        completion(.failure(createConnectionError(withChannelName: channelName)))
        return
      }
      if listResponse.count > 1 {
        let code: String = listResponse[0] as! String
        let message: String? = nilOrValue(listResponse[1])
        let details: String? = nilOrValue(listResponse[2])
        completion(.failure(PigeonError(code: code, message: message, details: details)))
      } else {
        completion(.success(Void()))
      }
    }
  }
}