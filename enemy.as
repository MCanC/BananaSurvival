package {

	import flash.display.*;
	import flash.events.*;


	public class Enemy extends MovieClip {

		var location: Vector2;
		var velocity: Vector2;
		var acceleration: Vector2;

		var char:Character;

		public function Enemy(char:Character) {
			location = new Vector2(100, 100);
			velocity = new Vector2(1, 1);
			acceleration = new Vector2(0.05, 0.05);
			this.char = char;
			addEventListener(Event.ENTER_FRAME, Update);
			
		}

		public function Update(e: Event): void {
			
			var loc:Vector2 = char.location.copy();
			loc.sub(location.copy());
			loc.normalize();
			loc.multS(3);
			location.add(loc);
			this.x = location.x;
			this.y = location.y;
			
			//if(this.hitTestObject(char)){
				//trace("I hit something")
			//}

		}
	}

}