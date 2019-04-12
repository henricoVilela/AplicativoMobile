{Hint: save all files to location: \jni }
unit unit8panelview;

{$mode delphi}

interface

uses
  Classes, SysUtils, AndroidWidget, Laz_And_Controls, ratingbar;
  
type

  { TAndroidModule8 }

  TAndroidModule8 = class(jForm)
    jImageView1: jImageView;
    jImageView2: jImageView;
    jImageView3: jImageView;
    jPanel1: jPanel;
    jPanel2: jPanel;
    jPanel3: jPanel;
    jRatingBar1: jRatingBar;
    jRatingBar2: jRatingBar;
    jTextView1: jTextView;
    jTextView2: jTextView;
    jTextView3: jTextView;
    jTextView4: jTextView;
    jTextView6: jTextView;
    jTextView5: jTextView;
    procedure AndroidModule8JNIPrompt(Sender: TObject);
  private
    {private declarations}
  public
    {public declarations}
  end;

var
  AndroidModule8: TAndroidModule8;

implementation
  
{$R *.lfm}
  

{ TAndroidModule8 }

procedure TAndroidModule8.AndroidModule8JNIPrompt(Sender: TObject);
begin
     //jRatingBar1.Enabled:=false;

end;

end.
