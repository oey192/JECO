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
    Copyright: TLabel;
    legend: TImage;
    legend_animation: TFloatAnimation;
    lowellHeinyHall_building: TImage;
    lowellHeinyHall_glow: TGlowEffect;
    FloatAnimation2: TFloatAnimation;
    officeRoom: TImage;
    glowAnimation: TFloatAnimation;
    roomGlow: TInnerGlowEffect;
    hoverArrow: TImage;
    hoverArrow_animation: TFloatAnimation;
    procedure FormShow(Sender: TObject);
    procedure campus_optionChange(Sender: TObject);
    procedure department_comboBoxChange(Sender: TObject);
    procedure professor_comboBoxChange(Sender: TObject);
    procedure findProfessor_buttonClick(Sender: TObject);
    procedure wubbenScience_buildingClick(Sender: TObject);
    procedure building_viewerDblClick(Sender: TObject);
    procedure reset_buttonClick(Sender: TObject);
    procedure return_buttonClick(Sender: TObject);
    procedure map_viewerResize(Sender: TObject);
    procedure building_viewerResize(Sender: TObject);
    procedure building_viewerPaint(Sender: TObject; Canvas: TCanvas;
      const ARect: TRectF);
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

procedure Tfind_professor_form.building_viewerPaint(Sender: TObject;
  Canvas: TCanvas; const ARect: TRectF);
begin
 if building_viewer.Width > building_viewer.Bitmap.Width then
  begin
    building_viewer.Width := building_viewer.Bitmap.Width ;
  end;
end;

procedure Tfind_professor_form.building_viewerResize(Sender: TObject);
begin
 if building_viewer.Width > building_viewer.Bitmap.Width then
  begin
    building_viewer.Width := building_viewer.Bitmap.Width ;
  end;
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
     //officeRoom : TImage;
      // roomGlow : TInnerGlowEffect;
  //glowAnimation : TFloatAnimation;
     HScrollBar : integer;
     VScrollBar : integer;
