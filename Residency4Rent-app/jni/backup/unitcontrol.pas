unit unitcontrol;

{$mode delphi}

interface

uses
  Classes, SysUtils, fphttpclient,httpdefs,httpprotocol;

type
  { TUser }

    TUser = Class
      private
      public

         constructor Create ;
         destructor Destroy ; override;
         function LoginSucess(email: string; pass: string; table1:string; table2:string): string; //valida login
         function RegisterUsers(email: string ; senha: string ; nome:string ; bairro:string ; numero:string ; rua:string; cidade: string; uf:string ; cpf:string ; fone1:string ; fone2:string; typeUser:string):string;
         function RegisterAuto(email: string; pass: string; table1: string; table2:string): string; //pede para o servidor inserir um locador utilizando os dados de locatario
         function GetImovel(email: string; pass: string; mode:string): string;
         function RegisterImovel(idLocador: string; nome: string; qtdAp: string; valor: string; info: string; bairro: string; rua: string; cidade: string; latitude: string; longitude:string): string;
         function GetImovelById(id: string): string;
         function UpdateImovel(idImovel: string; nome: string; qtdAp: string; valor: string; info: string; bairro: string; rua: string; cidade: string;latitude: string; longitude:string): string;
         function GetLastIdImovel(): string;
         function RegisterImagens(id:string; nome:string): string;
         function GetImagesFront(): string;
         function GetImagesById(id:string): string;
         function ResgisterDataVisit(idLocatario:string; idImovel:string; data:string; hora:string; status:string): string;
         function GetDateTime(mode:string; idLocatario:string; idImovel:string): string; overload;
         function GetDateTime(mode:string; idImovel:string): string; overload;
         function RequestContract(idImovel:string;TypeStatus:string; qtd:string; valor:string; idLocatario:string):string;
         function UpdateUser(table1:string; table2:string; oldEmail:string; oldSenha:string; email: string; senha: string; nome:string ; bairro:string ; numero:string ; rua:string; cidade: string; uf:string ; cpf:string ; fone1:string ; fone2:string): string;
         function GetUser(table:string; id:string): string;
         function GetRequest(idLocador:string): string;
         function SetStatus(modo:string; id:string; status:string): string; //set status do contrato e visita
         function Getbylocatario(idLocatario:string): string; //pega os imoveis interessado ao locatario
         function GetLocation(idImovel:string): string;
         function GetInfoAlugel(idAluguel:string; mode:string): string;
         function GetQtdAp(idImovel:string): string;
         function GetStatusContrato(id:string): string;
         function RegisterAvaliacao(idImovel:string; nome:string; comentario:string; numEstrelas:string; sexo:string): string;
         function GetAvaliacoes(idImovel:string): string;
         function GetIdLocadorByImovel(idImovel:string): string;
    end;

var
  SERVER : string = '10.1.18.163';


implementation
{ TUser }

//faz a requisicao ao servidor e retorna sua resposta
function HttpGet(URL: string): string;
begin

  With TFPHTTPClient.Create(Nil) do
    try
      Result:= Get(URL);
    finally
      Free;
    end;
end;

//troca determinado caracter por outro ou vazio
function ReplaceChar(query: string; oldchar, newchar: char):string;
begin
  if query <> '' then
  begin
     while Pos(oldchar,query) > 0 do query[pos(oldchar,query)]:= newchar;
     Result:= query;

  end;
end;

constructor TUser.Create;
begin
  //
end;

destructor TUser.Destroy;
begin
  //
  inherited Destroy;
end;

//verifica se o login existe e retorna a resposta
function TUser.LoginSucess(email: string; pass: string; table1:string; table2:string): string;
begin
  Result:= HttpGet(ReplaceChar('http://'+SERVER+'/cgi-bin/cgiresidency.exe/usuario?task=login&email='+email+
   '&pass='+pass+'&table1='+table1+'&table2='+table2,' ','+'));
end;

//cadastra tanto locador quanto locatario
function TUser.RegisterUsers(email: string ; senha: string ; nome:string ; bairro:string ; numero:string ; rua:string; cidade: string; uf:string ; cpf:string ; fone1:string ; fone2:string; typeUser:string):string;
begin
   Result:= HttpGet(ReplaceChar('http://'+SERVER+'/cgi-bin/cgiresidency.exe/usuario?task=resgisteruser&email='+email+
   '&pass='+senha+'&nome='+nome+'&bairro='+bairro+'&num='+numero+'&rua='+rua+'&cidade='+cidade+
   '&uf='+uf+'&cpf='+cpf+'&fone1='+fone1+'&fone2='+fone2+'&type='+typeUser,' ','+'));
end;

