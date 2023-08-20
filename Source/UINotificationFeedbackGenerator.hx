package;

// Includes the UIKit framework and gets the UINotificationFeedbackGenerator class so you can get haptic feedback functions.
// Check out the hx-ios-uikit repository for more information on how to access native iOS APIs: https://github.com/rainyt/hx-ios-uikit

@:objc
@:native("UINotificationFeedbackGenerator")
@:include("UIKit/UIKit.h")
extern class UINotificationFeedbackGenerator {
	static function alloc():UINotificationFeedbackGenerator;
	function init():UINotificationFeedbackGenerator;
	function notificationOccurred(notificationType:UINotificationFeedbackType):Void;
	function prepare():Void;
}

@:objc
@:native("UINotificationFeedbackType")
@:include("UIKit/UIKit.h")
extern enum abstract UINotificationFeedbackType(Int) from Int to Int {
	var UINotificationFeedbackTypeSuccess;
	var UINotificationFeedbackTypeWarning;
	var UINotificationFeedbackTypeError;
}
