package gamelib2.microvcl;

import gamelib2.i18n.Manager;

enum ModalResult
{
  ModalResult_None;
  ModalResult_Ok;
  ModalResult_Cancel;
  ModalResult_Abort;
  ModalResult_Retry;
  ModalResult_Ignore;
  ModalResult_Yes;
  ModalResult_No;
  ModalResult_All;
  ModalResult_YesToAll;
  ModalResult_NoToAll;
}

class Button extends ButtonControl
{
  public var modalResult (getModalResult, setModalResult) : ModalResult;

  public function new(parentControl : gamelib2.microvcl.Control, name : String, displayTactics : DisplayTactics, autoAdd : Bool, strMgr : Manager)
  {
    super(parentControl, name, displayTactics, autoAdd, strMgr);

    modalResult = ModalResult_None;
  }

  private function getModalResult() : ModalResult
  {
    return modalResult;
  }

  private function setModalResult(v : ModalResult) : ModalResult
  {
    modalResult = v;

    return modalResult;
  }

  private override function setCaption(v : String) : String
  {
    caption = v;

    if (displayTactics != null)
    {
      displayTactics.update();
    }

    return caption;
  }
}