unit unit11copycadastro;
//

{$mode delphi}

interface

uses
  Classes, SysUtils, AndroidWidget, Laz_And_Controls, Spinner, sfloatingbutton,
  stoolbar, unitcontrol;
  
type

  { TAndroidModule11 }

  TAndroidModule11 = class(jForm)
    jEditText1: jEditText;
    jEditText10: jEditText;
    jEditText2: jEditText;
    jEditText3: jEditText;
    jEditText4: jEditText;
    jEditText5: jEditText;
    jEditText6: jEditText;
    jEditText7: jEditText;
    jEditText8: jEditText;
    jEditText9: jEditText;
    jsFloatingButton1: jsFloatingButton;
    jSpinner1: jSpinner;
    jsToolbar1: jsToolbar;
    jTextView1: jTextView;
    jPanel1: jPanel;
    procedure AndroidModule11JNIPrompt(Sender: TObject);
    procedure jsFloatingButton1Click(Sender: TObject);

  private
    {private declarations}
  public
    {public declarations}
    Modo,oldSenha,oldEmail,id:string;
  end;

var
  AndroidModule11: TAndroidModule11;

implementation
  
{$R *.lfm}


{ TAndroidModule11 }

procedure TAndroidModule11.jsFloatingButton1Click(Sender: TObject);
var
  email,senha,nome,bairro,numero,rua,cidade,uf,cpf,telefone1,telefone2:string;
  aux:string;
begin
  if Self.Modo = 'cadastro' then
  begin
    with TUser.Create do
    begin
      email:= self.jEditText1.Text;
      senha:= self.jEditText2.Text;
      nome:= self.jEditText3.Text;
      bairro:= self.jEditText4.Text;
      numero:= self.jEditText5.Text;
      rua:= self.jEditText6.Text;
      cidade:= self.jEditText7.Text;
      uf:= self.jSpinner1.GetSelectedItem();
      cpf:= self.jEditText8.Text;
      telefone1:= self.jEditText9.Text;
      telefone2:= self.jEditText10.Text;
      aux := '';
      aux := Trim(RegisterUsers(email,senha,nome,bairro,numero,rua,cidade,uf,cpf,telefone1,telefone2,'locatario'));


      if aux = 'existe' then
      begin
        ShowMessage('usuario ou senha ja existente!');
        jEditText1.Text:='';
        jEditText2.Text:='';
      end;
      if aux = 'sucesso' then
      begin
           ShowMessage('cadastro realizado com sucesso!');
      end;
      if aux = '' then
      begin
           ShowMessage('Houve um erro, tente novamente!');
      end;
    end;
  end;

  if self.Modo = 'alterar' then
  begin
       With TUser.Create do
       begin
            email:= self.jEditText1.Text;
            senha:= self.jEditText2.Text;
            nome:= self.jEditText3.Text;
            bairro:= self.jEditText4.Text;
            numero:= self.jEditText5.Text;
            rua:= self.jEditText6.Text;
            cidade:= self.jEditText7.Text;
            uf:= self.jSpinner1.GetSelectedItem();
            cpf:= self.jEditText8.Text;
            telefone1:= self.jEditText9.Text;
            telefone2:= self.jEditText10.Text;
            aux:=Trim(UpdateUser('locatario','locador',self.oldEmail,self.oldSenha,email,senha,nome,bairro,numero,rua,cidade,uf,cpf,telefone1,telefone2));

            if aux = 'sucesso' then
            begin
                 ShowMessage('Atualização de Dados feito com sucesso!');
                 AndroidModule11.Close;
            end;

            if aux = 'erro' then ShowMessage('Houve algum erro, tente novamente!');
       end;
  end;
end;


procedure TAndroidModule11.AndroidModule11JNIPrompt(Sender: TObject);
var
  aux:string;
  List:TStringList;
begin

   if self.Modo = 'cadastro' then
  begin
      self.jTextView1.Text:='CADASTRO DE LOCÁTARIO';
      self.jEditText1.Text:='';
      self.jEditText2.Text:='';
      self.jEditText3.Text:='';
      self.jEditText4.Text:='';
      self.jEditText5.Text:='';
      self.jEditText6.Text:='';
      self.jEditText7.Text:='';
      self.jEditText8.Text:='';
      self.jEditText9.Text:='';
      self.jEditText10.Text:='';
  end;
  if self.Modo = 'alterar' then
  begin
      jTextView1.Text:='ALTERAR CADASTRO';
      List:= TStringList.Create;
      With TUser.Create do
      begin
           //ShowMessage('id: '+self.id);
           aux:=Trim(GetUser('locatario',self.id));
           List.Clear;
           List.Delimiter:= ';';
           List.StrictDelimiter:= TRUE;
           List.DelimitedText:= aux;

           jEditText1.Text:=List.Strings[0];
           jEditText2.Text:=List.Strings[1];
           jEditText3.Text:=List.Strings[2];
           jEditText4.Text:=List.Strings[4];
           jEditText5.Text:=List.Strings[5];
           jEditText6.Text:=List.Strings[6];
           jEditText7.Text:=List.Strings[7];
           jEditText8.Text:=List.Strings[3];
           jEditText9.Text:=List.Strings[9];
           jEditText10.Text:=List.Strings[10];
           if list.Strings[8] = 'GO' then jSpinner1.SetSelectedIndex(0);
           if list.Strings[8] = 'MS' then jSpinner1.SetSelectedIndex(1);
           if list.Strings[8] = 'MT' then jSpinner1.SetSelectedIndex(2);
           if list.Strings[8] = 'MG' then jSpinner1.SetSelectedIndex(3);
           if list.Strings[8] = 'SP' then jSpinner1.SetSelectedIndex(4);
           if list.Strings[8] = 'RJ' then jSpinner1.SetSelectedIndex(5);

           List.Free;
      end;
  end;



end;

end.
