{Hint: save all files to location: \jni }
unit unit9viewdetailsimoveis;

{$mode delphi}

interface

uses
  Classes, SysUtils, AndroidWidget, Laz_And_Controls, scoordinatorlayout,
  sappbarlayout, srecyclerview, sfloatingbutton, viewflipper, stoolbar,
  broadcastreceiver, intentmanager, downloadservice, unit8panelview,
  unitcontrol, And_jni, gmaps, customdialog, ratingbar, radiogroup,
  unit13loginlocatario, unit11copycadastro, unit16viewavaliacoes;
  
type

  { TAndroidModule9 }

  TAndroidModule9 = class(jForm)
    jBroadcastReceiver1: jBroadcastReceiver;
    jButton1: jButton;
    jCustomDialog1: jCustomDialog;
    jCustomDialog2: jCustomDialog;
    jDialogYN1: jDialogYN;
    jDialogYN2: jDialogYN;
    jDownloadService1: jDownloadService;
    jEditText1: jEditText;
    jEditText2: jEditText;
    jIntentManager1: jIntentManager;
    jMaps1: jMaps;
    jPanel1: jPanel;
    jPanel2: jPanel;
    jPanel3: jPanel;
    jPanel4: jPanel;
    jRadioGroup1: jRadioGroup;
    jRatingBar1: jRatingBar;
    jsCoordinatorLayout1: jsCoordinatorLayout;
    jsFloatingButton1: jsFloatingButton;
    jsFloatingButton2: jsFloatingButton;
    jsFloatingButton3: jsFloatingButton;
    jsFloatingButton4: jsFloatingButton;
    jsRecyclerView1: jsRecyclerView;
    jsToolbar1: jsToolbar;
    jTextView1: jTextView;
    jTextView2: jTextView;
    jTextView3: jTextView;
    jTextView4: jTextView;
    jViewFlipper1: jViewFlipper;
    procedure AndroidModule9JNIPrompt(Sender: TObject);
    procedure AddCardView();
    procedure jBroadcastReceiver1Receiver(Sender: TObject; intent: jObject);
    procedure jButton1Click(Sender: TObject);
    procedure jDialogYN1ClickYN(Sender: TObject; YN: TClickYN);
    procedure jDialogYN2ClickYN(Sender: TObject; YN: TClickYN);
    procedure jsFloatingButton1Click(Sender: TObject);
    procedure jsFloatingButton2Click(Sender: TObject);
    procedure jsFloatingButton3Click(Sender: TObject);
    procedure jsFloatingButton4Click(Sender: TObject);
    procedure jsRecyclerView1ItemClick(Sender: TObject; itemPosition: integer;
      itemArrayOfStringCount: integer);
    procedure jViewFlipper1FlingGesture(Sender: TObject;
      flingGesture: TFlingGesture);
  private
    {private declarations}
  public
    id,lat,long:string;
    List:TStringList;
    {public declarations}
  end;

var
  AndroidModule9: TAndroidModule9;

implementation
  
{$R *.lfm}
  

{ TAndroidModule9 }

procedure TAndroidModule9.AddCardView();
var
   aux:string;
   i:integer;
   ListCampos:TStringList;
begin
     if AndroidModule8 = nil then
     begin
             gApp.CreateForm(TAndroidModule8, AndroidModule8);
             AndroidModule8.Init(gApp);
     end;

     with TUser.Create do
     begin
          aux:=Trim(GetImovelById(self.id));
     end;

     jsFloatingButton1.SetPressedRippleColor(colbrCyan);
     jsFloatingButton1.ShowSnackbar('Efetuar Alugel!');

        listCampos:=TStringList.Create;
        listCampos.Clear;
        listCampos.Delimiter:=';';
        listCampos.StrictDelimiter:=True;
        ListCampos.DelimitedText:=aux;

        for i:= jsRecyclerView1.GetItemCount()-1 downto 0  do
        begin
               jsRecyclerView1.Remove(i);
        end;

        jsRecyclerView1.SetClipToPadding(False);
        jsRecyclerView1.SetItemContentFormat('IMAGE|TEXT|TEXT');
        jsRecyclerView1.SetItemContentLayout(AndroidModule8.jPanel2.View, true);
        jsRecyclerView1.Add('dollar.png@assets|Valor de Locação:|'+'R$ '+ListCampos.Strings[2]);
        jsRecyclerView1.Add('cityscape.png@assets|Cidade/Estado:|'+ListCampos.Strings[6]);
        jsRecyclerView1.Add('placeholder2.png@assets|Bairro: '+ListCampos.Strings[4]+'|'+'AV. '+ListCampos.Strings[5]);
        jsRecyclerView1.Add('info.png@assets|Apartamentos diponíveis: '+ListCampos.Strings[1]+'|'+ListCampos.Strings[3]);

end;

procedure TAndroidModule9.jBroadcastReceiver1Receiver(Sender: TObject;
  intent: jObject);
begin
     jViewFlipper1.AddView(jIntentManager1.GetExtraString(intent, 'FilePath'),scaleCenterInside);
end;

procedure TAndroidModule9.jButton1Click(Sender: TObject);
var
   aux:string;
begin
     if jEditText1.Text <> '' then
     begin
         with TUser.Create do
         begin
              aux:=Trim(RegisterAvaliacao(self.id,jEditText1.Text,jEditText2.Text,jRatingBar1.GetRating().ToString,jRadioGroup1.GetChekedRadioButtonCaption()));
              if aux <> '' then
              begin
                   ShowMessage('Obrigado por contribuir com sua opinião!');
                   jCustomDialog2.Close();
              end
              else
              begin
                   ShowMessage('Error: tente novamente!');
              end;
         end;
     end
     else
     begin
          ShowMessage('Por favor, insira seu nome!');
     end;

