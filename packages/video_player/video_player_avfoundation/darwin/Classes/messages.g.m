// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
// Autogenerated from Pigeon (v13.1.2), do not edit directly.
// See also: https://pub.dev/packages/pigeon

#import "messages.g.h"

#if TARGET_OS_OSX
#import <FlutterMacOS/FlutterMacOS.h>
#else
#import <Flutter/Flutter.h>
#endif

#if !__has_feature(objc_arc)
#error File requires ARC to be enabled.
#endif

static NSArray *wrapResult(id result, FlutterError *error) {
  if (error) {
    return @[
      error.code ?: [NSNull null], error.message ?: [NSNull null], error.details ?: [NSNull null]
    ];
  }
  return @[ result ?: [NSNull null] ];
}

static id GetNullableObjectAtIndex(NSArray *array, NSInteger key) {
  id result = array[key];
  return (result == [NSNull null]) ? nil : result;
}

@interface FVPTextureMessage ()
+ (FVPTextureMessage *)fromList:(NSArray *)list;
+ (nullable FVPTextureMessage *)nullableFromList:(NSArray *)list;
- (NSArray *)toList;
@end

@interface FVPLoopingMessage ()
+ (FVPLoopingMessage *)fromList:(NSArray *)list;
+ (nullable FVPLoopingMessage *)nullableFromList:(NSArray *)list;
- (NSArray *)toList;
@end

@interface FVPVolumeMessage ()
+ (FVPVolumeMessage *)fromList:(NSArray *)list;
+ (nullable FVPVolumeMessage *)nullableFromList:(NSArray *)list;
- (NSArray *)toList;
@end

@interface FVPPlaybackSpeedMessage ()
+ (FVPPlaybackSpeedMessage *)fromList:(NSArray *)list;
+ (nullable FVPPlaybackSpeedMessage *)nullableFromList:(NSArray *)list;
- (NSArray *)toList;
@end

@interface FVPPositionMessage ()
+ (FVPPositionMessage *)fromList:(NSArray *)list;
+ (nullable FVPPositionMessage *)nullableFromList:(NSArray *)list;
- (NSArray *)toList;
@end

@interface FVPCreateMessage ()
+ (FVPCreateMessage *)fromList:(NSArray *)list;
+ (nullable FVPCreateMessage *)nullableFromList:(NSArray *)list;
- (NSArray *)toList;
@end

@interface FVPLoadMessage ()
+ (FVPLoadMessage *)fromList:(NSArray *)list;
+ (nullable FVPLoadMessage *)nullableFromList:(NSArray *)list;
- (NSArray *)toList;
@end

@interface FVPMixWithOthersMessage ()
+ (FVPMixWithOthersMessage *)fromList:(NSArray *)list;
+ (nullable FVPMixWithOthersMessage *)nullableFromList:(NSArray *)list;
- (NSArray *)toList;
@end

@implementation FVPTextureMessage
+ (instancetype)makeWithTextureId:(NSInteger )textureId {
  FVPTextureMessage* pigeonResult = [[FVPTextureMessage alloc] init];
  pigeonResult.textureId = textureId;
  return pigeonResult;
}
+ (FVPTextureMessage *)fromList:(NSArray *)list {
  FVPTextureMessage *pigeonResult = [[FVPTextureMessage alloc] init];
  pigeonResult.textureId = [GetNullableObjectAtIndex(list, 0) integerValue];
  return pigeonResult;
}
+ (nullable FVPTextureMessage *)nullableFromList:(NSArray *)list {
  return (list) ? [FVPTextureMessage fromList:list] : nil;
}
- (NSArray *)toList {
  return @[
    @(self.textureId),
  ];
}
@end

@implementation FVPLoopingMessage
+ (instancetype)makeWithTextureId:(NSInteger )textureId
    isLooping:(BOOL )isLooping {
  FVPLoopingMessage* pigeonResult = [[FVPLoopingMessage alloc] init];
  pigeonResult.textureId = textureId;
  pigeonResult.isLooping = isLooping;
  return pigeonResult;
}
+ (FVPLoopingMessage *)fromList:(NSArray *)list {
  FVPLoopingMessage *pigeonResult = [[FVPLoopingMessage alloc] init];
  pigeonResult.textureId = [GetNullableObjectAtIndex(list, 0) integerValue];
  pigeonResult.isLooping = [GetNullableObjectAtIndex(list, 1) boolValue];
  return pigeonResult;
}
+ (nullable FVPLoopingMessage *)nullableFromList:(NSArray *)list {
  return (list) ? [FVPLoopingMessage fromList:list] : nil;
}
- (NSArray *)toList {
  return @[
    @(self.textureId),
    @(self.isLooping),
  ];
}
@end

