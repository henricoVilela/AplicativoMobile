{Hint: save all files to location: C:\Android\workspace\Residency4Rent\jni }
unit unit1;

{$mode delphi}

interface

uses
  Classes, SysUtils, AndroidWidget, Laz_And_Controls, stoolbar,
  broadcastreceiver, downloadmanager, sdrawerlayout, snavigationview,
  unit2loginlocador, unit7viewimoveis, unitcontrol;
  
type

  { TAndroidModule1 }

  TAndroidModule1 = class(jForm)
    jButton1: jButton;
    jButton2: jButton;
    jImageBtn1: jImageBtn;
    jPanel1: jPanel;
    jsDrawerLayout1: jsDrawerLayout;
    jsNavigationView1: jsNavigationView;
    jsToolbar1: jsToolbar;
    procedure AndroidModule1JNIPrompt(Sender: TObject);
    procedure AndroidModule1RequestPermissionResult(Sender: TObject;
      requestCode: integer; manifestPermission: string;
      grantResult: TManifestPermissionResult);
    procedure jButton1Click(Sender: TObject);
    procedure jButton2Click(Sender: TObject);
    procedure jsToolbar1ClickNavigationIcon(Sender: TObject);
  private
    {private declarations}
  public
    {public declarations}
    List:TStringList;
  end;

var
  AndroidModule1: TAndroidModule1;

implementation
  
{$R *.lfm}
  

{ TAndroidModule1 }

procedure TAndroidModule1.jButton2Click(Sender: TObject);
begin
  if AndroidModule2 = nil then
  begin
       gApp.CreateForm(TAndroidModule2, AndroidModule2);
       AndroidModule2.Init(gApp);
  end
  else
  begin
       AndroidModule2.Show;
  end;
end;

procedure TAndroidModule1.jsToolbar1ClickNavigationIcon(Sender: TObject);
begin
  jsDrawerLayout1.OpenDrawer();
end;

procedure TAndroidModule1.jButton1Click(Sender: TObject);
begin

  if AndroidModule7 = nil then
     begin
          gApp.CreateForm(TAndroidModule7, AndroidModule7);
          //AndroidModule7.strings:=aux2;
          AndroidModule7.Init(gApp);
     end
     else
     begin
          //AndroidModule7.strings:=aux2;
          AndroidModule7.Show;
     end;

end;

procedure TAndroidModule1.AndroidModule1JNIPrompt(Sender: TObject);
var
  myMenu: jObjectRef;
  manifestPermissions: TDynArrayOfString;
  i:integer;
begin
     if  IsRuntimePermissionNeed() then   // that is, target API >= 23
     begin

      ShowMessage('warning: Requesting Runtime Permission.... please, wait..');

      SetLength(manifestPermissions, 1);
      manifestPermissions[0]:= 'android.permission.WRITE_EXTERNAL_STORAGE'; //from AndroodManifest.xml

      Self.RequestRuntimePermission(manifestPermissions, 1001);

      SetLength(manifestPermissions, 0);
     end;
     if not Self.isConnected() then
     begin //try wifi
           if Self.SetWifiEnabled(True) then
              ShowMessage('Wifi enable with sucess...')
           else
               ShowMessage('Please,  try enable some connection...');
     end;
     jsToolbar1.NavigationIconIdentifier:= 'menu';

     jsNavigationView1.AddHeaderView(colbrDodgerBlue, 'logo_tela2', 'Residency4Rent', 240);

     myMenu:= jsNavigationView1.AddMenu('Trabalho de Curso');
     jsNavigationView1.AddItem(myMenu,101,'Henrico Tadeu R A Vilela');

     jsNavigationView1.AddItem(myMenu,102,'Universidade Federal do Mato Grosso');
     jsNavigationView1.AddItem(myMenu,103,'ICET/Campus Araguia');
     //jsNavigationView1.AddItem(myMenu,104,'Campus Araguaia');

end;

procedure TAndroidModule1.AndroidModule1RequestPermissionResult(
  Sender: TObject; requestCode: integer; manifestPermission: string;
  grantResult: TManifestPermissionResult);
begin
  {case requestCode of
     1001:begin
              if grantResult = PERMISSION_GRANTED  then
                ShowMessage('Success! ['+manifestPermission+'] Permission grant!!! ' )
              else  //PERMISSION_DENIED
                ShowMessage('Sorry... ['+manifestPermission+'] Permission not grant... ' );
          end;
  end;}
end;

end.
