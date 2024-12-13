package gamelib2.microvcl.dt;

// as3.0
import flash.text.TextField;
import flash.text.TextFormat;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormatAlign;
import flash.text.StyleSheet;

// app
import gamelib2.microvcl.DisplayTactics;

class WrapLabelTactics extends DisplayTactics
{
  private var msg        : TextField;

  private var autoSize   : TextFieldAutoSize;//String;
  private var align      : TextFormatAlign;//String;
  private var style      : StyleSheet;
  private var msgWidth   : Int;

  private var embedFonts : Bool;
  private var antiAliasType   : flash.text.AntiAliasType;

  private function new(autoSize : TextFieldAutoSize, align : TextFormatAlign, w : Int)
  {
    super();

    this.autoSize = autoSize;
    this.align    = align;
    this.msgWidth = w;

    antiAliasType = flash.text.AntiAliasType.ADVANCED;
    embedFonts    = false;
  }

  public override function init()
  {
    this.style = createStyleSheet();

    msg = createTextField(target.caption, 0, 0, this.style, this.autoSize);
    msg.width = msgWidth;

    if (target.contains(msg))
    {
      target.removeChild(msg);
    }

    target.addChild(msg);
  }

  private function createStyleSheet() : flash.text.StyleSheet
  {
    var style = new flash.text.StyleSheet();

    return style;
  }

  private function createTextField(str : String, x : Int, y : Int, cssStyle : flash.text.StyleSheet, textAutoSize : flash.text.TextFieldAutoSize)
  {
    var textField : flash.text.TextField;

    textField = new flash.text.TextField();
    textField.autoSize   = textAutoSize;
    textField.antiAliasType = antiAliasType;// flash.text.AntiAliasType.ADVANCED;
    textField.styleSheet = cssStyle;
    textField.multiline  = true;
    textField.wordWrap   = true;
    textField.embedFonts = embedFonts;
    textField.type       = flash.text.TextFieldType.DYNAMIC;
    textField.textColor  = 0xFFFFFF;
    textField.x          = x;
    textField.y          = y;
    textField.selectable = false;
    textField.htmlText   = str;

    //textField.cacheAsBitmap = true;

    return textField;
  }

  public override function update()
  {
    //trace(target.caption);
    msg.embedFonts = this.embedFonts;
    msg.styleSheet = createStyleSheet();

    msg.htmlText = target.caption;
  }

  public function setWidth(w : Int)
  {
    msgWidth = w;
    msg.width = w;
  }
}