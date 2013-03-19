unit JECOMap;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Rtti, System.Classes,
  System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.ListBox,
  FMX.Edit, FMX.Objects;

type
  TForm1 = class(TForm)
    cmbUserOptions: TComboBox;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    btnQuit: TButton;
    btnViewSchMap: TButton;
    btnEditSchedule: TButton;
    Panel1: TPanel;
    getDirs: TButton;
    Panel2: TPanel;
    Label3: TLabel;
    Destination: TLabel;
    start_building: TComboBox;
    start_room: TComboBox;
    ListBoxItem7: TListBoxItem;
    ListBoxItem8: TListBoxItem;
    ListBoxItem9: TListBoxItem;
    ListBoxItem10: TListBoxItem;
    ListBoxItem11: TListBoxItem;
    ListBoxItem12: TListBoxItem;
    ListBoxItem13: TListBoxItem;
    CMU_Logo: TImage;
    CMU_Montrose_Logo: TImage;
    WCCC_Logo: TImage;
    Label4: TLabel;
    end_room: TComboBox;
    ListBoxItem19: TListBoxItem;
    end_building: TComboBox;
    ListBoxItem20: TListBoxItem;
    ListBoxItem21: TListBoxItem;
    ListBoxItem22: TListBoxItem;
    ListBoxItem23: TListBoxItem;
    ListBoxItem24: TListBoxItem;
    ListBoxItem25: TListBoxItem;
    Panel3: TPanel;
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    procedure btnQuitClick(Sender: TObject);
    procedure CMU_Montrose_LogoMouseEnter(Sender: TObject);
    procedure CMU_Montrose_LogoMouseLeave(Sender: TObject);
    procedure CMU_LogoMouseEnter(Sender: TObject);
    procedure CMU_LogoMouseLeave(Sender: TObject);
    procedure WCCC_LogoMouseEnter(Sender: TObject);
    procedure WCCC_LogoMouseLeave(Sender: TObject);
    procedure WCCC_LogoClick(Sender: TObject);
    procedure CMU_LogoClick(Sender: TObject);
    procedure CMU_Montrose_LogoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure getDirsClick(Sender: TObject);
    procedure btnViewSchMapClick(Sender: TObject);
    procedure start_buildingChange(Sender: TObject);
    procedure end_buildingChange(Sender: TObject);
    procedure btnEditScheduleClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

  end;

type Campus_Selections = (NO_CAMPUS, CMU, WCCC, Montrose);
var
  Form1: TForm1;
  Campus : Campus_Selections;
implementation

{$R *.fmx}

uses Map, Schedule;


procedure TForm1.btnEditScheduleClick(Sender: TObject);
begin
   Form2.Show();

end;

procedure TForm1.btnQuitClick(Sender: TObject);
begin
application.Terminate;
end;

procedure TForm1.btnViewSchMapClick(Sender: TObject);
begin
 MapForm.Visible := true;
end;

procedure TForm1.CMU_LogoClick(Sender: TObject);
begin
  CMU_Logo.Opacity := 1.0;
  WCCC_Logo.Opacity := 0.4;
  CMU_Montrose_Logo.Opacity := 0.4;
   Campus := CMU;
end;

procedure TForm1.CMU_LogoMouseEnter(Sender: TObject);
begin
  CMU_Logo.Opacity := 1.0;
end;

procedure TForm1.CMU_LogoMouseLeave(Sender: TObject);
begin
  if Campus <> CMU then
    CMU_Logo.Opacity := 0.4;
end;

procedure TForm1.CMU_Montrose_LogoClick(Sender: TObject);
begin
  CMU_Logo.Opacity := 0.4;
  WCCC_Logo.Opacity := 0.4;
  CMU_Montrose_Logo.Opacity := 1.0;
  Campus := Montrose;
end;

procedure TForm1.CMU_Montrose_LogoMouseEnter(Sender: TObject);
begin
   CMU_Montrose_Logo.Opacity := 1.0;
end;

procedure TForm1.CMU_Montrose_LogoMouseLeave(Sender: TObject);
begin
  if Campus <> Montrose then
   CMU_Montrose_Logo.Opacity := 0.4;
end;

