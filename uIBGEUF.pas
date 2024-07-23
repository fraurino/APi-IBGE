unit uIBGEUF;

interface

uses
  Vcl.Forms, Vcl.StdCtrls, System.SysUtils, Vcl.Controls, Vcl.Dialogs,
  System.JSON ,System.Net.HttpClient, System.Net.HttpClientComponent,
  System.Classes;

type
  TfrmAPiIBGE = class(TForm)
    GroupBox1: TGroupBox;
    MemoCidades: TMemo;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    MemoMicrorregioes: TMemo;
    GroupBox4: TGroupBox;
    edtEstados: TEdit;
    edtregioes: TEdit;
    GroupBox5: TGroupBox;
    MemoMesorregioes: TMemo;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure GetIBGE;
  public
    { Public declarations }
  end;

var
  frmAPiIBGE: TfrmAPiIBGE;

implementation


{$R *.dfm}

procedure TfrmAPiIBGE.GetIBGE;
const
  URLIBGE : string =
  'https://servicodados.ibge.gov.br/api/v1/localidades/estados/21/municipios' ;
var
  HttpClient: TNetHTTPClient;
  HttpResponse: IHTTPResponse;
  JsonData: string;
  JsonArray: TJSONArray;
  JsonObject, Microregiao, Mesoregiao, UF, Regiao: TJSONObject;
  i: Integer;
  Cidade, Estado, MicroregiaoNome, MesoregiaoNome,  RegiaoNome, SiglaUF, SiglaRegiao: string;
  idCidade, idEstado, idMicro, idMeso, idRegiao : string ;
  EstadosList, CidadesList, MicroregioesList,MesoregioesList, RegioesList: TStringList;
begin
  HttpClient := TNetHTTPClient.Create(nil);
  try
    HttpResponse            := HttpClient.Get(UrlIBGE);
    JsonData                := HttpResponse.ContentAsString();
    JsonArray               := TJSONObject.ParseJSONValue(JsonData) as TJSONArray;
    try
      EstadosList           := TStringList.Create;
      CidadesList           := TStringList.Create;
      MicroregioesList      := TStringList.Create;
      MesoregioesList       := TStringList.Create;
      RegioesList           := TStringList.Create;
      try
        MemoCidades.Clear;
        MemoMicrorregioes.Clear;
        MemoMesorregioes.Clear;
        edtregioes.Clear;
        edtEstados.Clear;
        if JsonArray.Count > 0 then
          for i := 0 to JsonArray.Count - 1 do
          begin
            JsonObject       := JsonArray.Items[i] as TJSONObject;
            Microregiao      := JsonObject.GetValue<TJSONObject>('microrregiao');
            Mesoregiao       := Microregiao.GetValue<TJSONObject>('mesorregiao');
            UF               := Mesoregiao.GetValue<TJSONObject>('UF');
            Regiao           := UF.GetValue<TJSONObject>('regiao');
            idCidade         := UpperCase(JsonObject.GetValue('id').Value);
            Cidade           := UpperCase(JsonObject.GetValue('nome').Value);
            SiglaUF          := UpperCase(UF.GetValue('sigla').Value);
            Estado           := UpperCase(UF.GetValue('nome').Value);
            idEstado         := UpperCase(UF.GetValue('id').Value);
            idMicro          := UpperCase(Microregiao.GetValue('id').Value);
            MicroregiaoNome  := UpperCase(Microregiao.GetValue('nome').Value);
            idMeso           := UpperCase(Mesoregiao.GetValue('id').Value);
            MesoregiaoNome   := UpperCase(Mesoregiao.GetValue('nome').Value);
            RegiaoNome       := UpperCase(Regiao.GetValue('nome').Value);
            SiglaRegiao      := UpperCase(Regiao.GetValue('sigla').Value);
            idRegiao         := UpperCase(Regiao.GetValue('id').Value);
            if CidadesList.IndexOf(idCidade + '-'+Cidade) = -1 then
              CidadesList.Add(idCidade + '-'+Cidade);
            if MicroregioesList.IndexOf(idMicro +'-'+MicroregiaoNome) = -1 then
              MicroregioesList.Add(idMicro +'-'+MicroregiaoNome);
            if MesoregioesList.IndexOf(idMeso+'-'+MesoregiaoNome) = -1 then
              MesoregioesList.Add(idMeso+'-'+MesoregiaoNome);
             edtEstados.Text := idEstado + '-'+ Estado + '-'+SiglaUF ;
             edtregioes.Text := idRegiao +'-'+  RegiaoNome +'-'+SiglaRegiao
          end;
        MemoCidades.Lines.Assign(CidadesList);
        MemoMicrorregioes.Lines.Assign(MicroregioesList);
        MemoMesorregioes.Lines.Assign(MesoregioesList);
      finally
        EstadosList.Free;
        CidadesList.Free;
        MicroregioesList.Free;
        RegioesList.Free;
      end;
    finally
      JsonArray.Free;
    end;
  finally
    HttpClient.Free;
  end;
end;

procedure TfrmAPiIBGE.FormCreate(Sender: TObject);
begin
   GetIBGE;
end;

end.
