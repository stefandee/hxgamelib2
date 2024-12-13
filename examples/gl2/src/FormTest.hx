import gamelib2.microvcl.Application;
import gamelib2.microvcl.Control;
import gamelib2.microvcl.DisplayTactics;
import gamelib2.microvcl.Form;
import gamelib2.microvcl.Label;
import gamelib2.microvcl.Helper;
import gamelib2.microvcl.dt.LabelTactics;

import gamelib2.microvcl.SentrySpriteWrapper;
import gamelib2.microvcl.SwfBinWrapper;
import gamelib2.i18n.Manager;
import gamelib2.Clock;

import data.AllStrings;
import ui.GenericLabelTactics;
import Data;

class FormTest extends Form
{ 
  private var labelMsg     : Label;
  private var labelSimTime : Label;
  private var labelTimer1  : Label;
  private var labelTimer2  : Label;
  private var labelTest    : Label;

  private var sprLib       : gamelib2.data.SprLib;
  
  public function new(parentControl : Control, name : String, displayTactics : DisplayTactics, autoAdd : Bool, strMgr : Manager)
  {
    var testApp : Test = cast Application.instance;
    sprLib = testApp.sprLib;

    super(parentControl, name, displayTactics, autoAdd, strMgr);
  }

  public override function createUI()
  {
    addChild(Helper.createBox(640, 480, 0x909090, 0x909090, 1));

    var spr = new SentrySpriteWrapper(this, "SpriteContainer", null, true, strMgr, sprLib.getSprite(0), 1);
    spr.x = 320;
    spr.y = 64;
    
    //labelMsg = new Label(this, "LabelMsg", new ui.GenericLabelTactics(flash.text.TextFieldAutoSize.LEFT, flash.text.TextFormatAlign.LEFT), true, strMgr);
    labelMsg = new Label(this, "LabelMsg", new ui.GenericWrapLabelTactics(flash.text.TextFieldAutoSize.LEFT, flash.text.TextFormatAlign.LEFT, 320), true, strMgr);    

    labelSimTime = new Label(this, "LabelSimTime", new ui.GenericLabelTactics(flash.text.TextFieldAutoSize.LEFT, flash.text.TextFormatAlign.LEFT), true, strMgr);
    labelTimer1 = new Label(this, "LabelTimer1", new ui.GenericLabelTactics(flash.text.TextFieldAutoSize.LEFT, flash.text.TextFormatAlign.LEFT), true, strMgr);
    labelTimer2 = new Label(this, "LabelTimer2", new ui.GenericLabelTactics(flash.text.TextFieldAutoSize.LEFT, flash.text.TextFormatAlign.LEFT), true, strMgr);

    Clock.instance.getTimer(Timer.TIMER_INGAME).speedMultiplier = 0.5;
    Clock.instance.getTimer(Timer.TIMER_SPRITE).speedMultiplier = 3.0;

    labelTest = new Label(this, "LabelTest", new LabelTactics("FontDefault", true, 8, flash.text.TextFieldAutoSize.LEFT, flash.text.TextFormatAlign.LEFT, 0xA00000), true, strMgr);

    var mc = flash.Lib.attach("LogoArt");
    addChild(mc);

    //mc.stop();

    trace(mc.width + "x" + mc.height);

    mc.x = 320;
    mc.y = 240;

    //var snd : flash.media.Sound = cast Type.createInstance(Type.resolveClass("Snd_Laser"), []);
    //snd.play(0, 2);

    /*
    var swf = new SwfBinWrapper(this, "SwfBinWrapper", null, true, strMgr, new Data_SwfTest());
    swf.x = 0;
    swf.y = 0;
    */

    updateUI();
  }

  public override function changeLanguage()
  {
    super.changeLanguage();
    
    trace("FormTest is processing the language change!");    

    updateUI();
  }

  public override function updateUI()
  {
    labelMsg.caption = "<body>" + "<span class='content'>" + string(AllStrings.kStringID_IngameHelp2) + "</span>" + "</body>";
    labelMsg.x = (640 - labelMsg.width) / 2;
    labelMsg.y = 120 - labelMsg.height / 2;

    labelSimTime.caption = "<body>" + "<span class='content'>" + "sim: " + Clock.instance.simTime + "</span>" + "</body>";
    labelSimTime.x = 160 - labelSimTime.width / 2;
    labelSimTime.y = 240 - labelSimTime.height / 2;

    labelTimer1.caption = "<body>" + "<span class='content'>" + "timer 1: " + Clock.instance.getTimer(Timer.TIMER_INGAME).time + "</span>" + "</body>";
    labelTimer1.x = 320 - labelTimer1.width / 2;
    labelTimer1.y = 240 - labelTimer1.height / 2;

    labelTimer2.caption = "<body>" + "<span class='content'>" + "timer 2: " + Clock.instance.getTimer(Timer.TIMER_SPRITE).time + "</span>" + "</body>";
    labelTimer2.x = 480 - labelTimer2.width / 2;
    labelTimer2.y = 240 - labelTimer2.height / 2;

    labelTest.caption = string(AllStrings.kStringID_IngameHelp1);
    labelTest.x = 320 - labelTest.width / 2;
    labelTest.y = 320;
  }

  private override function onEnterFrame(e : flash.events.Event)
  {
    labelSimTime.caption = "<body>" + "<span class='content'>" + "sim: " + Clock.instance.simTime + "</span>" + "</body>";
    labelTimer1.caption = "<body>" + "<span class='content'>" + "timer 1: " + Clock.instance.getTimer(Timer.TIMER_INGAME).time + "</span>" + "</body>";
    labelTimer2.caption = "<body>" + "<span class='content'>" + "timer 2: " + Clock.instance.getTimer(Timer.TIMER_SPRITE).time + "</span>" + "</body>";
  }
}