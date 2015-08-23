package;

import dialogue.BlaWithChoices;
import dialogue.DialogueItem;
import dialogue.StartDialogue;
import kha.math.Vector2;
import kha2d.Animation;
import kha.audio1.Audio;
import kha2d.Direction;
import kha.Loader;
import kha.Rectangle;
import kha.Sound;
import kha2d.Sprite;
import sprites.IdSystem.IdLoggerSprite;
import sprites.InteractiveSprite;

class Elevator extends IdLoggerSprite {
	var openAnimation : Animation;
	var closedAnimation : Animation;
	public var level : Int;
	public var open(default, set_open) : Bool;
	
	public function new(x : Float, y : Float, level : Int) {
		super(Keys_text.ELEVATOR, Loader.the.getImage("elevator"), 64 * 2, 78 * 2, 0);
		this.x = x - 64 * 2 / 2;
		this.y = y - 78 - 14;
		this.level = level;
		openAnimation = Animation.create(1);
		closedAnimation = Animation.create(0);
		collider = new Rectangle(0, 0, 64 * 2, 78 * 2);
		accy = 0;
		this.collides = false;
		
		isUseable = true;
	}
	
	public function set_open(value : Bool) : Bool {
		open = value;
		setAnimation(open ? openAnimation : closedAnimation);
		if (!open) {
			dlg.set([]);
		}
		return open;
	}
	
	override public function useFrom(dir:Direction, user:Dynamic):Bool 
	{
		if (super.useFrom(dir, user)) return false;
		if (open) 
		{
			var text : String = "";
			var choices = new Array<Array<DialogueItem>>();
			for (i in 0...ElevatorManager.the.levels)
			{
				var to: Int = ElevatorManager.the.levels - i;
				choices.push([new StartDialogue(ElevatorManager.the.getIn.bind(user, level, to, null))]);
				text += '\n$to. ' + Localization.getText(Keys_text.FLOOR);
			}
			dlg.insert([new BlaWithChoices(text, this, choices)]);
		}
		else
		{
			ElevatorManager.the.callTo(level);
		}
		
		return true;
	}
	
	/*public override function update() {
		if (lastupcount > 0) --lastupcount;	
		
		if (y == floor1) {
			firstFloor = true;
			if (!canMove) {
			speedy = 0.0;
			canMove = true;
			}
		}
		if (y == floor2) {
			firstFloor = false;
			if (!canMove) {
			speedy = 0.0;
			canMove = true;
			}
		}
		if (y == floor3) {
			lastFloor = false;
			if (!canMove) {
			speedy = 0.0;
			canMove = true;
			}
		}
		if (y == floor4) {
			lastFloor = true;
			if (!canMove) {
			speedy = 0.0;
			canMove = true;
			}
		}		
		super.update();
	}
	
	public function goup() {
		if (canMove) {
			if (!lastFloor) {
				speedy = -elevatorSpeed;
				canMove = false;
				}
		}
	}
	
	public function godown() {
		if (canMove) {
		if (!firstFloor) {
				speedy = elevatorSpeed;
				canMove = false;
				}
	}
	}
	
	public function setUp() {
		up = false;
		lastupcount = 8;
	}*/
}
