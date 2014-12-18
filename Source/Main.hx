package;

import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.text.TextFieldType;
import extension.gamecenter.GameCenter;
import extension.gamecenter.GameCenterEvent;

class Main extends Sprite {
	
	private var _tf:TextField;
	
	public function new () {
		
		super ();
		
		// Add TextField
		addTextField();
		
        // Connect to GameCenter
        connectToGameCenter();
	}

	private function addTextField():Void {
		_tf = new TextField();
		_tf.width = 200;
		_tf.selectable = false;
		_tf.type = TextFieldType.DYNAMIC;
        addChild(_tf);
	}

	private function connectToGameCenter():Void {
		_tf.text = "Connecting...";
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