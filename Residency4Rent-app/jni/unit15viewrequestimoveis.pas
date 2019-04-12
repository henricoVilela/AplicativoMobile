{Hint: save all files to location: \jni }
unit unit15viewrequestimoveis;

{$mode delphi}

interface

uses
  Classes, SysUtils, AndroidWidget, stoolbar, Laz_And_Controls, customdialog,
  unitcontrol, And_jni, radiogroup, broadcastreceiver, downloadmanager;
  
type

  { TAndroidModule15 }

  TAndroidModule15 = class(jForm)
    jBroadcastReceiver1: jBroadcastReceiver;
    jCustomDialog1: jCustomDialog;
    jCustomDialog2: jCustomDialog;
    jCustomDialog3: jCustomDialog;
    jDownloadManager1: jDownloadManager;
    jEditText1: jEditText;
    jEditText10: jEditText;
    jEditText11: jEditText;
    jEditText2: jEditText;
    jEditText3: jEditText;
    jEditText4: jEditText;
    jEditText5: jEditText;
    jEditText6: jEditText;
    jEditText7: jEditText;
    jEditText8: jEditText;
    jEditText9: jEditText;
    jImageBtn1: jImageBtn;
    jImageBtn2: jImageBtn;
    jImageBtn3: jImageBtn;
    jListView1: jListView;
    jPanel1: jPanel;
    jPanel2: jPanel;
    jPanel3: jPanel;
    jPanel4: jPanel;
    jPanel5: jPanel;
    jRadioGroup1: jRadioGroup;
    jsToolbar1: jsToolbar;
    jTextView1: jTextView;
    jTextView10: jTextView;
    jTextView11: jTextView;
    jTextView12: jTextView;
    jTextView13: jTextView;
    jTextView14: jTextView;
    jTextView2: jTextView;
    jTextView3: jTextView;
    jTextView4: jTextView;
    jTextView5: jTextView;
    jTextView6: jTextView;
    jTextView7: jTextView;
    jTextView8: jTextView;
    jTextView9: jTextView;
    procedure AndroidModule15JNIPrompt(Sender: TObject);
    procedure jBroadcastReceiver1Receiver(Sender: TObject; intent: jObject);
    procedure jImageBtn1Click(Sender: TObject);
    procedure jImageBtn2Click(Sender: TObject);
    procedure jImageBtn3Click(Sender: TObject);
    procedure jListView1ClickItem(Sender: TObject; itemIndex: integer;
      itemCaption: string);
    procedure jRadioGroup1CheckedChanged(Sender: TObject;
      checkedIndex: integer; checkedCaption: string);
  private
    {private declarations}
  public
    {public declarations}
    idLocador,idAlugel,idLocatario,infoImovel:string;
  end;

var
  AndroidModule15: TAndroidModule15;

implementation
  
{$R *.lfm}
  

{ TAndroidModule15 }

procedure TAndroidModule15.AndroidModule15JNIPrompt(Sender: TObject);
var
  ListImoveis,ListRequest:TStringList;
  i:integer;
  j:integer;
  aux,infos,nome,bairro,idImovel:string;
