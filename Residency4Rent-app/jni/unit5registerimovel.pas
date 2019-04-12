{Hint: save all files to location: \jni }
unit unit5registerimovel;

{$mode delphi}

interface

uses
  Classes, SysUtils, AndroidWidget, Laz_And_Controls, stextinput, stoolbar,
  sfloatingbutton, Spinner, customdialog,unitcontrol,unit6takephoto;
  
type

  { TAndroidModule5 }

  TAndroidModule5 = class(jForm)
    jCustomDialog1: jCustomDialog;
    jDialogYN1: jDialogYN;
    jEditText1: jEditText;
    jEditText2: jEditText;
    jImageBtn1: jImageBtn;
    jPanel1: jPanel;
    jsFloatingButton1: jsFloatingButton;
    jsFloatingButton2: jsFloatingButton;
    jsFloatingButton3: jsFloatingButton;
    jSpinner1: jSpinner;
    jsTextInput1: jsTextInput;
    jsTextInput2: jsTextInput;
    jsTextInput3: jsTextInput;
    jsTextInput4: jsTextInput;
    jsTextInput5: jsTextInput;
    jsTextInput6: jsTextInput;
    jsToolbar1: jsToolbar;
    jTextView1: jTextView;
    jTextView2: jTextView;
    jTextView3: jTextView;
    procedure AndroidModule5JNIPrompt(Sender: TObject);
    procedure jDialogYN1ClickYN(Sender: TObject; YN: TClickYN);
    procedure jsFloatingButton1Click(Sender: TObject);
    procedure clear();
    procedure jsFloatingButton2Click(Sender: TObject);
    procedure jsFloatingButton3Click(Sender: TObject);

  private
    {private declarations}
  public
    {public declarations}
    idLocador:string;
    latitude: Double;
    longitude: Double;
    typeActivity: string;
    index: string;
  end;

var
  AndroidModule5: TAndroidModule5;

implementation
  
{$R *.lfm}
  

{ TAndroidModule5 }

procedure TAndroidModule5.AndroidModule5JNIPrompt(Sender: TObject);
var
  List:TStringList;
  aux: string;
  aux2: string;
begin
  {Falta capturar as coordenadas para inserir na tabela}
  jsToolbar1.SetFitsSystemWindows(True);
  jsToolbar1.SetTitle('Residency4Rent');
  jsToolbar1.SetTitleTextColor(colbrWhite);
  self.clear();

  if self.typeActivity = 'edit' then
  begin
      jsFloatingButton2.SetImageIdentifier('editlocation');
      jsFloatingButton3.Visible:=true;
      jsFloatingButton3.SetImageIdentifier('addcamera');
      jTextView1.SetText('EDITAR INFORMAÇÕES');
      List:= TStringList.Create;
      with TUser.Create do
      begin
           aux:= Trim(GetImovelById(self.index));
           if aux <> '' then
           begin
               List.Delimiter:= ';';
               List.StrictDelimiter:= TRUE;
               List.DelimitedText:= aux;
               aux2:=List.Strings[6];

               jsTextInput1.Text:= List.Strings[0];
               jsTextInput2.Text:= List.Strings[1];
               jsTextInput3.Text:= List.Strings[4];
               jsTextInput4.Text:= List.Strings[2];
               jsTextInput5.Text:= List.Strings[5];
               jsTextInput6.Text:= List.Strings[3];


               if aux2 = 'Barra do Garças - MT' then jSpinner1.SetSelectedIndex(1);
               if aux2 = 'Aragarças - GO' then jSpinner1.SetSelectedIndex(0);
               if aux2 = 'Pontal do Araguai - MT' then jSpinner1.SetSelectedIndex(2);


           end;
           list.Free;
      end;

  end;

  if self.typeActivity = 'register' then
  begin
      jTextView1.SetText('CADASTRO DE IMÓVEIS');
      jsFloatingButton2.SetImageIdentifier('addlocation');
      jsFloatingButton3.Visible:=false;
  end;


end;

procedure TAndroidModule5.jDialogYN1ClickYN(Sender: TObject; YN: TClickYN);
begin
  if YN = ClickYes then
  begin
     if AndroidModule6 = nil then
     begin
          gApp.CreateForm(TAndroidModule6, AndroidModule6);
          AndroidModule6.Init(gApp);
     end
     else
     begin
          AndroidModule6.Show;
     end;
  end;
  if YN = ClickNo then
  begin
      AndroidModule5.Close;
  end;

end;

//procedimento para da um clear nos editText
procedure TAndroidModule5.clear();
begin
     jsTextInput1.Text:='';
     jsTextInput2.Text:='';
     jsTextInput3.Text:='';
     jsTextInput4.Text:='';
     jsTextInput5.Text:='';
     jsTextInput6.Text:='';
end;

procedure TAndroidModule5.jsFloatingButton2Click(Sender: TObject);
begin
     //pegar as coordenadas atuais ou edita-las
  if self.typeActivity = 'register' then
  begin
     jCustomDialog1.Show('Editar Coordenadas');
  end
  else
  begin
       jEditText1.Text:='-15.878887';
       jEditText2.Text:='-52.313171';
       jCustomDialog1.Show('Editar Coordenadas');
  end;
end;

procedure TAndroidModule5.jsFloatingButton3Click(Sender: TObject);
begin
     if AndroidModule6 = nil then
     begin
          gApp.CreateForm(TAndroidModule6, AndroidModule6);
          AndroidModule6.aux:=self.index;
          AndroidModule6.Init(gApp);
     end
     else
     begin
          AndroidModule6.aux:=self.index;
          AndroidModule6.Show;
     end;
end;


procedure TAndroidModule5.jsFloatingButton1Click(Sender: TObject);
var
  aux:string;
  nome,qtdAp,valor,bairro,rua,info,cidade:string;
  msg: string;
  title: string;

begin
  aux:='';
  self.latitude:=0.0;
  self.longitude:=0.0;

  nome:= self.jsTextInput1.Text;
  qtdAp:= self.jsTextInput2.Text;
  bairro:= self.jsTextInput3.Text;
  valor:= self.jsTextInput4.Text;
  rua:= Self.jsTextInput5.Text;
  info:= self.jsTextInput6.Text;
  cidade:= self.jSpinner1.GetSelectedItem();
  if self.typeActivity = 'register' then
  begin
       With TUser.Create do
       begin
            aux:=RegisterImovel(self.idLocador,nome,qtdAp,valor,info,bairro,rua,cidade,latitude.ToString,longitude.ToString);
            if aux <> '' then
            begin
                 title := 'Imovel Cadastrado com sucesso!';
                 msg := 'Deseja adicionar fotos ao residencial?';
                 jDialogYN1.Show(title,msg,'SIM','MAIS TARDE');

            end;
       end;
  end;
  if self.typeActivity = 'edit' then
  begin
       With TUser.Create do
       begin
            aux:=Trim(UpdateImovel(self.index,nome,qtdAp,valor,info,bairro,rua,cidade,latitude.ToString,longitude.ToString));
            if aux <> '' then
            begin
                ShowMessage('Atualização feita com sucesso!');
                AndroidModule5.Close;
            end
            else
            begin
                 ShowMessage('Falha ao tentar atualizar!');
            end;
       end;
  end;


end;

end.
