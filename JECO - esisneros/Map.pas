unit Map;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Rtti, System.Classes,
  System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.ExtCtrls, FMX.Ani;

type
  TMapForm = class(TForm)
    zoomBar: TTrackBar;
    ArcDial1: TArcDial;
    zoom_plus: TImage;
    zoom_minus: TImage;
    mapViewer: TImageViewer;
    Blero: TStyleBook;
    Label1: TLabel;
    legend: TImage;
    legend_animation: TFloatAnimation;
    BitmapAnimation1: TBitmapAnimation;
    BitmapAnimation2: TBitmapAnimation;
    procedure drawLine(x1, y1, x2, y2 : Integer);
    procedure FormCreate(Sender: TObject);
    procedure zoom_plusClick(Sender: TObject);
    procedure zoom_minusClick(Sender: TObject);
    procedure zoomBarChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MapForm: TMapForm;

implementation

{$R *.fmx}

uses JECOMap;

procedure TMapForm.drawLine(x1, y1, x2, y2 : Integer);
var line : TLine;
begin

line := TLine.Create(self);

line.Stroke := TStrokeBrush.Create(TBrushKind.bkSolid, $0000F0);

line := TLine.Create(application.Owner);
line.SetBounds(x1, y1, x2-x1, y2-y1);
line.Stroke := TStrokeBrush.Create(TBrushKind.bkSolid, $0000F0);
//line.Stroke.Kind := TBrushKind.bkSolid;
//line.Stroke.Color := $0000F0;
line.StrokeThickness := 20;
line.Visible := true;
line.Opacity := 1;
line.BringToFront;
application.ProcessMessages;
end;

procedure TMapForm.FormCreate(Sender: TObject);
begin
  drawLine(0, 0, 40, 60);
end;

procedure TMapForm.zoomBarChange(Sender: TObject);
begin
  mapViewer.BitmapScale := (-zoomBar.Value);
end;

procedure TMapForm.zoom_minusClick(Sender: TObject);
begin
 zoomBar.Value := zoomBar.Value + 2;
end;

procedure TMapForm.zoom_plusClick(Sender: TObject);
begin
 zoomBar.Value := zoomBar.Value - 2;
end;

end.
