unit Main; //������ �������� ����

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.GIFImg, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, Vcl.MPlayer, Vcl.OleCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.Menus, ShellAPI, IOUtils;

type
  TMainForm = class(TForm)
    MainFormbg: TImage;
    Title: TLabel;
    TitleColor: TTimer;
    ButtonDevice: TImage;
    Volume: TImage;
    Musicbg: TMediaPlayer;
    ExitButton: TImage;
    ButtonSelection: TImage;
    TrickButton: TImage;
    RouteButton: TImage;
    TestsButton: TImage;
    MusicTimer: TTimer;
    MusicList: TListBox;
    WelcomeLabel: TLabel;
    Score: TLabel;
    GameButton: TImage;
    MainFormMenu: TMainMenu;
    N1: TMenuItem;
    TestsMenu: TMenuItem;
    DeviceMenu: TMenuItem;
    TypesMenu: TMenuItem;
    TricksMenu: TMenuItem;
    RoutesMenu: TMenuItem;
    PicturesGamesMenu: TMenuItem;
    N8: TMenuItem;
    Help: TMenuItem;
    AboutProg: TMenuItem;
    ExitAccount: TMenuItem;
    ResetProgress: TMenuItem;
    MusicSwap: TLabel;
    NextMusic: TImage;
    PrevMusic: TImage;
    procedure TitleColorTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure VolumeClick(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure ButtonDeviceClick(Sender: TObject);
    procedure MusicTimerTimer(Sender: TObject);
    procedure ButtonSelectionClick(Sender: TObject);
    procedure TrickButtonClick(Sender: TObject);
    procedure RouteButtonClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure TestsButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GameButtonClick(Sender: TObject);
    procedure DeviceMenuClick(Sender: TObject);
    procedure TypesMenuClick(Sender: TObject);
    procedure TricksMenuClick(Sender: TObject);
    procedure RoutesMenuClick(Sender: TObject);
    procedure TestsMenuClick(Sender: TObject);
    procedure PicturesGamesMenuClick(Sender: TObject);
    procedure ExitAccountClick(Sender: TObject);
    procedure HelpClick(Sender: TObject);
    procedure AboutProgClick(Sender: TObject);
    procedure ResetProgressClick(Sender: TObject);
    procedure NextMusicClick(Sender: TObject);
    procedure PrevMusicClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    var
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TForm;
  i, music_index: integer;
  exit_reason: boolean;

implementation

{$R *.dfm}

uses BicycleDevice, BicyclesTypes, BicyclesTricks, HrodnaRoutes,
  RegistrationForm, Tests, Game, AboutProgram;

procedure TMainForm.ButtonDeviceClick(Sender: TObject); // ������ ��� ����������� ������� "���������� ����������"
begin
Device.ShowModal;
end;

procedure TMainForm.FormActivate(Sender: TObject); // ����������� ������ ��������������� ������������
begin
WelcomeLabel.Caption :='�� �������������� ��� ' + Reg.VeloLandUsers.FieldByName('UserLogin').AsString + '!';
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction); // ������� ��������� ���������� ��� �������� �������� ����
begin
 if exit_reason = True then
  begin
    exit_reason := False;
    exit
  end
 else
  Application.Terminate;
end;

