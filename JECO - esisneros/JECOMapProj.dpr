program JECOMapProj;

uses
  FMX.Forms,
  JECOMap in 'JECOMap.pas' {Form1},
  Map in 'Map.pas' {MapForm},
  Schedule in 'Schedule.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TMapForm, MapForm);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
