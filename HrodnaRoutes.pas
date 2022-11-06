unit HrodnaRoutes; // модуль раздела "Маршруты Гродно"

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.OleCtrls, SHDocVw;

type
  TRoutes = class(TForm)
    Page4: TWebBrowser;
    procedure FormActivate(Sender: TObject);
    procedure Page4BeforeScriptExecute(ASender: TObject;
      const pDispWindow: IDispatch);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Routes: TRoutes;

implementation

{$R *.dfm}

procedure TRoutes.FormActivate(Sender: TObject); // открытие HTML-страницы с разделом "Маршруты Гродно"
begin
Page4.Navigate('file://' + ExtractFilePath(paramstr(0)) +'resources/html_pages/Hrodna_routes/Hrodna_routes.html');
end;

procedure TRoutes.Page4BeforeScriptExecute(ASender: TObject;
  const pDispWindow: IDispatch); // закрытие формы
begin
Routes.Close;
end;

end.
