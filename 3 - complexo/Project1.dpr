program Project1;

uses
  Vcl.Forms,
  Q3 in 'Q3.pas' {Form1},
  ulNetwork in 'ulNetwork.pas',
  uNetwork in 'uNetwork.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
