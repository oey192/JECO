unit JECOMap;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Rtti, System.Classes,
  System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.ListBox,
  FMX.Edit, FMX.Objects;

type
  TForm1 = class(TForm)
    user_menu_options: TComboBox;
    get_directions: TListBoxItem;
    find_professor: TListBoxItem;
    find_building: TListBoxItem;
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
    CMU_Logo: TImage;
    CMU_Montrose_Logo: TImage;
    WCCC_Logo: TImage;
    Label4: TLabel;
    end_room: TComboBox;
    end_building: TComboBox;
    Panel3: TPanel;
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    Blero: TStyleBook;
    default_option: TListBoxItem;
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
    procedure user_menu_optionsChange(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

  end;

type Campus_Selections = (NO_CAMPUS, CMU, WCCC, Montrose);
type
  rooms = array of string;
  building = record
  buildingName : string;
  classrooms : rooms;
  end;

var
  Form1: TForm1;
  Campus : Campus_Selections;
  campusBuildings : array of building;
implementation

{$R *.fmx}

uses Map, Schedule, FindProfessor, wubben;


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

   start_building.Clear;
   start_building.Items.Add('-');
   start_building.ItemIndex := 0;
   start_building.Enabled := false;

   start_room.Clear;
   start_room.Items.Add('-');
   start_room.ItemIndex := 0;
   start_room.Enabled := false;

   end_building.Clear;
   end_building.Items.Add('-');
   end_building.ItemIndex := 0;
   end_building.Enabled := false;

   end_room.Clear;
   end_room.Items.Add('-');
   end_room.ItemIndex := 0;
   end_room.Enabled := false;

  user_menu_options.ItemIndex := 0;   // Sets combobox to Choose An Option
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

   start_building.Clear;
   start_building.Items.Add('-');
   start_building.ItemIndex := 0;
   start_building.Enabled := false;

   start_room.Clear;
   start_room.Items.Add('-');
   start_room.ItemIndex := 0;
   start_room.Enabled := false;

   end_building.Clear;
   end_building.Items.Add('-');
   end_building.ItemIndex := 0;
   end_building.Enabled := false;

   end_room.Clear;
   end_room.Items.Add('-');
   end_room.ItemIndex := 0;
   end_room.Enabled := false;

  user_menu_options.ItemIndex := 0;   // Sets combobox to Choose An Option
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
var
  indexFile : File;
  building : integer;
  i : integer;

begin
  if end_building.Items[end_building.ItemIndex] <> 'Select A Building' then
  begin
    end_room.Enabled := True;
    end_room.Clear;
    for i := 0 to Length(campusBuildings) - 1 do
    begin
       if end_building.Items[end_building.ItemIndex] = campusBuildings[i].buildingName then
       begin
        building := i;
        break;
       end;
    end;
    end_room.Items.Add('Choose A Room');
    end_room.ItemIndex := 0;
    for i := 0 to Length(campusBuildings[building].classrooms) - 1 do
    begin
       end_room.Items.Add(campusBuildings[building].classrooms[i]);
    end;
  end
  else
  begin
    end_room.Enabled := false;
    end_room.Clear;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   Campus := CMU;
  CMU_Logo.Opacity := 1.0;
  WCCC_Logo.Opacity := 0.4;
  CMU_Montrose_Logo.Opacity := 0.4;
end;

procedure TForm1.getDirsClick(Sender: TObject);
begin
    //MapForm.Visible := true;
    {if start_building.Items.Count > 0 then
      if (start_building.Selected.Text = 'Wubben Science Building') and (end_building.Selected.Text = 'Wubben Science Building') then
      begin}
        wubbenScience.showPath(start_room.Selected.Text, end_room.Selected.Text);
        wubbenScience.Show;
      {end
      else
        showMessage('Only Wubben Science has been implemented')
    else
      showMessage('You must select an option ');  }
end;

procedure TForm1.start_buildingChange(Sender: TObject);
var
  indexFile : File;
  building : integer;
  i : integer;

begin
  if start_building.Items[start_building.ItemIndex] <> 'Select A Building' then
  begin
    start_room.Enabled := True;
    start_room.Clear;
    for i := 0 to Length(campusBuildings) - 1 do
    begin
       if start_building.Items[start_building.ItemIndex] = campusBuildings[i].buildingName then
       begin
        building := i;
        break;
       end;
    end;
    start_room.Items.Add('Choose A Room');
    start_room.ItemIndex := 0;
    for i := 0 to Length(campusBuildings[building].classrooms) - 1 do
    begin
       start_room.Items.Add(campusBuildings[building].classrooms[i]);
    end;
  end
  else
  begin
    start_room.Enabled := false;
    start_room.Clear;
  end;
end;

procedure populate_getDirections(CampusFolder: String; start_building:TComboBox; end_building:TComboBox);
 var
   indexFileLocation : string;

   campusFiles : TextFile;
   campusRoomFilenames : array of string;

   totalBuildings : integer;
   totalRooms : integer;

   i, j : integer;

  begin
   // Try to open the Index.txt file for reading campus information
   indexFileLocation := 'rooms/' + CampusFolder + '/index.txt';
   AssignFile(campusFiles, indexFileLocation);
   Reset(campusFiles);

   i := 1;
   j := 1;
   while not Eof(campusFiles) do
    begin
      setLength(campusBuildings, i);
      setLength(campusRoomFilenames, j);
      ReadLn(campusFiles, campusBuildings[i-1].buildingName);
      ReadLn(campusFiles, campusRoomFilenames[j-1]);
      i := i + 1;
      j := j + 1;
    end;
    closeFile(campusFiles);

    for I := 0 to Length(campusRoomFilenames) - 1 do
    begin
      AssignFile(campusFiles, 'rooms/' + CampusFolder + '/' + campusRoomFilenames[I]);
      Reset(campusFiles);
      j := 1;
     while not Eof(campusFiles) do
      begin
        setLength(campusBuildings[I].classrooms, j);
         ReadLn(campusFiles, campusBuildings[I].classrooms[j-1]);
         j := j + 1;
      end;
      closeFile(campusFiles);
    end;

    start_building.Items.Clear;
    start_building.Clear;
    end_building.Items.Clear;
    end_building.Clear;

    start_building.Items.Add('Select A Building');
    end_building.Items.Add('Select A Building');
    for i := 0 to Length(campusBuildings) - 1 do
      begin
        start_building.Items.Add(campusBuildings[i].buildingName);
        end_building.Items.Add(campusBuildings[i].buildingName);
      end;
    start_building.ItemIndex := 0;
    start_building.Enabled := true;
    end_building.ItemIndex := 0;
    end_building.Enabled := true;

end;

procedure TForm1.user_menu_optionsChange(Sender: TObject);
begin
  if user_menu_options.Selected.Text = 'Get Directions' then
  begin
    if Campus = CMU then
      begin
         populate_getDirections('CMU', start_building, end_building); // Pass Folder Name
      end
    else if Campus = WCCC then
      begin
         populate_getDirections('WCCC', start_building, end_building); // Pass Folder Name
      end
    else if Campus = Montrose then
      begin
         populate_getDirections('Montrose', start_building, end_building); // Pass Folder Name
      end
    else if Campus = NO_CAMPUS then
     begin
       ShowMessage('Are you hacking? Don''t break too much stuff. ''ight?');
     end;
  end;

  if user_menu_options.Selected.Text = 'Find Professor' then
  begin
    find_professor_form.Show();
    user_menu_options.ItemIndex := 0;
  end;

end;

procedure TForm1.WCCC_LogoClick(Sender: TObject);
begin
  CMU_Logo.Opacity := 0.4;
  WCCC_Logo.Opacity := 1.0;
  CMU_Montrose_Logo.Opacity := 0.4;
  Campus := WCCC;

   start_building.Clear;
   start_building.Items.Add('-');
   start_building.ItemIndex := 0;
   start_building.Enabled := false;

   start_room.Clear;
   start_room.Items.Add('-');
   start_room.ItemIndex := 0;
   start_room.Enabled := false;

   end_building.Clear;
   end_building.Items.Add('-');
   end_building.ItemIndex := 0;
   end_building.Enabled := false;

   end_room.Clear;
   end_room.Items.Add('-');
   end_room.ItemIndex := 0;
   end_room.Enabled := false;

  user_menu_options.ItemIndex := 0;   // Sets combobox to Choose An Option
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
