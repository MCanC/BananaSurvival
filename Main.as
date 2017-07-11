package {

	import flash.display.*;
	import flash.events.*;

	public class Main extends MovieClip {

		var enemy;
		var character;
		var bullet;
		public function Main() {

			bullet = new Bullet(this);
			character = new Character(this);
			character.x = 50;
			character.y = 50;
			enemy = new Enemy(character);
			stage.addChild(enemy);
			stage.addChild(character);

			addEventListener(Event.ENTER_FRAME, Update)

		}

		public function Update(e: Event) {
			character.Coll(enemy);
			enemy.Collision(character.bul);
		}
	}

}