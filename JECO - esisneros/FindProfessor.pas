unit FindProfessor;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Rtti, System.Classes,
  System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.ExtCtrls, FMX.Effects, FMX.Filter.Effects, FMX.ListBox,
  FMX.Edit, FMX.Ani;

type
  Tfind_professor_form = class(TForm)
    sideMenu_background: TImage;
    map_viewer: TImageViewer;
    JECOMap_watermark: TImage;
    FindProfessor_Title: TLabel;
    ShadowEffect1: TShadowEffect;
    Title_background: TPanel;
    FillEffect1: TFillEffect;
    campus_title: TLabel;
    campus_option: TComboBox;
    ShadowEffect2: TShadowEffect;
    main_campus: TListBoxItem;
    montrose: TListBoxItem;
    WCCC: TListBoxItem;
    department_Title: TLabel;
    ShadowEffect3: TShadowEffect;
    department_comboBox: TComboBox;
    professorsName_Title: TLabel;
    ShadowEffect4: TShadowEffect;
    professor_comboBox: TComboBox;
    avatar: TImage;
    avatar_background: TPanel;
    ListBoxItem1: TListBoxItem;
    professorName_title: TLabel;
    ShadowEffect5: TShadowEffect;
    office_title: TLabel;
    ShadowEffect6: TShadowEffect;
    building_title: TLabel;
    ShadowEffect7: TShadowEffect;
    email_title: TLabel;
    ShadowEffect8: TShadowEffect;
    phone_title: TLabel;
    ShadowEffect9: TShadowEffect;
    professor_name: TEdit;
    office_name: TEdit;
    building_name: TEdit;
    email_name: TEdit;
    phone_name: TEdit;
    ListBoxItem2: TListBoxItem;
    Blero: TStyleBook;
    findProfessor_button: TButton;
    wubbenScience_building: TImage;
    FloatAnimation1: TFloatAnimation;
    wubbenScience_glow: TGlowEffect;
    building_viewer: TImageViewer;
    reset_button: TButton;
    return_button: TButton;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure campus_optionChange(Sender: TObject);
    procedure department_comboBoxChange(Sender: TObject);
    procedure professor_comboBoxChange(Sender: TObject);
    procedure findProfessor_buttonClick(Sender: TObject);
    procedure wubbenScience_buildingClick(Sender: TObject);
    procedure building_viewerDblClick(Sender: TObject);
    procedure reset_buttonClick(Sender: TObject);
    procedure return_buttonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
  professor = record
    name : string;
    email : string;
    phone : string;
    office : string;
    building : string;
    professorFolder : string;
  end;

  dept = record
  departmentName : string;
  departmentFolder : string;
  professors : array of professor;
  end;

var
  find_professor_form: Tfind_professor_form;
  departments : array of dept;

implementation

{$R *.fmx}

uses JECOMap;

procedure populate_department(Campus: JECOMap.Campus_Selections; department_comboBox: TComboBox);
var
  indexFileLocation : string;
  DeptIndex: TextFile;
  tempIndex : integer;
begin
    department_comboBox.Clear();
    department_comboBox.Items.Add('Select A Department');
    department_comboBox.ItemIndex := 0;
    setLength(departments, 0);

    if Campus = JECOMap.CMU then
    begin
      indexFileLocation := 'faculty/CMU/index.txt';
    end
    else if Campus = JECOMap.WCCC then
    begin
      indexFileLocation := 'faculty/WCCC/index.txt';
    end
    else if Campus = JECOMap.Montrose then
    begin
     indexFileLocation := 'faculty/Montrose/index.txt';
    end;
    AssignFile(DeptIndex, indexFileLocation);
    Reset(DeptIndex);
    tempIndex := 1;
    while not Eof(DeptIndex) do
    begin
      setLength(departments, tempIndex);
      ReadLn(DeptIndex, departments[tempIndex - 1].departmentName);
      ReadLn(DeptIndex, departments[tempIndex - 1].departmentFolder);
      tempIndex := tempIndex + 1;
    end;
    closeFile(DeptIndex);

    for tempIndex := 0 to Length(departments) - 1 do
    begin
       department_comboBox.Items.Add(departments[tempIndex].departmentName);
    end;

