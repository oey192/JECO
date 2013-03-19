unit Schedule;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Rtti, System.Classes,
  System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.ListBox,
  FMX.Edit, FMX.Objects, FMX.Layouts;

type
  TForm2 = class(TForm)
    Panel3: TPanel;
    btnQuit: TButton;
    btnViewSchMap: TButton;
    btnHome: TButton;
    Panel1: TPanel;
    getDirs: TButton;
    Label3: TLabel;
    Destination: TLabel;
    end_room: TComboBox;
    ListBoxItem19: TListBoxItem;
    CMU_Logo: TImage;
    CMU_Montrose_Logo: TImage;
    WCCC_Logo: TImage;
    Label4: TLabel;
    end_building: TComboBox;
    ListBoxItem20: TListBoxItem;
    ListBoxItem21: TListBoxItem;
    ListBoxItem22: TListBoxItem;
    ListBoxItem23: TListBoxItem;
    ListBoxItem24: TListBoxItem;
    ListBoxItem25: TListBoxItem;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    ListBox1: TListBox;
    ListBox2: TListBox;
    lstCourse: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    ListBoxItem4: TListBoxItem;
    lstCourseNum: TListBoxItem;
    ListBoxItem6: TListBoxItem;
    ListBoxItem7: TListBoxItem;
    ListBox3: TListBox;
    Label5: TLabel;
    lstProfessor: TListBoxItem;
    ListBoxItem9: TListBoxItem;
    ListBoxItem10: TListBoxItem;
    Label6: TLabel;
    btnRemove: TButton;
    lstSchedule: TListBox;
    Button1: TButton;
    procedure getDirsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnHomeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

procedure TForm2.btnHomeClick(Sender: TObject);
begin
  Form2.Hide;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  lstCourseNum.Enabled := false;
  lstProfessor.Enabled := false;
  end_room.Enabled := false;
end;

procedure TForm2.getDirsClick(Sender: TObject);
var
  temp : string;
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
  temp := 'CSCI 112       WS-118      Dr. Lori Payne';
  lstSchedule.Items.Add(temp);
end;


end.
