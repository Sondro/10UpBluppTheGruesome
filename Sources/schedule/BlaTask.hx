package schedule;

import dialogue.Bla;
import dialogue.Dialogue;
import kha.math.Random;
import kha.Scheduler;
import kha2d.Direction;
import sprites.Coffee;
import sprites.RandomGuy;

class BlaTask extends Task {
	private var taskScheduled: Bool;
	private var aim: RandomGuy;
	
	public function new(sprite: RandomGuy, aim: RandomGuy) {
		super(guy);
		taskScheduled = false;
		this.aim = aim;
	}
	
	override public function update(): Void {
		if (!taskScheduled) {
			var drg = new Dialogue();
			drg.insert([new Bla(Localization.getText(Keys_text.HELLO, [aim.IdCard.Name]), guy, false)]);
			Empty.the.npcDlgs.push(drg);
		}
	}
}