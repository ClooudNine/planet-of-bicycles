unit RegistrationForm;//������ �����������

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Data.Win.ADODB, Vcl.Mask, Vcl.DBCtrls, ShellAPI, Vcl.Menus;

type
  TReg = class(TForm)
    RegBg: TImage;
    Title: TLabel;
    NameLabel: TLabel;
    SurnameLabel: TLabel;
    VeloLandDatabase: TADOConnection;
    RegButton: TImage;
    Name: TEdit;
    Surname: TEdit;
    VeloLandUsers: TADOTable;
    AuthImg: TImage;
    RegImg: TImage;
    Title2: TLabel;
    Pass: TEdit;
    ConfrimPass: TEdit;
    PassLabel: TLabel;
    ConfrimPassLabel: TLabel;
    LoginLabel: TLabel;
    Login: TEdit;
    AuthButton: TImage;
    MainMenuReg: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure RegButtonClick(Sender: TObject);
    procedure RegImgClick(Sender: TObject);
    procedure AuthImgClick(Sender: TObject);
    procedure AuthButtonClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Reg: TReg;

implementation

{$R *.dfm}

uses Main, AboutProgram;

procedure TReg.AuthButtonClick(Sender: TObject); //�����������
begin
VeloLandUsers.Active := True;
if VeloLandUsers.Locate('UserLogin', Login.Text, []) then //�������� ������������� ������
  if VeloLandUsers.FieldByName('UserPassword').AsString = Pass.Text then //�������� ������ � ������
    begin
      MainForm.Show;
    end
  else
    ShowMessage('�������� ����� ��� ������!')
else
  ShowMessage('�������� ����� ��� ������!');
end;

procedure TReg.AuthImgClick(Sender: TObject); //����������� ����� �����������
begin
AuthImg.Visible := False;
Login.Visible := True;
Pass.Visible := True;
LoginLabel.Visible := True;
PassLabel.Visible := True;
Name.Visible := False;
Surname.Visible := False;
ConfrimPass.Visible :=False;
ConfrimPassLabel.Visible := False;
NameLabel.Visible := False;
SurnameLabel.Visible := False;
LoginLabel.Top := 285;
Login.Top := 285;
RegImg.Top := 502;
RegImg.Left := 100;
PassLabel.Left := 650;
RegButton.Visible := False;
AuthButton.Visible := True;
RegImg.Visible := True;
end;

procedure TReg.FormCreate(Sender: TObject); //�������� ��������, ����������� ��, ������������ ��������� ����������
begin
Application.Title := '������� �����������';
VeloLandDatabase.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0; '+
                              'Persist Security Info=False; Data Source='+
   ExtractFilePath(Application.ExeName)+'VeloLandDatabase.mdb';
VeloLandUsers.Connection := VeloLandDatabase;
VeloLandUsers.TableName := 'Users';
AddFontResource('resources\fonts\minecraft.ttf');
SendMessage(HWND_BROADCAST, WM_FONTCHANGE, 0, 0) ;
RegButton.Picture.LoadFromFile('resources\buttons\regcomplete.png');
AuthButton.Picture.LoadFromFile('resources\buttons\authcomplete.png');
AuthButton.AutoSize := True;
AuthButton.Visible := False;
Reg.Position := poDesktopCenter;
RegBg.Picture.LoadFromFile('resources\screens_and_bg\device_test_bg.png');
RegBg.AutoSize := True;
AuthImg.Picture.LoadFromFile('resources\buttons\auth.png');
AuthImg.AutoSize := True;
RegImg.Picture.LoadFromFile('resources\buttons\reg.png');
RegImg.AutoSize := True;
Name.Visible := False;
Surname.Visible := False;
Pass.Visible := False;
ConfrimPass.Visible :=False;
PassLabel.Visible := False;
ConfrimPassLabel.Visible := False;
LoginLabel.Visible := False;
Login.Visible := False;
NameLabel.Visible := False;
SurnameLabel.Visible := False;
RegButton.Visible := False;
LoginLabel.Caption := '�����:';
LoginLabel.Font.Name := 'Minecraft Rus Regular';
LoginLabel.Font.Size := 16;
NameLabel.Caption := '���:';
NameLabel.Font.Name := 'Minecraft Rus Regular';
NameLabel.Font.Size := 16;
SurnameLabel.Caption := '�������:';
SurnameLabel.Font.Name := 'Minecraft Rus Regular';
SurnameLabel.Font.Size := 16;
PassLabel.Caption := '������:';
PassLabel.Font.Name := 'Minecraft Rus Regular';
PassLabel.Font.Size := 16;
ConfrimPassLabel.Caption := '����������� ������:';
ConfrimPassLabel.Font.Name := 'Minecraft Rus Regular';
ConfrimPassLabel.Font.Size := 12;
Title.Caption := '������������ ��� � ���������� "������� �����������"!';
Title.Font.Name := 'Minecraft Rus Regular';
Title.Font.Size := 20;
Title2.Caption := '��� ������ ���������������!';
Title2.Font.Name := 'Minecraft Rus Regular';
Title2.Font.Size := 20;
end;

