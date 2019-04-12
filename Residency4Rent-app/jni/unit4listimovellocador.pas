{Hint: save all files to location: C:\Android\workspace\appteste\jni }
unit unit4listimovellocador;

{$mode delphi}

interface

uses
  Classes, SysUtils, AndroidWidget, Laz_And_Controls, sfloatingbutton,
  unitcontrol, And_jni, imagefilemanager, textfilemanager,
  stoolbar, snavigationview, sdrawerlayout, unit5registerimovel,unit10viewimovellocador,
  unit15viewrequestimoveis;
  
type

  { TAndroidModule4 }

  TAndroidModule4 = class(jForm)
    jButton1: jButton;
    jImageFileManager1: jImageFileManager;
    jListView1: jListView;
    jsFloatingButton1: jsFloatingButton;
    jsNavigationView1: jsNavigationView;
    jsToolbar1: jsToolbar;
    jTextFileManager1: jTextFileManager;
    procedure AndroidModule4BackButton(Sender: TObject);
    procedure AndroidModule4Create(Sender: TObject);
    procedure AndroidModule4JNIPrompt(Sender: TObject);
    procedure jButton1Click(Sender: TObject);
    procedure jListView1ClickItem(Sender: TObject; itemIndex: integer;
      itemCaption: string);
    procedure jListView1ClickWidgetItem(Sender: TObject; itemIndex: integer;
      checked: boolean);
    procedure jListView1DrawItemTextColor(Sender: TObject; itemIndex: integer;
      itemCaption: string; out textColor: TARGBColorBridge);
    procedure jListView1DrawItemWidgetBitmap(Sender: TObject;
      itemIndex: integer; widgetText: string; out bimap: JObject);
    procedure jsFloatingButton1Click(Sender: TObject);
    procedure jsToolbar1ClickNavigationIcon(Sender: TObject);


  private
    {private declarations}
  public
    {public declarations}
     Email:string;
     Pass:string;
     idLocador:string;
     //flag:integer;
  end;

var
  AndroidModule4: TAndroidModule4;


implementation
  
{$R *.lfm}
  

{ TAndroidModule4 }

procedure TAndroidModule4.AndroidModule4JNIPrompt(Sender: TObject);
var
  List:TStringList;
  i:integer;
  j:integer;
  p:integer;
  id,aux,nome:string;
  //myMenu: jObjectRef;
begin
  jsToolbar1.SetFitsSystemWindows(True);
  //jsToolbar1.NavigationIconIdentifier:= 'menu2';
  jsToolbar1.SetTitle('Residency4Rent');
  jsToolbar1.SetTitleTextColor(colbrWhite);


  //preencher a lista com as informacoes dos imoveis
  List:= TStringList.Create;

  with TUser.Create do
  begin
       Self.jListView1.Clear;
       Self.jListView1.Add('IMÓVEIS');
       aux:=GetImovel(Self.Email, Self.Pass,'bylocador');
       Self.idLocador:=SplitStr(aux,'+');
       //ShowMessage(self.idLocador);
       aux:=Trim(aux);

       if aux <> 'free' then
       begin
           j:=1;
           SplitStr(aux,'+');
           List.Clear;
           List.Delimiter:= ';';
           List.StrictDelimiter:= TRUE;
           List.DelimitedText:= aux;
           List.NameValueSeparator:= '*';
           for i:=0 to List.Count -1 do
           begin
                aux:= List.Strings[i];
                SplitStr(aux,'*');
                nome:=Trim(SplitStr(aux,'*'));
                p:= Pos('*',List.Strings[i]);
                id:=Copy(List.Strings[i],0,p-1);
                //self.jListView1.Add(Copy(List.Strings[i],p+1,Length(List.Strings[i])));
                Self.jListView1.Add(nome);
                self.jListView1.SetItemTagString(id,j);
                j:=j+1;
           end;
           list.Free;
       end
       else
       begin
            self.jListView1.Add('Voce não possui imoveis cadastrados!');
       end;

  end;
  jListView1.SetTextDecoratedByIndex(txtBold,0);
  Self.jListView1.SetTextAlignByIndex(alCenter,0);


end;

procedure TAndroidModule4.jButton1Click(Sender: TObject);
begin
     if AndroidModule15 = nil then
     begin
           gApp.CreateForm(TAndroidModule15, AndroidModule15);
           AndroidModule15.idLocador:= self.idLocador;
           AndroidModule15.Init(gApp);
     end
     else
     begin
           AndroidModule15.idLocador:= Self.idLocador;
           AndroidModule15.Show;
     end;
end;

procedure TAndroidModule4.jListView1ClickItem(Sender: TObject;
  itemIndex: integer; itemCaption: string);
begin
     if AndroidModule10 = nil then
     begin
          gApp.CreateForm(TAndroidModule10, AndroidModule10);
          AndroidModule10.id:= self.jListView1.GetItemTagString(itemIndex);
          AndroidModule10.Init(gApp);
     end
     else
     begin
          AndroidModule10.id:= self.jListView1.GetItemTagString(itemIndex);
          AndroidModule10.Show;
     end;
end;

procedure TAndroidModule4.jListView1ClickWidgetItem(Sender: TObject;
  itemIndex: integer; checked: boolean);
begin
     if AndroidModule5 = nil then
     begin
          gApp.CreateForm(TAndroidModule5, AndroidModule5);
          AndroidModule5.typeActivity:='edit';
          AndroidModule5.index:= self.jListView1.GetItemTagString(itemIndex);
          AndroidModule5.Init(gApp);
     end
     else
     begin
          AndroidModule5.index:= self.jListView1.GetItemTagString(itemIndex);
          AndroidModule5.typeActivity:='edit';
          AndroidModule5.Show;
     end;
end;

procedure TAndroidModule4.AndroidModule4BackButton(Sender: TObject);
begin

end;

procedure TAndroidModule4.AndroidModule4Create(Sender: TObject);
begin

end;

procedure TAndroidModule4.jListView1DrawItemTextColor(Sender: TObject;
  itemIndex: integer; itemCaption: string; out textColor: TARGBColorBridge);
begin
  if itemIndex = 0 then
  begin
      textColor:= colbrDarkBlue;
  end;
end;

procedure TAndroidModule4.jListView1DrawItemWidgetBitmap(Sender: TObject;
  itemIndex: integer; widgetText: string; out bimap: JObject);
begin
  if itemIndex <> 0 then
  begin
      bimap:=jImageFileManager1.LoadFromAssets('pencil.png');
  end;

end;

procedure TAndroidModule4.jsFloatingButton1Click(Sender: TObject);
begin

     //self.flag:= self.flag + 1;

     if AndroidModule5 = nil then
     begin
          gApp.CreateForm(TAndroidModule5, AndroidModule5);
          AndroidModule5.idLocador:=self.idLocador;
          AndroidModule5.typeActivity:='register';
          AndroidModule5.Init(gApp);
     end
     else
     begin
          AndroidModule5.idLocador:=self.idLocador;
          AndroidModule5.typeActivity:='register';
          AndroidModule5.Show;
     end;
end;

procedure TAndroidModule4.jsToolbar1ClickNavigationIcon(Sender: TObject);
begin

    //ShowMessage('ok');
    //jsDrawerLayout1.OpenDrawer();
end;



end.
