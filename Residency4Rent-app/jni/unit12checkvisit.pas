{Hint: save all files to location: \jni }
unit unit12checkvisit;

{$mode delphi}

interface

uses
  Classes, SysUtils, AndroidWidget, stoolbar, Laz_And_Controls, stextinput,
  Spinner, datepickerdialog, timepickerdialog, sfloatingbutton, textfilemanager,
  customdialog, unitcontrol;
  
type

  { TAndroidModule12 }

  TAndroidModule12 = class(jForm)
    jButton1: jButton;
    jCustomDialog1: jCustomDialog;
    jDatePickerDialog1: jDatePickerDialog;
    jDialogYN1: jDialogYN;
    jEditText1: jEditText;
    jEditText2: jEditText;
    jEditText3: jEditText;
    jImageBtn1: jImageBtn;
    jPanel1: jPanel;
    jsFloatingButton1: jsFloatingButton;
    jsFloatingButton2: jsFloatingButton;
    jSpinner1: jSpinner;
    jsToolbar1: jsToolbar;
    jTextView1: jTextView;
    jTextView2: jTextView;
    jTextView3: jTextView;
    jTextView4: jTextView;
    jTextView5: jTextView;
    jTextView6: jTextView;
    jTimePickerDialog1: jTimePickerDialog;
    procedure AndroidModule12JNIPrompt(Sender: TObject);
    procedure jButton1Click(Sender: TObject);
    procedure jDatePickerDialog1DatePicker(Sender: TObject; year: integer;
      monthOfYear: integer; dayOfMonth: integer);
    procedure jDialogYN1ClickYN(Sender: TObject; YN: TClickYN);
    procedure jEditText1Click(Sender: TObject);
    procedure jEditText2Click(Sender: TObject);
    procedure jsFloatingButton1Click(Sender: TObject);
    procedure jsFloatingButton2Click(Sender: TObject);
    procedure jTimePickerDialog1TimePicker(Sender: TObject; hourOfDay: integer;
      minute: integer);
  private
    {private declarations}
  public
    {public declarations}
    idImovel,idLocatario,textDateDB,textHoursDB,idAluguel:string;
  end;

var
  AndroidModule12: TAndroidModule12;

implementation
  
{$R *.lfm}
  

{ TAndroidModule12 }

procedure TAndroidModule12.AndroidModule12JNIPrompt(Sender: TObject);
var
  i:Integer;
  aux:string;
begin
     jEditText1.Text:='';
     jEditText2.Text:='';
     with TUser.Create do
     begin
          aux:=Trim(GetDateTime('existe',self.idLocatario,self.idImovel));
          if aux <> '' then
          begin
                ShowMessage('Você ja possui uma data agendada!');
                jEditText1.Text:=SplitStr(aux,';');
                jEditText2.Text:=SplitStr(aux,';');
                self.idAluguel:=aux;
          end;
     end;
end;

procedure TAndroidModule12.jButton1Click(Sender: TObject);
var
  aux:string;
  count,i:integer;
begin
     with TUser.Create do
     begin
          aux:=Trim(GetQtdAp(self.idImovel));
          count:=aux.ToInteger;
          for i:=1 to count do
          begin
               jSpinner1.Add(IntToStr(i));
          end;
          jSpinner1.SetSelectedIndex(0);

          jCustomDialog1.Show('Adicionar Informações');
     end;
end;

procedure TAndroidModule12.jDatePickerDialog1DatePicker(Sender: TObject;
  year: integer; monthOfYear: integer; dayOfMonth: integer);
var
  text,day,month:string;
begin
     day:=IntToStr(dayOfMonth);
     month:= IntToStr(monthOfYear);

     if dayOfMonth < 10 then day:='0'+IntToStr(dayOfMonth);
     if monthOfYear < 10 then month:='0'+IntToStr(monthOfYear);

     text:= day +'/'+ month +'/'+ IntToStr(year);
     self.textDateDB:=IntToStr(year)+'-'+month+'-'+day;
     jEditText1.Text:=text;
end;

procedure TAndroidModule12.jDialogYN1ClickYN(Sender: TObject; YN: TClickYN);
begin
     if YN = ClickYes then jCustomDialog1.Close();
end;

procedure TAndroidModule12.jEditText1Click(Sender: TObject);
begin
     jDatePickerDialog1.Show();
end;


procedure TAndroidModule12.jEditText2Click(Sender: TObject);
begin
    jTimePickerDialog1.Show();
end;

procedure TAndroidModule12.jsFloatingButton1Click(Sender: TObject);
var
  aux:string;
begin
     with TUser.Create do
     begin
          if ((jEditText1.Text <> '') and (jEditText2.Text <> '')) then aux:=ResgisterDataVisit(self.idLocatario,self.idImovel,self.textDateDB,self.textHoursDB,'1');
          if aux <> '' then ShowMessage('Visita cadastrada com sucesso!');
     end;
end;

procedure TAndroidModule12.jsFloatingButton2Click(Sender: TObject);
var
  aux:string;
begin
    if jEditText3.Text <> '' then
    begin
         With TUser.Create do
         begin

              aux:=Trim(RequestContract(self.idAluguel,'3',Self.jEditText3.Text,Self.jSpinner1.GetSelectedItem(),self.idLocatario));
              if aux <> '' then
              begin
                   jDialogYN1.Show('Sucesso!','O contrato foi solicitado com sucesso! Você pode acompanhar o status na tela de imóveis.','OK',' ');
              end;
         end;
    end;
end;


procedure TAndroidModule12.jTimePickerDialog1TimePicker(Sender: TObject;
  hourOfDay: integer; minute: integer);
var
  text,hour,min:string;
begin
     hour:=IntToStr(hourOfDay);
     min:=IntToStr(minute);
     {Talvez ajustar as string de saida}
     if hourOfDay < 10 then hour:='0'+IntToStr(hourOfDay);
     if minute < 10 then min:='0'+IntToStr(minute);
     text:= hour +':'+ min;
     self.textHoursDB:=text;
     jEditText2.Text:=text;
end;

end.
