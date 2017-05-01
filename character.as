package {

	import flash.events.*;
	import flash.display.*;
	import flash.ui.Keyboard;
	import flash.ui.Mouse;

	public class character extends MovieClip {
		
		var location:Vector2;
		var velocity: Vector2;
		var acceleration: Vector2;
		var speed = 1;
		var up: Boolean = false;
		var down: Boolean = false;
		var left: Boolean = false;
		var right: Boolean = false;
		private var koek;


		public function character(koek) {
			this.koek = koek;
			
			location = new Vector2((1920/2),(1080/2));
			velocity = new Vector2(0, 0);
			koek.stage.addEventListener(KeyboardEvent.KEY_DOWN, move);
			koek.stage.addEventListener(KeyboardEvent.KEY_UP, move2);
			koek.stage.addEventListener(Event.ENTER_FRAME, Update);
			
		}

		public function Update(e: Event): void {
		
			var mouse:Vector2 = new Vector2(koek.stage.mouseX, koek.stage.mouseY);
			
			var angle:Vector2 = mouse.copy();
			
			acceleration = new Vector2(0, 0);
			
			angle.sub(location.copy());
		
			this.rotation = (angle.heading() * 180/Math.PI);
		
			if (up == true) {
				acceleration.y -= speed;
			}
			if (right == true) {
				acceleration.x += speed;
			}
			if (left == true) {
				acceleration.x -= speed;
			}
			if (down == true) {
				acceleration.y += speed;
			}
			if (location.x - (this.width / 2) <= 0) {
				location.x = this.width;
			}

			if (location.x + (this.width / 2) >= koek.stage.stageWidth) {
				location.x = koek.stage.stageWidth - this.width / 2;
			}

			if (location.y + (this.height / 2) >= koek.stage.stageHeight) {
				location.y = koek.stage.stageHeight - this.height / 2;
			}

			if (location.y - (this.height / 2) <= 0) {
				location.y = this.height;
			}
			if (acceleration.mag() > 0) {
				acceleration.normalize();
			}
			velocity.add(acceleration);
			trace(location + " 1");
			location.add(velocity); // iets fout bij deze regel
			trace(location + " 2");
			this.x = location.x;
			this.y = location.y;
		}

		public function move(e:KeyboardEvent): void {
	
			if (e.keyCode == Keyboard.A) {
				left = true;
			}
	
			if (e.keyCode == Keyboard.D) {
				right = true;
			}
			if (e.keyCode == Keyboard.W) {
				up = true;
			}
			if (e.keyCode == Keyboard.S) {
				down = true;
			}

		}
		public function move2(event: KeyboardEvent): void {
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