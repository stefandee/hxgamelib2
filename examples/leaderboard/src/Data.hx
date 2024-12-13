import flash.display.MovieClip;
import flash.utils.ByteArray;
import flash.display.Bitmap;
import flash.media.Sound;

//
// Binary Data
//
@:bind class Data_Lang             extends ByteArray {}
@:bind class Data_SprLib           extends ByteArray {}


//
// Game Data
// 


//
// Sounds
//
//extern class                          extends Sound {}

class Data
{
  #if VersionPironGames
    public static var PortalName    = "Piron Games";
    public static var MoreGamesLink = "http://www.pirongames.com";
    public static var PortalLink    = "http://www.pirongames.com";
  #end // VersionPironGames

  public static var GameName : String = "Leaderboard Test";

  public static var FontDefaultName : String = "FontDefault";
  //public static var FontContentName : String = "FontContent";
  //public static var FontIngameName  : String = "FontIngame";  
  //public static var FontHudName     : String = "FontHud";

  public function new()
  {
  }
}