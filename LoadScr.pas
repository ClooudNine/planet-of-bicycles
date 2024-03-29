unit LoadScr;// ������ ������������ ������

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.GIFImg,
  Vcl.StdCtrls, Vcl.ComCtrls;

type
  TLoadScreen = class(TForm)
    LoadTimer: TTimer;
    LoadImage: TImage;
    Text: TLabel;
    ProgressBar1: TProgressBar;
    ProgressBarTimer: TTimer;
    procedure LoadTimerTimer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ProgressBarTimerTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LoadScreen: TLoadScreen;
  i:integer;

implementation

{$R *.dfm}

procedure TLoadScreen.FormActivate(Sender: TObject); //������� GIF-��������
begin
(LoadImage.Picture.Graphic as TGIFImage).Animate := True;//����������� GIF
(LoadImage.Picture.Graphic as TGIFImage).AnimationSpeed := 160;//�������� ��������
DoubleBuffered := True;
LoadScreen.Height := LoadImage.Height;
LoadScreen.Width := LoadImage.Width;
i := 0;//���������� ��� ������ ��������
end;

procedure TLoadScreen.LoadTimerTimer(Sender: TObject);//���������� �������
begin
LoadTimer.Enabled := False;
end;

procedure TLoadScreen.ProgressBarTimerTimer(Sender: TObject);//������ ��������
begin
Inc(i);
ProgressBar1.Position:=ProgressBar1.Position+1;
if i=100 then ProgressBarTimer.Enabled  := False;
end;

end.
