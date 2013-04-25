unit Schedule;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Rtti, System.Classes,
  System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.ListBox,
  FMX.Edit, FMX.Objects, FMX.Layouts, FMX.Grid, FMX.Filter.Effects, FMX.Effects;

type
  TForm2 = class(TForm)
    Panel3: TPanel;
    btnQuit: TButton;
    btnViewSchMap: TButton;
    btnHome: TButton;
    Panel1: TPanel;
    getDirs: TButton;
    Label3: TLabel;
    CMU_Logo: TImage;
    CMU_Montrose_Logo: TImage;
    WCCC_Logo: TImage;
    title_CMUScheduleAndProfile: TLabel;
    JECO_Logo: TImage;
    Copyright_footer: TLabel;
    Title_ChooseCampus: TLabel;
    label_professor: TLabel;
    Label6: TLabel;
    btnRemove: TButton;
    btnApproveSchedule: TButton;
    Blero: TStyleBook;
    scheduleGrid: TStringGrid;
    colCourse: TStringColumn;
    colProfessor: TStringColumn;
    coursePrefix: TComboBox;
    courseSuffix: TComboBox;
    professorList: TComboBox;
    Label_PPass: TLabel;
    PPass_ComboBox: TComboBox;
    PP_G24: TListBoxItem;
    PP_P5: TListBoxItem;
    PP_G10: TListBoxItem;
    ListBoxItem1: TListBoxItem;
    CSCI_Test: TListBoxItem;
    c241: TListBoxItem;
    c250: TListBoxItem;
    Label1: TLabel;
    Sec: TComboBox;
    ListBoxItem4: TListBoxItem;
    ListBoxItem5: TListBoxItem;
    ListBoxItem6: TListBoxItem;
    Panel2: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    HueAdjustEffect1: THueAdjustEffect;
    ShadowEffect1: TShadowEffect;
    ListBoxItem7: TListBoxItem;
    ListBoxItem8: TListBoxItem;
    ListBoxItem9: TListBoxItem;
    c100: TListBoxItem;
    c106: TListBoxItem;
    c110: TListBoxItem;
    c111: TListBoxItem;
    c112: TListBoxItem;
    c130: TListBoxItem;
    c196: TListBoxItem;
    c206: TListBoxItem;
    ektare: TListBoxItem;
    kcastlet: TListBoxItem;
    lpayne: TListBoxItem;
    grader: TListBoxItem;
    wmacevoy: TListBoxItem;
    jddobbs: TListBoxItem;
    procedure getDirsClick(Sender: TObject);
    procedure btnHomeClick(Sender: TObject);
    procedure btnQuitClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnViewSchMapClick(Sender: TObject);
    procedure CMU_LogoClick(Sender: TObject);
    procedure CMU_Montrose_LogoClick(Sender: TObject);
    procedure WCCC_LogoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CMU_Montrose_LogoMouseEnter(Sender: TObject);
    procedure CMU_Montrose_LogoMouseLeave(Sender: TObject);
    procedure CMU_LogoMouseEnter(Sender: TObject);
    procedure CMU_LogoMouseLeave(Sender: TObject);
    procedure WCCC_LogoMouseEnter(Sender: TObject);
    procedure WCCC_LogoMouseLeave(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

//type Campus_Selections = (NO_CAMPUS, CMU, WCCC, Montrose);

var
  Form2: TForm2;
 // Campus : Campus_Selections;
  schedule_row : integer;
  schedule_column : integer;

implementation

{$R *.fmx}

Uses map, JECOMap;

procedure TForm2.btnHomeClick(Sender: TObject);
begin
  Form1.Show;
  Form2.Hide;
end;

procedure TForm2.btnQuitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm2.btnRemoveClick(Sender: TObject);
begin
  if scheduleGrid.RowCount <> 1 then
  begin
    scheduleGrid.RowCount := scheduleGrid.RowCount - 1;
  end
  else
  begin
    scheduleGrid.Cells[0, scheduleGrid.Selected] := '';
    scheduleGrid.Cells[1, scheduleGrid.Selected] := '';
    scheduleGrid.Cells[2, scheduleGrid.Selected] := '';
  end;
end;

procedure TForm2.btnViewSchMapClick(Sender: TObject);
begin
  MapForm.Visible := true;
end;

procedure TForm2.CMU_LogoClick(Sender: TObject);
begin
  CMU_Logo.Opacity := 1.0;
  WCCC_Logo.Opacity := 0.4;
  CMU_Montrose_Logo.Opacity := 0.4;
  Campus := CMU;
end;

procedure TForm2.CMU_LogoMouseEnter(Sender: TObject);
begin
  CMU_Logo.Opacity := 1.0;
end;

procedure TForm2.CMU_LogoMouseLeave(Sender: TObject);
begin
if Campus <> CMU then
    CMU_Logo.Opacity := 0.4;
end;

procedure TForm2.CMU_Montrose_LogoClick(Sender: TObject);
begin
  CMU_Logo.Opacity := 0.4;
  WCCC_Logo.Opacity := 0.4;
  CMU_Montrose_Logo.Opacity := 1.0;
  Campus := Montrose;
end;

procedure TForm2.CMU_Montrose_LogoMouseEnter(Sender: TObject);
begin
  CMU_Montrose_Logo.Opacity := 1.0;
end;

procedure TForm2.CMU_Montrose_LogoMouseLeave(Sender: TObject);
begin
  if Campus <> Montrose then
    CMU_Montrose_Logo.Opacity := 0.4;
end;

procedure TForm2.WCCC_LogoClick(Sender: TObject);
begin
  CMU_Logo.Opacity := 0.4;
  WCCC_Logo.Opacity := 1.0;
  CMU_Montrose_Logo.Opacity := 0.4;
  Campus := WCCC;
end;

procedure TForm2.WCCC_LogoMouseEnter(Sender: TObject);
begin
  WCCC_Logo.Opacity := 1.0;
end;

procedure TForm2.WCCC_LogoMouseLeave(Sender: TObject);
begin
if Campus <> WCCC then
    WCCC_Logo.Opacity := 0.4;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  application.Terminate;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
   Campus := JECOMap.Campus;
  if Campus = CMU then
  begin
      CMU_Logo.Opacity := 1.0;
      WCCC_Logo.Opacity := 0.4;
      CMU_Montrose_Logo.Opacity := 0.4;
  end
  else if Campus = WCCC then
  begin
      CMU_Logo.Opacity := 0.4;
      WCCC_Logo.Opacity := 1.0;
      CMU_Montrose_Logo.Opacity := 0.4;
  end
  else if Campus = Montrose then
  begin
      CMU_Logo.Opacity := 0.4;
      WCCC_Logo.Opacity := 0.4;
      CMU_Montrose_Logo.Opacity := 1.0;
  end
  else
  begin
      CMU_Logo.Opacity := 1.0;
      WCCC_Logo.Opacity := 0.4;
      CMU_Montrose_Logo.Opacity := 0.4;
      Campus := CMU;
  end;
end;

procedure TForm2.getDirsClick(Sender: TObject);
var
  courseab : string;
begin
courseab:='';

  if (scheduleGrid.Selected = scheduleGrid.RowCount - 1) then
    begin
      scheduleGrid.RowCount := scheduleGrid.RowCount + 1;
    end
  else if scheduleGrid.RowCount = 1 then
    begin
      scheduleGrid.RowCount := scheduleGrid.RowCount + 1;
    end;


if (courseprefix.ItemIndex >= 0) then
  begin
    courseab := courseprefix.Items[Courseprefix.ItemIndex];
  end;
if (coursesuffix.ItemIndex >= 0) then
    begin
      courseab := courseab + ' ' + coursesuffix.Items[coursesuffix.ItemIndex]
    end;
if (sec.ItemIndex >= 0) then
begin
   courseab := courseab + '-' + sec.Items[sec.itemindex];
end;

  scheduleGrid.Cells[0, scheduleGrid.Selected] := courseab;
  scheduleGrid.Cells[1, scheduleGrid.Selected] := professorList.Items[professorList.ItemIndex];
  scheduleGrid.Selected := scheduleGrid.Selected + 1;
end;

end.