procedure TForm1.end_buildingChange(Sender: TObject);
begin
  end_room.Enabled := True;
  if end_building.Items[end_building.ItemIndex] = 'Wubben Science Hall' then
    begin
      end_room.Clear;
      end_room.Items.Add('Choose A Room');
      end_room.Items.Add('WS-113');
      end_room.Items.Add('WS-118');
      end_room.Items.Add('WS-120');
      end_room.Items.Add('WS-250');
    end
  else if end_building.Items[end_building.ItemIndex] = 'Moss Performing Arts' then
  begin
      end_room.Clear;
      end_room.Items.Add('Choose A Room');
      end_room.Items.Add('MPAC-114');
      end_room.Items.Add('MPAC-115');
      end_room.Items.Add('MPAC-123');
      end_room.Items.Add('MPAC-154');
  end
  else if end_building.Items[end_building.ItemIndex] = 'Houston Hall' then
  begin
      end_room.Clear;
      end_room.Items.Add('Choose A Room');
      end_room.Items.Add('HH-104');
      end_room.Items.Add('HH-106');
      end_room.Items.Add('HH-121');
      end_room.Items.Add('HH-150');
  end
  else if end_building.Items[end_building.ItemIndex] = 'Maverick Center' then
  begin
      end_room.Clear;
      end_room.Items.Add('Choose A Room');
      end_room.Items.Add('MAV-154');
      end_room.Items.Add('MAV-162');
      end_room.Items.Add('MAV-164');
      end_room.Items.Add('MAV-193');
  end
  else if end_building.Items[end_building.ItemIndex] = 'Academic Classroom Building' then
  begin
      end_room.Clear;
      end_room.Items.Add('Choose A Room');
      end_room.Items.Add('ACB-104');
      end_room.Items.Add('ACB-105');
      end_room.Items.Add('ACB-203');
      end_room.Items.Add('ACB-204');
  end
  else if end_building.Items[end_building.ItemIndex] = 'Select A Building' then
  begin
    end_room.ItemIndex := 0;
    end_room.Clear;
    end_room.Items.Add('Choose A Room');
    end_room.Enabled := False;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   Campus := CMU;
  CMU_Logo.Opacity := 1.0;
  WCCC_Logo.Opacity := 0.4;
  CMU_Montrose_Logo.Opacity := 0.4;
  end_room.Enabled := False;
  start_room.Enabled := False
end;

procedure TForm1.getDirsClick(Sender: TObject);
begin
    MapForm.Visible := true;
end;

procedure TForm1.start_buildingChange(Sender: TObject);
begin
  start_room.Enabled := True;
  if start_building.Items[start_building.ItemIndex] = 'Wubben Science Hall' then
    begin
      start_room.Clear;
      start_room.Items.Add('Choose A Room');
      start_room.Items.Add('WS-113');
      start_room.Items.Add('WS-118');
      start_room.Items.Add('WS-120');
      start_room.Items.Add('WS-250');
    end
  else if start_building.Items[start_building.ItemIndex] = 'Moss Performing Arts' then
  begin
      start_room.Clear;
      start_room.Items.Add('Choose A Room');
      start_room.Items.Add('MPAC-114');
      start_room.Items.Add('MPAC-115');
      start_room.Items.Add('MPAC-123');
      start_room.Items.Add('MPAC-154');
  end
  else if start_building.Items[start_building.ItemIndex] = 'Houston Hall' then
  begin
      start_room.Clear;
      start_room.Items.Add('Choose A Room');
      start_room.Items.Add('HH-104');
      start_room.Items.Add('HH-106');
      start_room.Items.Add('HH-121');
      start_room.Items.Add('HH-150');
  end
  else if start_building.Items[start_building.ItemIndex] = 'Maverick Center' then
  begin
      start_room.Clear;
      start_room.Items.Add('Choose A Room');
      start_room.Items.Add('MAV-154');
      start_room.Items.Add('MAV-162');
      start_room.Items.Add('MAV-164');
      start_room.Items.Add('MAV-193');
  end
  else if start_building.Items[start_building.ItemIndex] = 'Academic Classroom Building' then
  begin
      start_room.Clear;
      start_room.Items.Add('Choose A Room');
      start_room.Items.Add('ACB-104');
      start_room.Items.Add('ACB-105');
      start_room.Items.Add('ACB-203');
      start_room.Items.Add('ACB-204');
  end
  else if start_building.Items[start_building.ItemIndex] = 'Select A Building' then
  begin
    start_room.ItemIndex := 0;
    start_room.Clear;
    start_room.Items.Add('Choose A Room');
    start_room.Enabled := False;
  end;
end;

procedure TForm1.WCCC_LogoClick(Sender: TObject);
begin
  CMU_Logo.Opacity := 0.4;
  WCCC_Logo.Opacity := 1.0;
  CMU_Montrose_Logo.Opacity := 0.4;
   Campus := WCCC;
end;

procedure TForm1.WCCC_LogoMouseEnter(Sender: TObject);
begin
   WCCC_Logo.Opacity := 1.0;
end;

procedure TForm1.WCCC_LogoMouseLeave(Sender: TObject);
begin
  if Campus <> WCCC then
    WCCC_Logo.Opacity := 0.4;
end;

end.