end;

procedure Tfind_professor_form.building_viewerDblClick(Sender: TObject);
begin
 // DEBUG: Show's coordinates of top left corner of TImageViewer 
     ShowMessage('H: ' + floattostr(building_viewer.HScrollBar.Value) + 'V: ' + floattostr(building_viewer.VScrollBar.Value));
end;

procedure Tfind_professor_form.campus_optionChange(Sender: TObject);
begin

  populate_department(Campus, department_comboBox);
  professor_name.Text :=  '';
  building_name.Text :=  '';
  office_name.Text := '';
  email_name.Text := '';
  phone_name.Text := '';
  avatar.Bitmap.LoadFromFile('faculty/defaultAvatar.png');

  if campus_option.Selected.Text = 'Main Campus' then
  begin
    populate_department(JECOMap.CMU, department_comboBox);
  end
  else if campus_option.Selected.Text = 'WCCC' then
  begin
    populate_department(JECOMap.WCCC, department_comboBox);
  end
  else if campus_option.Selected.Text = 'CMU - Montrose' then
  begin
    populate_department(JECOMap.Montrose, department_comboBox);
  end;
end;

procedure Tfind_professor_form.department_comboBoxChange(Sender: TObject);
var
  indexFileLocation : string;
  campusFolder : string;
  deptFolder : string;
  ProfessorsIndex: TextFile;
  deptIndex : integer;
  tempIndex: Integer;

  ProfessorInfoIndex : TextFile;
  profIndexFileLocation : string;
  
begin
    professor_comboBox.Clear();
    professor_comboBox.Items.Add('Select A Professor');
    professor_comboBox.ItemIndex := 0;

    if campus_option.Selected.Text = 'Main Campus' then
    begin
      campusFolder := 'CMU';
    end
    else if campus_option.Selected.Text = 'WCCC' then
    begin
      campusFolder := 'WCCC';
    end
    else if campus_option.Selected.Text = 'CMU - Montrose' then
    begin
      campusFolder := 'Montrose'
    end;
    
     if department_comboBox.Selected.Text <> 'Select A Department' then
     begin
        for deptIndex := 0 to Length(departments) - 1 do
        begin
          if departments[deptIndex].departmentName = department_comboBox.Selected.Text then
          begin
            deptFolder := departments[deptIndex].departmentFolder;
            break;
          end;
        end;
       indexFileLocation := 'faculty/' + campusFolder + '/' + deptFolder + '/index.txt';

      AssignFile(ProfessorsIndex, indexFileLocation);
      Reset(ProfessorsIndex);
      tempIndex := 1;
      while not Eof(ProfessorsIndex) do
      begin
        setLength(departments[deptIndex].professors, tempIndex);
        ReadLn(ProfessorsIndex, departments[deptIndex].professors[tempIndex - 1].name);
        ReadLn(ProfessorsIndex, departments[deptIndex].professors[tempIndex - 1].professorFolder);
    
        // Open Professor Information
        profIndexFileLocation := 'faculty/' + campusFolder + '/' + deptFolder + '/' + departments[deptIndex].professors[tempIndex - 1].professorFolder + '/index.txt'; 
        AssignFile(ProfessorInfoIndex, profIndexFileLocation); 
        Reset(ProfessorInfoIndex);
        ReadLn(ProfessorInfoIndex, departments[deptIndex].professors[tempIndex - 1].building);
        ReadLn(ProfessorInfoIndex, departments[deptIndex].professors[tempIndex - 1].office);
        ReadLn(ProfessorInfoIndex, departments[deptIndex].professors[tempIndex - 1].phone);
        ReadLn(ProfessorInfoIndex, departments[deptIndex].professors[tempIndex - 1].email);
        closeFile(ProfessorInfoIndex);
        // Close Professor Information

        // DEBUG - Output all professor's information
        //ShowMessage('Name: ' +  departments[deptIndex].professors[tempIndex - 1].name + #13#10 +
        //            'E-mail: ' + departments[deptIndex].professors[tempIndex - 1].email + #13#10 +
        //            'Phone: ' + departments[deptIndex].professors[tempIndex - 1].phone + #13#10 +
        //            'Office: ' + departments[deptIndex].professors[tempIndex - 1].office + #13#10 +
        //             'Building: ' + departments[deptIndex].professors[tempIndex - 1].building);
        
        tempIndex := tempIndex + 1;
      end;
      closeFile(ProfessorsIndex);
      for tempIndex := 0 to Length(departments[deptIndex].professors) - 1 do
        begin
          professor_comboBox.Items.Add(departments[deptIndex].professors[tempIndex].name);
        end;
    end;
