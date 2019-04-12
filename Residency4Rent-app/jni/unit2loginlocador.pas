{Hint: save all files to location: C:\Android\workspace\Residency4Rent\jni }
unit unit2loginlocador;

{$mode delphi}

interface

uses
  Classes, SysUtils, AndroidWidget, Laz_And_Controls, stoolbar,
  unit3cadastro, unitcontrol, unit4listimovellocador;
  
type

  { TAndroidModule2 }

  TAndroidModule2 = class(jForm)
    jButton1: jButton;
    jButton2: jButton;
    jDialogYN1: jDialogYN;
    jEditText1: jEditText;
    jEditText2: jEditText;
    jImageBtn1: jImageBtn;
    jImageBtn2: jImageBtn;
    jImageBtn3: jImageBtn;
    jPanel1: jPanel;
    jsToolbar1: jsToolbar;
    jTextView1: jTextView;
    jTextView2: jTextView;
    jTextView3: jTextView;
    jTextView4: jTextView;
    jTextView5: jTextView;
    procedure AndroidModule2JNIPrompt(Sender: TObject);
    procedure jButton1Click(Sender: TObject);
    procedure jButton2Click(Sender: TObject);
    procedure jDialogYN1ClickYN(Sender: TObject; YN: TClickYN);
    procedure jTextView4Click(Sender: TObject);
  private
    {private declarations}
  public
    {public declarations}
    id:string;
  end;

var
  AndroidModule2: TAndroidModule2;

implementation
  
{$R *.lfm}
  

{ TAndroidModule2 }

procedure TAndroidModule2.jButton2Click(Sender: TObject);
begin
   if AndroidModule3 = nil then
   begin
        gApp.CreateForm(TAndroidModule3, AndroidModule3);
        AndroidModule3.modo:='cadastro';
        AndroidModule3.Init(gApp);
   end
   else
   begin
        AndroidModule3.modo:='cadastro';
        AndroidModule3.Show;
   end;

end;


procedure TAndroidModule2.AndroidModule2JNIPrompt(Sender: TObject);
begin
     jEditText1.Text:='';
    jEditText2.Text:='';
end;


procedure TAndroidModule2.jDialogYN1ClickYN(Sender: TObject; YN: TClickYN);
var
  aux:string;
begin
  with TUser.Create do
   begin
         aux:='';
         if YN = ClickYes then
         begin
              aux := Trim(RegisterAuto(self.jEditText1.Text,self.jEditText2.Text,'locatario','locador'));
              if aux = '' then
              begin
                   ShowMessage('Erro! Tente novamente.');
              end
              else
              begin
                    ShowMessage('Cadastro feito com sucesso!');
              end;
         end;

         if YN = ClickNo then
         begin
              ShowMessage('senha ou usuario invalido!');
              jEditText2.Text:='';
              jEditText1.Text:='';
         end;

   end;

end;

procedure TAndroidModule2.jButton1Click(Sender: TObject);
var
  aux,aux2: string;
  msg: string;
  title: string;
begin
  with TUser.Create do
   begin
       aux:= '';
       try
          aux:= Trim(LoginSucess(self.jEditText1.Text,self.jEditText2.Text,'locador','locatario'));
          aux2:=SplitStr(aux,';');
       except
       // will only be executed in case of an exception
          on E: Exception do
          ShowMessage( 'Error: '+ E.ClassName + #13#10 + E.Message );
       end;
       if aux2 = 'locatario' then
       begin
             title := 'Voce é um locatario!';
             msg := 'Deseja que seu cadastro para locador seja feito automaticamente com os dados ja cadastrado?';
             jDialogYN1.Show(title,msg,'SIM','NAO');
       end;

       if aux2 = 'locador' then
       begin
            ShowMessage('login feito com sucesso!');
            if AndroidModule4 = nil then
            begin
                 gApp.CreateForm(TAndroidModule4, AndroidModule4);
                 AndroidModule4.Email:=self.jEditText1.Text;
                 AndroidModule4.Pass:=self.jEditText2.Text;
                 AndroidModule4.Init(gApp);
            end
            else
            begin
                 AndroidModule4.Email:=self.jEditText1.Text;
                 AndroidModule4.Pass:=self.jEditText2.Text;
                 AndroidModule4.Show;
            end;
       end;

       if aux = '' then
       begin
             ShowMessage('senha ou usuario invalido!');
             jEditText1.Text:='';
             jEditText2.Text:='';
       end;
   end;

end;

procedure TAndroidModule2.jTextView4Click(Sender: TObject);
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
                  aux:=Trim(LoginSucess(self.jEditText1.Text,self.jEditText2.Text,'locador','locatario'));
                  aux2:=SplitStr(aux,';');
               except
               // will only be executed in case of an exception
               on E: Exception do
               ShowMessage( 'Error: '+ E.ClassName + #13#10 + E.Message );
               end;

               if aux2 <> '' then
               begin

                    if AndroidModule3 = nil then
                    begin
                         gApp.CreateForm(TAndroidModule3, AndroidModule3);
                         AndroidModule3.oldEmail:=oldEmail;
                         AndroidModule3.oldSenha:=oldSenha;
                         AndroidModule3.Modo:='alterar';
                         AndroidModule3.id:=aux;
                         AndroidModule3.Init(gApp);
                    end
                    else
                    begin
                         AndroidModule3.oldEmail:=oldEmail;
                         AndroidModule3.oldSenha:=oldSenha;
                         AndroidModule3.Modo:='alterar';
                         AndroidModule3.id:=aux;
                         AndroidModule3.Show;
                    end;
               end;
          end;
     end;
end;

end.
