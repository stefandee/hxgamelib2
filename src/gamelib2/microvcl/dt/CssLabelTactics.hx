package gamelib2.microvcl.dt;

// as3.0
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.geom.Matrix;
import flash.geom.Point;
import flash.geom.Rectangle;
import flash.events.MouseEvent;
import flash.display.SimpleButton;
import flash.text.TextField;
import flash.text.TextFormat;
import flash.text.TextFieldType;
import flash.events.Event;

// app
import gamelib2.microvcl.DisplayTactics;

class CssLabelTactics extends DisplayTactics
{
  private var msg      : TextField;

  private var autoSize : flash.text.TextFieldAutoSize;
  private var align    : flash.text.TextFormatAlign;

  private var embedFonts      : Bool;
  private var antiAliasType   : flash.text.AntiAliasType;

  private function new(autoSize : flash.text.TextFieldAutoSize, align : flash.text.TextFormatAlign)
  {
    super();

    this.autoSize = autoSize;
    this.align    = align;

    antiAliasType = flash.text.AntiAliasType.ADVANCED;
    embedFonts    = true;
  }

  public override function init()
  {
    msg = createTextField(target.caption, 0, 0, createStyleSheet(), this.autoSize);

    target.addChild(msg);
  }

  private function createStyleSheet() : flash.text.StyleSheet
  {
    return new flash.text.StyleSheet();
  }

  private function createTextField(str : String, x : Int, y : Int, cssStyle : flash.text.StyleSheet, textAutoSize : flash.text.TextFieldAutoSize)
  {
    var textField : flash.text.TextField;

    textField = new flash.text.TextField();
    textField.autoSize   = textAutoSize;
    textField.antiAliasType = antiAliasType;
    textField.styleSheet = cssStyle;
    textField.multiline  = true;
    textField.wordWrap   = false;
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
}