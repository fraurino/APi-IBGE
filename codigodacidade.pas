function ObterCodigoMunicipio(const SiglaUF, NomeMunicipio: string): Integer;
var
  HTTP: THTTPClient;
  Resp: IHTTPResponse;
  JSONArray: TJSONArray;
  JSONObject: TJSONObject;
  I: Integer;
begin
  Result := -1; // Retorno padrão (não encontrado)
  HTTP := THTTPClient.Create;
  try
    Resp := HTTP.Get('https://servicodados.ibge.gov.br/api/v1/localidades/estados/' +
                     SiglaUF + '/municipios');

    if Resp.StatusCode = 200 then
    begin
      JSONArray := TJSONObject.ParseJSONValue(Resp.ContentAsString) as TJSONArray;
      try
        for I := 0 to JSONArray.Count - 1 do
        begin
          JSONObject := JSONArray.Items[I] as TJSONObject;

          // Comparar nomes ignorando maiúsculas/minúsculas
          if SameText(JSONObject.GetValue<string>('nome'), NomeMunicipio) then
          begin
            Result := JSONObject.GetValue<Integer>('id');
            Exit; // Encontrou, sai da função
          end;
        end;
      finally
        JSONArray.Free;
      end;
    end
    else
      raise Exception.CreateFmt('Erro HTTP %d ao consultar API do IBGE', [Resp.StatusCode]);

  finally
    HTTP.Free;
  end;
end;

var
  Codigo: Integer;
begin
  Codigo := ObterCodigoMunicipio('MA', 'São Luís');
  if Codigo <> -1 then
    ShowMessage('Código IBGE: ' + Codigo.ToString)
  else
    ShowMessage('Município não encontrado.');
end;