//funcao que requere ao servidor um cadastro automatico
function TUser.RegisterAuto(email: string; pass: string; table1: string; table2:string): string;
begin
  Result:= HttpGet(ReplaceChar('http://'+SERVER+'/cgi-bin/cgiresidency.exe/usuario?task=registerauto&email='+email+
   '&pass='+pass+'&table='+table1+'&destino='+table2,' ','+'));
end;

//funcao que requere os imoveis de um determinado locador
function TUser.GetImovel(email: string; pass: string; mode:string): string;
begin
  Result:= HttpGet(ReplaceChar('http://'+SERVER+'/cgi-bin/cgiresidency.exe/imovel?task=getimovel&email='+email+
   '&pass='+pass+'&mode='+mode,' ','+'));
end;

//funcao que resgistra imoveis no servidor
function TUser.RegisterImovel(idLocador: string; nome: string; qtdAp: string; valor: string; info: string; bairro: string; rua: string; cidade: string;latitude: string; longitude:string): string;
begin
  Result:= HttpGet(ReplaceChar('http://'+SERVER+'/cgi-bin/cgiresidency.exe/imovel?task=registerimovel&id='+idLocador+
   '&nome='+nome+'&qtd='+qtdAp+'&valor='+valor+'&info='+info+'&bairro='+bairro+'&rua='+rua+'&cidade='+cidade+'&latitude='+latitude+'&longitude='+longitude,' ','+'));
end;

//funcao que requere um imovel passando o seu id
function TUser.GetImovelById(id: string): string;
begin
  Result:= HttpGet(ReplaceChar('http://'+SERVER+'/cgi-bin/cgiresidency.exe/imovel?task=getimovelbyid&id='+id,' ','+'));
end;

//funcao que faz o update de imoveis no servidor
function TUser.UpdateImovel(idImovel: string; nome: string; qtdAp: string; valor: string; info: string; bairro: string; rua: string; cidade: string;latitude: string; longitude:string): string;
begin
  Result:= HttpGet(ReplaceChar('http://'+SERVER+'/cgi-bin/cgiresidency.exe/imovel?task=updateimovel&id='+idImovel+
   '&nome='+nome+'&qtd='+qtdAp+'&valor='+valor+'&info='+info+'&bairro='+bairro+'&rua='+rua+'&cidade='+cidade+'&latitude='+latitude+'&longitude='+longitude,' ','+'));
end;

//funcao que requere o id do ultimo imovel cadastrado
function TUser.GetLastIdImovel(): string;
begin
  Result:= HttpGet(ReplaceChar('http://'+SERVER+'/cgi-bin/cgiresidency.exe/imovel?task=getlastid',' ','+'));
end;

//funcao que requere o id do ultimo imovel cadastrado
function TUser.RegisterImagens(id:string; nome:string): string;
begin
  Result:= HttpGet(ReplaceChar('http://'+SERVER+'/cgi-bin/cgiresidency.exe/imagens?task=registerimagens&id='+id+'&nome='+nome,' ','+'));
end;

//funcao que requere as imagens de um determinado imovel
function TUser.GetImagesById(id:string):string;
begin
     Result:= HttpGet(ReplaceChar('http://'+SERVER+'/cgi-bin/cgiresidency.exe/imagens?task=getimagesbyid&id='+id,' ','+'));
end;

//pega as imagens que sera primeiramente exibida
function TUser.GetImagesFront(): string;
begin
    Result:= HttpGet(ReplaceChar('http://'+SERVER+'/cgi-bin/cgiresidency.exe/imagens?task=getimagesfront',' ','+'));
end;

//registra data de uma eventual visita
function TUser.ResgisterDataVisit(idLocatario:string; idImovel:string; data:string; hora:string; status:string): string;
begin
    Result:= HttpGet(ReplaceChar('http://'+SERVER+'/cgi-bin/cgiresidency.exe/alugar?task=agendar&idLocatario='+
    idLocatario+'&idImovel='+idImovel+'&data='+data+'&horas='+hora+'&status='+status,' ','+'));
end;

//pega data de visita
function TUser.GetDateTime(mode:string; idLocatario:string; idImovel:string): string;
begin
     Result:= HttpGet(ReplaceChar('http://'+SERVER+'//cgi-bin/cgiresidency.exe/alugar?task=getdatatime&type='+mode+'&idLocatario='+
     idLocatario+'&idImovel='+idImovel,' ','+'));
end;

//pega data de visita
function TUser.GetDateTime(mode:string; idImovel:string): string;
begin
     Result:= HttpGet(ReplaceChar('http://'+SERVER+'//cgi-bin/cgiresidency.exe/alugar?task=getdatatime&type='+mode+'&idImovel='+idImovel,' ','+'));
end;

