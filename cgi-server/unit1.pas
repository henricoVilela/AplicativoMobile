unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  SysUtils, Classes, httpdefs, fpHTTP, fpWeb, sqldb, sqlite3conn;

type

  { TFPWebModule1 }

  TFPWebModule1 = class(TFPWebModule)
    SQLite3Connection1: TSQLite3Connection;
    SQLQuery1: TSQLQuery;
    SQLQuery2: TSQLQuery;
    SQLQuery3: TSQLQuery;
    SQLTransaction1: TSQLTransaction;

    procedure alugarRequest(Sender: TObject; ARequest: TRequest;
      AResponse: TResponse; var Handled: Boolean);
    procedure avaliacaoRequest(Sender: TObject; ARequest: TRequest;
      AResponse: TResponse; var Handled: Boolean);
    procedure imagensRequest(Sender: TObject; ARequest: TRequest;
      AResponse: TResponse; var Handled: Boolean);
    procedure imovelRequest(Sender: TObject; ARequest: TRequest;
      AResponse: TResponse; var Handled: Boolean);
    procedure usuarioRequest(Sender: TObject; ARequest: TRequest;
      AResponse: TResponse; var Handled: Boolean);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  FPWebModule1: TFPWebModule1;

implementation

{$R *.lfm}

{ TFPWebModule1 }


procedure TFPWebModule1.imovelRequest(Sender: TObject;
  ARequest: TRequest; AResponse: TResponse; var Handled: Boolean);
var
  task: string;
  aux:string;
  idLocador:string;
  mode:string;
  ListId:TStringList;

