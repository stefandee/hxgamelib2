package gamelib2.microvcl;

import gamelib2.microvcl.Button;
import gamelib2.microvcl.Control;
import gamelib2.i18n.Manager;

class Form extends Control
{
  public var modalResult (getModalResult, setModalResult) : ModalResult;

  public function new(parentControl : Control, name : String, displayTactics : DisplayTactics, autoAdd : Bool, strMgr : Manager)
  {
    super(parentControl, name, displayTactics, autoAdd, strMgr);

    modalResult = ModalResult_None;
  }

  //
  // Members
  //
  private function getModalResult() : ModalResult
  {
    return modalResult;
  }

  private function setModalResult(v : ModalResult) : ModalResult
  {
    modalResult = v;

    return modalResult;
  }

  //
  // Methods
  //
  public function showModal()
  {
  }

  // for convenience only :)
  public function show()
  {
    visible = true;
  }

  public function hide()
  {
    visible = false;
  }
}