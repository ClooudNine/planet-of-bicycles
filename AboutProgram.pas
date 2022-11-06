unit AboutProgram; // ������ ���� "� ���������"

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TAProgramm = class(TForm)
    AppImg: TImage;
    Version: TLabel;
    Developer: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AProgramm: TAProgramm;

implementation

{$R *.dfm}

procedure TAProgramm.FormCreate(Sender: TObject); // �������� ���������� "� ���������"
begin
AppImg.Picture.LoadFromFile('resources/app_icon/app_icon.png');
AppImg.AutoSize := True;
AProgramm.Position := poDesktopCenter;
Version.Font.Name := 'Minecraft Rus Regular';
Version.Font.Size := 14;
Version.Caption := '������: ������� ����������� 1.0';
Developer.Font.Name := 'Minecraft Rus Regular';
Developer.Font.Size := 14;
Developer.Caption := '�����������: ������ ���������, �������� �� ���� ������ ���-34';
end;

end.
