package sprites;

import kha.Loader;
import kha2d.Animation;
import sprites.IdSystem.IdCard;

class Mechanic extends RandomGuy {
	public function new(stuff: Array<InteractiveSprite>, youarethemonster: Bool) {
		super(stuff, youarethemonster);
		image = Loader.the.getImage("mechanic");
		standLeft = Animation.create(10);
		standRight = Animation.create(0);
		walkLeft = Animation.createRange(11, 18, 4);
		walkRight = Animation.createRange(1, 8, 4);
		IdCard = new IdCard("Mechanic");
	}
}