begin

     Self.jListView1.Clear;
     //criar as listas
     ListImoveis:= TStringList.Create;
     ListRequest:= TStringList.Create;

     if not Self.isConnected() then
     begin //try wifi
           if Self.SetWifiEnabled(True) then
              ShowMessage('wifi conection sucess!')
           else
               ShowMessage('Please,  try enable some connection...');
     end;

     with TUser.Create do
     begin
          ShowMessage(self.idLocador);
          try
             aux:=Trim(GetRequest(self.idLocador));
          except
                on E: Exception do
                ShowMessage( 'Error: '+ E.ClassName + #13#10 + E.Message );
          end;

         // ShowMessage('teste');
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

               //preencher a lista
               j:=0;
               for i:=0 to ListImoveis.Count -1 do
               begin
                    aux:=ListImoveis.Strings[i];
                    infos:=ListRequest.Strings[i];
                    idImovel:=SplitStr(aux,';');
                    nome:=SplitStr(aux,';');
                    bairro:=aux;

                    Self.jListView1.Add(nome+'|'+'Bairro: '+bairro);
                    Self.jListView1.SetItemTagString(ListRequest.Strings[i],j);
                    j:=j+1;
               end;
               ListImoveis.Free;
               ListRequest.Free;
          end
          else
          begin
               self.jListView1.Add('Não há imóveis com manifestação de algum interesse...');
          end;


     end;
end;

procedure TAndroidModule15.jBroadcastReceiver1Receiver(Sender: TObject;
  intent: jObject);
begin
    jBroadcastReceiver1.Unregister();
end;

procedure TAndroidModule15.jImageBtn1Click(Sender: TObject);
var
  res: TAndroidResult;
begin
     if not Self.isConnected() then
     begin
          ShowMessage('Sorry,  Device is not connected...');
          Exit;
     end;

     jBroadcastReceiver1.RegisterIntentActionFilter(jDownloadManager1.GetActionDownloadComplete()); //'android.intent.action.DOWNLOAD_COMPLETE'

     jDownloadManager1.SaveToFile(dirDownloads, 'Contrato'+self.idAlugel+'.txt');
     res:= jDownloadManager1.Start('http://10.1.18.163/contratos/Contrato'+self.idAlugel+'.txt');

     if res = RESULT_OK then
        ShowMessage('Download Sucess! verifique sua PASTA DE DOWNLOAD...')
     else
         ShowMessage('Download FAIL!');
end;

procedure TAndroidModule15.jImageBtn2Click(Sender: TObject);
var
  aux:string;
  list:TStringList;
begin
     List:= TStringList.Create;
     with TUser.Create do
     begin
          aux:=Trim(GetUser('locatario',self.idLocatario));
          List.Clear;
          List.Delimiter:= ';';
          List.StrictDelimiter:= TRUE;
          List.DelimitedText:= aux;
          jEditText3.Text:=list.Strings[2];
          jEditText5.Text:=list.Strings[3];
          jEditText7.Text:=list.Strings[7];
          jEditText6.Text:=list.Strings[9];
          jEditText8.Text:=list.Strings[10];
          List.Free;
          jCustomDialog2.Show('Dados do Locátario');
     end;


end;

procedure TAndroidModule15.jImageBtn3Click(Sender: TObject);
var
  aux:string;
begin
     With TUser.Create do
     begin
          aux:=Trim(GetInfoAlugel(self.idAlugel,'min'));
          jEditText4.Text:=SplitStr(self.infoImovel,'|');
          jEditText11.Text:=SplitStr(aux,';');
          jEditText10.Text:=SplitStr(aux,';');
          jEditText9.Text:=aux;
          jCustomDialog3.Show('Informações Contrato');
     end;
end;

procedure TAndroidModule15.jListView1ClickItem(Sender: TObject;
  itemIndex: integer; itemCaption: string);
var
  ListInfo:TStringList;
begin
     //ShowMessage(self.jListView1.GetItemTagString(itemIndex));
     //ShowMessage(itemCaption);
     self.infoImovel:=itemCaption;
     ListInfo:=TStringList.Create;
     ListInfo.Clear;
     ListInfo.Delimiter:= ';';
     ListInfo.StrictDelimiter:= TRUE;
     ListInfo.DelimitedText:= self.jListView1.GetItemTagString(itemIndex);
     jEditText1.Text:=ListInfo.Strings[1];
     jEditText2.Text:=ListInfo.Strings[2];
     Self.idAlugel:=ListInfo.Strings[0];
     self.idLocatario:=ListInfo.Strings[5];
     //jRadioGroup1.ClearCheck();

     if ListInfo.Strings[3] = '1' then jRadioGroup1.CheckRadioButtonByIndex(0);
     if ListInfo.Strings[3] = '2' then jRadioGroup1.CheckRadioButtonByIndex(1);
     if ListInfo.Strings[3] = '3' then ShowMessage('Validação do contrato pendente!');
     if ListInfo.Strings[3] = '' then
     begin
          jTextView4.Enabled:=false;
          jTextView4.Visible:=false;
          jTextView5.Enabled:=false;
          jTextView5.Visible:=false;
          jRadioGroup1.Enabled:=false;
          jRadioGroup1.Visible:=false;
          jImageBtn1.Enabled:=false;
          jImageBtn1.Visible:=false;
     end;

     jCustomDialog1.Show('Visitas agendadas', 'info');
end;

procedure TAndroidModule15.jRadioGroup1CheckedChanged(Sender: TObject;
  checkedIndex: integer; checkedCaption: string);
var
  aux:string;
begin
     if checkedIndex = 0 then
     begin
          with TUser.Create do
          begin
               aux:=SetStatus('contrato',self.idAlugel,'1');
          end;
     end;

     if checkedIndex = 1 then
     begin
          with TUser.Create do
          begin
               aux:=SetStatus('contrato',self.idAlugel,'2');
          end;
     end;
end;


end.