begin
   task := Arequest.QueryFields.Values['task'];
   {Retorna todos imoveis de um determinado locador}
   if task = 'getimovel' then
   begin
         mode:= Trim(Arequest.QueryFields.Values['mode']);
         if mode = 'bylocador' then
         begin
             aux := '';
             SQLQuery1.SQL.Text:= 'select idLocador from locador where email= '+'"'+Arequest.QueryFields.Values['email']+'"'+'and senha= '+'"'+Arequest.QueryFields.Values['pass']+'"';
             SQLQuery1.Active:= true;
             idLocador:= SQLQuery1.FieldByName('idLocador').AsString;
             aux:=idLocador+'+free+';
             SQLQuery1.Active:= false;

             SQLQuery1.SQL.Text:= 'select * from imovel where idLocador= '+idLocador;
             SQLQuery1.Active:= true;
             while not SQLQuery1.EOF do
             begin
                  aux:= aux+SQLQuery1.FieldByName('idImovel').AsString+'*'+
                            SQLQuery1.FieldByName('nome').AsString+'*'+
                            SQLQuery1.FieldByName('bairro').AsString+';';
                  SQLQuery1.Next;
             end;

             SQLQuery1.Active:= False;
             AResponse.Content:= Copy(aux, 1, Length(aux)-1);
         end;
         if mode = 'getinfomin' then
         begin

             aux := '';
             SQLQuery1.Active:= false;
             SQLQuery1.SQL.Text:= 'select * from imovel';
             SQLQuery1.Active:= true;
             while not SQLQuery1.EOF do
             begin
                  SQLQuery2.Active:= false;
                  SQLQuery2.SQL.Text := 'SELECT AVG(qtd_estrela) as qtd FROM avaliacao where idImovel = '+SQLQuery1.FieldByName('idImovel').AsString;
                  SQLQuery2.Active:= true;

                  aux:= aux+SQLQuery1.FieldByName('idImovel').AsString+'*'+
                            SQLQuery1.FieldByName('nome').AsString+'*'+
                            SQLQuery1.FieldByName('cidade').AsString+'*'+
                            SQLQuery2.FieldByName('qtd').AsString+';';

                  SQLQuery1.Next;
             end;

             SQLQuery1.Active:= False;
             AResponse.Content:= Copy(aux, 1, Length(aux)-1);
         end;

         if mode = 'getinfo' then
         begin
             aux := '';
             SQLQuery1.Active:= false;
             SQLQuery1.SQL.Text:= 'select * from imovel';
             SQLQuery1.Active:= true;
             while not SQLQuery1.EOF do
             begin
                  aux:= aux+SQLQuery1.FieldByName('idImovel').AsString+'*'+
                            SQLQuery1.FieldByName('idLocador').AsString+'*'+
                            SQLQuery1.FieldByName('nome').AsString+'*'+
                            SQLQuery1.FieldByName('qtd_ap').AsString+'*'+
                            SQLQuery1.FieldByName('valor').AsString+'*'+
                            SQLQuery1.FieldByName('infoComplementar').AsString+'*'+
                            SQLQuery1.FieldByName('bairro').AsString+'*'+
                            SQLQuery1.FieldByName('rua').AsString+'*'+
                            SQLQuery1.FieldByName('latitude').AsString+'*'+
                            SQLQuery1.FieldByName('longitude').AsString+'*'+
                            SQLQuery1.FieldByName('cidade').AsString+';';
                  SQLQuery1.Next;
             end;

             SQLQuery1.Active:= False;
             AResponse.Content:= Copy(aux, 1, Length(aux)-1);
         end;
   end;

   {Registra um imovel para um determinado locador}
   if task = 'registerimovel' then
   begin

        SQLQuery2.Active:= false;
        SQLQuery2.SQL.Text:= 'insert into imovel (idLocador,nome,qtd_ap,valor,infoComplementar,bairro,rua,cidade,latitude,longitude) values ('+
                              Arequest.QueryFields.Values['id']+', '+
                              '"'+Arequest.QueryFields.Values['nome']+'", '+
                              '"'+Arequest.QueryFields.Values['qtd']+'", '+
                              Arequest.QueryFields.Values['valor']+', '+
                              '"'+Arequest.QueryFields.Values['info']+'", '+
                              '"'+Arequest.QueryFields.Values['bairro']+'", '+
                              '"'+Arequest.QueryFields.Values['rua']+'", '+
                              '"'+Arequest.QueryFields.Values['cidade']+'", '+
                              '"'+Arequest.QueryFields.Values['latitude']+'", '+
                              '"'+Arequest.QueryFields.Values['longitude']+'" )';
         SQLQuery2.ExecSQL;
         AResponse.Content:='sucesso';
   end;

   {atualiza as colunas da tabela se necessario}
   if task = 'updateimovel' then
   begin
        SQLQuery1.SQL.Text:= 'update imovel set nome = "'+Arequest.QueryFields.Values['nome']+'", qtd_ap='
                                                         +Arequest.QueryFields.Values['qtd']+', valor='
                                                         +Arequest.QueryFields.Values['valor']+', infoComplementar= "'
                                                         +Arequest.QueryFields.Values['info']+'", bairro= "'
                                                         +Arequest.QueryFields.Values['bairro']+'", rua= "'
                                                         +Arequest.QueryFields.Values['rua']+'", cidade= "'
                                                         +Arequest.QueryFields.Values['cidade']+'", latitude= '
                                                         +Arequest.QueryFields.Values['latitude']+', longitude= '
                                                         +Arequest.QueryFields.Values['longitude']+' where idImovel = '
                                                         +Arequest.QueryFields.Values['id'];
        SQLQuery1.ExecSQL;
        AResponse.Content:='sucesso'
   end;

   {Retorna um imovel por seu id}
   if task = 'getimovelbyid' then
   begin
       aux:='';
       SQLQuery1.Active:= false;
       SQLQuery1.SQL.Text:= 'select * from imovel where idImovel = '+ARequest.QueryFields.Values['id'];
       SQLQuery1.Active:= true;
       aux:=SQLQuery1.FieldByName('nome').AsString+';'+SQLQuery1.FieldByName('qtd_ap').AsString+';'
           +SQLQuery1.FieldByName('valor').AsString+';'+SQLQuery1.FieldByName('infoComplementar').AsString+';'
           +SQLQuery1.FieldByName('bairro').AsString+';'+SQLQuery1.FieldByName('rua').AsString+';'
           +SQLQuery1.FieldByName('cidade').AsString+';'+SQLQuery1.FieldByName('idImovel').AsString+';'
           +SQLQuery1.FieldByName('idLocador').AsString+';'+SQLQuery1.FieldByName('latitude').AsString+';'
           +SQLQuery1.FieldByName('longitude').AsString;

       AResponse.Content:=(aux);

   end;

   if task = 'getlastid' then
   begin
         aux:='';
         SQLQuery1.Active:= false;
         SQLQuery1.SQL.Text:= 'select idImovel from imovel';
         SQLQuery1.Active:= true;
         while not SQLQuery1.EOF do
         begin
              aux:= aux+SQLQuery1.FieldByName('idImovel').AsString;
              SQLQuery1.Next;
         end;

         SQLQuery1.Active:= False;
         AResponse.Content:= Copy(aux, Length(aux), Length(aux));
   end;

   if task = 'getlocation' then
   begin
        aux:='';
        SQLQuery1.Active:= false;
        SQLQuery1.SQL.Text:= 'select latitude,longitude from imovel where idImovel = '+ARequest.QueryFields.Values['id'];
        SQLQuery1.Active:= true;
        aux:=SQLQuery1.FieldByName('latitude').AsString+';'+SQLQuery1.FieldByName('longitude').AsString;
        AResponse.Content:=(aux);
   end;

   if task = 'getqtdap' then
   begin
        aux:='';
        SQLQuery1.Active:= false;
        SQLQuery1.SQL.Text:= 'select qtd_ap from imovel where idImovel = '+ARequest.QueryFields.Values['id'];
        SQLQuery1.Active:= true;
        aux:=SQLQuery1.FieldByName('qtd_ap').AsString;
        AResponse.Content:=(aux);
   end;

   if task = 'getidlocador' then
   begin
        SQLQuery1.SQL.Text:='select idLocador from imovel where idImovel = '+ARequest.QueryFields.Values['id'];
        SQLQuery1.Active:=true;
        AResponse.Content:=SQLQuery1.FieldByName('idLocador').AsString;
   end;

   Handled:=true;
