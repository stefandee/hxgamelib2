package gamelib2.microvcl;

import gamelib2.microvcl.Control;
import gamelib2.microvcl.DisplayTactics;
import gamelib2.i18n.Manager;
import gamelib2.math.MathEx;

class SpinEditControl extends Control
{
  public var value     (default, setValue)     : Float;
  public var increment (default, setIncrement) : Float;
  public var fastIncrement (default, setFastIncrement) : Float;
  public var minValue  (default, setMinValue)  : Float;
  public var maxValue  (default, setMaxValue)  : Float;

  public var onChangeEvent(default, default)   : Dynamic -> Void;

  public function new(parentControl : Control, name : String, displayTactics : DisplayTactics, autoAdd : Bool, strMgr : Manager)
  {
    super(parentControl, name, displayTactics, autoAdd, strMgr);

    value     = 0.0;
    increment = 1.0;
    fastIncrement = 2.0;
    minValue  = 0.0;
    maxValue  = 10.0;
  }

  private function setValue(v : Float) : Float
  {
    var oldValue : Float = value;
    
    value = MathEx.fclamp(MathEx.correctFloatingPointError(v), minValue, maxValue);

    //var t : Float = 0.05;
    //var x : Float = 0.01;

    //trace(value + "..." + v + "..." + increment + "..." + (0.05 + 0.01) + "..." + (t + x));

    if (oldValue != value)
    {
      if (onChangeEvent != null)
      {
        onChangeEvent(this);
      }
    }

    if (displayTactics != null)
    {
      displayTactics.update();
    }

    return value;
  }

  public function notifyChange()
  {
    if (onChangeEvent != null)
    {
      onChangeEvent(this);
    }
  }

  private function setIncrement(v : Float) : Float
  {
    if (v < 0)
    {
      v = 0;
    }

    increment = v;

    return increment;
  }

  private function setFastIncrement(v : Float) : Float
  {
    if (v < 0)
    {
      v = 0;
    }

    fastIncrement = v;

    return fastIncrement;
  }
  
  private function setMinValue(v : Float) : Float
  {
    if (v > maxValue)
    {
      minValue = maxValue;
      maxValue = v;
    }
    else
    {
      minValue = v;
    }

    value = MathEx.fclamp(value, minValue, maxValue);

    return minValue;
  }

  private function setMaxValue(v : Float) : Float
  {
    if (v < minValue)
    {
      maxValue = minValue;
      minValue = v;
    }
    else
    {
      maxValue = v;
    }

    value = MathEx.fclamp(value, minValue, maxValue);

    return maxValue;
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
}
  