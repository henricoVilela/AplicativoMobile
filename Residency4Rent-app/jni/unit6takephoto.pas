{Hint: save all files to location: \jni }
unit unit6takephoto;

{$mode delphi}

interface

uses
  Classes, SysUtils, AndroidWidget, customcamera, Laz_And_Controls, And_jni,
  sfloatingbutton, opendialog, unitcontrol;
  
type

  { TAndroidModule6 }

  TAndroidModule6 = class(jForm)
    jCustomCamera1: jCustomCamera;
    jEditText1: jEditText;
    jHttpClient1: jHttpClient;
    jImageBtn1: jImageBtn;
    jsFloatingButton1: jsFloatingButton;
    procedure AndroidModule6JNIPrompt(Sender: TObject);
    procedure AndroidModule6RequestPermissionResult(Sender: TObject;
      requestCode: integer; manifestPermission: string;
      grantResult: TManifestPermissionResult);
    procedure jCustomCamera1PictureTaken(Sender: TObject;
      bitmapPicture: jObject; fullPath: string);
    procedure jHttpClient1UploadFinished(Sender: TObject;
      connectionStatusCode: integer; responseMessage: string; fileName: string);
    procedure jImageBtn1Click(Sender: TObject);
    procedure jsFloatingButton1Click(Sender: TObject);
  private
    {private declarations}
  public
    {public declarations}
    ListNames:TStringList;
    ListPaths:TStringList;
    paths:string;
    aux:string;
    i:integer;
  end;

var
  AndroidModule6: TAndroidModule6;

implementation
  
{$R *.lfm}
  

{ TAndroidModule6 }

procedure TAndroidModule6.jImageBtn1Click(Sender: TObject);
var
  name:string;
begin

  if self.aux = '' then
  begin
      with TUser.Create do
      begin
           self.aux:=Trim(GetLastIdImovel());
      end;
  end;

  name:=jEditText1.Text+self.aux+'.jpg';
  self.ListNames.Add(name);
  jCustomCamera1.TakePicture(name);


end;

procedure TAndroidModule6.jsFloatingButton1Click(Sender: TObject);
var
  address:string;
begin
  address:='http://10.1.18.163/';
  self.i:=0;
  if self.ListPaths.Count > 0 then
  begin
      Self.jHttpClient1.UploadFile(address, self.ListPaths.Strings[0]);
      //AndroidModule6.Close;
  end
  else
  begin
       ShowMessage('Tire uma fotografia para que possa ser salva!');
  end;


end;

procedure TAndroidModule6.AndroidModule6JNIPrompt(Sender: TObject);
var
  manifestPermissions: TDynArrayOfString;
begin
  self.ListPaths:= TStringList.Create;
  self.ListNames:= TStringList.Create;
  jCustomCamera1.SetEnvironmentStorage(dirDownloads,'ResidencyPicture');
  jEditText1.Text:='photo';


  if  IsRuntimePermissionNeed() then   // that is, target API >= 23
  begin

      ShowMessage('warning: Requesting Runtime Permission.... please, wait..');

      SetLength(manifestPermissions, 2);

      manifestPermissions[0]:= 'android.permission.CAMERA';  //from AndroodManifest.xml
      manifestPermissions[1]:= 'android.permission.WRITE_EXTERNAL_STORAGE'; //from AndroodManifest.xml

      Self.RequestRuntimePermission(manifestPermissions, 1001);

      SetLength(manifestPermissions, 0);
  end;

  if not Self.isConnected() then
  begin //try wifi
    if Self.SetWifiEnabled(True) then
      ShowMessage('Sucess conected!')
    else
      ShowMessage('Please,  try enable some connection...');
  end;

end;

procedure TAndroidModule6.AndroidModule6RequestPermissionResult(
  Sender: TObject; requestCode: integer; manifestPermission: string;
  grantResult: TManifestPermissionResult);
begin
  case requestCode of
     1001:begin
              if grantResult = PERMISSION_GRANTED  then
                ShowMessage('Success! ['+manifestPermission+'] Permission grant!!! ' )
              else  //PERMISSION_DENIED
                ShowMessage('Sorry... ['+manifestPermission+'] Permission not grant... ' );
          end;
  end;

  if IsRuntimePermissionNeed() then
      jCustomCamera1.Refresh;
end;

procedure TAndroidModule6.jCustomCamera1PictureTaken(Sender: TObject;
  bitmapPicture: jObject; fullPath: string);
begin
   self.ListPaths.Add(fullPath);

   ShowMessage('foto salva com sucesso!');
end;

procedure TAndroidModule6.jHttpClient1UploadFinished(Sender: TObject;
  connectionStatusCode: integer; responseMessage: string; fileName: string);
var
  str:string;
  j:integer;
begin

     if self.ListPaths.Count-1 > i then
     begin
       i:=i+1 ;
       Self.jHttpClient1.UploadFile('http://10.1.18.163/', self.ListPaths.Strings[i]);

     end
     else
     begin
         ShowMessage('Upload feito com sucesso!');
         self.ListPaths.Free;
         with TUser.Create do
         begin
             if self.ListNames.Count > 1 then
             begin
                  for j:=0 to self.ListNames.Count -1 do
                  begin
                       try

                          str:=RegisterImagens(self.aux,self.ListNames.Strings[j]);
                          self.ListNames.Free
                       except
                          // will only be executed in case of an exception
                          on E: Exception do
                          ShowMessage( 'Error: '+ E.ClassName + #13#10 + E.Message );
                       end;
                  end;
                  self.ListNames.Free;
             end
             else
             begin
                 try
                    str:=RegisterImagens(self.aux,self.ListNames.Strings[0]);
                    self.ListNames.Free;
                    AndroidModule6.Close;
                 except
                 // will only be executed in case of an exception
                    on E: Exception do
                       ShowMessage( 'Error: '+ E.ClassName + #13#10 + E.Message );
                 end;

             end;

         end;
     end;

end;


end.
