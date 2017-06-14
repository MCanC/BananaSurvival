package {

	import flash.display.Sprite;
	import flash.events.Event;


	public class Bullet extends Sprite {

		var speed: int;

		public function Bullet() {
			speed = 10;
			addEventListener(Event.ADDED_TO_STAGE, Initialize);
		}

		public function Update(e: Event) {
			this.x += Math.cos(rotation / 180 * Math.PI) * speed;
			this.y += Math.sin(rotation / 180 * Math.PI) * speed;

			if (x > stage.stageWidth || y > stage.stageHeight) {
				parent.removeChild(this);
			}
		}

		public function Initialize(e: Event) {
			addEventListener(Event.ENTER_FRAME, Update);
		}
	}

}