procedure TMainForm.FormCreate(Sender: TObject); // �������� ��������, ������, ��������� ������������ ��������� ����������
begin
  Application.Title := '������� �����������';
  MainForm.WindowState := wsMaximized;
  TitleColor.Enabled := True;
  MusicList.Items.Add('resources/music/8-Bit Misfits - Get Lucky.mp3');
  MusicList.Items.Add('resources/music/Similar But Differet - Blinding Lights.mp3');
  MusicList.Items.Add('resources/music/Dynamite - Hobismorning.mp3');
  MusicList.Items.Add('resources/music/8-Bit Misfits - Shake It Off.mp3');
  MusicList.Items.Add('resources/music/8-Bit Misfits - Watermelon Sugar.mp3');
  Musicbg.FileName := MusicList.Items[0];
  music_index := 0;
  Musicbg.Open;
  Musicbg.Play;
  ButtonDevice.Picture.LoadFromFile('resources\buttons\button_device.png');
  ButtonSelection.Picture.LoadFromFile('resources\buttons\button_selection.png');
  TrickButton.Picture.LoadFromFile('resources\buttons\button_trick.png');
  RouteButton.Picture.LoadFromFile('resources\buttons\route_button.png');
  Volume.Picture.LoadFromFile('resources\buttons\volume_on.png');
  ExitButton.Picture.LoadFromFile('resources\buttons\exit.png');
  TestsButton.Picture.LoadFromFile('resources\buttons\bicycletest_button.png');
  GameButton.Picture.LoadFromFile('resources\buttons\game_button.png');
  WelcomeLabel.Font.Size := 23;
  Score.Font.Size := 16;
  WelcomeLabel.Font.Name := 'Minecraft Rus Regular';
  Score.Font.Name := 'Minecraft Rus Regular';
  MusicSwap.Font.Name := 'Minecraft Rus Regular';
  MusicSwap.Font.Size := 20;
  NextMusic.Picture.LoadFromFile('resources/buttons/nextmusic.png');
  NextMusic.AutoSize := True;
  PrevMusic.Picture.LoadFromFile('resources/buttons/prevmusic.png');
  PrevMusic.AutoSize := True;
end;

procedure TMainForm.FormShow(Sender: TObject); // ���������� ���� ������������
begin
Score.Caption := '������� ����:' + #13#10 + Reg.VeloLandUsers.FieldByName('UserScore').AsString;
end;

procedure TMainForm.GameButtonClick(Sender: TObject); // ������ ��� �������� �� ���� "������ �������� � ������������"
begin
if Reg.VeloLandUsers.FieldByName('UserScore').AsInteger < 2700 then
  ShowMessage('������������ ����� ��� �������� ����! �������� ������� 2700 �����!')
else
  begin
    PicturesGame.Show;
    MainForm.Hide;
  end;
end;

procedure TMainForm.MusicTimerTimer(Sender: TObject); // �������� ����������� �� ������ � ����������� ������� ����������
begin
if Musicbg.Mode = mpStopped then
        begin
        if music_index = MusicList.Count-1 then
            music_index := -1;
        Musicbg.FileName := MusicList.Items[music_index+1];
        music_index := music_index + 1;
        Musicbg.Open;
        Musicbg.Play;
       end;
MusicSwap.Caption := '������ ������: ' + StringReplace(Copy(MusicList.Items[music_index], 17), '.mp3', '', [rfReplaceAll, rfIgnoreCase]);
end;

procedure TMainForm.AboutProgClick(Sender: TObject); // ����������� ���� "� ���������"
begin
AProgramm.ShowModal;
end;

procedure TMainForm.ResetProgressClick(Sender: TObject); // �������� �������� ������������
var buttonSelected: integer;
begin
buttonSelected := MessageDlg('�� �������, ��� ������ �������� ��������? ��� ����� ����� ����� ��������� � �������',mtConfirmation, mbOKCancel, 0);
if buttonSelected = mrOK then
  begin
    exit_reason := True;
    Reg.VeloLandUsers.Edit;
    Reg.VeloLandUsers.FieldByName('UserScore').AsInteger := 0;
    Reg.VeloLandUsers.FieldByName('UserDeviceTestScore').AsInteger := 0;
    Reg.VeloLandUsers.FieldByName('UserPDDTestScore').AsInteger := 0;
    Reg.VeloLandUsers.FieldByName('UserTypesTestScore').AsInteger := 0;
    Reg.VeloLandUsers.FieldByName('UserGameScore').AsInteger := 0;
    Reg.VeloLandUsers.Post;
    MainForm.Close;
  end;
end;

