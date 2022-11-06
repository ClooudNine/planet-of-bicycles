unit BicycleDevice; // ������ ������� "���������� ����������"

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.OleCtrls, SHDocVw,
  Vcl.StdCtrls, Vcl.Imaging.pngimage;

type
  TDevice = class(TForm)
    Page: TWebBrowser;
    procedure FormActivate(Sender: TObject);
    procedure PageBeforeScriptExecute(ASender: TObject;
      const pDispWindow: IDispatch);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Device: TDevice;

implementation

{$R *.dfm}

uses Main;

procedure TDevice.FormActivate(Sender: TObject); //�������� HTML-�������� � �������� "���������� ����������"
begin
Page.Navigate('file://' + ExtractFilePath(paramstr(0)) +'resources/html_pages/bicycle_device/bicycle_device.html');
end;

procedure TDevice.PageBeforeScriptExecute(ASender: TObject;
  const pDispWindow: IDispatch); // ������� �����
begin
Device.Close;
end;

end.
