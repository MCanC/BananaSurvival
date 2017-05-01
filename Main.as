package  {
	
	import flash.display.*;
	import flash.events.*;
	
	public class Main extends MovieClip {
		
		var Enemy;
		var Character;
		public function Main() {
			
			Character = new character(this);
			Character.x = 50;
			Character.y = 50;
			Enemy = new enemy;
			stage.addChild(Enemy);
			stage.addChild(Character);
		}
	}
	
}
