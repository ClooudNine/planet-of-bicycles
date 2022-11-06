unit Tests; // ������ ������� "�����"

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  System.ImageList, Vcl.ImgList, Vcl.Menus, ShellAPI;

type
  TTest = class(TForm)
    DeviceTBg: TImage;
    TestsVariant: TRadioGroup;
    NextButton: TImage;
    Questions: TRadioGroup;
    Score: TLabel;
    PictureDevice: TImage;
    OnMainForm: TImage;
    Timer: TTimer;
    Time: TLabel;
    MainMenuTest: TMainMenu;
    N1: TMenuItem;
    Help: TMenuItem;
    AboutProgr: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure TestsVariantClick(Sender: TObject);
    procedure NextButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OnMainFormClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure HelpClick(Sender: TObject);
    procedure AboutProgrClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Test: TTest;
  f: text;
  s: string;
  Nvern, ball: integer;
  img_index:integer;
  i:integer;

implementation

{$R *.dfm}

uses RegistrationForm, Main, AboutProgram;

procedure TTest.FormClose(Sender: TObject; var Action: TCloseAction); // ������ ��������� � �� ��� ������ �� �����
begin
Reg.VeloLandUsers.Edit;
Reg.VeloLandUsers.FieldByName('UserScore').AsInteger := Reg.VeloLandUsers.FieldByName('UserDeviceTestScore').AsInteger
+ Reg.VeloLandUsers.FieldByName('UserPDDTestScore').AsInteger
+ Reg.VeloLandUsers.FieldByName('UserTypesTestScore').AsInteger
+ Reg.VeloLandUsers.FieldByName('UserGameScore').AsInteger;
Reg.VeloLandUsers.Post;
TestsVariant.ItemIndex := -1;
TestsVariant.Enabled := True;
Timer.Enabled := False;
Time.Visible := False;
Questions.Items.Clear;
Questions.Caption := '�������';
Questions.Visible := False;
PictureDevice.Visible := False;
MainForm.Show;
end;

procedure TTest.FormCreate(Sender: TObject); // ������� ������������ ��������� ����������
begin
Application.Title := '������� �����������';
Test.Position := poDesktopCenter;
DeviceTBg.Picture.LoadFromFile('resources\screens_and_bg\device_test_bg.png');
NextButton.Picture.LoadFromFile('resources\buttons\authcomplete.png');
OnMainForm.Picture.LoadFromFile('resources\buttons\return_button.png');
OnMainForm.AutoSize := True;
NextButton.AutoSize := True;
NextButton.Enabled := False;
DeviceTBg.AutoSize := True;
Timer.Enabled := False;
TestsVariant.Font.Name := 'Minecraft Rus Regular';
Score.Font.Name := 'Minecraft Rus Regular';
Questions.Font.Name := 'Minecraft Rus Regular';
Questions.Font.Size := 16;
Score.Font.Size := 32;
Time.Font.Name := 'Minecraft Rus Regular';
Time.Font.Size := 16;
Time.Visible := False;
Score.Font.Color := clBlack;
Score.Visible := False;
Questions.Visible := False;
TestsVariant.Font.Size := 12;
end;

procedure TTest.HelpClick(Sender: TObject); // ����� �������
begin
ShellExecute(0, PChar('Open'),PChar('VeloLandHelp.chm'),nil,nil,SW_SHOW);
end;

procedure TTest.AboutProgrClick(Sender: TObject); // ����� ���� "� ���������"
begin
AProgramm.ShowModal;
end;

