{Hint: save all files to location: \jni }
unit unit10viewimovellocador;

{$mode delphi}

interface

uses
  Classes, SysUtils, AndroidWidget, Laz_And_Controls, scoordinatorlayout,
  sappbarlayout, srecyclerview, sfloatingbutton, viewflipper, stoolbar,
  broadcastreceiver, intentmanager, downloadservice, unit8panelview,
  unitcontrol, And_jni;
  
type

  { TAndroidModule10 }

  TAndroidModule10 = class(jForm)
    jBroadcastReceiver1: jBroadcastReceiver;
    jDownloadService1: jDownloadService;
    jIntentManager1: jIntentManager;
    jsCoordinatorLayout1: jsCoordinatorLayout;
    jsRecyclerView1: jsRecyclerView;
    jsToolbar1: jsToolbar;
    jViewFlipper1: jViewFlipper;
    procedure AndroidModule10JNIPrompt(Sender: TObject);
    procedure jBroadcastReceiver1Receiver(Sender: TObject; intent: jObject);
    procedure AddCardView();
    procedure jViewFlipper1FlingGesture(Sender: TObject;
      flingGesture: TFlingGesture);
  private
    {private declarations}
  public
    {public declarations}
    id:string;
    List:TStringList;
  end;

var
  AndroidModule10: TAndroidModule10;

implementation
  
{$R *.lfm}
  

{ TAndroidModule10 }
procedure TAndroidModule10.AddCardView();
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
        jsRecyclerView1.SetItemContentLayout(AndroidModule8.jPanel2.View);
        jsRecyclerView1.Add('dollar.png@assets|Valor de Locação:|'+'R$ '+ListCampos.Strings[2]);
        jsRecyclerView1.Add('cityscape.png@assets|Cidade/Estado:|'+ListCampos.Strings[6]);
        jsRecyclerView1.Add('placeholder2.png@assets|Bairro: '+ListCampos.Strings[4]+'|'+'AV. '+ListCampos.Strings[5]);
        jsRecyclerView1.Add('info.png@assets|Apartamentos diponíveis: '+ListCampos.Strings[1]+'|'+ListCampos.Strings[3]);

end;

procedure TAndroidModule10.jViewFlipper1FlingGesture(Sender: TObject;
  flingGesture: TFlingGesture);
begin
     if flingGesture = fliRightToLeft then jViewFlipper1.Previous();
     if flingGesture =  fliLeftToRight then jViewFlipper1.Next();
end;

procedure TAndroidModule10.jBroadcastReceiver1Receiver(Sender: TObject;
  intent: jObject);
begin
     jViewFlipper1.AddView(jIntentManager1.GetExtraString(intent, 'FilePath'),scaleCenterInside);
end;

procedure TAndroidModule10.AndroidModule10JNIPrompt(Sender: TObject);
var
   i:integer;
   aux:string;
begin
     AddCardView();
     jsToolbar1.SetTitle('Informações');

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