//solicita o contrato type = 3
function TUser.RequestContract(idImovel:string;TypeStatus:string; qtd:string; valor:string; idLocatario:string):string;
begin
     Result:= HttpGet(ReplaceChar('http://'+SERVER+'//cgi-bin/cgiresidency.exe/alugar?task=solicitarcontrato&status='+TypeStatus+'&id='+idImovel+'&qtd='+qtd+'&valor='+valor+'&idLocatario='+idLocatario,' ','+'));
end;

//faz a alteracao dos dados dos usuarios em ambas as tabelas
function TUser.UpdateUser(table1:string; table2:string; oldEmail:string; oldSenha:string; email: string; senha: string; nome:string ; bairro:string ; numero:string ; rua:string; cidade: string; uf:string ; cpf:string ; fone1:string ; fone2:string): string;
begin
    Result:= HttpGet(ReplaceChar('http://'+SERVER+'/cgi-bin/cgiresidency.exe/usuario?task=updateuser&email='+email+
     '&senha='+senha+'&nome='+nome+'&bairro='+bairro+'&num='+numero+'&rua='+rua+'&cidade='+cidade+
     '&uf='+uf+'&cpf='+cpf+'&fone1='+fone1+'&fone2='+fone2+'&table1='+table1+'&table2='+table2+
     '&oldemail='+oldEmail+'&oldsenha='+oldSenha,' ','+'));
end;

//Pega as informacoes do usuario
function TUser.GetUser(table:string; id:string): string;
begin
    Result:= HttpGet(ReplaceChar('http://'+SERVER+'/cgi-bin/cgiresidency.exe/usuario?task=getuser&id='+id+'&table='+table,' ','+'));
end;

//seta o status da visita e do contrato
function TUser.SetStatus(modo:string; id:string; status:string): string;
begin
     Result:= HttpGet(ReplaceChar('http://'+SERVER+'/cgi-bin/cgiresidency.exe/alugar?task=setstatus&id='+id+'&status='+status+'&modo='+modo,' ','+'));
end;

//retorna as informacoes sobre imoveis requisitados por locatarios
function TUser.GetRequest(idLocador:string): string;
begin
     Result:= HttpGet(ReplaceChar('http://'+SERVER+'/cgi-bin/cgiresidency.exe/alugar?task=getrequest&id='+idLocador,' ','+'));
end;

//retorna os imoveis de interesse do locatario
function TUser.Getbylocatario(idLocatario:string): string;
begin
     Result:= HttpGet(ReplaceChar('http://'+SERVER+'/cgi-bin/cgiresidency.exe/alugar?task=getbylocatario&idLocatario='+idLocatario,' ','+'));
end;

//retorna a localização do imovel
function TUser.GetLocation(idImovel:string): string;
begin
    Result:= HttpGet(ReplaceChar('http://'+SERVER+'/cgi-bin/cgiresidency.exe/imovel?task=getlocation&id='+idImovel,' ','+'));
end;

//retorna algumas informacoes do aluguel
function TUser.GetInfoAlugel(idAluguel:string; mode:string): string;
begin
     Result:= HttpGet(ReplaceChar('http://'+SERVER+'/cgi-bin/cgiresidency.exe/alugar?task=getinfo&id='+idAluguel+'&mode='+mode,' ','+'));
end;

//retorna quantidade de ap
function TUser.GetQtdAp(idImovel:string): string;
begin
     Result:= HttpGet(ReplaceChar('http://'+SERVER+'/cgi-bin/cgiresidency.exe/imovel?task=getqtdap&id='+idImovel,' ','+'));
end;

//retorna o estatus do contrato
function TUser.GetStatusContrato(id:string): string;
begin
     Result:= HttpGet(ReplaceChar('http://'+SERVER+'/cgi-bin/cgiresidency.exe/alugar?task=getstatuscontrato&id='+id,' ','+'));
end;

//registra avalicao de um imovel
function TUser.RegisterAvaliacao(idImovel:string; nome:string; comentario:string; numEstrelas:string; sexo:string): string;
begin
     Result:= HttpGet(ReplaceChar('http://'+SERVER+'/cgi-bin/cgiresidency.exe/avaliacao?task=register&idImovel='+idImovel+'&nome='+nome+
                                  '&comentario='+comentario+'&num='+numEstrelas+'&sexo='+sexo,' ','+'));
end;

//retorna as avaliacoes
function TUser.GetAvaliacoes(idImovel:string): string;
begin
     Result:= HttpGet(ReplaceChar('http://'+SERVER+'/cgi-bin/cgiresidency.exe/avaliacao?task=getavaliacoes&id='+idImovel,' ','+'));
end;

//retorna id do locador de um determinado imovel
function TUser.GetIdLocadorByImovel(idImovel:string): string;
begin
      Result:= HttpGet(ReplaceChar('http://'+SERVER+'/cgi-bin/cgiresidency.exe/imovel?task=getidlocador&id='+idImovel,' ','+'));
end;

end.