@implementation FVPVolumeMessage
+ (instancetype)makeWithTextureId:(NSInteger )textureId
    volume:(double )volume {
  FVPVolumeMessage* pigeonResult = [[FVPVolumeMessage alloc] init];
  pigeonResult.textureId = textureId;
  pigeonResult.volume = volume;
  return pigeonResult;
}
+ (FVPVolumeMessage *)fromList:(NSArray *)list {
  FVPVolumeMessage *pigeonResult = [[FVPVolumeMessage alloc] init];
  pigeonResult.textureId = [GetNullableObjectAtIndex(list, 0) integerValue];
  pigeonResult.volume = [GetNullableObjectAtIndex(list, 1) doubleValue];
  return pigeonResult;
}
+ (nullable FVPVolumeMessage *)nullableFromList:(NSArray *)list {
  return (list) ? [FVPVolumeMessage fromList:list] : nil;
}
- (NSArray *)toList {
  return @[
    @(self.textureId),
    @(self.volume),
  ];
}
@end

@implementation FVPPlaybackSpeedMessage
+ (instancetype)makeWithTextureId:(NSInteger )textureId
    speed:(double )speed {
  FVPPlaybackSpeedMessage* pigeonResult = [[FVPPlaybackSpeedMessage alloc] init];
  pigeonResult.textureId = textureId;
  pigeonResult.speed = speed;
  return pigeonResult;
}
+ (FVPPlaybackSpeedMessage *)fromList:(NSArray *)list {
  FVPPlaybackSpeedMessage *pigeonResult = [[FVPPlaybackSpeedMessage alloc] init];
  pigeonResult.textureId = [GetNullableObjectAtIndex(list, 0) integerValue];
  pigeonResult.speed = [GetNullableObjectAtIndex(list, 1) doubleValue];
  return pigeonResult;
}
+ (nullable FVPPlaybackSpeedMessage *)nullableFromList:(NSArray *)list {
  return (list) ? [FVPPlaybackSpeedMessage fromList:list] : nil;
}
- (NSArray *)toList {
  return @[
    @(self.textureId),
    @(self.speed),
  ];
}
@end

@implementation FVPPositionMessage
+ (instancetype)makeWithTextureId:(NSInteger )textureId
    position:(NSInteger )position {
  FVPPositionMessage* pigeonResult = [[FVPPositionMessage alloc] init];
  pigeonResult.textureId = textureId;
  pigeonResult.position = position;
  return pigeonResult;
}
+ (FVPPositionMessage *)fromList:(NSArray *)list {
  FVPPositionMessage *pigeonResult = [[FVPPositionMessage alloc] init];
  pigeonResult.textureId = [GetNullableObjectAtIndex(list, 0) integerValue];
  pigeonResult.position = [GetNullableObjectAtIndex(list, 1) integerValue];
  return pigeonResult;
}
+ (nullable FVPPositionMessage *)nullableFromList:(NSArray *)list {
  return (list) ? [FVPPositionMessage fromList:list] : nil;
}
- (NSArray *)toList {
  return @[
    @(self.textureId),
    @(self.position),
  ];
}
@end

@implementation FVPCreateMessage
+ (instancetype)makeWithAsset:(nullable NSString *)asset
    uri:(nullable NSString *)uri
    packageName:(nullable NSString *)packageName
    formatHint:(nullable NSString *)formatHint
    httpHeaders:(NSDictionary<NSString *, NSString *> *)httpHeaders {
  FVPCreateMessage* pigeonResult = [[FVPCreateMessage alloc] init];
  pigeonResult.asset = asset;
  pigeonResult.uri = uri;
  pigeonResult.packageName = packageName;
  pigeonResult.formatHint = formatHint;
  pigeonResult.httpHeaders = httpHeaders;
  return pigeonResult;
}
+ (FVPCreateMessage *)fromList:(NSArray *)list {
  FVPCreateMessage *pigeonResult = [[FVPCreateMessage alloc] init];
  pigeonResult.asset = GetNullableObjectAtIndex(list, 0);
  pigeonResult.uri = GetNullableObjectAtIndex(list, 1);
  pigeonResult.packageName = GetNullableObjectAtIndex(list, 2);
  pigeonResult.formatHint = GetNullableObjectAtIndex(list, 3);
  pigeonResult.httpHeaders = GetNullableObjectAtIndex(list, 4);
  return pigeonResult;
}
+ (nullable FVPCreateMessage *)nullableFromList:(NSArray *)list {
  return (list) ? [FVPCreateMessage fromList:list] : nil;
}
- (NSArray *)toList {
  return @[
    self.asset ?: [NSNull null],
    self.uri ?: [NSNull null],
    self.packageName ?: [NSNull null],
    self.formatHint ?: [NSNull null],
    self.httpHeaders ?: [NSNull null],
  ];
}
@end

