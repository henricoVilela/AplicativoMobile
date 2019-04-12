{Hint: save all files to location: \jni }
unit unit10teste;

{$mode delphi}

interface

uses
  Classes, SysUtils, AndroidWidget, viewflipper;
  
type

  { TAndroidModule10 }

  TAndroidModule10 = class(jForm)
    jViewFlipper1: jViewFlipper;
    procedure AndroidModule10JNIPrompt(Sender: TObject);
  private
    {private declarations}
  public
    {public declarations}
  end;

var
  AndroidModule10: TAndroidModule10;

implementation
  
{$R *.lfm}
  

{ TAndroidModule10 }

procedure TAndroidModule10.AndroidModule10JNIPrompt(Sender: TObject);
begin
  jViewFlipper1.AddView(self.GetEnvironmentDirectoryPath(dirDownloads)+'/temp/'+List.Strings[i],scaleCenterInside);
end;

end.
