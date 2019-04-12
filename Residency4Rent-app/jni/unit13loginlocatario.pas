{Hint: save all files to location: \jni }
unit unit13loginlocatario;

{$mode delphi}

interface

uses
  Classes, SysUtils, AndroidWidget, stoolbar, Laz_And_Controls,unitcontrol,unit12checkvisit,unit14viewinteresse,
  unit11copycadastro;
  
type

  { TAndroidModule13 }

  TAndroidModule13 = class(jForm)
    jButton1: jButton;
    jEditText1: jEditText;
    jEditText2: jEditText;
    jImageBtn1: jImageBtn;
    jPanel1: jPanel;
    jsToolbar1: jsToolbar;
    jTextView1: jTextView;
    jTextView2: jTextView;
    jTextView3: jTextView;
    jTextView4: jTextView;
    jTextView5: jTextView;
    procedure AndroidModule13JNIPrompt(Sender: TObject);
    procedure jButton1Click(Sender: TObject);
    procedure jTextView4Click(Sender: TObject);
  private
    {private declarations}
  public
    {public declarations}
    idImovel,modo,idLocatario:string;
  end;

var
  AndroidModule13: TAndroidModule13;

implementation
  
{$R *.lfm}
  

{ TAndroidModule13 }

procedure TAndroidModule13.jButton1Click(Sender: TObject);
var
  aux,aux2:string;
begin
     with TUser.Create do
     begin
       aux:= '';
       try
          aux:=Trim(LoginSucess(self.jEditText1.Text,self.jEditText2.Text,'locatario','locador'));
          aux2:=SplitStr(aux,';');
       except
       // will only be executed in case of an exception
          on E: Exception do
          ShowMessage( 'Error: '+ E.ClassName + #13#10 + E.Message );
       end;
       if aux2 <> '' then
       begin
         //ShowMessage('login feito com sucesso! ->'+aux2 );
         if aux2 = 'locador' then
         begin
              {fazer pegar o novo id dentro da tabela locatario}
              aux:= Trim(RegisterAuto(self.jEditText1.Text,self.jEditText2.Text,'locador','locatario'));
         end;

         if self.modo = 'checkstatus' then
         begin
              if AndroidModule14 = nil then
              begin
                 gApp.CreateForm(TAndroidModule14, AndroidModule14);
                 AndroidModule14.idLocatario:=aux;
                 AndroidModule14.Init(gApp);
              end
              else
              begin
                 AndroidModule14.idLocatario:=aux;
                 AndroidModule14.Show;
              end;
         end;
         if self.modo = 'visit' then
         begin
              if AndroidModule12 = nil then
              begin
                 gApp.CreateForm(TAndroidModule12, AndroidModule12);
                 AndroidModule12.idImovel:=self.idImovel;
                 AndroidModule12.idLocatario:=aux;
                 AndroidModule12.Init(gApp);
              end
              else
              begin
                 AndroidModule12.idImovel:=self.idImovel;
                 AndroidModule12.idLocatario:=aux;
                 AndroidModule12.Show;
              end;
         end;

       end
       else
       begin
         ShowMessage('Usuario ou senha incorreto!');
         jEditText2.Text:='';
         jEditText1.Text:='';
       end;
     end;
end;

procedure TAndroidModule13.jTextView4Click(Sender: TObject);
var
   oldSenha,oldEmail,aux,aux2:string;
begin
     if ((jEditText1.Text = '') or (jEditText2.Text = '')) then
     begin
          ShowMessage('Informe os dados de login!');
     end
     else
     begin
          oldEmail:=jEditText1.Text;
          oldSenha:=jEditText2.Text;

          with TUser.Create do
          begin
               aux:= '';
               try
                  aux:=Trim(LoginSucess(self.jEditText1.Text,self.jEditText2.Text,'locatario','locador'));
                  aux2:=SplitStr(aux,';');
               except
               // will only be executed in case of an exception
               on E: Exception do
               ShowMessage( 'Error: '+ E.ClassName + #13#10 + E.Message );
               end;

               if aux2 <> '' then
               begin

                    if AndroidModule11 = nil then
                    begin
                         gApp.CreateForm(TAndroidModule11, AndroidModule11);
                         AndroidModule11.oldEmail:=oldEmail;
                         AndroidModule11.oldSenha:=oldSenha;
                         AndroidModule11.Modo:='alterar';
                         AndroidModule11.id:=aux;
                         AndroidModule11.Init(gApp);
                    end
                    else
                    begin
                         AndroidModule11.oldEmail:=oldEmail;
                         AndroidModule11.oldSenha:=oldSenha;
                         AndroidModule11.Modo:='alterar';
                         AndroidModule11.id:=aux;
                         AndroidModule11.Show;
                    end;
               end;
          end;
     end;
end;

procedure TAndroidModule13.AndroidModule13JNIPrompt(Sender: TObject);
begin
    jEditText1.Text:='';
    jEditText2.Text:='';
end;

end.
