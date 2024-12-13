package gamelib2.data;

interface IXML
{
  public function fromXMLString(xmlString : String) : Void;
  public function toXMLString() : String;
  public function fromXML(elem : flash.xml.XML) : Void;
}