end;

procedure Tfind_professor_form.findProfessor_buttonClick(Sender: TObject);
var
  officeRoom : TImage;
  roomGlow : TGlowEffect;
  glowAnimation : TFloatAnimation;
begin
    // DEBUG: Show's coordinates of top left corner of TImageViewer 
    // ShowMessage('H: ' + floattostr(map_viewer.HScrollBar.Value) + 'V: ' + floattostr(map_viewer.VScrollBar.Value));
    if building_name.Text = 'Wubben Science Building' then
      begin
        map_viewer.HScrollBar.Value := 27;
        map_viewer.VScrollBar.Value := 432;
        wubbenScience_glow.Enabled := true;
        building_viewer.Height := 500;
        building_viewer.Width := 600;
        building_viewer.Bitmap.LoadFromFile('maps/action_findProfessor/WS/1st_floor.png');


        officeRoom := TImage.Create(building_viewer);
        officeRoom.Parent := building_viewer;
        officeRoom.Bitmap.LoadFromFile('maps/action_findProfessor/WS/' + office_name.Text + '.png');

        roomGlow := TGlowEffect.Create(officeRoom);
        roomGlow.Parent := officeRoom;
        roomGlow.Enabled := true;
        roomGlow.GlowColor := $FF00008B; // Color - Dark Blue
        roomGlow.Softness := 0.75;

        glowAnimation := TFloatAnimation.Create(roomGlow);
        glowAnimation.Parent := roomGlow;
        glowAnimation.AutoReverse := true;
        glowAnimation.Duration := 0.7;
        glowAnimation.Loop := true;
        glowAnimation.PropertyName := 'Opacity';
        glowAnimation.StartValue := 1;
        glowAnimation.StopValue := 0;
        glowAnimation.Enabled := true;
        
        if office_name.Text = 'WS-134K' then
        begin
          officeRoom.Height := 65;
          officeRoom.Width := 85;
          officeRoom.Position.X := 1242;
          officeRoom.Position.Y := 664;
          building_viewer.HScrollBar.Value := 1003;
          building_viewer.VScrollBar.Value := 437;
          
        end
        else if office_name.Text = 'WS-119H' then
          begin
          officeRoom.Height := 45;
          officeRoom.Width := 66;
          officeRoom.Position.X := 1153;
          officeRoom.Position.Y := 918;
          building_viewer.HScrollBar.Value := 903;
          building_viewer.VScrollBar.Value := 636;
          end
        else if office_name.Text = 'WS-136A' then
          begin
          officeRoom.Height := 63;
          officeRoom.Width := 61;
          officeRoom.Position.X := 986;
          officeRoom.Position.Y := 796;
          building_viewer.HScrollBar.Value := 722;
          building_viewer.VScrollBar.Value := 763;
          end
        else if office_name.Text = 'WS-119J' then
          begin
          officeRoom.Height := 49;
          officeRoom.Width := 58;
          officeRoom.Position.X := 1211;
          officeRoom.Position.Y := 982;
          building_viewer.HScrollBar.Value := 955;
          building_viewer.VScrollBar.Value := 637;
          end
        else if office_name.Text = 'WS-119F' then
          begin
          officeRoom.Height := 50;
          officeRoom.Width := 57;
          officeRoom.Position.X := 1098;
          officeRoom.Position.Y := 981;
          building_viewer.HScrollBar.Value := 844;
          building_viewer.VScrollBar.Value := 637;
          end
        else if office_name.Text = 'WS-119G' then
          begin
          officeRoom.Height := 50;
          officeRoom.Width := 58;
          officeRoom.Position.X := 1155;
          officeRoom.Position.Y := 981;
          building_viewer.HScrollBar.Value := 844;
          building_viewer.VScrollBar.Value := 637;
          end
        else if office_name.Text = 'WS-119B' then
          begin
          officeRoom.Height := 49;
          officeRoom.Width := 57;
          officeRoom.Position.X := 930;
          officeRoom.Position.Y := 981;
          building_viewer.HScrollBar.Value := 672;
          building_viewer.VScrollBar.Value := 637;
          end;
       end;
  end;