end;

procedure TAndroidModule9.jDialogYN1ClickYN(Sender: TObject; YN: TClickYN);
begin
     if YN = ClickYes then
     begin
          if AndroidModule13 = nil then
          begin
             gApp.CreateForm(TAndroidModule13, AndroidModule13);
             AndroidModule13.idImovel:=self.id;
             AndroidModule13.modo:='visit';
             AndroidModule13.Init(gApp);
          end
          else
          begin
               AndroidModule13.modo:='visit';
               AndroidModule13.idImovel:=self.id;
               AndroidModule13.Show;
          end;
     end;

     if YN = ClickNo then
     begin
          if AndroidModule11 = nil then
          begin
               try
                 gApp.CreateForm(TAndroidModule11, AndroidModule11);
                 AndroidModule11.Modo:='cadastro';
                 AndroidModule11.Init(gApp);

               except
                  // will only be executed in case of an exception
                  on E: Exception do
                     ShowMessage( 'Error: '+ E.ClassName + #13#10 + E.Message );
               end;
          end
          else
          begin
               AndroidModule11.Modo:='cadastro';
               AndroidModule11.Show;
          end;
     end;
end;

procedure TAndroidModule9.jDialogYN2ClickYN(Sender: TObject; YN: TClickYN);
begin
     if YN = ClickYes then jCustomDialog2.Show('Avaliação');
     if YN = ClickNo then
     begin
         if AndroidModule16 = nil then
         begin
             gApp.CreateForm(TAndroidModule16, AndroidModule16);
             AndroidModule16.idImovel:=self.id;
             AndroidModule16.Init(gApp);
         end
         else
         begin
             AndroidModule16.idImovel:=self.id;
             AndroidModule16.Show;
         end;
     end;
end;

procedure TAndroidModule9.jsFloatingButton1Click(Sender: TObject);
var
   title,msg:string;
begin
     title := 'Aviso!';
     msg := 'É necessario possuir cadastro para efetuar o contrato, ou marcar visita. Você possui cadastro?';
     jDialogYN1.Show(title,msg,'SIM','NAO');
end;

procedure TAndroidModule9.jsFloatingButton2Click(Sender: TObject);
begin
    if  jMaps1.IsAppMapsInstalled() then
     begin
          jMaps1.Show(self.lat,self.long);
     end
     else
     begin
          ShowMessage('Try downloading Google Maps App ...');
          if not Self.IsWifiEnabled() then Self.SetWifiEnabled(True);
          jMaps1.TryDownloadAppMaps();

     end;
end;

procedure TAndroidModule9.jsFloatingButton3Click(Sender: TObject);
begin
     if  jMaps1.IsAppMapsInstalled() then
     begin
          jMaps1.Navigation(self.lat,self.long);
     end
     else
     begin
          ShowMessage('Try downloading Google Maps App ...');
          if not Self.IsWifiEnabled() then Self.SetWifiEnabled(True);
          jMaps1.TryDownloadAppMaps();

     end;
end;

procedure TAndroidModule9.jsFloatingButton4Click(Sender: TObject);
begin
    //jCustomDialog2.Show('Avaliação');
    jDialogYN2.Show('Opções','Você deseja:','Avaliar','Ver avaliações');
end;

procedure TAndroidModule9.jsRecyclerView1ItemClick(Sender: TObject;
  itemPosition: integer; itemArrayOfStringCount: integer);
var
   aux:string;
begin
    aux:='';
    if itemPosition = 2 then
    begin

        with TUser.Create do
        begin
             aux:=Trim(GetLocation(self.id));
             if aux <> '0;0' then
             begin
                  self.lat:=SplitStr(aux,';');
                  self.long:=aux;
                  jTextView1.SetRoundCorner();
                  jCustomDialog1.Show('Opções de Navegação');
             end
             else
             begin
                  ShowMessage('Não possui localização cadastrada!');
             end;

        end;


    end;
end;

procedure TAndroidModule9.jViewFlipper1FlingGesture(Sender: TObject;
  flingGesture: TFlingGesture);
begin
  if flingGesture = fliRightToLeft then jViewFlipper1.Previous();
  if flingGesture =  fliLeftToRight then jViewFlipper1.Next();
end;

procedure TAndroidModule9.AndroidModule9JNIPrompt(Sender: TObject);
var
   i:integer;
   aux:string;
begin
     jEditText1.Text:='';
     jEditText2.Text:='';
     AddCardView();
     jViewFlipper1.Clear();

      List:= TStringList.Create;
      with TUser.Create do
      begin
          aux:=Trim(GetImagesById(self.id));
          if aux <> '' then
          begin
                List.Clear;
                List.Delimiter:= ';';
                List.StrictDelimiter:= TRUE;
                List.DelimitedText:= aux;
          end;
      end;

      if not Self.isConnected() then
      begin //try wifi
            if Self.SetWifiEnabled(True) then
               ShowMessage('Enable wifi sucess...')
            else
                ShowMessage('Please,  try enable some connection...')
      end;

      jBroadcastReceiver1.RegisterIntentActionFilter('com.example.appdownloadservicedemo1.DOWNLOAD_RECEIVER');
      for i:=0 to List.Count -1 do
      begin
          jDownloadService1.SaveToFile(Self.GetEnvironmentDirectoryPath(dirDownloads)+'/temp', List.Strings[i]);
          jDownloadService1.Start('http://10.1.18.163/uploads/'+List.Strings[i],'com.example.appdownloadservicedemo1.DOWNLOAD_RECEIVER');
      end;
      //AddFlipView();
end;


end.