@implementation FVPLoadMessage
+ (instancetype)makeWithTextureId:(NSInteger )textureId
    asset:(nullable NSString *)asset
    uri:(nullable NSString *)uri
    packageName:(nullable NSString *)packageName
    formatHint:(nullable NSString *)formatHint
    httpHeaders:(NSDictionary<NSString *, NSString *> *)httpHeaders {
  FVPLoadMessage* pigeonResult = [[FVPLoadMessage alloc] init];
  pigeonResult.textureId = textureId;
  pigeonResult.asset = asset;
  pigeonResult.uri = uri;
  pigeonResult.packageName = packageName;
  pigeonResult.formatHint = formatHint;
  pigeonResult.httpHeaders = httpHeaders;
  return pigeonResult;
}
+ (FVPLoadMessage *)fromList:(NSArray *)list {
  FVPLoadMessage *pigeonResult = [[FVPLoadMessage alloc] init];
  pigeonResult.textureId = [GetNullableObjectAtIndex(list, 0) integerValue];
  pigeonResult.asset = GetNullableObjectAtIndex(list, 1);
  pigeonResult.uri = GetNullableObjectAtIndex(list, 2);
  pigeonResult.packageName = GetNullableObjectAtIndex(list, 3);
  pigeonResult.formatHint = GetNullableObjectAtIndex(list, 4);
  pigeonResult.httpHeaders = GetNullableObjectAtIndex(list, 5);
  return pigeonResult;
}
+ (nullable FVPLoadMessage *)nullableFromList:(NSArray *)list {
  return (list) ? [FVPLoadMessage fromList:list] : nil;
}
- (NSArray *)toList {
  return @[
    @(self.textureId),
    self.asset ?: [NSNull null],
    self.uri ?: [NSNull null],
    self.packageName ?: [NSNull null],
    self.formatHint ?: [NSNull null],
    self.httpHeaders ?: [NSNull null],
  ];
}
@end

@implementation FVPMixWithOthersMessage
+ (instancetype)makeWithMixWithOthers:(BOOL )mixWithOthers {
  FVPMixWithOthersMessage* pigeonResult = [[FVPMixWithOthersMessage alloc] init];
  pigeonResult.mixWithOthers = mixWithOthers;
  return pigeonResult;
}
+ (FVPMixWithOthersMessage *)fromList:(NSArray *)list {
  FVPMixWithOthersMessage *pigeonResult = [[FVPMixWithOthersMessage alloc] init];
  pigeonResult.mixWithOthers = [GetNullableObjectAtIndex(list, 0) boolValue];
  return pigeonResult;
}
+ (nullable FVPMixWithOthersMessage *)nullableFromList:(NSArray *)list {
  return (list) ? [FVPMixWithOthersMessage fromList:list] : nil;
}
- (NSArray *)toList {
  return @[
    @(self.mixWithOthers),
  ];
}
@end

@interface FVPAVFoundationVideoPlayerApiCodecReader : FlutterStandardReader
@end
@implementation FVPAVFoundationVideoPlayerApiCodecReader
- (nullable id)readValueOfType:(UInt8)type {
  switch (type) {
    case 128: 
      return [FVPCreateMessage fromList:[self readValue]];
    case 129: 
      return [FVPLoadMessage fromList:[self readValue]];
    case 130: 
      return [FVPLoopingMessage fromList:[self readValue]];
    case 131: 
      return [FVPMixWithOthersMessage fromList:[self readValue]];
    case 132: 
      return [FVPPlaybackSpeedMessage fromList:[self readValue]];
    case 133: 
      return [FVPPositionMessage fromList:[self readValue]];
    case 134: 
      return [FVPTextureMessage fromList:[self readValue]];
    case 135: 
      return [FVPVolumeMessage fromList:[self readValue]];
    default:
      return [super readValueOfType:type];
  }
}
@end

