package gamelib2.microvcl;

import gamelib2.microvcl.Control;
import gamelib2.microvcl.DisplayTactics;
import gamelib2.i18n.Manager;
import gamelib2.sentry.SentrySprite;

class SentrySpriteWrapper extends Control
{      
  public var anim (getAnim, setAnim)		: Int;
  public var aFrame (getAFrame, setAFrame)	: Int;
  public var pause	(default, setPause)		: Bool;
  
  public var sprite (default, null)			: SentrySprite;
  
  public function new(parentControl : Control, name : String, displayTactics : DisplayTactics, autoAdd : Bool, strMgr : Manager, sprite : SentrySprite, ?anim : Int = 0)
  {
    super(parentControl, name, displayTactics, autoAdd, strMgr);

    this.sprite = sprite;

    if (sprite != null)
    {      
      addChild(sprite);

      sprite.currentAnim = anim;
    }
  }

  private function getAnim() : Int
  {
    return sprite.currentAnim;
  }

  private function setAnim(v : Int) : Int
  {
    sprite.currentAnim = v;

    return sprite.currentAnim;
  }

  private function getAFrame() : Int
  {
    return sprite.currentAFrame;
  }

  private function setAFrame(v : Int) : Int
  {
    sprite.currentAFrame = v;

    return sprite.currentAFrame;
  }

  private function setPause(v : Bool) : Bool
  {
	  pause = v;
	  
	  sprite.pause = v;
	  	  
	  return pause;
  }
  
  private override function onEnterFrame(e : flash.events.Event)
  {
    if (sprite != null)
    {
      sprite.update();
    }
  }
}
