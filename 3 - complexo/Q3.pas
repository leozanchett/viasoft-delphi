unit Q3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, ulNetwork;

type
  TForm1 = class(TForm)
    con1: TLabeledEdit;
    con2: TLabeledEdit;
    conectLimit: TLabeledEdit;
    btnConexoes: TButton;
    mPainelConexoes: TMemo;
    lblNumeroConexoes: TLabel;
    btnQueryConexoes: TButton;
    procedure conectLimitChange(Sender: TObject);
    procedure btnConexoesClick(Sender: TObject);
    procedure InserirConexao(Sender: TObject);
    procedure con1Change(Sender: TObject);
    procedure con2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnQueryConexoesClick(Sender: TObject);
  private
    FNetwork: iNetwork;
    procedure VerificarCamposInformados;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  uNetwork;

{$R *.dfm}

procedure TForm1.btnConexoesClick(Sender: TObject);
var
   Btn: TButton absolute Sender;
begin
   FNetwork := TNetwork.New(StrToInt(conectLimit.Text));
   lblNumeroConexoes.Visible := True;
   lblNumeroConexoes.Caption := lblNumeroConexoes.Caption +' '+conectLimit.Text; 
   conectLimit.Visible := False;
   con1.Visible := True;
   con2.Visible := True;
   btnQueryConexoes.Visible := True;
   Btn.Top := 313;
   Btn.Width := 147;
   Btn.Left := 176;
   Btn.Caption := 'Inserir conexão';
   Btn.Enabled := False;
   Btn.OnClick := InserirConexao;
end;

procedure TForm1.btnQueryConexoesClick(Sender: TObject);
begin
   ShowMessage(FNetwork.Query(StrToInt(con1.Text), StrToInt(con2.Text)));
end;

procedure TForm1.con1Change(Sender: TObject);
begin
   VerificarCamposInformados;
end;

procedure TForm1.con2Change(Sender: TObject);
begin
   VerificarCamposInformados;
end;

procedure TForm1.conectLimitChange(Sender: TObject);
var
   Edit: TLabeledEdit absolute Sender;
begin
   btnConexoes.Enabled := (not String(Edit.Text).Trim.IsEmpty);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   ReportMemoryLeaksOnShutdown := True;
end;

procedure TForm1.InserirConexao(Sender: TObject);
var
   i: Byte;
begin
   if StrToInt(con1.Text) <> StrToInt(con2.Text) then begin
      FNetwork.Connect(StrToInt(con1.Text), StrToInt(con2.Text));
      mPainelConexoes.Clear;
      for I := Low(Byte) to pred(FNetwork.Conections.Count) do begin
         mPainelConexoes.Lines.Add(FNetwork.Conections.KeyNames[i] + StringOfChar('-', 66) + FNetwork.Conections.ValueFromIndex[i]);
      end;
   end else begin
      ShowMessage('A conexão '+ con1.Text + ' não pode estar conectada a ela mesma ' + con2.Text + '.');
      con2.SetFocus;
   end;
end;

procedure TForm1.VerificarCamposInformados;
begin
   btnConexoes.Enabled := (not String(con1.Text).Trim.IsEmpty) and (not String(con2.Text).Trim.IsEmpty);
   btnQueryConexoes.Enabled := btnConexoes.Enabled;
end;

end.
