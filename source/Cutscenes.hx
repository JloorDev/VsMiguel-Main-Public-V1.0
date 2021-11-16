package;

import haxe.display.Display.Package;
import openfl.display.BitmapData;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import lime.utils.Assets;
import flixel.graphics.FlxGraphic;
import flixel.util.FlxTimer;
import PlayState;

class Cutscenes extends MusicBeatState{
	
	var bgNight:FlxSprite;
	var people:FlxSprite;
	var miguel:FlxSprite;
	var finalBG:FlxSprite;
	var gf:FlxSprite;
	var bf:FlxSprite;

	override public function create(){
		FlxG.sound.play(Paths.sound('DariaAnimationEnd'), 1);

		PlayState.defaultCamZoom = 0.5;
		bgNight = new FlxSprite(-600, -200);
		bgNight.frames = Paths.getSparrowAtlas('vsMiguel/stageNight/bgNight', 'shared');
		bgNight.animation.addByPrefix('idle', 'BGHouseNight', 24);
		bgNight.animation.play('idle');
		bgNight.setGraphicSize(Std.int(bgNight.width * 1.1));
		bgNight.scrollFactor.set(0.9, 0.9);
		bgNight.updateHitbox();
		bgNight.antialiasing = true;
		add(bgNight);

		people = new FlxSprite(-600, -200);
		people.frames = Paths.getSparrowAtlas('vsMiguel/stageDark/CharsBGSong4', 'shared');
		people.animation.addByPrefix('idle', 'CharsNightRedAnimation', 24);
		people.animation.play('idle');
		people.antialiasing = true;
		people.scrollFactor.set(0.9, 0.9);
		people.x += 400;
		people.y += 1070;
		add(people);

		finalBG = new FlxSprite(-600, -200);
		finalBG.frames = Paths.getSparrowAtlas('cinematic final/BG_DariaEndAnimation', 'shared');
		finalBG.setGraphicSize(Std.int(finalBG.width * 1.1));
		finalBG.updateHitbox();
		finalBG.antialiasing = true;
		finalBG.scrollFactor.set(0.9, 0.9);
		finalBG.active = false;
		add(finalBG);
		finalBG.kill();

		gf = new FlxSprite(-600, -200);
		gf.frames = Paths.getSparrowAtlas('characters/GF_assets', 'shared');
		gf.animation.addByPrefix('idle', 'GF Dancing Beat', 24);
		gf.animation.play('idle');
		gf.antialiasing = true;
		gf.scrollFactor.set(0.9, 0.9);
		gf.x += 460;
		gf.y += 810;
		add(gf);

		miguel = new FlxSprite(-600, -200);
		miguel.frames = Paths.getSparrowAtlas('cinematic final/Daria_AnimationEnd', 'shared');
		miguel.animation.addByPrefix('idle', 'DariaAnimation', 24);
		miguel.animation.play('idle');
		miguel.antialiasing = true;
		miguel.scrollFactor.set(0.9, 0.9);
		miguel.x += 300;
		miguel.y += 1160;
		add(miguel);

		bf = new FlxSprite(-600, -200);
		bf.frames = Paths.getSparrowAtlas('cinematic final/BF_AnimationEnd', 'shared');
		bf.animation.addByPrefix('idle', 'BF_Animation', 24);
		bf.animation.play('idle');
		bf.antialiasing = true;
		bf.scrollFactor.set(0.9, 0.9);
		bf.x += 900;
		bf.y += 980;
		add(bf);
		
		if(curBeat == 212){
			gf.visible = false;
			finalBG.revive();
		}
		if(curBeat == 214){
			gf.visible = true;
			finalBG.kill();
		}
    }

	override public function update(elapsed:Float):Void{
		super.update(elapsed);
		if(FlxG.keys.pressed.ENTER){
			end();
		}
	}
	public function end(e:FlxTimer=null){
		FlxG.switchState(new EndingState());
		trace("CUTSCENE");
	}
}