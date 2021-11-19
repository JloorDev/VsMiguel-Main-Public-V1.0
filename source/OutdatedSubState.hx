package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.effects.FlxFlicker;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import flixel.util.FlxColor;
import flixel.addons.transition.FlxTransitionableState;
import lime.app.Application;

class OutdatedSubState extends MusicBeatState
{
	public static var leftState:Bool = false;
	var selectedSomethin:Bool = false;
	var text1:Alphabet;
	var text2:Alphabet;
	var text3:Alphabet;
	var text4:Alphabet;
	var text5:Alphabet;

	override function create()
	{
		super.create();
		var bg:FlxSprite = new FlxSprite(-5).loadGraphic(Paths.image('Warning'));
		add(bg);
		text1 = new Alphabet(0, 170, "Waning!", true);
		text1.screenCenter(X);
		add(text1);
		text2 = new Alphabet(0, 250, "This mod Contains", true);
		text2.screenCenter(X);
		add(text2);
		text3 = new Alphabet(0, 330, "Strong Lights", true);
		text3.screenCenter(X);
		add(text3);
		text4 = new Alphabet(0, 410, "Please take this with care", true);
		text4.screenCenter(X);
		add(text4);
		text5 = new Alphabet(0, 490, "Press Enter to continue!", true);
		text5.screenCenter(X);
		add(text5);
	}

	override function update(elapsed:Float)
	{
		if (!selectedSomethin)
			{
				if (controls.ACCEPT)
				{
					FlxG.sound.play(Paths.sound('confirmMenu'));
					FlxFlicker.flicker(text5, 1, 0.1, true);
					FlxFlicker.flicker(text4, 1, 0.1, true);
					FlxFlicker.flicker(text3, 1, 0.1, true);
					FlxFlicker.flicker(text2, 1, 0.1, true);
					FlxFlicker.flicker(text1, 1, 0.1, true);
					new FlxTimer().start(1.2, function (tmr:FlxTimer) {
						selectedSomethin = true;
						FlxG.switchState(new MainMenuState());
					});
				}
				if (controls.BACK)
				{
					selectedSomethin = true;
					FlxG.sound.play(Paths.sound('cancelMenu'));
					FlxG.switchState(new TitleState());
				}
			}
		super.update(elapsed);
	}
}
