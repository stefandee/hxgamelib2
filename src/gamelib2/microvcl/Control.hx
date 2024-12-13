package gamelib2.microvcl;

enum HelpType
{
  HelpType_Context;
  HelpType_Keyword;
}

enum BiDiMode
{
  BiDiMode_LeftToRight;
  BiDiMode_RightToLeft;
  BiDiMode_RightToLeftNoAlign;
  BiDiMode_RightToLeftReadingOnly;
}

class Control extends flash.display.Sprite
{
  //
  // Properties
  //
  public var enabled (getEnabled, setEnabled)    : Bool;
  public var parentControl(getParentControl, setParentControl) : Control;

  // set this to disable setting this by the parent
  public var parentEnabled : Bool;

  public var controlName (getControlName, setControlName) : String;
  public var caption (getCaption, setCaption)    : String;
  public var text (getText, setText)             : String;

  public var hint (getHint, setHint)             : String;
  public var showHint (getShowHint, setShowHint) : Bool;
  public var parentShowHint (getParentShowHint, setParentShowHint) : Bool;

  public var helpContext (getHelpContext, setHelpContext) : Int;
  public var helpKeyword (getHelpKeyword, setHelpKeyword) : String;
  public var helpType    (getHelpType, setHelpType)       : HelpType;

  public var bidiMode (getBiDiMode, setBiDiMode) : BiDiMode;
  public var parentBiDiMode (getParentBiDiMode, setParentBiDiMode) : Bool;

  public var displayTactics : DisplayTactics;

  public var autoAdd        : Bool;

  public var strMgr         : gamelib2.i18n.Manager;

  public var userData       : Dynamic;

  //
  // Events
  //
  public var onClickEvent(getOnClickEvent, setOnClickEvent) : Dynamic -> Void;

  public function new(parentControl : Control, controlName : String, displayTactics : DisplayTactics, autoAdd : Bool, strMgr : gamelib2.i18n.Manager)
  {
    super();

    this.parentControl = parentControl;

    this.autoAdd = autoAdd;
    
    if (autoAdd && parentControl != null)
    {
      parentControl.addChild(this);
    }

    this.strMgr = strMgr;

    this.controlName = controlName;

    hint     = "";
    caption  = "";
    text     = "";
    showHint = false;
    parentShowHint = false;

    helpContext = -1;
    helpKeyword = "";
    helpType    = HelpType_Context;

    bidiMode = BiDiMode_LeftToRight;
    parentBiDiMode = false;    

    if (displayTactics != null)
    {
      //trace("control::ctor - dt start");
      this.displayTactics = displayTactics;
      displayTactics.target = this;
      displayTactics.init();
      displayTactics.update();
      //trace("control::ctor - dt end");
    }

    // TODO: should be an event like VCL "onFormCreate"?
    createUI();

    enabled   = true;
    parentEnabled = true;
  }

  private function getEnabled() : Bool
  {
    return enabled;
  }

  private function setEnabled(v : Bool) : Bool
  {
    enabled = v;

    // TODO: add more mouse events, depending on the application needs
    if (enabled)
    {
      // register the events
      addEventListener(flash.events.Event.ENTER_FRAME, onEnterFrame);
      addEventListener(flash.events.MouseEvent.CLICK, onClick);

      // TODO: iterate over the Control children and enable them
    }
    else
    {
      // unregister the events
      removeEventListener(flash.events.Event.ENTER_FRAME, onEnterFrame);
      removeEventListener(flash.events.MouseEvent.CLICK, onClick);

      // TODO: iterate over the Control children and disable them
    }

    for(index in 0...numChildren)
    {
      try
      {
        var child = getChildAt(index);
        
        if (Std.is(child, Control))
        {        
          var control : Control = cast child;

          if (control.parentEnabled)
          {
            control.enabled = enabled;
          }
        }
      }
      catch(e : Dynamic)
      {
      }
    }

    return enabled;
  }

  private function getControlName() : String
  {
    return controlName;
  }

  private function setControlName(v : String) : String
  {
    controlName = v;

    return controlName;
  }
  
  private function getHint() : String
  {
    return hint;
  }

  private function setHint(v : String) : String
  {
    hint = v;

    return hint;
  }

  private function getCaption() : String
  {
    return caption;
  }

  private function setCaption(v : String) : String
  {
    caption = v;

    return caption;
  }

  private function getText() : String
  {
    return text;
  }

  private function setText(v : String) : String
  {
    text = v;

    return text;
  }

  private function getShowHint() : Bool
  {
    return showHint;
  }

  private function setShowHint(v : Bool) : Bool
  {
    showHint = v;

    return showHint;
  }

  private function getParentShowHint() : Bool
  {
    return parentShowHint;
  }

  private function setParentShowHint(v : Bool) : Bool
  {
    parentShowHint = v;

    return parentShowHint;
  }

  private function getHelpContext() : Int
  {
    return helpContext;
  }

  private function setHelpContext(v : Int) : Int
  {
    helpContext = v;

    return helpContext;
  }