end;

procedure TFPWebModule1.imagensRequest(Sender: TObject; ARequest: TRequest;
  AResponse: TResponse; var Handled: Boolean);
var
     task: string;
     aux:string;
begin
     task := Arequest.QueryFields.Values['task'];
     if task = 'registerimagens' then
     begin
           SQLQuery1.Active:=false;
           SQLQuery1.SQL.Text:= 'insert into imagens (idImovel,nome) values ('+
                                 Arequest.QueryFields.Values['id']+', "'+
                                 Arequest.QueryFields.Values['nome']+'" )';
           SQLQuery1.ExecSQL;
           AResponse.Content:='sucesso';
     end;

     if task = 'getimagesfront' then
     begin
          aux:='';
          SQLQuery1.SQL.Text:= 'SELECT idImovel, nome FROM imagens WHERE nome LIKE "frente%"';
          SQLQuery1.Active:= true;
          while not SQLQuery1.EOF do
          begin
              aux:= aux+SQLQuery1.FieldByName('idImovel').AsString+'*'+
                        SQLQuery1.FieldByName('nome').AsString+';';
              SQLQuery1.Next;
          end;
          AResponse.Content:=Copy(aux, 1, Length(aux)-1);

     end;

     if task = 'getimagesbyid' then
     begin
          aux:='';
          SQLQuery1.SQL.Text:= 'SELECT nome FROM imagens WHERE idImovel = '+Arequest.QueryFields.Values['id'];
          SQLQuery1.Active:= true;
          while not SQLQuery1.EOF do
          begin
              aux:= aux+SQLQuery1.FieldByName('nome').AsString+';';
              SQLQuery1.Next;
          end;
          AResponse.Content:=Copy(aux, 1, Length(aux)-1);

     end;

     Handled:=true;
end;

procedure TFPWebModule1.alugarRequest(Sender: TObject; ARequest: TRequest;
  AResponse: TResponse; var Handled: Boolean);
var
  task,mode,aux,aux2,idLocador,idImovel: string;
  ListId,ListIdAux:TStringList;
  i:integer;
  arq: TextFile;
