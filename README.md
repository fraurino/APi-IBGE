# APi-IBGE
Consulta API IBGE

Municípios por UF
Obtém o conjunto de municípios do Brasil a partir dos identificadores das Unidades da Federação


https://servicodados.ibge.gov.br/api/v1/localidades/estados/{UF}/municipios
Parâmetros
Name	Description
UF*	
 string
Um ou mais identificadores de Unidades da Federação delimitados pelo caracter | (pipe)

Exemplos:

https://servicodados.ibge.gov.br/api/v1/localidades/estados/33/municipios

    Obtém os dados referentes aos municípios do Rio de Janeiro (33)

https://servicodados.ibge.gov.br/api/v1/localidades/estados/33|35/municipios

    Obtém os dados referentes aos municípios do Rio de Janeiro (33) e São Paulo (35)

Required
Query parameters
Name	Description
orderBy	
 string
Por padrão, os muncípios são ordenados pela propriedade id, que corresponde ao respectivo identificador do município. Se desejar ordenar alfabeticamente pelo nome do município, use o parâmetro orderBy com o valor nome

https://servicodados.ibge.gov.br/api/v1/localidades/municipios?orderBy=nome

    Obtém os municípios ordenados alfabeticamente pelo nome.

view	
 string
Modo de visualização. Por padrão, a resposta JSON é configurada para refletir a hierarquia à qual pertencem as localidades. A outra opção é configurar o parâmetro view com o valor nivelado, que faz com que as localidades sejam renderizadas no mesmo nível

https://servicodados.ibge.gov.br/api/v1/localidades/municipios?view=nivelado

Responses
Status: 200 - Um array de municípios
Schema
[
 {
id:	
 number
Identificador do município

nome:	
 string
Nome do município

microrregiao:	
 {
id:	
 number
nome:	
 string
mesorregiao:	
 { }
regiao-imediata:	
 {
id:	
 number
nome:	
 string
regiao-intermediara:	
 { }
]
