package gamelib2.microvcl;

import gamelib2.i18n.Manager;

class ButtonControl extends Control
{
  public var checked (getChecked, setChecked) : Bool;
  public var clicksDisabled (getClicksDisabled, setClicksDisabled) : Bool;

  public var onChangeEvent (default, default) : Dynamic -> Void;

  public function new(parentControl : Control, name : String, displayTactics : DisplayTactics, autoAdd : Bool, strMgr : Manager)
  {
    super(parentControl, name, displayTactics, autoAdd, strMgr);

    checked = false;
    clicksDisabled = false;

    //mouseChildren = false;
  }

  private function getChecked() : Bool
  {
    return checked;
  }

  private function setChecked(v : Bool) : Bool
  {
    var prevValue = checked;
    
    checked = v;

    if (displayTactics != null)
    {
      displayTactics.update();
    }

    if (onChangeEvent != null && enabled)// && prevValue != checked)
    {
      onChangeEvent(this);
    }

    return checked;
  }

  private override function setCaption(v : String) : String
  {
    caption = v;

    if (displayTactics != null)
    {
      displayTactics.update();
    }

    //trace(caption);

    return caption;
  }

  private function getClicksDisabled() : Bool
  {
    return clicksDisabled;
  }

  private function setClicksDisabled(v : Bool) : Bool
  {
    clicksDisabled = v;

    return clicksDisabled;
  }
}