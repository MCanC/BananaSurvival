package {

	import flash.events.*;
	import flash.display.*;
	import flash.ui.Keyboard;
	import flash.ui.Mouse;

	public class Character extends MovieClip {

		var location: Vector2;
		var velocity: Vector2;
		var acceleration: Vector2;
		var up: Boolean = false;
		var down: Boolean = false;
		var left: Boolean = false;
		var right: Boolean = false;
		var isDead: Boolean = false;
		var en:Enemy;
		var health: int;
		public var bul:Bullet;
		private var koek;


		public function Character(koek) {
			this.koek = koek;
			health = 3;
			location = new Vector2((1920 / 2), (1080 / 2));
			velocity = new Vector2(0, 0);
			koek.stage.addEventListener(KeyboardEvent.KEY_DOWN, Move);
			koek.stage.addEventListener(KeyboardEvent.KEY_UP, Move2);
			koek.stage.addEventListener(Event.ENTER_FRAME, Update);
			koek.stage.addEventListener(MouseEvent.CLICK, Shoot);

		}

		public function Update(e: Event): void {
			
			var mouse: Vector2 = new Vector2(koek.stage.mouseX, koek.stage.mouseY);

			var angle: Vector2 = mouse.copy();

			acceleration = new Vector2(0, 0);

			angle.sub(location.copy());

			this.rotation = (angle.heading() * 180 / Math.PI);

			if (up == true) {
				acceleration.y -= 1;
			}
			if (right == true) {
				acceleration.x += 1;
			}
			if (left == true) {
				acceleration.x -= 1;
			}
			if (down == true) {
				acceleration.y += 1;
			}
			if (location.x - (this.width / 2) <= 0) {
				location.x = this.width;
			}

			if (location.x + (this.width / 2) >= koek.stage.stageWidth) {
				location.x = koek.stage.stageWidth - this.width / 2;
			}

			if (location.y + (this.height / 2) >= koek.stage.stageHeight) {
				location.y = koek.stage.stageHeight - (this.height / 2);
				if (acceleration.y > 0) {
					acceleration.y = 0;
				}

			}

			if (location.y - (this.height / 2) <= 0) {
				location.y = this.height;
			}
			if (acceleration.mag() > 0) {
				acceleration.normalize();
			}
			if (this.health < 0){
				isDead = true;
			}
			
			velocity.add(acceleration);
			location.add(velocity);
			velocity.limit(5);
			this.x = location.x;
			this.y = location.y;

		}
		
		public function Coll(en:Enemy){
			this.en = en;
			if(this.hitTestObject(en)){
				trace("I hit something")
				this.health -=1;
				trace(health)
			}
		}

		public function Shoot(m: MouseEvent) {

			bul = new Bullet(koek);
			bul.rotation = rotation;
			bul.x = x;
			bul.y = y;
			koek.stage.addChild(bul);
		}


		public function Move(event: KeyboardEvent): void {

			if (event.keyCode == Keyboard.A) {
				left = true;
			}
			if (event.keyCode == Keyboard.D) {
				right = true;
			}
			if (event.keyCode == Keyboard.W) {
				up = true;
			}
			if (event.keyCode == Keyboard.S) {
				down = true;
			}
		}
		public function Move2(event: KeyboardEvent): void {
			if (event.keyCode == Keyboard.A) {
				left = false;
			}
			if (event.keyCode == Keyboard.D) {
				right = false;
			}
			if (event.keyCode == Keyboard.W) {
				up = false;
			}
			if (event.keyCode == Keyboard.S) {
				down = false;
			}

		}
	}
}