begin
    // DEBUG: Show's coordinates of top left corner of TImageViewer
    // ShowMessage('H: ' + floattostr(map_viewer.HScrollBar.Value) + 'V: ' + floattostr(map_viewer.VScrollBar.Value));

    // BEGIN: Lowell Heiny Hall
        if building_name.Text = 'Lowell Heiny Hall' then
      begin
        //officeRoom := TImage.Create(building_viewer);
        //officeRoom.Parent := building_viewer;
        officeRoom.Bitmap.LoadFromFile('maps/action_findProfessor/LHH/' + office_name.Text + '.png');

        map_viewer.HScrollBar.Value := 62;
        map_viewer.VScrollBar.Value := 371;
        lowellHeinyHall_glow.Enabled := true;
        hoverArrow.Position.X := 392;
        hoverArrow.Position.Y := 535;
        hoverArrow.Visible := true;
        hoverArrow_animation.Enabled := false;
        hoverArrow_animation.StartValue := hoverArrow.Position.Y;
        hoverArrow_animation.StopValue := hoverArrow.Position.Y - 40;
        hoverArrow_animation.Enabled := true;
        // Office_Name Format =  L  H  H  -  X  X  X  X
        //                      [1][2][3][4][5][6][7][8]
        if office_name.Text[5] = '1' then
        begin
         building_viewer.Bitmap.LoadFromFile('maps/action_findProfessor/LHH/1st_floor.png');
        end
        else if office_name.Text[5] = '2' then
        begin
         building_viewer.Bitmap.LoadFromFile('maps/action_findProfessor/LHH/2nd_floor.png');
        end
        else if office_name.Text[5] = '3' then
        begin
          building_viewer.Bitmap.LoadFromFile('maps/action_findProfessor/LHH/3rd_floor.png');
        end
        else if office_name.Text[5] = '4' then
        begin
          building_viewer.Bitmap.LoadFromFile('maps/action_findProfessor/LHH/4th_floor.png');
        end;


        if office_name.Text = 'LHH-439' then
        begin
          officeRoom.Height := 104;
          officeRoom.Width := 71;
          officeRoom.Position.X := 683;
          officeRoom.Position.Y := 83;
          HScrollBar := 371;
          VScrollBar := 0;
        end
        else if office_name.Text = 'LHH-456' then
        begin
          officeRoom.Height := 76;
          officeRoom.Width := 72;
          officeRoom.Position.X := 269;
          officeRoom.Position.Y := 84;
          HScrollBar := 13;
          VScrollBar := 0;
        end
        else if office_name.Text = 'LHH-451' then
        begin
          officeRoom.Height := 75;
          officeRoom.Width := 109;
          officeRoom.Position.X := 88;
          officeRoom.Position.Y := 238;
          HScrollBar := 13;
          VScrollBar := 0;
        end
        else if office_name.Text = 'LHH-437' then
        begin
          officeRoom.Height := 55;
          officeRoom.Width := 90;
          officeRoom.Position.X := 682;
          officeRoom.Position.Y := 233;
          HScrollBar := 371;
          VScrollBar := 0;
        end
        else if office_name.Text = 'LHH-436' then
        begin
          officeRoom.Height := 50;
          officeRoom.Width := 89;
          officeRoom.Position.X := 683;
          officeRoom.Position.Y := 185;
          HScrollBar := 371;
          VScrollBar := 0;
        end
        else if office_name.Text = 'LHH-440' then
        begin
          officeRoom.Height := 71;
          officeRoom.Width := 79;
          officeRoom.Position.X := 615;
          officeRoom.Position.Y := 87;
          HScrollBar := 371;
          VScrollBar := 0;
        end
        else if office_name.Text = 'LHH-450' then
        begin
          officeRoom.Height := 55;
          officeRoom.Width := 86;
          officeRoom.Position.X := 256;
          officeRoom.Position.Y := 230;
          HScrollBar := 0;
          VScrollBar := 0;
        end
        else if office_name.Text = 'LHH-428' then
        begin
          officeRoom.Height := 76;
          officeRoom.Width := 72;
          officeRoom.Position.X := 800;
          officeRoom.Position.Y := 476;
          HScrollBar := 371;
          VScrollBar := 198;
        end
        else if office_name.Text = 'LHH-431' then
        begin
          officeRoom.Height := 76;
          officeRoom.Width := 70;
          officeRoom.Position.X := 800;
          officeRoom.Position.Y := 336;
          HScrollBar := 371;
          VScrollBar := 58;
        end
        else if office_name.Text = 'LHH-433' then
        begin
          officeRoom.Height := 73;
          officeRoom.Width := 71;
          officeRoom.Position.X := 800;
          officeRoom.Position.Y := 200;
          HScrollBar := 371;
          VScrollBar := 0;
        end
        else if office_name.Text = 'LHH-453' then
        begin
          officeRoom.Height := 101;
          officeRoom.Width := 74;
          officeRoom.Position.X := 88;
          officeRoom.Position.Y := 96;
          HScrollBar := 0;
          VScrollBar := 0;
        end
        else if office_name.Text = 'LHH-454' then
        begin
          officeRoom.Height := 74;
          officeRoom.Width := 101;
          officeRoom.Position.X := 100;
          officeRoom.Position.Y := 84;
          HScrollBar := 0;
          VScrollBar := 0;
        end
        else if office_name.Text = 'LHH-432' then
        begin
          officeRoom.Height := 71;
          officeRoom.Width := 75;
          officeRoom.Position.X := 797;
          officeRoom.Position.Y := 267;
          HScrollBar := 371;
          VScrollBar := 0;
        end;


      end;
    // END: Lowell Heiny Hall

    // BEGIN: Wubben Science
    if building_name.Text = 'Wubben Science Building' then
      begin
        //officeRoom := TImage.Create(building_viewer);
        //officeRoom.Parent := building_viewer;
        officeRoom.Bitmap.LoadFromFile('maps/action_findProfessor/WS/' + office_name.Text + '.png');

        map_viewer.HScrollBar.Value := 27;
        map_viewer.VScrollBar.Value := 432;
        wubbenScience_glow.Enabled := true;

        hoverArrow.Position.X := 280;
        hoverArrow.Position.Y := 535;
        hoverArrow.Visible := true;
        hoverArrow_animation.Enabled := false;
        hoverArrow_animation.StartValue := hoverArrow.Position.Y;
        hoverArrow_animation.StopValue := hoverArrow.Position.Y - 40;
        hoverArrow_animation.Enabled := true;

        // Office_Name Format =  W  S  -  X  X  X  X
        //                      [1][2][3][4][5][6][7]
        if office_name.Text[4] = '1' then
        begin
         building_viewer.Bitmap.LoadFromFile('maps/action_findProfessor/WS/1st_floor.png');
        end
        else if office_name.Text[4] = '2' then
        begin
         building_viewer.Bitmap.LoadFromFile('maps/action_findProfessor/WS/2nd_floor.png');
        end
        else if office_name.Text[4] = '3' then
        begin
          building_viewer.Bitmap.LoadFromFile('maps/action_findProfessor/WS/3rd_floor.png');
        end;

        if office_name.Text = 'WS-134K' then
        begin
          officeRoom.Height := 65;
          officeRoom.Width := 85;
          officeRoom.Position.X := 1242;
          officeRoom.Position.Y := 664;
          HScrollBar := 1003;
          VScrollBar := 437;
        end
        else if office_name.Text = 'WS-119H' then
          begin
          officeRoom.Height := 45;
          officeRoom.Width := 66;
          officeRoom.Position.X := 1153;
          officeRoom.Position.Y := 918;
          HScrollBar := 903;
          VScrollBar := 636;
          end
        else if office_name.Text = 'WS-136A' then
          begin
          officeRoom.Height := 63;
          officeRoom.Width := 61;
          officeRoom.Position.X := 986;
          officeRoom.Position.Y := 796;
          HScrollBar := 722;
          VScrollBar := 763;
          end
        else if office_name.Text = 'WS-119J' then
          begin
          officeRoom.Height := 49;
          officeRoom.Width := 58;
          officeRoom.Position.X := 1211;
          officeRoom.Position.Y := 982;
          HScrollBar := 955;
          VScrollBar := 637;
          end
        else if office_name.Text = 'WS-119F' then
          begin
          officeRoom.Height := 50;
          officeRoom.Width := 57;
          officeRoom.Position.X := 1098;
          officeRoom.Position.Y := 981;
          HScrollBar := 844;
          VScrollBar := 637;
          end
        else if office_name.Text = 'WS-119G' then
          begin
          officeRoom.Height := 50;
          officeRoom.Width := 58;
          officeRoom.Position.X := 1155;
          officeRoom.Position.Y := 981;
          HScrollBar := 844;
          VScrollBar := 637;
          end
        else if office_name.Text = 'WS-119B' then
          begin
          officeRoom.Height := 49;
          officeRoom.Width := 57;
          officeRoom.Position.X := 930;
          officeRoom.Position.Y := 981;
          HScrollBar := 672;
          VScrollBar := 637;
          end
        else if office_name.Text = 'WS-136B' then
          begin
          officeRoom.Height := 59;
          officeRoom.Width := 60;
          officeRoom.Position.X := 929;
          officeRoom.Position.Y := 798;
          HScrollBar := 679;
          VScrollBar := 567;
          end
        else if office_name.Text = 'WS-119D' then
          begin
          officeRoom.Height := 44;
          officeRoom.Width := 63;
          officeRoom.Position.X := 1006;
          officeRoom.Position.Y := 919;
          HScrollBar := 746;
          VScrollBar := 633;
          end
        else if office_name.Text = 'WS-134A' then
          begin
          officeRoom.Height := 42;
          officeRoom.Width := 72;
          officeRoom.Position.X := 1451;
          officeRoom.Position.Y := 817;
          HScrollBar := 1089;
          VScrollBar := 633;
          end
        else if office_name.Text = 'WS-136E' then
          begin
          officeRoom.Height := 44;
          officeRoom.Width := 71;
          officeRoom.Position.X := 975;
          officeRoom.Position.Y := 668;
          HScrollBar := 716;
          VScrollBar := 425;
          end
        else if office_name.Text = 'WS-134H' then
          begin
          officeRoom.Height := 47;
          officeRoom.Width := 97;
          officeRoom.Position.X := 1366;
          officeRoom.Position.Y := 642;
          HScrollBar := 1089;
          VScrollBar := 444;
          end
        else if office_name.Text = 'WS-119C' then
          begin
          officeRoom.Height := 49;
          officeRoom.Width := 55;
          officeRoom.Position.X := 987;
          officeRoom.Position.Y := 982;
          HScrollBar := 719;
          VScrollBar := 631;
          end
        else if office_name.Text = 'WS-134E' then
          begin
          officeRoom.Height := 38;
          officeRoom.Width := 72;
          officeRoom.Position.X := 1451;
          officeRoom.Position.Y := 740;
          HScrollBar := 1089;
          VScrollBar := 526;
          end
        else if office_name.Text = 'WS-134L' then
          begin
          officeRoom.Height := 62;
          officeRoom.Width := 50;
          officeRoom.Position.X := 1193;
          officeRoom.Position.Y := 666;
          HScrollBar := 929;
          VScrollBar := 481;
          end
        else if office_name.Text = 'WS-119A' then
          begin
          officeRoom.Height := 63;
          officeRoom.Width := 53;
          officeRoom.Position.X := 931;
          officeRoom.Position.Y := 919;
          HScrollBar := 648;
          VScrollBar := 633;
          end
        else if office_name.Text = 'WS-134M' then
          begin
          officeRoom.Height := 62;
          officeRoom.Width := 47;
          officeRoom.Position.X := 1146;
          officeRoom.Position.Y := 666;
          HScrollBar := 876;
          VScrollBar := 455;
          end
        else if office_name.Text = 'WS-134A' then
          begin
          officeRoom.Height := 40;
          officeRoom.Width := 72;
          officeRoom.Position.X := 1451;
          officeRoom.Position.Y := 818;
          HScrollBar := 1089;
          VScrollBar := 627;
          end
        else if office_name.Text = 'WS-134B' then
          begin
          officeRoom.Height := 61;
          officeRoom.Width := 47;
          officeRoom.Position.X := 1384;
          officeRoom.Position.Y := 798;
          HScrollBar := 1089;
          VScrollBar := 627;
          end
        else if office_name.Text = 'WS-134G' then
          begin
          officeRoom.Height := 58;
          officeRoom.Width := 60;
          officeRoom.Position.X := 1463;
          officeRoom.Position.Y := 642;
          HScrollBar := 1089;
          VScrollBar := 434;
          end
        else if office_name.Text = 'WS-119K' then
          begin
          officeRoom.Height := 64;
          officeRoom.Width := 51;
          officeRoom.Position.X := 1218;
          officeRoom.Position.Y := 919;
          HScrollBar := 954;
          VScrollBar := 633;
          end
        else if office_name.Text = 'WS-136D' then
          begin
          officeRoom.Height := 65;
          officeRoom.Width := 46;
          officeRoom.Position.X := 929;
          officeRoom.Position.Y := 669;
          HScrollBar := 663;
          VScrollBar := 462;
          end
        else if office_name.Text = 'WS-134N' then
          begin
          officeRoom.Height := 62;
          officeRoom.Width := 55;
          officeRoom.Position.X := 1091;
          officeRoom.Position.Y := 666;
          HScrollBar := 825;
          VScrollBar := 460;
          end
        else if office_name.Text = 'WS-134F' then
          begin
          officeRoom.Height := 40;
          officeRoom.Width := 70;
          officeRoom.Position.X := 1452;
          officeRoom.Position.Y := 700;
          HScrollBar := 1089;
          VScrollBar := 467;
          end
        else if office_name.Text = 'WS-134J' then
          begin
          officeRoom.Height := 64;
          officeRoom.Width := 52;
          officeRoom.Position.X := 1332;
          officeRoom.Position.Y := 738;
          HScrollBar := 1067;
          VScrollBar := 516;
          end
        else if office_name.Text = 'WS-134C' then
          begin
          officeRoom.Height := 40;
          officeRoom.Width := 72;
          officeRoom.Position.X := 1451;
          officeRoom.Position.Y := 778;
          HScrollBar := 1089;
          VScrollBar := 564;
          end
        else if office_name.Text = 'WS-136C' then
          begin
          officeRoom.Height := 64;
          officeRoom.Width := 47;
          officeRoom.Position.X := 929;
          officeRoom.Position.Y := 734;
          HScrollBar := 654;
          VScrollBar := 523;
          end
        else if office_name.Text = 'WS-134D' then
          begin
          officeRoom.Height := 61;
          officeRoom.Width := 47;
          officeRoom.Position.X := 1384;
          officeRoom.Position.Y := 737;
          HScrollBar := 1089;
          VScrollBar := 535;
          end
        else if office_name.Text = 'WS-119E' then
          begin
          officeRoom.Height := 49;
          officeRoom.Width := 56;
          officeRoom.Position.X := 1042;
          officeRoom.Position.Y := 982;
          HScrollBar := 765;
          VScrollBar := 633;
          end;
    end;
    // END: Wubben Science

       building_viewer.HScrollBar.Value := HScrollBar;
       building_viewer.VScrollBar.Value := VScrollBar;

       // set Room Effects
       //roomGlow := TInnerGlowEffect.Create(officeRoom);
       //roomGlow.Parent := officeRoom;
       //roomGlow.Enabled := true;
       //roomGlow.GlowColor := $FF00008B; // Color - Dark Blue
       //roomGlow.Softness := 0.75;

       //glowAnimation := TFloatAnimation.Create(roomGlow);
       //glowAnimation.Parent := roomGlow;
       //glowAnimation.AutoReverse := true;
       //glowAnimation.Duration := 0.7;
       //glowAnimation.Loop := true;
       //glowAnimation.PropertyName := 'Opacity';
       //glowAnimation.StartValue := 1;
       //glowAnimation.StopValue := 0;
       //glowAnimation.Enabled := true;
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
    building_viewer.Visible := false;
    wubbenScience_glow.Enabled := false;
    lowellHeinyHall_glow.Enabled := false;
    legend.Bitmap.LoadFromFile('maps/action_findProfessor/legend.png');
    hoverArrow.Visible := false;
    legend.Height := 183;
    legend.Width := 262;
end;

procedure Tfind_professor_form.map_viewerResize(Sender: TObject);
begin
  if map_viewer.Width > 648 then
  begin
    map_viewer.Width := 648;
  end;
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
end;

procedure Tfind_professor_form.return_buttonClick(Sender: TObject);
begin
  find_professor_form.Hide();
end;

procedure Tfind_professor_form.wubbenScience_buildingClick(Sender: TObject);
begin
    map_viewer.Visible := false;
    building_viewer.Visible := true;
    legend.Bitmap.LoadFromFile('maps/action_findProfessor/building_legend.png');
    legend.Height := 272;
    legend.Width := 206;
end;

end.
