package gamelib2.microvcl;

import gamelib2.microvcl.Control;
import gamelib2.i18n.Manager;
import gamelib2.microvcl.dt.TextInputTactics;

class TextInput extends Control
{
  //
  // Events
  //
  public var onTextInputEvent (default, setOnTextInputEvent) : Dynamic -> Void;
  public var onChangeEvent    (default, setOnChangeEvent)    : Dynamic -> Void;
  public var onFocusInEvent   (default, setOnFocusInEvent)   : Dynamic -> Void;
  public var onFocusOutEvent  (default, setOnFocusOutEvent)  : Dynamic -> Void;

  public function new(parentControl : Control, name : String, displayTactics : TextInputTactics, autoAdd : Bool, strMgr : Manager)
  {
    super(parentControl, name, displayTactics, autoAdd, strMgr);

    onTextInputEvent = null;
    onChangeEvent    = null;
    onFocusInEvent   = null;
    onFocusOutEvent  = null;

    this.tabEnabled  = true;
  }

  private override function setCaption(v : String) : String
  {
    trace("TextInput - setCaption");
    
    caption = v;

    if (displayTactics != null)
    {
      displayTactics.update();
    }

    return caption;
  }

  public function getEditedText() : String
  {
    var dt : TextInputTactics = cast displayTactics;

    return dt.getText();
  }

  /*
  private override function getCaption() : String
  {
    var dt : ui.TextInputTactics = cast(displayTactics, ui.TextInputTactics);

    return dt.getText();
  }
  */

  //
  // Events
  //
  private function setOnTextInputEvent(v : Dynamic -> Void) : Dynamic -> Void
  {
    onTextInputEvent = v;

    return onTextInputEvent;
  }

  private function setOnChangeEvent(v : Dynamic -> Void) : Dynamic -> Void
  {
    onChangeEvent = v;

    return onChangeEvent;
  }

  private function setOnFocusInEvent(v : Dynamic -> Void) : Dynamic -> Void
  {
    onFocusInEvent = v;

    return onFocusInEvent;
  }

  private function setOnFocusOutEvent(v : Dynamic -> Void) : Dynamic -> Void
  {
    onFocusOutEvent = v;

    return onFocusOutEvent;
  }

  public function setFocus()
  {
    var dt : TextInputTactics = cast(displayTactics, TextInputTactics);

    this.stage.focus = dt.textField;    
  }

  public function hasFocus() : Bool
  {
    var dt : TextInputTactics = cast(displayTactics, TextInputTactics);
    
    return (this.stage.focus == dt.textField);
  }
}