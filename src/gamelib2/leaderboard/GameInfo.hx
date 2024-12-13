package gamelib2.leaderboard;

// as3.0
import flash.events.Event; 
import flash.events.ErrorEvent; 
import flash.events.IOErrorEvent; 
import flash.events.SecurityErrorEvent; 
import flash.net.URLLoader; 
import flash.net.URLRequest; 
import flash.net.URLRequestMethod; 
import flash.net.URLVariables; 

import gamelib2.data.IXML;
import gamelib2.data.XMLHelper;
import gamelib2.leaderboard.Def;
import gamelib2.pattern.observer.Observable;

class GameInfo extends Observable, implements IXML
{
  public static var STATE_EVENT : Int = 1;
  public static var LOAD_EVENT  : Int = 2;
  public static var ERROR_EVENT : Int = 4;

  public var name     (default, null) : String;
  public var tagline  (default, null) : String;
  public var gameId   (default, null) : Int;
  public var stats    (default, null) : Array<StatInfo>;

  public var submitToken (default, null) : Int;

  public var state   (default, setState) : RemoteDataState;

  private var requestor : URLLoader;

  public function new()
  {
    super();

    submitToken = -1;

    state = RemoteDataState.Unavailable;

    stats = new Array();
  }

  public function fromXMLString(str : String) : Void
  {
    var xml = new flash.xml.XML(str);

    fromXML(xml);
  }

  public function toXMLString() : String
  {
    return "<gameinfo/>";
  }

  public function fromXML(elem : flash.xml.XML) : Void
  {
    trace(elem.toString());
    
    state = RemoteDataState.Unavailable;

    var item = elem.elements("gameinfo")[0].elements("item")[0];

    name    = item.elements("name")[0].toString();
    tagline = item.elements("tagline")[0].toString();

    stats = new Array();
    
    var items = elem.elements("stats")[0].elements("item");

    for(i in 0...items.length())
    {
      var statInfo = new StatInfo();

      statInfo.fromXML(items[i]);

      stats.push(statInfo);
    }

    submitToken = Std.parseInt(elem.elements("submitToken")[0].toString());

    state = RemoteDataState.Available;

    notify(GameInfo.STATE_EVENT, null);

    trace(name + " - " + tagline + ", submitToken: " + submitToken);
  }

  private function setState(v : RemoteDataState) : RemoteDataState
  {
    state = v;

    return state;
  }

  public function retrieve(gameId : Int)
  {
    state = RemoteDataState.Unavailable;

    this.gameId = gameId;

    //Create the HTTP request object 
    var request:URLRequest = new URLRequest(LeaderboardDef.BASE_URL + "/" + LeaderboardDef.BASE_CONTROLLER + "/" + "info/game_id/" + gameId + "/format/xml" ); 
    request.method = URLRequestMethod.GET; 

    //Initiate the transaction 
    requestor = new URLLoader(); 
    requestor.addEventListener( Event.COMPLETE, requestComplete ); 
    requestor.addEventListener( IOErrorEvent.IO_ERROR, requestError ); 
    requestor.addEventListener( SecurityErrorEvent.SECURITY_ERROR, requestError ); 
    requestor.load( request ); 
  }

  private function requestComplete(event : Event) : Void
  { 
    trace( event.target.data );
    
    // parse the xml received
    fromXMLString(event.target.data);
  } 
   
  private function requestError(error : ErrorEvent) : Void
  { 
    trace("An error occured: " + error.text);
    notify(ERROR_EVENT, null);
  }

  public function getStatByName(name : String) : StatInfo
  {
    for(stat in stats)
    {
      if (stat.name == name)
      {
        return stat;
      }
    }

    return null;
  }
}