procedure Tfind_professor_form.FormShow(Sender: TObject);
begin
    if Campus = JECOMap.CMU then
    begin                                                                     
      campus_option.ItemIndex := 0;
    end
    else if Campus = JECOMap.WCCC then
    begin
      campus_option.ItemIndex := 1;
    end
    else if Campus = JECOMap.Montrose then
    begin
      campus_option.ItemIndex := 2;
    end
    else if Campus = JECOMap.NO_CAMPUS then
    begin
     ShowMessage('Are you hacking? Don''t break too much stuff. ''ight?');
    end;

    // Clear all Content if form is re-opened
    populate_department(Campus, department_comboBox);
    professor_name.Text :=  '';
    building_name.Text :=  '';
    office_name.Text := '';
    email_name.Text := '';
    phone_name.Text := '';
    avatar.Bitmap.LoadFromFile('faculty/defaultAvatar.png');
    map_viewer.Visible := true;
    wubbenScience_glow.Enabled := false;
end;

procedure Tfind_professor_form.professor_comboBoxChange(Sender: TObject);
var
  deptIndex : integer;
  profIndex : integer;
  photoSource : string;
  I: Integer;

begin
  if professor_comboBox.Selected.Text <> 'Select A Professor' then
  begin
     for I := 0 to Length(departments) - 1 do
     begin
       if departments[I].departmentName = department_comboBox.Selected.Text then
       begin
           deptIndex := I;
           break;
       end;
     end;

     for I := 0 to Length(departments[deptIndex].professors) - 1 do
     begin
      if departments[deptIndex].professors[I].name = professor_comboBox.Selected.Text then
      begin
        profIndex := I;
      end;
     end;

     if campus_option.Selected.Text = 'Main Campus' then
     begin
       photoSource := 'faculty/CMU';
     end
     else if campus_option.Selected.Text = 'WCCC' then
     begin
       photoSource := 'faculty/WCCC';
     end
     else if campus_option.Selected.Text = 'CMU - Montrose' then
     begin
       photoSource := 'faculty/Montrose';
     end;
     photoSource := photoSource + '/' + departments[deptIndex].departmentFolder + '/' +  departments[deptIndex].professors[profIndex].professorFolder + '/avatar.png';
     avatar.Bitmap.LoadFromFile(photoSource);
     professor_name.Text :=  departments[deptIndex].professors[profIndex].name;
     building_name.Text :=  departments[deptIndex].professors[profIndex].building;
     office_name.Text := departments[deptIndex].professors[profIndex].office;
     email_name.Text := departments[deptIndex].professors[profIndex].email;
     phone_name.Text := departments[deptIndex].professors[profIndex].phone;
  end
  else
  begin
    professor_name.Text :=  '';
    building_name.Text :=  '';
    office_name.Text := '';
    email_name.Text := '';
    phone_name.Text := '';
    avatar.Bitmap.LoadFromFile('faculty/defaultAvatar.png');
  end;
end;

procedure Tfind_professor_form.reset_buttonClick(Sender: TObject);
begin
  find_professor_form.Hide();
  find_professor_form.Show();
  showMessage('Reset Not Fully Implemented - building_viewer not set to reset');
end;

procedure Tfind_professor_form.return_buttonClick(Sender: TObject);
begin
  find_professor_form.Hide();
end;

procedure Tfind_professor_form.wubbenScience_buildingClick(Sender: TObject);
begin
    map_viewer.Visible := false;
    building_viewer.Visible := true;
end;

end.