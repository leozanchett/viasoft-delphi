program QS6;

uses
  uISubstitui in 'uISubstitui.pas',
  uSubstitui in 'uSubstitui.pas';

{$R *.RES}
var
   LSubstitui: ISubstitui;
   LResultado, a: String;
const 
   O_RATO = 'O rato roeu a roupa do rei de roma';
begin
   LSubstitui := TSubstitui.New;
   LResultado := LSubstitui.Substituir(O_RATO, 'ro', 'teste');
end.