begin
     aux := '';
     task := Arequest.QueryFields.Values['task'];
     if task = 'agendar' then
     begin
          SQLQuery2.Active:= false;
          SQLQuery2.SQL.Text:= 'insert into alugar (idLocatario,idImovel,data_visita,hora_visita,estado_visita) values ('+
                               Arequest.QueryFields.Values['idLocatario']+', '+
                               Arequest.QueryFields.Values['idImovel']+', '+
                               '"'+Arequest.QueryFields.Values['data']+'", '+
                               '"'+Arequest.QueryFields.Values['horas']+'", '+
                               Arequest.QueryFields.Values['status']+' )';
          SQLQuery2.ExecSQL;
          SQLQuery1.SQL.Text:='select idAluguel from alugar where idLocatario ='+
                                    Arequest.QueryFields.Values['idLocatario']+' and idImovel ='+
                                    Arequest.QueryFields.Values['idImovel'];
          SQLQuery1.Active:=true;
          AResponse.Content:=SQLQuery2.FieldByName('idAluguel').AsString;
     end;

     if task = 'getdatatime' then
     begin
          mode:=Arequest.QueryFields.Values['type'];

          if mode = 'existe' then
          begin
               SQLQuery2.SQL.Text:='select data_visita, hora_visita, idAluguel from alugar where idLocatario ='+
                                    Arequest.QueryFields.Values['idLocatario']+' and idImovel ='+
                                    Arequest.QueryFields.Values['idImovel'];
               SQLQuery2.Active:=true;
               AResponse.Content:=SQLQuery2.FieldByName('data_visita').AsString+';'+SQLQuery2.FieldByName('hora_visita').AsString
                                 +';'+SQLQuery2.FieldByName('idAluguel').AsString;
          end;

          if mode = 'getbyid' then
          begin
               SQLQuery2.Active:=false;
               SQLQuery2.SQL.Text:='select data_visita, hora_visita, idLocatario from alugar where idImovel ='+
                                    Arequest.QueryFields.Values['idImovel'];
               SQLQuery2.Active:=true;
               while not SQLQuery2.EOF do
               begin
                  aux:= aux+SQLQuery2.FieldByName('data_visita').AsString+'*'+
                            SQLQuery2.FieldByName('hora_visita').AsString+'*'+
                            SQLQuery2.FieldByName('idLocatario').AsString+';';
                  SQLQuery1.Next;
               end;
               AResponse.Content:= Copy(aux, 1, Length(aux)-1);
          end;

     end;

     if task = 'solicitarcontrato' then
     begin

          SQLQuery2.Active:= false;
          SQLQuery2.SQL.Text:= 'update alugar set status_contrato = '+Arequest.QueryFields.Values['status']+', qtd_apartamentos = '+
                                                                      Arequest.QueryFields.Values['qtd']+', valor = '+
                                                                      Arequest.QueryFields.Values['valor']+' where idAluguel = '+Arequest.QueryFields.Values['id'];
          SQLQuery2.ExecSQL;


          //parte de fazer o contrato "por enquanto feito em um arquivo txt"

          SQLQuery2.Active:=false;
          SQLQuery2.SQL.Text:='select idLocador from imovel where idImovel in (select idImovel from alugar where idAluguel = '+Arequest.QueryFields.Values['id']+')';
          SQLQuery2.Active:=true;
          idLocador:=SQLQuery2.FieldByName('idLocador').AsString;

          SQLQuery2.Active:=false;
          SQLQuery2.sql.Text:='select idImovel from alugar where idAluguel = '+Arequest.QueryFields.Values['id'];
          SQLQuery2.Active:=true;
          idImovel:=SQLQuery2.FieldByName('idImovel').AsString;

          SQLQuery2.Active:=false;
          SQLQuery2.sql.Text:='select * from locador where idLocador = '+idLocador;
          SQLQuery2.Active:=true;

          SQLQuery1.SQL.Text:='select * from locatario where idLocatario = '+Arequest.QueryFields.Values['idLocatario'];
          SQLQuery1.Active:=true;

          SQLQuery3.SQL.Text:='select * from imovel where idImovel = '+idImovel;
          SQLQuery3.Active:=true;

          AssignFile(arq,'C:\\xampp\htdocs\contratos\Contrato'+Arequest.QueryFields.Values['id']+'.txt');
          Rewrite(arq);
          WriteLn(arq,'INSTRUMENTO PARTICULAR DE LOCAÇÃO DE IMÓVEL RESIDENCIAL');
          WriteLn(arq,'LOCADOR(A): '+SQLQuery2.FieldByName('nome').AsString+', brasileiro, inscrito nº CPF sob o nº: '+SQLQuery2.FieldByName('cpf').AsString);
          WriteLn(arq,'LOCATÁRIO(A): '+SQLQuery1.FieldByName('nome').AsString+', brasileiro, inscrito nº CPF sob o nº: '+SQLQuery1.FieldByName('cpf').AsString);
          WriteLn(arq,'As partes acima mencionadas, pelo presente instrumento particular, ajustam a');
          WriteLn(arq,'locação de um imóvel residencial, de acordo com as cláusulas que seguem:');
          WriteLn(arq,'');
          WriteLn(arq,'CLÁUSULA PRIMEIRA: O objeto deste contrato de locação é o imóvel residencial, ');
          WriteLn(arq,'situado à Rua: '+SQLQuery3.FieldByName('rua').AsString+', Bairro: '+SQLQuery3.FieldByName('bairro').AsString+', no município de '+SQLQuery3.FieldByName('cidade').AsString+'.');
          WriteLn(arq,'');
          WriteLn(arq,'CLÁUSULA SEGUNDA: O LOCATÁRIO declara, após vistoria realizada no imóvel, que este encontra-se em condições adequadas para o uso ao qual se destina.');
          WriteLn(arq,'CLÁUSULA TERCEIRA: O prazo da locação é de ____ (_____) meses, tendo início em __/__/____, momento da assinatura do presente contrato e entrega das chaves do imóvel ao locador, com término em __/__/_____, independentemente de aviso, notificação ou interpelação judicial ou mesmo extrajudicial, no entanto, o contrato poderá ser prorrogado mediante termo aditivo, havendo interesse de ambas as partes');
          WriteLn(arq,'CLÁUSULA QUARTA: O valor do aluguel fica acordado em R$ _______ (__________ reais).');
          WriteLn(arq,'PARÁGRAFO PRIMEIRO: O valor do aluguel deverá ser pago até o dia 10 (dez) do mês subsequente ao vencido, mediante depósito na conta corrente do LOCADOR, Agência do ______ nº _____, Conta corrente nº___________.');
          WriteLn(arq,'PARÁGRAFO SEGUNDO: Na data de __/__/___ o LOCATÁRIO depositará o valor de R$ ____, referente à caução na conta bancária mencionada. Somente após o referido depósito será realizada a entrega das chaves do imóvel.');
          WriteLn(arq,'');

          CloseFile(arq);

          AResponse.Content:='sucesso';
     end;

     if task = 'getrequest' then
     begin
          aux:='';
          aux2:='';

          ListId:=TStringList.Create;
          ListIdAux:=TStringList.Create;
          SQLQuery2.SQL.Text:='select idImovel from imovel where idLocador = '+Arequest.QueryFields.Values['id'];
          SQLQuery2.Active:=true;
          //pega os id dos imoveis de um determinado locador
          while not SQLQuery2.EOF do
          begin
               ListId.Add(SQLQuery2.FieldByName('idImovel').AsString);
               SQLQuery2.Next;
          end;
          SQLQuery2.Active:=false;



          if ListId.Count > 0 then
          begin
               for i:=0 to ListId.Count - 1 do
               begin
                     SQLQuery1.Active:=false;
                     SQLQuery1.SQL.Text:='select idAluguel, idImovel, idLocatario, data_visita, hora_visita, status_contrato, estado_visita, path_contrato '+
                                         'from alugar where idImovel = '+ListId.Strings[i];
                     SQLQuery1.Active:=true;
                     if SQLQuery1.FieldByName('idAluguel').AsString <> '' then
                     begin
                          ListIdAux.Add(ListId.Strings[i]);
                          aux:= aux + SQLQuery1.FieldByName('idAluguel').AsString+';'+SQLQuery1.FieldByName('data_visita').AsString+';'+
                                      SQLQuery1.FieldByName('hora_visita').AsString+';'+SQLQuery1.FieldByName('status_contrato').AsString+';'+
                                      SQLQuery1.FieldByName('estado_visita').AsString+';'+SQLQuery1.FieldByName('idLocatario').AsString+';'+SQLQuery1.FieldByName('path_contrato').AsString+'*';
                     end;

               end;


               for i:=0 to ListIdAux.Count-1 do
               begin
                    SQLQuery2.Active:=false;
                    SQLQuery2.SQL.Text:= 'select nome, bairro from imovel where idImovel = '+ListId.Strings[i];
                    SQLQuery2.Active:=true;
                    aux2:= aux2+ListIdAux.Strings[i]+';'+SQLQuery2.FieldByName('nome').AsString+';'+SQLQuery2.FieldByName('bairro').AsString+'*';
               end;

               ListId.free;
               ListIdAux.free;
               aux:=Copy(aux, 1, Length(aux)-1);
               aux2:=Copy(aux2, 1, Length(aux2)-1);
               if ((aux <> '') and (aux2 <> '')) then
               begin
                    aux:= aux + '|' + aux2;
                    AResponse.Content:=(aux);
               end
               else
               begin
                    AResponse.Content:='';
               end;


          end;
          SQLQuery1.Active:=false;
          SQLQuery2.Active:=false;
          AResponse.Content:=aux;

     end;

     if task = 'setstatus' then
     begin
          if Arequest.QueryFields.Values['modo'] = 'contrato' then
          begin
               SQLQuery1.SQL.Text:= 'update alugar set status_contrato = '+Arequest.QueryFields.Values['status']+' where idAluguel = '+Arequest.QueryFields.Values['id'];
               SQLQuery1.ExecSQL;
               AResponse.Content:='sucesso'
          end;

          if Arequest.QueryFields.Values['modo'] = 'visita' then
          begin
               SQLQuery1.SQL.Text:= 'update alugar set estado_visita = '+Arequest.QueryFields.Values['status']+' where idAluguel = '+Arequest.QueryFields.Values['id'];
               SQLQuery1.ExecSQL;
               AResponse.Content:='sucesso'
          end;
     end;

     if task = 'getbylocatario' then
     begin
          aux:='';
          aux2:='';

          ListId:=TStringList.Create;
          ListIdAux:=TStringList.Create;
          SQLQuery1.SQL.Text:='select * from alugar where idLocatario = '+Arequest.QueryFields.Values['idLocatario'];
          SQLQuery1.Active:=true;
          //pega os id dos imoveis de um determinado locador
          while not SQLQuery1.EOF do
          begin
               ListId.Add(SQLQuery1.FieldByName('idImovel').AsString);
               aux:= aux+SQLQuery1.FieldByName('idAluguel').AsString+';'+SQLQuery1.FieldByName('estado_visita').AsString+';'+
                         SQLQuery1.FieldByName('status_contrato').AsString+'*';
               SQLQuery1.Next;
          end;
          SQLQuery1.Active:=false;

          if ListId.Count > 0 then
          begin
               for i:=0 to ListId.Count-1 do
               begin
                    SQLQuery1.Active:=false;
                    SQLQuery1.SQL.Text:='select nome, bairro, cidade, idLocador from imovel where idImovel = '+ListId.Strings[i];
                    SQLQuery1.Active:=True;
                    aux2:=aux2+ListId.Strings[i]+';'+SQLQuery1.FieldByName('idLocador').AsString+';'+
                               SQLQuery1.FieldByName('nome').AsString+';'+SQLQuery1.FieldByName('bairro').AsString+';'+
                               SQLQuery1.FieldByName('cidade').AsString+'*';
               end;

               ListId.free;
               aux:=Copy(aux, 1, Length(aux)-1);
               aux2:=Copy(aux2, 1, Length(aux2)-1);
               if ((aux <> '') and (aux2 <> '')) then
               begin
                    aux:= aux + '|' + aux2;
                    AResponse.Content:=(aux);
               end
               else
               begin
                    AResponse.Content:='';
               end;
          end
          else
          begin
               AResponse.Content:='';
          end;
     end;

     if task = 'getinfo' then
     begin
          if Arequest.QueryFields.Values['mode'] = 'min' then
          begin
               aux:='';
               SQLQuery1.SQL.Text:='select a.qtd_apartamentos, a.valor, i.valor as val from alugar a, imovel i where a.idAluguel = '+Arequest.QueryFields.Values['id']+' and i.idImovel = a.idImovel';
               SQLQuery1.Active:=true;
               aux:=SQLQuery1.FieldByName('qtd_apartamentos').AsString+';'+SQLQuery1.FieldByName('valor').AsString+';'+
                    SQLQuery1.FieldByName('val').AsString;
               AResponse.Content:=aux;
          end;
     end;

     if task = 'getstatuscontrato' then
     begin
          aux:='';
          SQLQuery1.SQL.Text:='select status_contrato from alugar where idAluguel = '+Arequest.QueryFields.Values['id'];
          SQLQuery1.Active:=true;
          aux:=SQLQuery1.FieldByName('status_contrato').AsString;
          SQLQuery1.Active:=false;
          AResponse.Content:=aux;
     end;
     Handled:=true;
