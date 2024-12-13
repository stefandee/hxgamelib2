package gamelib2.data;

import gamelib2.Utils;
import gamelib2.math.Vector2f;
import gamelib2.math.Interval;

class XMLHelper
{
  private function new()
  {
  }

  public static function hasAtt(a : String, elem : flash.xml.XML) : Bool
  {
    return (elem.attribute(a).length() > 0);
  }

  public static function hasNode(node : String, elem : flash.xml.XML) : Bool
  {
    var nodes = elem.elements(node);

    return (nodes.length() > 0);
  }

  public static function attInt(a : String, elem : flash.xml.XML) : Int
  {
    return Std.parseInt(elem.attribute(a).toString());
  }

  public static function attBool(a : String, elem : flash.xml.XML) : Bool
  {
    return Utils.asBool(elem.attribute(a).toString());
  }

  public static function attFloat(a : String, elem : flash.xml.XML) : Float
  {
    return Std.parseFloat(elem.attribute(a).toString());
  }

  public static function att(a : String, elem : flash.xml.XML) : String
  {
    return elem.attribute(a).toString();
  }

  public static function attInterval(a : String, elem : flash.xml.XML) : Interval
  {
    var tmp = att(a, elem).split("...");

    if (tmp.length == 2)
    {
      return new Interval(Std.parseInt(tmp[0]), Std.parseInt(tmp[1]));
    }
    else
    {
      // create an interval out of a single value
      var v : Int = Std.parseInt(att(a, elem));
      
      return new Interval(v, v);
    }

    trace("Wrong number of params for interval.");

    return null;
  }

  public static function attFInterval(a : String, elem : flash.xml.XML) : Interval
  {
    var tmp = att(a, elem).split("...");

    if (tmp.length == 2)
    {
      return new Interval(Std.parseFloat(tmp[0]), Std.parseFloat(tmp[1]));
    }
    else
    {
      // create an interval out of a single value
      var v : Float = Std.parseFloat(att(a, elem));
      
      return new Interval(v, v);
    }

    trace("Wrong number of params for interval.");

    return null;
  }

  public static function attPoint(a : String, elem : flash.xml.XML) : Vector2f
  {
    var tmp = att(a, elem).split(",");

    if (tmp.length == 2)
    {
      return new Vector2f(Std.parseInt(tmp[0]), Std.parseInt(tmp[1]));
    }

    trace("Wrong number of params for point.");

    return null;
  }
}