procedure TTest.NextButtonClick(Sender: TObject); // ������� � ���������� �������
begin
if (Questions.ItemIndex>-1) and (not Eof(f)) then begin
if Questions.ItemIndex = Nvern-1 then ball:=ball+100; //���� ��������� ������� �������������
Questions.Items.Clear; //������ ������� ������ �� ���� ������������
Repeat //� ��������� ���� ��� ���������� �������
if (s[1]='-') then begin
delete(s,1,1);
Questions.Caption:=s;
end
else if s[1]='*' then begin
delete(s,1,1);
Nvern:=StrToInt(s);
end
else Questions.Items.Add(s);
readln(f,s);
Score.Caption:=s;
until (s[1]='-') or (Eof(f));
if TestsVariant.ItemIndex = 0 then
  begin
    img_index := img_index + 1;
    PictureDevice.Picture.LoadFromFile('resources\tests\device_test\' + IntToStr(img_index) + '.jpg') // �������� �������� ��� ��������
  end
else if TestsVariant.ItemIndex = 2 then
  begin
    img_index := img_index + 1;
    PictureDevice.Picture.LoadFromFile('resources\tests\types_test\' + IntToStr(img_index) + '.jpg') // �������� �������� ��� ��������
  end;
end
//���� ����� ����� ���������, ������ ������� �����������
Else if Eof(f) then begin
delete(s,1,1);
Nvern:=StrToInt(s);
if Questions.ItemIndex = Nvern-1 then ball:=ball+100;
Score.Visible := True;
Score.Caption:='�������� ����: ' +IntToStr(ball); //����� ���������� ������
Reg.VeloLandUsers.Edit;
if TestsVariant.ItemIndex = 0 then
  if ball > Reg.VeloLandUsers.FieldByName('UserDeviceTestScore').AsInteger then // �������� ��� �� ������� ����� ����
    Reg.VeloLandUsers.FieldByName('UserDeviceTestScore').AsInteger := ball;
if TestsVariant.ItemIndex = 1 then
  if ball > Reg.VeloLandUsers.FieldByName('UserPDDTestScore').AsInteger then
    Reg.VeloLandUsers.FieldByName('UserPDDTestScore').AsInteger := ball;
if TestsVariant.ItemIndex = 2 then
  if ball > Reg.VeloLandUsers.FieldByName('UserTypesTestScore').AsInteger then
    Reg.VeloLandUsers.FieldByName('UserTypesTestScore').AsInteger := ball;
Reg.VeloLandUsers.Post;
CloseFile(f);
NextButton.Enabled:=False; //������ ���������� ����������� � ���������� �������
TestsVariant.Enabled := True;
TestsVariant.ItemIndex := -1;
Questions.Items.Clear;
Timer.Enabled := False;
end;
end;

procedure TTest.OnMainFormClick(Sender: TObject);
begin
Test.Close;
end;

procedure TTest.TestsVariantClick(Sender: TObject);
begin
case TestsVariant.ItemIndex of //� ����������� �� ���������� �������� ���������� f
0: begin
    AssignFile( f ,'resources\tests\device_test\device_test.txt');//����������� � ������� �������
    img_index := 1;
    Questions.Font.Size := 16;
    Questions.Width := 700;
    PictureDevice.Left := 800;
    PictureDevice.Width := 545;
    PictureDevice.Height := 400;
    PictureDevice.Picture.LoadFromFile('resources\tests\device_test\' + IntToStr(img_index) + '.jpg');
    end;
1: begin
    if Reg.VeloLandUsers.FieldByName('UserDeviceTestScore').AsInteger + Reg.VeloLandUsers.FieldByName('UserPDDTestScore').AsInteger // �������� ������� ������� ���������� �����
    + Reg.VeloLandUsers.FieldByName('UserTypesTestScore').AsInteger < 700 then
    begin
        TestsVariant.ItemIndex := -1;
        ShowMessage('�������� ������� 700 ����� ��� ����������� ����� �����!');
        exit;
    end
    else
      begin
      AssignFile( f ,'resources\tests\pdd_test\pdd_test.txt');
      Questions.Font.Size := 12;
      Questions.Width := 1000;
      PictureDevice.Left := 1100;
      PictureDevice.Width := 350;
      PictureDevice.Height := 450;
      PictureDevice.Picture.LoadFromFile('resources\tests\pdd_test\traffic.png');
      end;
   end;
2: begin
    if Reg.VeloLandUsers.FieldByName('UserDeviceTestScore').AsInteger + Reg.VeloLandUsers.FieldByName('UserPDDTestScore').AsInteger
    + Reg.VeloLandUsers.FieldByName('UserTypesTestScore').AsInteger < 1400 then
      begin
        TestsVariant.ItemIndex := -1;
        ShowMessage('�������� ������� 1400 ����� ��� ����������� ����� �����!');
        exit;
      end
      else
      begin
      AssignFile( f ,'resources\tests\types_test\types_test.txt');
      img_index := 1;
      Questions.Font.Size := 14;
      Questions.Width := 700;
      PictureDevice.Left := 800;
      PictureDevice.Width := 700;
      PictureDevice.Height := 400;
      PictureDevice.Picture.LoadFromFile('resources\tests\types_test\' + IntToStr(img_index) + '.jpg');
      end;
    end;
end;
TestsVariant.Enabled:=false; //����� �������� ���������� ����������
Questions.Enabled:=true; //��������� ���������� ���� � ��������
NextButton.Enabled:=true; //������ �����
Score.Visible := False;
Questions.Visible := True;
PictureDevice.Visible := True;
i := 300;
Timer.Enabled := True;
Time.Visible := True;
reset(f); //��������� ���� ��� ������
readln(f,s); //��������� ������ ������ �� �����
ball:=0; //���������� ���������� ������ 0
repeat
if (s[1]='-') then begin //���� ������ ������ ������ �-� ������ ��� ������
delete(s,1,1);
Questions.Caption:=s;
end
else if s[1]='*' then begin //���� ���� ������ �*� ������ ��� ����� ������� ������
delete(s,1,1);
Nvern:=StrToInt(s);
end

else Questions.Items.Add(s); //����� ��� ������� ������
readln(f,s); //��������� ��������� ������ �� �����
until (s[1]='-') or (Eof(f)); //���������� � ����������� ��������� ������� � RadiGroup �� ��� ���
// ���� �� ��������� ��������� ������ ��� ����� �����
end;

procedure TTest.TimerTimer(Sender: TObject); // ������ ����������� �������
var H,M,S:integer;
begin
i := i - 1;
H := I div 3600;
M := (I mod 3600) div 60;
S := (I mod 3600) mod 60;
Time.Caption := '���������� �����:' + Format('%.2d:',[H]) + Format('%.2d:',[M]) + Format('%.2d',[S]);
if i = 0 then // ���� ����� �����, �� ����������� ����, ������� ����� ���������� ������������
begin
  Timer.Enabled := False;
  Questions.Enabled := False;
  NextButton.Enabled := False;
  TestsVariant.Enabled := True;
  Time.Visible := False;
  Reg.VeloLandUsers.Edit;
  if TestsVariant.ItemIndex = 0 then
    if ball > Reg.VeloLandUsers.FieldByName('UserDeviceTestScore').AsInteger then
      Reg.VeloLandUsers.FieldByName('UserDeviceTestScore').AsInteger := ball;
  if TestsVariant.ItemIndex = 1 then
   if ball > Reg.VeloLandUsers.FieldByName('UserPDDTestScore').AsInteger then
      Reg.VeloLandUsers.FieldByName('UserPDDTestScore').AsInteger := ball;
  if TestsVariant.ItemIndex = 2 then
    if ball > Reg.VeloLandUsers.FieldByName('UserTypesTestScore').AsInteger then
      Reg.VeloLandUsers.FieldByName('UserTypesTestScore').AsInteger := ball;
  Reg.VeloLandUsers.Post;
  TestsVariant.ItemIndex := -1;
  Questions.Visible := False;
  PictureDevice.Visible := False;
  Questions.Items.Clear;
  ShowMessage('����� �����! ��� ��������� ' + IntToStr(ball) + ' �����!');
end;
end;

end.
