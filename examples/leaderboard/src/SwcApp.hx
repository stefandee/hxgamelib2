import gamelib2.microvcl.Application;
import gamelib2.microvcl.DisplayTactics;
import gamelib2.data.SprLib;
import gamelib2.Utils;

import Data;

class SwcApp extends Application
{    
  public var sprLib                     : SprLib;
  public var currentURI(default, null)  : Hash<String>;

  public function new(title : String)
  { 
    super(title);

    try
    {
      root.stage.scaleMode = flash.display.StageScaleMode.EXACT_FIT;
    }
    catch(e : Dynamic)
    {
      trace(e);
    }
  }

  private function allowApplication() : Bool
  {
    trace("Checking for sitelock...");

    var host = currentURI.get("host");

#if debug
    // don't lock in debug mode
    return true;
#else    
    var domainsLockTo : Array<String> = new Array();
      
#if PironGamesLock
    domainsLockTo = ["pirongames.com"];
#end // release - Piron Games

#if FGLLock
    domainsLockTo = ["flashgamelicense.com"];
#end // FGLicense

#if KongregateLock
    domainsLockTo = ["chat.kongregate.com"];
#end // KongregateLock

#if MindjoltLock
    domainsLockTo = ["mindjolt.com"];
#end // MindjoltLock

    return Utils.allowApplication(host, domainsLockTo);
#end // debug
  }

#if UseMochiBot
  private function initMochiBot()
  {
    // MochiBot.com -- Version 8
    // Tested with Flash 9-10, ActionScript 3
    trace("Sending stats to Mochibot.");
    mochi.MochiBot.track(root, "");
  }
#end // UseMochiBot

#if UseMochiAnalytics
  public function onConnectError(status : String) : Void
  {
    trace("Connecting to Mochi Analytics failed. Reason: " + status);
  }
#end // UseMochiAnalytics

  public override function run()
  {
    // obtain the current URI
    currentURI = Utils.parseUri(root.stage.loaderInfo.url);

    // init the clock
    gamelib2.Clock.getInstance();

#if UseMochiBot
    initMochiBot();
#end // UseMochiBot

#if UseMochiAnalytics
    trace("Connecting to the Mochi Analytics service.");
    
    mochi.as3.MochiServices.connect("", root, onConnectError);
#end // UseMochiAnalytics

    //this.root.opaqueBackground = 0x000000;

    if (allowApplication())
    {
      var formPreload: FormPreload = new FormPreload(root, "FormPreload", new DisplayTactics(), true, strMgr);

      addForm(formPreload);

#if UseMochiAds
      // mochi api need the container to be placed on the stage already
      formPreload.initMochiAds();
#end // UseMochiAds
    }
    else
    {
      trace("Locking the game up.");

      var formLock = new FormSiteLock(root, "SiteLock", new DisplayTactics(), true, strMgr);
      addForm(formLock);
    }
  }

  // shortcut function
  public static function getApp() : GameApp
  {
    return cast(Application.instance, GameApp);
  }

	public static function main() 
  {
    // temporary traces redir
#if FirebugTraces
    if(haxe.Firebug.detect())
    {       
      haxe.Firebug.redirectTraces();
    }		
#end // FirebugTraces

    trace("main()");
    
    Application.instance = new GameApp("SuperChicken");

    Application.instance.run();
	}
}