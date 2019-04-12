{Hint: save all files to location: \jni }
unit unit16viewavaliacoes;

{$mode delphi}

interface

uses
  Classes, SysUtils, AndroidWidget, stoolbar, scoordinatorlayout, srecyclerview,unitcontrol,unit8panelview;
  
type

  { TAndroidModule16 }

  TAndroidModule16 = class(jForm)
    jsCoordinatorLayout1: jsCoordinatorLayout;
    jsRecyclerView1: jsRecyclerView;
    jsToolbar1: jsToolbar;
    procedure AndroidModule16JNIPrompt(Sender: TObject);
    procedure AddCardView();
  private
    {private declarations}
  public
    {public declarations}
    idImovel:string;
  end;

var
  AndroidModule16: TAndroidModule16;

implementation
  
{$R *.lfm}
  

{ TAndroidModule16 }

procedure TAndroidModule16.AndroidModule16JNIPrompt(Sender: TObject);
begin
     jsToolbar1.SetTitle('Avaliações');
     AddCardView();
end;

procedure TAndroidModule16.AddCardView();
var
   aux,nome,comentario,dec,aux2:string;
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
          aux:=Trim(GetAvaliacoes(self.idImovel));
     end;


        listCampos:=TStringList.Create;
        listCampos.Clear;
        listCampos.Delimiter:='*';
        listCampos.StrictDelimiter:=True;
        ListCampos.DelimitedText:=aux;

        for i:= jsRecyclerView1.GetItemCount()-1 downto 0  do
        begin
               jsRecyclerView1.Remove(i);
        end;

        jsRecyclerView1.SetClipToPadding(False);
        jsRecyclerView1.SetItemContentFormat('IMAGE|RATING|TEXT|TEXT');
        jsRecyclerView1.SetItemContentLayout(AndroidModule8.jPanel3.View);

        dec:='';
        for i:=0 to ListCampos.Count -1 do
        begin
             aux:=ListCampos.Strings[i];
             SplitStr(aux,';');//id avaliacoes
             nome:=SplitStr(aux,';');
             comentario:=SplitStr(aux,';');
             aux2:= SplitStr(aux,';')
             dec:=SplitStr(aux2,',');
             if aux = 'M' then  jsRecyclerView1.Add('user.png@assets|'+dec+'.'+aux2+'|'+nome+'|'+comentario);
             if aux = 'F' then  jsRecyclerView1.Add('userf.png@assets|'+dec+'.'+aux2+'|'+nome+'|'+comentario);

        end;
        ListCampos.Free;
end;


end.
