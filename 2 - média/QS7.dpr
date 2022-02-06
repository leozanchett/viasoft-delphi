program QS7;

uses
  uTroco in 'uTroco.pas',
  uIMaquina in 'uIMaquina.pas',
  uMaquinaDinheiro in 'uMaquinaDinheiro.pas', Winapi.Windows, System.SysUtils, 
  System.Classes {$R *.RES};


  procedure ImprimirTroco(const _PMsgNota_Moeda, _PVlrTroco: String; _PTroco: TTroco);
  begin
     OutputDebugString(PWideChar(IntToStr(_PTroco.GetQuantidade)+' '+_PMsgNota_Moeda+' de R$ ' + _PVlrTroco));
  end;
  
{$R *.RES}
var
   LMaquina: IMaquina;
   LTRoco_List: TList;
   i: Byte;
   LMsg_Nota, LMsg_Moeda: String;
begin
   ReportMemoryLeaksOnShutdown := True;
   LMaquina := TMaquinaDinheiro.New;
   LTRoco_List := LMaquina.MontarTroco(125.15);
   for i := Low(Byte) to pred(LTRoco_List.Count) do begin
      if TTroco(LTRoco_List.Items[i]).GetQuantidade > 1 then begin
         LMsg_Nota := 'notas';
         LMsg_Moeda := 'moedas';
      end else begin
         LMsg_Nota := 'nota';
         LMsg_Moeda := 'moeda';
      end;
      case TTroco(LTRoco_List.Items[i]).GetTipo of
         ceNota100 : ImprimirTroco(LMsg_Nota, '100', TTroco(LTRoco_List[i]));
         ceNota50 : ImprimirTroco(LMsg_Nota, '50', TTroco(LTRoco_List[i]));
         ceNota20 : ImprimirTroco(LMsg_Nota, '20', TTroco(LTRoco_List[i]));
         ceNota10 : ImprimirTroco(LMsg_Nota, '10', TTroco(LTRoco_List[i]));
         ceNota5 :  ImprimirTroco(LMsg_Nota, '5', TTroco(LTRoco_List[i]));
         ceNota2 : ImprimirTroco(LMsg_Nota, '2', TTroco(LTRoco_List[i]));
         ceMoeda100: ImprimirTroco(LMsg_Moeda, '1', TTroco(LTRoco_List[i]));
         ceMoeda50:  ImprimirTroco(LMsg_Moeda, '0,50', TTroco(LTRoco_List[i]));
         ceMoeda25:  ImprimirTroco(LMsg_Moeda, '0,25', TTroco(LTRoco_List[i]));
         ceMoeda10:  ImprimirTroco(LMsg_Moeda, '0,10', TTroco(LTRoco_List[i]));
         ceMoeda5:  ImprimirTroco(LMsg_Moeda, '0,05', TTroco(LTRoco_List[i]));
         ceMoeda1:  ImprimirTroco(LMsg_Moeda, '0,01', TTroco(LTRoco_List[i]));
      end;
   end;
   for i := pred(LTRoco_List.Count) downto 0 do begin
      var Atroco := LTRoco_List[i];
      FreeAndNil(Atroco);
   end;
   FreeAndNil(LTRoco_List);

end.

