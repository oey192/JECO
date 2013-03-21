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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MapForm: TMapForm;

implementation

{$R *.fmx}

end.
