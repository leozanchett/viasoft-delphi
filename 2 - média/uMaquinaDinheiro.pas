unit uMaquinaDinheiro;

interface

uses
  uIMaquina, Classes, uTroco;

type

  TMaquinaDinheiro = class(TInterfacedObject, IMaquina)
  private
     FList: TList;
  public
    constructor Create;
    destructor Destroy; override;
    function MontarTroco(Troco: Double): TList;
    class function New: IMaquina;
  end;

implementation

uses math, System.SysUtils;

constructor TMaquinaDinheiro.Create;
begin
   FList := TList.Create;
end;

destructor TMaquinaDinheiro.Destroy;
begin
  
  inherited;
end;

function TMaquinaDinheiro.MontarTroco(Troco: Double): TList;

   procedure CalcTroco(const _PTroco: Double; const _PCedula: TCedula);
   begin
      FList.Add(TTroco.Create(_PCedula, Trunc(Troco / _PTroco)));
      MontarTroco(Troco - ((Trunc(Troco / _PTroco) * _PTroco)));
   end;

begin
   Troco := StrToCurr(FormatCurr('0.00', Troco));
   Result := FList;
   if Troco > 100 then 
      CalcTroco(100, ceNota100)
   else if Troco > 50 then 
      CalcTroco(50, ceNota50)
   else if Troco > 20 then 
      CalcTroco(20, ceNota20)      
   else if Troco > 10 then 
      CalcTroco(10, ceNota10)
   else if Troco > 5 then 
      CalcTroco(5, ceNota5)
   else if Troco > 2 then
      CalcTroco(2, ceNota2)
   else if Troco > 1 then
      CalcTroco(1, ceMoeda100)      
   else if Troco > 0.5 then 
      CalcTroco(0.5, ceMoeda50)
   else if Troco > 0.25 then 
      CalcTroco(0.25, ceMoeda25)
   else if Troco > 0.1 then 
      CalcTroco(0.1, ceMoeda10)
   else if Troco > 0.05 then 
      CalcTroco(0.05, ceMoeda5)
   else if Troco > 0.01 then 
      CalcTroco(0.01, ceMoeda1)
   else if Troco < 0 then begin
      FreeAndNil(FList);
      raise Exception.Create('Troco inválido, verifique');
   end;
end;

class function TMaquinaDinheiro.New: IMaquina;
begin
    Result := Self.Create;
end;

end.

