package ui.dt;

// as3.0

// app
import gamelib2.microvcl.dt.WrapLabelTactics;
import Data;

class SiteLockLabelTactics extends WrapLabelTactics
{
  public function new(autoSize : flash.text.TextFieldAutoSize, align : flash.text.TextFormatAlign, w : Int)
  {
    super(autoSize, align, w);
    embedFonts = true;
  }

  private override function createStyleSheet() : flash.text.StyleSheet
  {
    var style = new flash.text.StyleSheet();

    var content : Dynamic = {
      fontFamily : "FontDefault",
      color : "#FFFFFF",
      fontSize : 10,
      textAlign : "center",
      leading : 10,
      letterSpacing : 1.0
      //textDecoration: "underline"
    };

    style.setStyle(".content", content);

    return style;
  }
}