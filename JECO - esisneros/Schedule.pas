unit Schedule;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Rtti, System.Classes,
  System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.ListBox,
  FMX.Edit, FMX.Objects, FMX.Layouts, FMX.Grid, FMX.Filter.Effects, FMX.Effects;

type
  TForm2 = class(TForm)
    btnQuit: TButton;
    btnViewSchMap: TButton;
    btnHome: TButton;
    Panel1: TPanel;
    getDirs: TButton;
    Label3: TLabel;
    title_CMUScheduleAndProfile: TLabel;
    JECO_Logo: TImage;
    Copyright_footer: TLabel;
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
    sideMenu_background: TImage;
    Panel3: TPanel;
    campus_option: TComboBox;
    Label2: TLabel;
    professorList: TComboBox;
    ListBoxItem2: TListBoxItem;
    procedure getDirsClick(Sender: TObject);
    procedure btnHomeClick(Sender: TObject);
    procedure btnQuitClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnViewSchMapClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    private
    { Private declarations }
  public
    { Public declarations }
  end;

//type Campus_Selections = (NO_CAMPUS, CMU, WCCC, Montrose);

  Stype = record
      courseName : string[5];
      courseNum : integer;
      sectNum : integer;
      professor : string[15];
  end;
  ClassArray = array[1..10] of Stype;
var
  Form2: TForm2;
  inf, outf : textfile;
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
  if scheduleGrid.RowCount > 1 then
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

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  application.Terminate;
end;

procedure popProf(Sender : TObject; professorList: TComboBox; coursePrefix: TComboBox);
var
  str : string[15];
begin
  professorList.clear;
  if  coursePrefix.Selected.Text = 'MATH' then
  begin
    assignfile(inf,'schedule/CMU/MATHstaff.txt');
    reset(inf);
    while not eof(inf) do
      begin
        readln(inf,str);
        professorList.Items.Add(str);
      end;
  end
  else if coursePrefix.selected.Text = 'CSCI' then
  begin
    assignfile(inf,'schedule/CMU/CSCIstaff.txt');
    reset(inf);
    while not eof(inf) do
      begin
        readln(inf,str);
        professorList.Items.Add(str);
      end;
  end;
   closefile(inf);
end;

procedure TForm2.FormCreate(Sender: TObject);
var
  str : string[15];
begin
  coursePrefix.Clear;
  assignfile(inf,'schedule/CMU/index.txt');
  reset(inf);
  while not eof(inf) do
    begin
      readln(inf,str);
      coursePrefix.Items.Add(str);
    end;
   closefile(inf);
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
