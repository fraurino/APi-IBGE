program IBGEUF;

uses
  Vcl.Forms,
  uIBGEUF in 'uIBGEUF.pas' {frmAPiIBGE};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmAPiIBGE, frmAPiIBGE);
  Application.Run;
end.