@interface FVPAVFoundationVideoPlayerApiCodecWriter : FlutterStandardWriter
@end
@implementation FVPAVFoundationVideoPlayerApiCodecWriter
- (void)writeValue:(id)value {
  if ([value isKindOfClass:[FVPCreateMessage class]]) {
    [self writeByte:128];
    [self writeValue:[value toList]];
  } else if ([value isKindOfClass:[FVPLoadMessage class]]) {
    [self writeByte:129];
    [self writeValue:[value toList]];
  } else if ([value isKindOfClass:[FVPLoopingMessage class]]) {
    [self writeByte:130];
    [self writeValue:[value toList]];
  } else if ([value isKindOfClass:[FVPMixWithOthersMessage class]]) {
    [self writeByte:131];
    [self writeValue:[value toList]];
  } else if ([value isKindOfClass:[FVPPlaybackSpeedMessage class]]) {
    [self writeByte:132];
    [self writeValue:[value toList]];
  } else if ([value isKindOfClass:[FVPPositionMessage class]]) {
    [self writeByte:133];
    [self writeValue:[value toList]];
  } else if ([value isKindOfClass:[FVPTextureMessage class]]) {
    [self writeByte:134];
    [self writeValue:[value toList]];
  } else if ([value isKindOfClass:[FVPVolumeMessage class]]) {
    [self writeByte:135];
    [self writeValue:[value toList]];
  } else {
    [super writeValue:value];
  }
}
@end

@interface FVPAVFoundationVideoPlayerApiCodecReaderWriter : FlutterStandardReaderWriter
@end
@implementation FVPAVFoundationVideoPlayerApiCodecReaderWriter
- (FlutterStandardWriter *)writerWithData:(NSMutableData *)data {
  return [[FVPAVFoundationVideoPlayerApiCodecWriter alloc] initWithData:data];
}
- (FlutterStandardReader *)readerWithData:(NSData *)data {
  return [[FVPAVFoundationVideoPlayerApiCodecReader alloc] initWithData:data];
}
@end

NSObject<FlutterMessageCodec> *FVPAVFoundationVideoPlayerApiGetCodec(void) {
  static FlutterStandardMessageCodec *sSharedObject = nil;
  static dispatch_once_t sPred = 0;
  dispatch_once(&sPred, ^{
    FVPAVFoundationVideoPlayerApiCodecReaderWriter *readerWriter = [[FVPAVFoundationVideoPlayerApiCodecReaderWriter alloc] init];
    sSharedObject = [FlutterStandardMessageCodec codecWithReaderWriter:readerWriter];
  });
  return sSharedObject;
}

