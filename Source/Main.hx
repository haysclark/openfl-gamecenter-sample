package;


import openfl.display.Sprite;
import openfl.text.TextField;
import extension.gamecenter.GameCenter;
import extension.gamecenter.GameCenterEvent;

class Main extends Sprite {
	
	private var _tf:TextField;
	public function new () {
		
		super ();
		
		// Add TextField
		_tf = new TextField();
		_tf.width = 200;
        addChild(_tf);
        
        // Connect to GameCenter
        if(!GameCenter.available) {
            _tf.text = "GameCenter not available. :(";
        } else {
            getPlayerName();
        }
	}
	
	private function getPlayerName():Void {
         GameCenter.addEventListener(GameCenterEvent.AUTH_SUCCESS, onGC_authSuccess); 
		 GameCenter.addEventListener(GameCenterEvent.AUTH_FAILURE, onGC_authFailure);

		 GameCenter.authenticate();
    }

	private function onGC_authSuccess():Void {
        _tf.text = "Welcome " + GameCenter.getPlayerName() + "!!!";
    }

    private function onGC_authFailure():Void {
        _tf.text = "GameCenter Auth Failed...";
    }

}