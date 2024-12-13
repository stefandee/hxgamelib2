import gamelib2.microvcl.Application;
import gamelib2.microvcl.DisplayTactics;
import gamelib2.data.SprLib;

import Data;

class Test extends gamelib2.microvcl.Application
{      
  public var sprLib : SprLib;
  
  public function new(title : String)
  { 
    super(title);

    try
    {
      this.root.stage.scaleMode = flash.display.StageScaleMode.EXACT_FIT;
    }
    catch(e : Dynamic)
    {
      trace(e);
    }
  }

  public override function run()
  {
    trace("running the application!");

    //this.root.opaqueBackground = 0xA00000;

    // feed the strMgr with data
    strMgr.init(new Data_Lang());

    // init the sprite library
    sprLib = new SprLib(new Data_SprLib());

    gamelib2.Clock.getInstance();

    // create a form
    var formTest = new FormTest(root, "FormTest", new DisplayTactics(), true, strMgr);
    addForm(formTest);
    
    dumpForms();
    
    //changeLanguage("nl-NL");
  }
  
  static function main()
  {    
#if FirebugTraces
    if(haxe.Firebug.detect())
    {       
      haxe.Firebug.redirectTraces();
    }		
#end // FirebugTraces

    Application.instance = new Test("Test Application");

    Application.instance.run();
  }
}