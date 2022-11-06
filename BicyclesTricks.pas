unit BicyclesTricks; // модуль раздела "Трюки на велосипеде"

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.OleCtrls, SHDocVw;

type
  TTricks = class(TForm)
    Page3: TWebBrowser;
    procedure FormActivate(Sender: TObject);
    procedure Page3BeforeScriptExecute(ASender: TObject;
      const pDispWindow: IDispatch);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Tricks: TTricks;

implementation

{$R *.dfm}

procedure TTricks.FormActivate(Sender: TObject); // открытие HTML-страницы с разделом "Трюки на велосипеде"
begin
Page3.Navigate('file://' + ExtractFilePath(paramstr(0)) + 'resources/html_pages/tricks_bicycle/tricks_bicycles.html');
end;

procedure TTricks.Page3BeforeScriptExecute(ASender: TObject;
  const pDispWindow: IDispatch); // закрытие формы
begin
Tricks.Close;
end;

end.
