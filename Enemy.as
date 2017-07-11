package {

	import flash.display.*;
	import flash.events.*;


	public class Enemy extends MovieClip {

		var location: Vector2;
		var velocity: Vector2;
		var acceleration: Vector2;

		var char: Character;
		var bullet: Bullet;
		var health:Number = 5;

		public function Enemy(char: Character) {
			location = new Vector2(100, 100);
			velocity = new Vector2(1, 1);
			acceleration = new Vector2(0.05, 0.05);
			this.char = char;
			addEventListener(Event.ENTER_FRAME, Update);

		}

		public function Collision(bullet: Bullet) {
			if(bullet == null){
				return;
			}
			this.bullet = bullet;
			if (this.hitTestObject(bullet)) {	
				trace("Oh no im taking damage!")
				this.health -= 1;
				trace(this.health);
				if(this.health <=0){
					stage.removeChild(this);
				}
			}
		}

		public function Update(e: Event): void {

			var loc: Vector2 = char.location.copy();
			loc.sub(location.copy());
			loc.normalize();
			loc.multS(3);
			location.add(loc);
			this.x = location.x;
			this.y = location.y;
		}
	}

}