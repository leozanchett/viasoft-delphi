unit uNetwork;

interface

uses
  ulNetwork, System.Classes;

type
   TNetwork = class(TInterfacedObject, iNetwork)
      private
         FConections: TStringList; 
         FCapacityConnection: Integer;
         FNumberActiveConnections: Integer;
         function ConnectionAvailable: Boolean;
    procedure VerificaLigacao(var _PConectionElement: Boolean; const _PVerify_Element: Integer; var _PConexoes: string);
      public
         constructor Create(const _PNumberConnections: Integer);
         destructor Destroy; override;
         class function New(const _PNumberConnections: Integer): iNetwork;
         procedure Connect(const _PElement_1, _PElement_2: Integer);
         function Query(const _PVerify_Element_1, _PVerify_Element_2: Integer): String;
         function Conections: TStringList;
   end;
implementation

uses
  System.SysUtils;


{ TNetwork }

function TNetwork.Conections: TStringList;
begin
   Result := FConections;
end;

procedure TNetwork.Connect(const _PElement_1, _PElement_2: Integer);
var
   LIndex: Integer;
begin
   if (_PElement_1 > 0) and (_PElement_2 > 0) then begin
      if ConnectionAvailable then begin
         if not FConections.Find(_PElement_1.ToString +'='+ _PElement_2.ToString, LIndex) then begin
            FConections.AddPair(_PElement_1.ToString, _PElement_2.ToString);
            FNumberActiveConnections := FConections.Count;
         end;
      end else
        raise Exception.Create('Conexão fora do limite permitido.'); 
   end else
      raise Exception.Create('Permitido apenas valores positivos.');
end;

function TNetwork.ConnectionAvailable: Boolean;
begin
   result := FNumberActiveConnections <= FCapacityConnection;    
end;

constructor TNetwork.Create(const _PNumberConnections: Integer);
begin
   FConections := TStringList.Create;
   FCapacityConnection := _PNumberConnections;
end;

destructor TNetwork.Destroy;
begin
   FreeAndNil(FConections);
  inherited;
end;

class function TNetwork.New(const _PNumberConnections: Integer): iNetwork;
begin
   Result := Self.Create(_PNumberConnections);
end;

function TNetwork.Query(const _PVerify_Element_1, _PVerify_Element_2: Integer): String;
const
   MSG_CONEXAO = 'A conexão %d tem vinculo com: ';
   MSG_NAO_CONECTADO = 'A conexão %d não tem nenhum vinculo.';
var
   LConectionElement1, LConectionElement2: Boolean;
   AConexoes_1, AConexoes_2: String;
begin
   LConectionElement1 := False;
   LConectionElement2 := False;
   if (_PVerify_Element_1 > 0) and (_PVerify_Element_2 > 0) then begin
      if ConnectionAvailable then begin
         VerificaLigacao(LConectionElement1, _PVerify_Element_1, AConexoes_1);
         VerificaLigacao(LConectionElement2, _PVerify_Element_2, AConexoes_2);
      end else
        raise Exception.Create('Consulta fora do limite de conexões permitidas.');
   end else
      raise Exception.Create('Permitido apenas valores positivos.');
   if LConectionElement1 then
      Result := Format(MSG_CONEXAO, [_PVerify_Element_1]) + AConexoes_1
   else
      Result := Format(MSG_NAO_CONECTADO, [_PVerify_Element_1]);
   if LConectionElement2 then
      Result :=  Result + sLineBreak + Format(MSG_CONEXAO, [_PVerify_Element_2]) + AConexoes_2
   else
      Result :=  Result + sLineBreak + Format(MSG_NAO_CONECTADO, [_PVerify_Element_2]);      
end;


procedure TNetwork.VerificaLigacao(var _PConectionElement: Boolean; const _PVerify_Element: Integer; var _PConexoes: string);
var
  i: Byte;
begin
   for i := Low(Byte) to pred(FConections.Count) do  begin
      if FConections.KeyNames[i].ToInteger = _PVerify_Element then begin
         _PConectionElement := True;
         _PConexoes := _PConexoes + sLineBreak + '* ' + FConections.ValueFromIndex[i];
      end;
      if FConections.ValueFromIndex[i].ToInteger = _PVerify_Element then begin
         _PConectionElement := True;
         _PConexoes := _PConexoes + sLineBreak + '* ' + FConections.KeyNames[i];
      end;
   end;
end;

end.
