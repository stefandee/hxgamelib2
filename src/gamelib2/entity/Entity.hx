package gamelib2.entity;

import gamelib2.scene.Spatial;

/**
 * <code>Entity</code> defines a core game element. An entity defines any object
 * within the game world. The <code>Entity</code> will contain all relevant
 * game information allowing for easy data reference and control.
 */
class Entity
{
	public var spatial (default, setSpatial) : Spatial;
	public var id      (getId, setId)        : String;

  public static var serialNumber : Int = 0;

  public function new()
  {
    spatial = null;
    id      = "Entity";

    serialNumber++;
  }

  private function getId() : String
  {
    return id;
  }

  private function setId(v : String) : String
  {
    if (v == null)
    {
      trace("Warning: set a null id on the Entity.");
    }

    id = v;

    return id;
  }
  
  public function update(?time : Float = -1)
  {
  }

  public function clone() : Entity
  {
    var e = new Entity();

    e.id = id;

    // TODO:!!!
    trace("Warning: Spatial should be cloned also!");
    e.spatial = spatial;

    return e;
  }

  private function setSpatial(v : Spatial) : Spatial
  {
    spatial = v;

    return spatial;
  }
}