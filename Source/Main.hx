package;

import openfl.geom.ColorTransform;
import openfl.display.BitmapData;
import openfl.events.MouseEvent;
import openfl.display.Bitmap;
import openfl.Assets;
import openfl.events.TouchEvent;
import openfl.display.Sprite;

class Main extends Sprite {
	var generator:UINotificationFeedbackGenerator;

	public function new() {
		super();
		var bitmapData = Assets.getBitmapData("assets/snek.png");
		var bitmap = new Bitmap(bitmapData);
		addChild(bitmap);

		stage.addEventListener(TouchEvent.TOUCH_BEGIN, event -> {
			addImage(bitmapData, event.stageX, event.stageY, true);
		});

		// Initialise the generator, you need both alloc() and init() just like in Objective-C.
		generator = UINotificationFeedbackGenerator.alloc().init();
	}

	function addImage(bitmapData:BitmapData, x:Float, y:Float, shouldTint:Bool) {
		var bitmap = new Bitmap(bitmapData);

		if (shouldTint) {
			var tintedData = bitmapData.clone();
			tintedData.colorTransform(bitmap.getBounds(stage), new ColorTransform(1, 0, 0, 1));
			bitmap.bitmapData = tintedData;
		}

		addChild(bitmap);

		bitmap.x = x - bitmap.width / 2;
		bitmap.y = y - bitmap.height / 2;

		// Prepare and play the haptics. You probably don't need prepare() here.
		generator.prepare();
		generator.notificationOccurred(UINotificationFeedbackTypeError);
	}
}
