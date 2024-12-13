package gamelib2.leaderboard;

import gamelib2.data.IXML;

class StatInfo implements IXML
{
  public var name            : String;
  public var id              : Int;
  public var displayName     : String;
  public var higherIsBetter  : Bool;

  public function new()
  {
    //state = RemoteDataState.Unavailable;
  }

  public function fromXMLString(str : String) : Void
  {
    var xml = new flash.xml.XML(str);

    fromXML(xml);
  }

  public function toXMLString() : String
  {
    return "<statinfo/>";
  }

  public function fromXML(elem : flash.xml.XML) : Void
  {
    trace(elem.toString());
    
    name        = elem.elements("stat_name")[0].toString();
    id          = Std.parseInt(elem.elements("stat_id")[0].toString());
    displayName = elem.elements("display_name")[0].toString();

    higherIsBetter = (Std.parseInt(elem.elements("higher_is_better")[0].toString()) > 0);

    trace(name + " - " + id + " - " + displayName + " - " + higherIsBetter);
  }
}