end;

procedure TFPWebModule1.avaliacaoRequest(Sender: TObject; ARequest: TRequest;
  AResponse: TResponse; var Handled: Boolean);
var
  task,aux: string;
begin

     aux := '';
     task := Arequest.QueryFields.Values['task'];
     if task = 'register' then
     begin
          SQLQuery1.SQL.Text:='insert into avaliacao (idImovel,nomeUsuario,comentario,qtd_estrela,sexo) values ('+
                               Arequest.QueryFields.Values['idImovel']+',"'+Arequest.QueryFields.Values['nome']+'","'+
                               Arequest.QueryFields.Values['comentario']+'",'+Arequest.QueryFields.Values['num']+',"'+
                               Arequest.QueryFields.Values['sexo']+'")';
          SQLQuery1.ExecSQL;
          AResponse.Content:='sucesso';
     end;

     if task = 'getavaliacoes' then
     begin
          SQLQuery1.SQL.Text:='select * from avaliacao where idImovel = '+ARequest.QueryFields.Values['id'];
          SQLQuery1.Active:=true;

          while not SQLQuery1.EOF do
          begin
               aux:=aux+SQLQuery1.FieldByName('idAvaliacao').AsString+';'+SQLQuery1.FieldByName('nomeUsuario').AsString+';'+
               SQLQuery1.FieldByName('comentario').AsString+';'+SQLQuery1.FieldByName('qtd_estrela').AsString+';'+SQLQuery1.FieldByName('sexo').AsString+'*';

               SQLQuery1.Next;
          end;


          SQLQuery1.Active:=false;
          AResponse.Content:=Copy(aux, 1, Length(aux)-1);
     end;

     Handled:=true;
