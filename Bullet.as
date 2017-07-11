package {

	import flash.display.Sprite;
	import flash.events.Event;


	public class Bullet extends Sprite {

		var speed: int;
		private var stg;

		public function Bullet(stg: Main) {
			this.stg = stg;
			speed = 10;
			addEventListener(Event.ADDED_TO_STAGE, Initialize);
		}

		public function Initialize(e: Event) {
			addEventListener(Event.ENTER_FRAME, Update);
		}

		public function Update(e: Event) {
			this.x += Math.cos(rotation / 180 * Math.PI) * speed;
			this.y += Math.sin(rotation / 180 * Math.PI) * speed;

			if (x > stg.stage.stageWidth || y > stg.stage.stageHeight || x < 0 || y < 0) {
				stg.stage.removeChild(this);
			}
		}
		public function RemoveBul(): Boolean {

			if (x  < 0 || y < 0 || x > stg.stage.stageWidth || y > stg.stage.stageHeight) {
				return true;
			} else {
				return false;
			}
		}

	}

}