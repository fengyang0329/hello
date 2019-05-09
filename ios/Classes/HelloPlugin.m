#import "HelloPlugin.h"

@implementation HelloPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"hello"
            binaryMessenger:[registrar messenger]];
  HelloPlugin* instance = [[HelloPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {


    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  }if ([call.method isEqualToString:@"getBattery"]) {

      [UIDevice currentDevice].batteryMonitoringEnabled = YES;
      double deviceLevel = [UIDevice currentDevice].batteryLevel;
      UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Battery" message:[NSString stringWithFormat:@"%f",deviceLevel] delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:@"ok", nil];
      [alert show];
      result(@(deviceLevel));
  }
  else {
    result(FlutterMethodNotImplemented);
  }
}

@end