procedure TReg.FormDestroy(Sender: TObject); //�������� ������ �� ������� ������������ ��� ��������
begin
   RemoveFontResource('resources\fonts\minecraft.ttf') ;
   SendMessage(HWND_BROADCAST, WM_FONTCHANGE, 0, 0) ;
end;

procedure TReg.N2Click(Sender: TObject); //����� �������
begin
ShellExecute(0, PChar('Open'),PChar('VeloLandHelp.chm'),nil,nil,SW_SHOW);
end;

procedure TReg.N3Click(Sender: TObject); //���� "� ���������"
begin
AProgramm.ShowModal;
end;

procedure TReg.RegButtonClick(Sender: TObject); //����������� ������������
begin
VeloLandUsers.Active := True;
if (Login.Text = '') or (Name.Text = '') or (Surname.Text = '') or (Pass.Text = '') or (ConfrimPass.Text = '') then //�������� �� ������������ �����
  ShowMessage('������ ���� ������ ���� ���������!')
else if (Length(Pass.Text) < 4) then
  ShowMessage('����� ������ �� ����� ���� ������ 4 ��������!')
else if VeloLandUsers.Locate('UserLogin', Login.Text, []) then
  ShowMessage('������ ������������ ��� ������������ � �������! ��������� �� �������� �����������!')
else
  begin //���������� ������ ������������ � ��
    VeloLandUsers.Insert;
    VeloLandUsers.FieldByName('UserName').AsString := Name.Text;
    VeloLandUsers.FieldByName('UserSurname').AsString := Surname.Text;
    VeloLandUsers.FieldByName('UserLogin').AsString := Login.Text;
    VeloLandUsers.FieldByName('UserPassword').AsString := Pass.Text;
    VeloLandUsers.FieldByName('UserScore').AsInteger := 0;
    VeloLandUsers.FieldByName('UserDeviceTestScore').AsInteger := 0;
    VeloLandUsers.FieldByName('UserPDDTestScore').AsInteger := 0;
    VeloLandUsers.FieldByName('UserTypesTestScore').AsInteger := 0;
    VeloLandUsers.FieldByName('UserGameScore').AsInteger := 0;
    VeloLandUsers.Post;
    ShowMessage('�� ������� ������������������! ��������� �� �������� ����������� ��� ����� � ���������!');
  end;
Pass.Text := '';
ConfrimPass.Text := '';
end;

procedure TReg.RegImgClick(Sender: TObject); //����������� ����� �����������
begin
RegImg.Visible := False;
AuthImg.Top := 502;
AuthImg.Visible := True;
Login.Top := 220;
LoginLabel.Top := 220;
Name.Visible := True;
Surname.Visible := True;
Pass.Visible := True;
ConfrimPass.Visible := True;
Login.Visible := True;
LoginLabel.Visible := True;
NameLabel.Visible := True;
SurnameLabel.Visible := True;
PassLabel.Visible := True;
ConfrimPassLabel.Visible := True;
RegButton.Visible := True;
AuthButton.Visible := False;
end;

end.
