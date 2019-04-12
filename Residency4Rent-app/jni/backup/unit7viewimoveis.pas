{Hint: save all files to location: \jni }
unit unit7viewimoveis;

{$mode delphi}

interface

uses
  Classes, SysUtils, AndroidWidget, stoolbar, Laz_And_Controls, unitcontrol,
  scoordinatorlayout, sappbarlayout, scollapsingtoolbarlayout, srecyclerview,
  sfloatingbutton, unit8panelview, unit9viewdetailsimoveis, unit14viewinteresse,
  unit13loginlocatario;

type

  { TAndroidModule7 }

  TAndroidModule7 = class(jForm)
    jImageView1: jImageView;
    jsAppBarLayout1: jsAppBarLayout;
    jsCollapsingToolbarLayout1: jsCollapsingToolbarLayout;
    jsCoordinatorLayout1: jsCoordinatorLayout;
    jsFloatingButton1: jsFloatingButton;
    jsRecyclerView1: jsRecyclerView;
    jsToolbar1: jsToolbar;
    procedure AndroidModule7JNIPrompt(Sender: TObject);
    procedure jsFloatingButton1Click(Sender: TObject);
    procedure jsRecyclerView1ItemClick(Sender: TObject; itemPosition: integer;
      itemArrayOfStringCount: integer);


  private
    {private declarations}
  public
    {public declarations}
      ListId:TStringList;

  end;

var
  AndroidModule7: TAndroidModule7;

implementation
  
{$R *.lfm}
  

{ TAndroidModule7 }

procedure TAndroidModule7.AndroidModule7JNIPrompt(Sender: TObject);
var
  aux,nome,cidade,dec:string;
  i:integer;
  ListImoveis:TStringList;
begin
        if AndroidModule8 = nil then
        begin
             gApp.CreateForm(TAndroidModule8, AndroidModule8);
             AndroidModule8.Init(gApp);
       end;
       // jsCoordinatorLayout1.SetFitsSystemWindows(True);
        jsAppBarLayout1.SetFitsSystemWindows(True);

        jsCollapsingToolbarLayout1.SetFitsSystemWindows(True);
        jsCollapsingToolbarLayout1.SetScrollFlag(csfExitUntilCollapsed);
        jsCollapsingToolbarLayout1.SetExpandedTitleColor(colbrWhite);
        jsCollapsingToolbarLayout1.SetCollapsedTitleTextColor(colbrWhite);

        jsCollapsingToolbarLayout1.SetContentScrimColor(colbrDodgerBlue);  //default primary colors in "res\values\style.xml"
        jsToolbar1.SetHeightByDisplayMetricsDensity(60);//need be seted to an absolute value!
        jsToolbar1.SetCollapseMode(cmPin);

        jImageView1.SetFitsSystemWindows(True);
        jImageView1.SetCollapseMode(cmParallax);

        jsRecyclerView1.SetClipToPadding(False);
        jsRecyclerView1.SetAppBarLayoutScrollingViewBehavior();
        //jsRecyclerView1.AddItemContentFormat(cfImage);
        //jsRecyclerView1.AddItemContentFormat(cfText);
        //jsRecyclerView1.AddItemContentFormat(cfText);
        //jsRecyclerView1.AddItemContentFormat(cfRating);
        //jsRecyclerView1.SetItemContentFormat();
        jsRecyclerView1.SetItemContentFormat('IMAGE|TEXT|TEXT|RATING');
        ListImoveis:=TStringList.Create;
        Self.ListId:=TStringList.Create;

        with TUser.Create do
        begin
             for i:= jsRecyclerView1.GetItemCount()-1 downto 0  do
             begin
               jsRecyclerView1.Remove(i);
             end;
             jsRecyclerView1.SetItemContentLayout(AndroidModule8.jPanel1.View,true);
             aux:=Trim(GetImovel('', '','getinfomin'));
             ListImoveis.Clear;
             ListImoveis.Delimiter:= ';';
             ListImoveis.StrictDelimiter:= TRUE;
             ListImoveis.DelimitedText:= aux;
             for i:=0 to ListImoveis.Count -1 do
             begin
                aux:= ListImoveis.Strings[i];
                Self.ListId.Add(SplitStr(aux,'*'));
                nome:=Trim(SplitStr(aux,'*'));
                cidade:= SplitStr(aux,'*');
                dec:=SplitStr(aux,',');
                jsRecyclerView1.Add('house.png@assets|'+nome+'|'+cidade+'|'+dec+'.'+aux);
             end;
             ListImoveis.Free;
        end;
end;

procedure TAndroidModule7.jsFloatingButton1Click(Sender: TObject);
begin
        {if AndroidModule14 = nil then
        begin
            gApp.CreateForm(TAndroidModule14, AndroidModule14);
            AndroidModule14.Init(gApp);
        end
        else
        begin
             AndroidModule14.Show;
        end;}
        if AndroidModule13 = nil then
        begin
            gApp.CreateForm(TAndroidModule13, AndroidModule13);
            AndroidModule13.modo:='checkstatus';
            AndroidModule13.Init(gApp);
        end
        else
        begin
             AndroidModule13.Show;
        end;
end;

procedure TAndroidModule7.jsRecyclerView1ItemClick(Sender: TObject;
  itemPosition: integer; itemArrayOfStringCount: integer);
begin
  //ShowMessage('itemIndex = ' + IntToStr(itemPosition) + ' IdImovel= ' + ListId.Strings[itemPosition] );
  if AndroidModule9 = nil then
  begin
       gApp.CreateForm(TAndroidModule9, AndroidModule9);
       AndroidModule9.id:=self.ListId.Strings[itemPosition];
       AndroidModule9.Init(gApp);
  end
  else
  begin
       AndroidModule9.id:=self.ListId.Strings[itemPosition];
       AndroidModule9.Show;
  end;
end;


end.
