program JECOMapProj;

uses
  FMX.Forms,
  JECOMap in 'JECOMap.pas' {Form1},
  Map in 'Map.pas' {MapForm},
  Schedule in 'Schedule.pas' {Form2},
  FindProfessor in 'FindProfessor.pas' {find_professor_form},
  wubben in 'wubben.pas' {wubbenScience};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TMapForm, MapForm);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(Tfind_professor_form, find_professor_form);
  Application.CreateForm(TwubbenScience, wubbenScience);
  Application.Run;
end.
