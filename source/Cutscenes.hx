package;

import haxe.display.Display.Package;
import openfl.display.BitmapData;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import lime.utils.Assets;
import flixel.graphics.FlxGraphic;

class Cutscenes extends MusicBeatState{
	inline static public function cutscenes1(path:String) {
		return BitmapData.fromFile(Paths.image('cutscenes/1/${path}', 'shared'));
	}

	inline static public function cutscenes2(patho:String) {
		return BitmapData.fromFile(Paths.image('cutscenes/2/${patho}', 'shared'));
	}
}