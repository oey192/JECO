unit Map;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Rtti, System.Classes,
  System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.ExtCtrls;

type
  TMapForm = class(TForm)
    TrackBar1: TTrackBar;
    ArcDial1: TArcDial;
    Image1: TImage;
    Image2: TImage;
    ImageViewer1: TImageViewer;
    Blero: TStyleBook;
    procedure drawLine(x1, y1, x2, y2 : Integer);
    procedure FormCreate(Sender: TObject);
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

end.