end;

procedure TFPWebModule1.usuarioRequest(Sender: TObject; ARequest: TRequest;
  AResponse: TResponse; var Handled: Boolean);
var
  task: string;
  aux:string;
  text:string;

begin
   task := Arequest.QueryFields.Values['task'];

   {valida login}
   if task = 'login' then
   begin
     aux:= '';

     text:= ARequest.QueryFields.Values['table1'];
     text:= Copy(text, 2, Length(text));
     SQLQuery1.SQL.Text:= 'select * from '+ARequest.QueryFields.Values['table1']+' where email= '+'"'+Arequest.QueryFields.Values['email']+'"'+'and senha= '+'"'+Arequest.QueryFields.Values['pass']+'"';
     SQLQuery1.Active:= true;
     aux:= SQLQuery1.FieldByName('idL'+text).AsString;
     if aux = '' then
     begin
          text:= ARequest.QueryFields.Values['table2'];
          text:= Copy(text, 2, Length(text));
          SQLQuery1.Active:= false;
          SQLQuery1.SQL.Text:= 'select * from '+ARequest.QueryFields.Values['table2']+' where email= '+'"'+Arequest.QueryFields.Values['email']+'"'+'and senha= '+'"'+Arequest.QueryFields.Values['pass']+'"';
          SQLQuery1.Active:= true;
          aux:= SQLQuery1.FieldByName('idL'+text).AsString;
          SQLQuery1.Active:= false;
          if aux <> '' then
          begin
               AResponse.Content:= ARequest.QueryFields.Values['table2']+';'+aux;
          end
          else
          begin
               AResponse.Content:= aux;
          end;
     end
     else
     begin
          AResponse.Content:= ARequest.QueryFields.Values['table1']+';'+aux;
     end;

   end;

   {registra usuario}
   if task = 'resgisteruser' then
   begin
        aux:= '';
        {verifica se ja existe esse cadastro}
        //pesquisa na tabela locador
        SQLQuery1.SQL.Text:= 'select * from locador where email= '+'"'+Arequest.QueryFields.Values['email']+'"'+'and senha= '+'"'+Arequest.QueryFields.Values['pass']+'"';
        SQLQuery1.Active:= true;
        aux:= SQLQuery1.FieldByName('idLocador').AsString;
        if aux = '' then
        begin
            //pesquisa na tabela locatario se necessario
            SQLQuery1.Active:= false;
            SQLQuery1.SQL.Text:= 'select * from locatario where email= '+'"'+Arequest.QueryFields.Values['email']+'"'+'and senha= '+'"'+Arequest.QueryFields.Values['pass']+'"';
            SQLQuery1.Active:= true;
            aux:= SQLQuery1.FieldByName('idLocatario').AsString;
            SQLQuery1.Active:= false;
        end;
        //se vazio, nao existe esse cadastro no banco
        if aux = '' then
        begin
            SQLQuery2.SQL.Text:='insert into '+Arequest.QueryFields.Values['type']+' (email,senha,nome,cpf,bairro,numero,rua,cidade,uf,telefone1,telefone2)values('+
                                 '"'+Arequest.QueryFields.Values['email']+'", '+
                                 '"'+Arequest.QueryFields.Values['pass']+'", '+
                                 '"'+Arequest.QueryFields.Values['nome']+'", '+
                                 '"'+Arequest.QueryFields.Values['cpf']+'", '+
                                 '"'+Arequest.QueryFields.Values['bairro']+'",'
                                 +Arequest.QueryFields.Values['num']+', '+
                                 '"'+Arequest.QueryFields.Values['rua']+'", '+
                                 '"'+Arequest.QueryFields.Values['cidade']+'", '+
                                 '"'+Arequest.QueryFields.Values['uf']+'", '+
                                 '"'+Arequest.QueryFields.Values['fone1']+'", '+
                                 '"'+Arequest.QueryFields.Values['fone2']+'" )';
            SQLQuery2.ExecSQL;
            AResponse.Content:='sucesso';
        end
        else
        begin
             AResponse.Content:='existe';
        end;

   end;

   {faz a transacao de uma tabela para outra}
   if task = 'registerauto' then
   begin

        SQLQuery1.SQL.Text:= 'select * from '+ARequest.QueryFields.Values['table']+' where email= '+'"'+Arequest.QueryFields.Values['email']+'"'+'and senha= '+'"'+Arequest.QueryFields.Values['pass']+'"';
        SQLQuery1.Active:= true;
        SQLQuery2.SQL.Text:='insert into '+ARequest.QueryFields.Values['destino']+' (email,senha,nome,cpf,bairro,numero,rua,cidade,uf,telefone1,telefone2)values('+
                                 '"'+SQLQuery1.FieldByName('email').AsString+'", '+
                                 '"'+SQLQuery1.FieldByName('senha').AsString+'", '+
                                 '"'+SQLQuery1.FieldByName('nome').AsString+'", '+
                                 '"'+SQLQuery1.FieldByName('cpf').AsString+'", '+
                                 '"'+SQLQuery1.FieldByName('bairro').AsString+'",'
                                 +SQLQuery1.FieldByName('numero').AsString+', '+
                                 '"'+SQLQuery1.FieldByName('rua').AsString+'", '+
                                 '"'+SQLQuery1.FieldByName('cidade').AsString+'", '+
                                 '"'+SQLQuery1.FieldByName('uf').AsString+'", '+
                                 '"'+SQLQuery1.FieldByName('telefone1').AsString+'", '+
                                 '"'+SQLQuery1.FieldByName('telefone2').AsString+'" )';

        SQLQuery1.Active:= false;
        SQLQuery2.ExecSQL;
        if ARequest.QueryFields.Values['destino'] = 'locatario' then
        begin
             SQLQuery1.SQL.Text:='select idLocatario from locatario where email= '+'"'+Arequest.QueryFields.Values['email']+'"'+'and senha= '+'"'+Arequest.QueryFields.Values['pass']+'"';
             SQLQuery1.Active:= true;
             AResponse.Content:= SQLQuery1.FieldByName('idLocatario').AsString;
        end
        else
        begin
              AResponse.Content:= 'sucesso';
        end;

   end;

   {Faz a alteracao das informacoes}
   if task = 'updateuser' then
   begin
        text:= ARequest.QueryFields.Values['table1'];
        text:= Copy(text, 2, Length(text));
        SQLQuery2.SQL.Text:='select * from '+Arequest.QueryFields.Values['table1']+' where email= "'+Arequest.QueryFields.Values['oldemail']+
                            'senha= "'+Arequest.QueryFields.Values['oldsenha']+'"';
        SQLQuery2.Active:=True;

        SQLQuery1.SQL.Text:='update '+Arequest.QueryFields.Values['table1']+' set email= "'+Arequest.QueryFields.Values['email']+
                            '", senha= "'+Arequest.QueryFields.Values['senha']+'", nome= "'+Arequest.QueryFields.Values['cpf']+
                            '", bairro= "'+Arequest.QueryFields.Values['bairro']+'", numero= '+Arequest.QueryFields.Values['num']+
                            ' , rua= "'+Arequest.QueryFields.Values['rua']+'", cidade= "'+Arequest.QueryFields.Values['cidade']+
                            '", uf= "'+Arequest.QueryFields.Values['uf']+'", telefone1= "'+Arequest.QueryFields.Values['fone1']+
                            '", telefone2= "'+Arequest.QueryFields.Values['fone2'] +'where idL'+text+' = '+SQLQuery2.FieldByName('idL'+text).AsString ;
        SQLQuery1.ExecSQL;

        //desativa a query para fazer outra operaçao
        SQLQuery1.Active:=False;
        SQLQuery1.SQL.Text:='select * from '+Arequest.QueryFields.Values['table2']+' where email= "'+Arequest.QueryFields.Values['oldemail']+
                            'senha= "'+Arequest.QueryFields.Values['oldsenha']+'"';
        SQLQuery1.Active:=True;

        text:= ARequest.QueryFields.Values['table2'];
        text:= Copy(text, 2, Length(text));

        if SQLQuery1.FieldByName('idL'+text).AsString <> '' then
        begin
             SQLQuery2.Active:=False;
             SQLQuery2.SQL.Text:='update '+Arequest.QueryFields.Values['table2']+' set email= "'+Arequest.QueryFields.Values['email']+
                                '", senha= "'+Arequest.QueryFields.Values['senha']+'", nome= "'+Arequest.QueryFields.Values['cpf']+
                                '", bairro= "'+Arequest.QueryFields.Values['bairro']+'", numero= '+Arequest.QueryFields.Values['num']+
                                ' , rua= "'+Arequest.QueryFields.Values['rua']+'", cidade= "'+Arequest.QueryFields.Values['cidade']+
                                '", uf= "'+Arequest.QueryFields.Values['uf']+'", telefone1= "'+Arequest.QueryFields.Values['fone1']+
                                '", telefone2= "'+Arequest.QueryFields.Values['fone2'] +'where idL'+text+' = '+SQLQuery2.FieldByName('idL'+text).AsString;
             SQLQuery2.ExecSQL;
             AResponse.Content:='sucesso';
        end
        else
        begin
             //erro em parte, possivelmente na hora de atualizar a segunda tabela
             AResponse.Content:='erro';
        end;



   end;

   if task = 'teste' then
   begin
         aux:= '';
        {verifica se ja existe esse cadastro}
        //pesquisa na tabela locador
        SQLQuery1.SQL.Text:= 'select * from teste where user= '+'"'+Arequest.QueryFields.Values['email']+'"'+'and senha= '+'"'+Arequest.QueryFields.Values['pass']+'"';
        SQLQuery1.Active:= true;
        aux:= SQLQuery1.FieldByName('user').AsString;
        if aux = '' then
        begin
            //pesquisa na tabela locatario se necessario
            SQLQuery1.Active:= false;
            SQLQuery1.SQL.Text:= 'select * from teste where user= '+'"'+Arequest.QueryFields.Values['email']+'"'+'and senha= '+'"'+Arequest.QueryFields.Values['pass']+'"';
            SQLQuery1.Active:= true;
            aux:= SQLQuery1.FieldByName('user').AsString;
            SQLQuery1.Active:= false;
        end;
          if aux='' then
          begin
                SQLQuery2.SQL.Text:='insert into '+Arequest.QueryFields.Values['type']+'(user,senha)values('+
                                   '"'+Arequest.QueryFields.Values['email']+'", '+
                                   '"'+Arequest.QueryFields.Values['pass']+'" )';
                SQLQuery2.ExecSQL;
                AResponse.Content:='sucesso';
          end
          else
          begin
               AResponse.Content:='existente';
          end;

   end;

   if task = 'getuser' then
   begin
        text:= ARequest.QueryFields.Values['table'];
        text:= Copy(text, 2, Length(text));
        SQLQuery1.SQL.Text:='select * from '+Arequest.QueryFields.Values['table']+' where idL'+text+' = '+Arequest.QueryFields.Values['id'];
        SQLQuery1.Active:=true;
        aux:= SQLQuery1.FieldByName('email').AsString+';'+SQLQuery1.FieldByName('senha').AsString+';'+
              SQLQuery1.FieldByName('nome').AsString+';'+SQLQuery1.FieldByName('cpf').AsString+';'+
              SQLQuery1.FieldByName('bairro').AsString+';'+SQLQuery1.FieldByName('numero').AsString+';'+
              SQLQuery1.FieldByName('rua').AsString+';'+SQLQuery1.FieldByName('cidade').AsString+';'+
              SQLQuery1.FieldByName('uf').AsString+';'+SQLQuery1.FieldByName('telefone1').AsString+';'+
              SQLQuery1.FieldByName('telefone2').AsString;
        AResponse.Content:=aux;
   end;

   Handled:=true;
end;

initialization
  RegisterHTTPModule('TFPWebModule1', TFPWebModule1);
end.