  private function getHelpKeyword() : String
  {
    return helpKeyword;
  }

  private function setHelpKeyword(v : String) : String
  {
    helpKeyword = v;

    return helpKeyword;
  }

  private function getHelpType() : HelpType
  {
    return helpType;
  }

  private function setHelpType(v : HelpType) : HelpType
  {
    helpType = v;

    return helpType;
  }

  private function getBiDiMode() : BiDiMode
  {
    return bidiMode;
  }

  private function setBiDiMode(v : BiDiMode) : BiDiMode
  {
    bidiMode = v;

    return bidiMode;
  }

  private function getParentBiDiMode() : Bool
  {
    return parentBiDiMode;
  }

  private function setParentBiDiMode(v : Bool) : Bool
  {
    parentBiDiMode = v;

    return parentBiDiMode;
  }

  private function getParentControl() : Control
  {
    return parentControl;
  }

  private function setParentControl(control : Control) : Control
  {
    if (parentControl != null)
    {
      if (parentControl.contains(this))
      {
        parentControl.removeChild(this);
      }
    }
    
    parentControl = control;

    if (parentControl != null)
    {
      if (!parentControl.contains(this) && this.autoAdd)
      {
        parentControl.addChild(this);
      }
    }

    return parentControl;
  }

  //
  // Events
  //
  private function getOnClickEvent() : Dynamic -> Void
  {
    return onClickEvent;
  }

  private function setOnClickEvent(v : Dynamic -> Void) : Dynamic -> Void
  {
    onClickEvent = v;

    return onClickEvent;
  }

  private function onEnterFrame(e : flash.events.Event)
  {
    //trace("onenterframe: " + controlName);
  }

  private function onClick(e : flash.events.Event)
  {
    //trace("onClick " + controlName + ", enabled: " + enabled);
    
    if (onClickEvent != null && enabled)
    {
      onClickEvent(e);
    }
  }

  // TODO: find a better way to implement this - maybe with an event listener
  // override this in child classes to update accordingly when the language changes
  public function changeLanguage()
  {
    if (displayTactics != null)
    {
      displayTactics.changeLanguage();
    }
    
    // also notify the children that the language changed; it's not a fast operation
    for(index in 0...numChildren)
    {
      try
      {
        var control : Control = cast getChildAt(index);

        control.changeLanguage();
      }
      catch(e : Dynamic)
      {
      }
    }
  }

  public function string(index : Int) : String
  {
    if (strMgr == null)
    {
      return "<strMgr is null>";
    }

    return strMgr.get(index);
  }

  public function createUI()
  {
  }

  public function updateUI()
  {
  }

  //
  // Get Bounds
  //
  public function getLeft() : Float
  {
	  var boundsAs3 = getBounds(null);
	  
	  return this.x + boundsAs3.x;
  }

  public function getRight() : Float
  {
	  var boundsAs3 = getBounds(null);
	  
	  return this.x + boundsAs3.x + boundsAs3.width;
  }
  
  public function getTop() : Float
  {
	  var boundsAs3 = getBounds(null);
	  
	  return this.y + boundsAs3.y;
  }

  public function getBottom() : Float
  {
	  var boundsAs3 = getBounds(null);
	  
	  return boundsAs3.y + boundsAs3.height;
  }
  
  public function getLocalBounds() : gamelib2.math.Rect
  {
	  var boundsAs3 = getBounds(null);
	  
	  return new gamelib2.math.Rect(boundsAs3.x, boundsAs3.y, boundsAs3.width, boundsAs3.height);
  }
  
  //
  // Get alignment
  //
  public function getTopAlign(topY : Int)
  {
	  var bounds = getLocalBounds();
	  
	  return topY - bounds.y;
  }
  
  public function getBottomAlign(bottomY : Int)
  {
	  var bounds = getLocalBounds();
	  
	  return bottomY - (bounds.y + bounds.height);
  }
  
  //
  // Set alignment
  //
  public function alignBottom(bottomY : Int)
  {
	  var bounds = getLocalBounds();
	  
	  this.y = bottomY - (bounds.y + bounds.height);
  }
  
  public function alignTop(topY : Int)
  {
	  var bounds = getLocalBounds();
	  
	  this.y = topY - bounds.y;
  }

  public function alignLeft(leftX : Int)
  {
	  var bounds = getLocalBounds();
	  
	  this.x = leftX - bounds.x;
  }
  
  //
  // Snap Methods
  //
  public function snapToRight(control : Control, ?spacing : Int = 0)
  {
	  if (control != null)
	  {
		var bounds = getLocalBounds();
	  
		this.x = control.getRight() + spacing - bounds.x;
	  }
  }
  
  //
  // Ordering
  //
  public function bringToFront()
  {
	  if (parentControl != null && parentControl.contains(this))
	  {		  
		  parentControl.setChildIndex(this, parentControl.numChildren - 1);
	  }
  }
  public function sendToBack()
  {
	  if (parentControl != null && parentControl.contains(this))
	  {		  
		  parentControl.setChildIndex(this, 0);
	  }
  }
}