procedure TMainForm.ExitAccountClick(Sender: TObject); // ����� �� ��������
var buttonSelected: integer;
begin
buttonSelected := MessageDlg('�� �������, ��� ������ ����� �� ��������?',mtConfirmation, mbOKCancel, 0);
if buttonSelected = mrOK then
  begin
    exit_reason := True;
    MainForm.Close;
  end
end;

procedure TMainForm.TestsMenuClick(Sender: TObject); // ����������� ������� "�����"
begin
Test.Show;
MainForm.Hide;
end;

procedure TMainForm.DeviceMenuClick(Sender: TObject); // ����������� ������� "���������� ����������"
begin
Device.ShowModal;
end;

procedure TMainForm.TypesMenuClick(Sender: TObject); // ����������� ������� "���� �����������"
begin
Types.ShowModal;
end;

procedure TMainForm.TricksMenuClick(Sender: TObject); // ����������� ������� "����� �� ����������"
begin
Tricks.ShowModal;
end;

procedure TMainForm.RoutesMenuClick(Sender: TObject); // ����������� ������� "�������� ������"
begin
Routes.ShowModal
end;

procedure TMainForm.PicturesGamesMenuClick(Sender: TObject); // ���� "������ �������� � ������������
begin
if Reg.VeloLandUsers.FieldByName('UserScore').AsInteger < 2700 then
  ShowMessage('������������ ����� ��� �������� ����! �������� ������� 2700 �����!')
else
  begin
    PicturesGame.Show;
    MainForm.Hide;
  end;
end;

procedure TMainForm.HelpClick(Sender: TObject); // ����� �������
begin
ShellExecute(0, PChar('Open'),PChar('VeloLandHelp.chm'),nil,nil,SW_SHOW);
end;

procedure TMainForm.NextMusicClick(Sender: TObject); //������������ ������ �����
begin
 if music_index = MusicList.Count-1 then
            music_index := 0
else
  music_index := music_index + 1;
Musicbg.FileName := MusicList.Items[music_index];
Musicbg.Open;
Musicbg.Play;
end;

procedure TMainForm.PrevMusicClick(Sender: TObject); // ������������ ������ �����
begin
if music_index = 0 then
  music_index := 4
else
  music_index := music_index - 1;
Musicbg.FileName := MusicList.Items[music_index];
Musicbg.Open;
Musicbg.Play;
end;

procedure TMainForm.RouteButtonClick(Sender: TObject); // ������ ��� ����������� ������� "�������� ������"
begin
Routes.ShowModal;
end;

procedure TMainForm.ButtonSelectionClick(Sender: TObject); // ������ ����������� ������� "���� �����������"
begin
Types.ShowModal;
end;

procedure TMainForm.TestsButtonClick(Sender: TObject); // ������ ����������� ������� "�����"
begin
Test.Show;
MainForm.Hide;
end;

procedure TMainForm.ExitButtonClick(Sender: TObject); // ������ ������ �� ����������
var buttonSelected: integer;
begin
buttonSelected := MessageDlg('�� �������, ��� ������ �����?',mtConfirmation, mbOKCancel, 0);
if buttonSelected = mrOK then
  begin
    Application.Terminate;
  end;
end;

procedure TMainForm.TitleColorTimer(Sender: TObject); // ����������� ������ "������� �����������"
begin
Title.Font.Color := rgb(random(255),random(255), random(255));
end;

procedure TMainForm.TrickButtonClick(Sender: TObject);
begin
Tricks.ShowModal;
end;

procedure TMainForm.VolumeClick(Sender: TObject); // ������ ��������� � ���������� ������
begin
if Musicbg.Mode = mpPlaying then
  begin
  Musicbg.Pause;
  Volume.Picture.LoadFromFile('resources\buttons\volume_off.png');
  end
else if Musicbg.Mode = mpPaused then
  begin
  Musicbg.Play;
  Volume.Picture.LoadFromFile('resources\buttons\volume_on.png');
  end;
end;

end.