void SetUpFVPAVFoundationVideoPlayerApi(id<FlutterBinaryMessenger> binaryMessenger, NSObject<FVPAVFoundationVideoPlayerApi> *api) {
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.video_player_avfoundation.AVFoundationVideoPlayerApi.initialize"
        binaryMessenger:binaryMessenger
        codec:FVPAVFoundationVideoPlayerApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(initialize:)], @"FVPAVFoundationVideoPlayerApi api (%@) doesn't respond to @selector(initialize:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        FlutterError *error;
        [api initialize:&error];
        callback(wrapResult(nil, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.video_player_avfoundation.AVFoundationVideoPlayerApi.create"
        binaryMessenger:binaryMessenger
        codec:FVPAVFoundationVideoPlayerApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(create:error:)], @"FVPAVFoundationVideoPlayerApi api (%@) doesn't respond to @selector(create:error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        FVPCreateMessage *arg_msg = GetNullableObjectAtIndex(args, 0);
        FlutterError *error;
        FVPTextureMessage *output = [api create:arg_msg error:&error];
        callback(wrapResult(output, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.video_player_avfoundation.AVFoundationVideoPlayerApi.load"
        binaryMessenger:binaryMessenger
        codec:FVPAVFoundationVideoPlayerApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(load:error:)], @"FVPAVFoundationVideoPlayerApi api (%@) doesn't respond to @selector(load:error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        FVPLoadMessage *arg_msg = GetNullableObjectAtIndex(args, 0);
        FlutterError *error;
        [api load:arg_msg error:&error];
        callback(wrapResult(nil, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.video_player_avfoundation.AVFoundationVideoPlayerApi.dispose"
        binaryMessenger:binaryMessenger
        codec:FVPAVFoundationVideoPlayerApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(dispose:error:)], @"FVPAVFoundationVideoPlayerApi api (%@) doesn't respond to @selector(dispose:error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        FVPTextureMessage *arg_msg = GetNullableObjectAtIndex(args, 0);
        FlutterError *error;
        [api dispose:arg_msg error:&error];
        callback(wrapResult(nil, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.video_player_avfoundation.AVFoundationVideoPlayerApi.setLooping"
        binaryMessenger:binaryMessenger
        codec:FVPAVFoundationVideoPlayerApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(setLooping:error:)], @"FVPAVFoundationVideoPlayerApi api (%@) doesn't respond to @selector(setLooping:error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        FVPLoopingMessage *arg_msg = GetNullableObjectAtIndex(args, 0);
        FlutterError *error;
        [api setLooping:arg_msg error:&error];
        callback(wrapResult(nil, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.video_player_avfoundation.AVFoundationVideoPlayerApi.setVolume"
        binaryMessenger:binaryMessenger
        codec:FVPAVFoundationVideoPlayerApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(setVolume:error:)], @"FVPAVFoundationVideoPlayerApi api (%@) doesn't respond to @selector(setVolume:error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        FVPVolumeMessage *arg_msg = GetNullableObjectAtIndex(args, 0);
        FlutterError *error;
        [api setVolume:arg_msg error:&error];
        callback(wrapResult(nil, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.video_player_avfoundation.AVFoundationVideoPlayerApi.setPlaybackSpeed"
        binaryMessenger:binaryMessenger
        codec:FVPAVFoundationVideoPlayerApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(setPlaybackSpeed:error:)], @"FVPAVFoundationVideoPlayerApi api (%@) doesn't respond to @selector(setPlaybackSpeed:error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        FVPPlaybackSpeedMessage *arg_msg = GetNullableObjectAtIndex(args, 0);
        FlutterError *error;
        [api setPlaybackSpeed:arg_msg error:&error];
        callback(wrapResult(nil, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.video_player_avfoundation.AVFoundationVideoPlayerApi.play"
        binaryMessenger:binaryMessenger
        codec:FVPAVFoundationVideoPlayerApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(play:error:)], @"FVPAVFoundationVideoPlayerApi api (%@) doesn't respond to @selector(play:error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        FVPTextureMessage *arg_msg = GetNullableObjectAtIndex(args, 0);
        FlutterError *error;
        [api play:arg_msg error:&error];
        callback(wrapResult(nil, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.video_player_avfoundation.AVFoundationVideoPlayerApi.position"
        binaryMessenger:binaryMessenger
        codec:FVPAVFoundationVideoPlayerApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(position:error:)], @"FVPAVFoundationVideoPlayerApi api (%@) doesn't respond to @selector(position:error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        FVPTextureMessage *arg_msg = GetNullableObjectAtIndex(args, 0);
        FlutterError *error;
        FVPPositionMessage *output = [api position:arg_msg error:&error];
        callback(wrapResult(output, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.video_player_avfoundation.AVFoundationVideoPlayerApi.seekTo"
        binaryMessenger:binaryMessenger
        codec:FVPAVFoundationVideoPlayerApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(seekTo:completion:)], @"FVPAVFoundationVideoPlayerApi api (%@) doesn't respond to @selector(seekTo:completion:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        FVPPositionMessage *arg_msg = GetNullableObjectAtIndex(args, 0);
        [api seekTo:arg_msg completion:^(FlutterError *_Nullable error) {
          callback(wrapResult(nil, error));
        }];
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.video_player_avfoundation.AVFoundationVideoPlayerApi.pause"
        binaryMessenger:binaryMessenger
        codec:FVPAVFoundationVideoPlayerApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(pause:error:)], @"FVPAVFoundationVideoPlayerApi api (%@) doesn't respond to @selector(pause:error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        FVPTextureMessage *arg_msg = GetNullableObjectAtIndex(args, 0);
        FlutterError *error;
        [api pause:arg_msg error:&error];
        callback(wrapResult(nil, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.video_player_avfoundation.AVFoundationVideoPlayerApi.setMixWithOthers"
        binaryMessenger:binaryMessenger
        codec:FVPAVFoundationVideoPlayerApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(setMixWithOthers:error:)], @"FVPAVFoundationVideoPlayerApi api (%@) doesn't respond to @selector(setMixWithOthers:error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        FVPMixWithOthersMessage *arg_msg = GetNullableObjectAtIndex(args, 0);
        FlutterError *error;
        [api setMixWithOthers:arg_msg error:&error];
        callback(wrapResult(nil, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
}
