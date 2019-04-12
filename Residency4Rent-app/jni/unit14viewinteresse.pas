{Hint: save all files to location: \jni }
unit unit14viewinteresse;

{$mode delphi}

interface

uses
  Classes, SysUtils, AndroidWidget, Laz_And_Controls, stoolbar, customdialog,
  unitcontrol;
  
type

  { TAndroidModule14 }

  TAndroidModule14 = class(jForm)
    jCustomDialog1: jCustomDialog;
    jCustomDialog2: jCustomDialog;
    jEditText1: jEditText;
    jEditText2: jEditText;
    jEditText3: jEditText;
    jImageView1: jImageView;
    jListView1: jListView;
    jPanel1: jPanel;
    jPanel2: jPanel;
    jsToolbar1: jsToolbar;
    jTextView1: jTextView;
    jTextView2: jTextView;
    jTextView3: jTextView;
    jTextView4: jTextView;
    jTextView5: jTextView;
    procedure AndroidModule14JNIPrompt(Sender: TObject);
    procedure jListView1ClickItem(Sender: TObject; itemIndex: integer;
      itemCaption: string);
    procedure jListView1ClickWidgetItem(Sender: TObject; itemIndex: integer;
      checked: boolean);
    function contains(value:integer): boolean;
    procedure jListView1LongClickItem(Sender: TObject; itemIndex: integer;
      itemCaption: string);
  private
    {private declarations}
  public
    {public declarations}
    idLocatario,idLocador:string;
    ListIndex:array of integer;
  end;

var
  AndroidModule14: TAndroidModule14;

implementation
  
{$R *.lfm}
  

{ TAndroidModule14 }

function TAndroidModule14.contains(value:integer): boolean;
var
  i:integer;

begin
     Result:=False;
     for i:=0 to Length(self.ListIndex) - 1 do
     begin
          //ShowMessage(IntToStr(value)+'|'+IntToStr(i)+'|'+);
          if(value = self.ListIndex[i]) then
          begin
               Result:=True;
          end;
     end;

end;

procedure TAndroidModule14.jListView1LongClickItem(Sender: TObject;
  itemIndex: integer; itemCaption: string);
var
  ListId,List:TStringList;
  aux:string;
begin
          ListId:=TStringList.Create;
          List:=TStringList.Create;
          ListId.Clear;
          ListId.Delimiter:= ';';
          ListId.StrictDelimiter:= TRUE;
          ListId.DelimitedText:= self.jListView1.GetItemTagString(itemIndex);
          with TUser.Create do
          begin
               aux:=Trim(GetUser('locador',ListId.Strings[2]));
               ListId.Free;
               List.Clear;
               List.Delimiter:= ';';
               List.StrictDelimiter:= TRUE;
               List.DelimitedText:= aux;
               jEditText1.Text:=list.Strings[2];
               jEditText2.Text:=list.Strings[7];
               jEditText3.Text:=list.Strings[9]+' / '+list.Strings[10];
               List.Free;
               jCustomDialog2.Show('Dados do Locador');
          end;
end;

procedure TAndroidModule14.AndroidModule14JNIPrompt(Sender: TObject);
var
  ListImoveis,ListRequest:TStringList;
  i:integer;
  j,k:integer;
  aux,infos,info,nome,bairro:string;
  idImovel,idLocador,cidade:string;
begin
     Self.jListView1.Clear;
     //criar as listas
     ListImoveis:= TStringList.Create;
     ListRequest:= TStringList.Create;

     with TUser.Create do
     begin
          //ShowMessage(self.idLocatario);
          aux:=Trim(Getbylocatario(self.idLocatario));


          if aux <> '' then
          begin
               infos:=SplitStr(aux,'|');
               //informacoes de interesse
               ListRequest.Clear;
               ListRequest.Delimiter:= '*';
               ListRequest.StrictDelimiter:= TRUE;
               ListRequest.DelimitedText:= infos;

               //informacoes basicas do imovel
               ListImoveis.Clear;
               ListImoveis.Delimiter:= '*';
               ListImoveis.StrictDelimiter:= TRUE;
               ListImoveis.DelimitedText:= aux;

               SetLength(self.ListIndex,ListImoveis.Count);

               //preencher a lista
               j:=0;k:=0;
               for i:=0 to ListImoveis.Count -1 do
               begin
                    aux:=ListImoveis.Strings[i];
                    infos:=ListRequest.Strings[i];
                    idImovel:=SplitStr(aux,';');
                    idLocador:=SplitStr(aux,';');
                    nome:=SplitStr(aux,';');
                    bairro:=SplitStr(aux,';');
                    cidade:=aux;
                    info:=SplitStr(infos,';')+';'+idImovel+';'+idLocador;

                    Self.jListView1.Add(nome+'|'+cidade+'|'+'Bairro: '+bairro);
                    Self.jListView1.SetItemTagString(info,j);
                    aux:=SplitStr(infos,';');

                    if aux = '2' then
                    begin
                         self.jListView1.SetWidgetCheck(true,i);
                         Self.ListIndex[k]:=i;
                         k:=k+1;
                    end;
                    j:=j+1;
               end;

          end
          else
          begin
               self.jListView1.Add('Voçê não se interesou por algum imóvel...');
          end;
     end;
end;

procedure TAndroidModule14.jListView1ClickItem(Sender: TObject;
  itemIndex: integer; itemCaption: string);
var
  aux:string;
  id:string;
begin
     //ShowMessage(jListView1.GetItemTagString(itemIndex));

     aux:=self.jListView1.GetItemTagString(itemIndex);
     id:=SplitStr(aux,';');
     with TUser.Create do
     begin
          aux:=Trim(GetStatusContrato(id));
          if aux='1' then
          begin
               jImageView1.ImageIdentifier:='tick';
               jTextView1.Text:='Contrato Aprovado!';
               jPanel1.BackgroundColor:=colbrBeige;
               jCustomDialog1.Show('Situação');
          end;
          if aux='2' then
          begin
               jImageView1.ImageIdentifier:='warning';
               jTextView2.Text:='Contrato negado pelo locador!';
               jPanel1.BackgroundColor:=colbrRed;
               jCustomDialog1.Show('Situação');
          end;
          if aux='3' then
          begin
               jImageView1.ImageIdentifier:='warning';
               jTextView2.Text:='Solicitação de contrato pendente!';
               jPanel1.BackgroundColor:=colbrKhaki;
               jCustomDialog1.Show('Situação');
          end;
     end;
end;

procedure TAndroidModule14.jListView1ClickWidgetItem(Sender: TObject;
  itemIndex: integer; checked: boolean);
var
   aux:string;
   ListId:TStrings;
begin
     if contains(itemIndex) then
     begin
          self.jListView1.SetWidgetCheck(true,itemIndex);
          ShowMessage('Visitado!');
     end
     else
     begin
          ListId:=TStringList.Create;
          ListId.Clear;
          ListId.Delimiter:= ';';
          ListId.StrictDelimiter:= TRUE;
          ListId.DelimitedText:= self.jListView1.GetItemTagString(itemIndex);
          if checked then
          begin
             ShowMessage('Visitado');
             With TUser.Create do
             begin
                 aux:=SetStatus('visita',ListId.Strings[0],'2');
             end;
          end
          else
          begin
             ShowMessage('Não visitado');
             With TUser.Create do
             begin
                 aux:=SetStatus('visita',ListId.Strings[0],'1');
             end;
          end;
          ListId.Free;
     end;
end;

end.
