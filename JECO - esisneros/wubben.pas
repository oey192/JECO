unit wubben;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Rtti, System.Classes,
  System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.Objects,
  JECOMap, FMX.Layouts, FMX.ExtCtrls, FMX.Effects, FMX.Filter.Effects, FMX.Ani;

type
  TwubbenScience = class(TForm)
    StyleBook1: TStyleBook;
    ImageViewer1: TImageViewer;
    Image1: TImage;
    Panel1: TPanel;
    Return: TButton;
    FillEffect1: TFillEffect;
    FindProfessor_Title: TLabel;
    ShadowEffect1: TShadowEffect;
    end_title: TLabel;
    ShadowEffect2: TShadowEffect;
    start_title: TLabel;
    ShadowEffect3: TShadowEffect;
    start_label: TLabel;
    end_label: TLabel;
    LineTransitionEffect1: TLineTransitionEffect;
    Line1: TLine;
    Line2: TLine;
    Line3: TLine;
    Line4: TLine;
    Line5: TLine;
    Line6: TLine;
    Line7: TLine;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Nextbutton1: TButton;
    Label2: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Image7: TImage;
    nextButton2: TButton;
    ImageViewer2: TImageViewer;
    campusView: TImageViewer;
    Line8: TLine;
    Image8: TImage;
    detailLegend: TImage;
    FloatAnimation1: TFloatAnimation;
    campusLegend: TImage;
    FloatAnimation2: TFloatAnimation;
    Panel4: TPanel;
    Line9: TLine;
    Line10: TLine;
    Line11: TLine;
    Image9: TImage;
    Image10: TImage;
    Image11: TImage;
    ImageViewer3: TImageViewer;
    Line12: TLine;
    Line13: TLine;
    Line14: TLine;
    nextButton3: TButton;
    Line15: TLine;
    Image12: TImage;
    Image13: TImage;
    Image14: TImage;
    Image15: TImage;
    Panel5: TPanel;
    Image16: TImage;
    Panel6: TPanel;
    procedure setLineVisibility(tf : boolean);
    procedure showPath(start, finish : String);
    procedure FormCreate(Sender: TObject);
    procedure ReturnClick(Sender: TObject);
    procedure ImageViewer1Resize(Sender: TObject);
    procedure campusViewResize(Sender: TObject);
    procedure Nextbutton1Click(Sender: TObject);
    procedure nextButton2Click(Sender: TObject);
    procedure final;
    procedure intermediate;
    procedure reallyFinal;
    procedure finalHelper(Sender: TObject);
    procedure reallyFinalHelper(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure nextButton3Click(Sender: TObject);
    procedure ImageViewer2Resize(Sender: TObject);
    procedure ImageViewer3Resize(Sender: TObject);
    procedure Image16Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  wubbenScience: TwubbenScience;
  finalDestNum : Integer;
  destBuilding : String;

implementation

{$R *.fmx}

procedure TwubbenScience.FormCreate(Sender: TObject);
begin
  Line1.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line1.StrokeThickness := 5;
  Line2.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line2.StrokeThickness := 5;
  Line3.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line3.StrokeThickness := 5;
  Line4.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line4.StrokeThickness := 5;
  Line5.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line5.StrokeThickness := 5;
  Line6.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line6.StrokeThickness := 5;
  Line7.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line7.StrokeThickness := 5;
  Line8.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line8.StrokeThickness := 5;
  Line9.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line9.StrokeThickness := 5;
  Line10.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line10.StrokeThickness := 5;
  Line11.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line11.StrokeThickness := 5;
  Line12.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line12.StrokeThickness := 5;
  Line13.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line13.StrokeThickness := 5;
  Line14.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line14.StrokeThickness := 5;
  Line15.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line15.StrokeThickness := 5;

  campusView.Visible := false;
  imageviewer2.Visible := false;
  imageviewer1.Visible := true;
  imageviewer1.BringToFront;
  detailLegend.BringToFront;
  finalDestNum := 0;

  setLineVisibility(false);
end;

procedure TwubbenScience.Image16Click(Sender: TObject);
begin
  intermediate;
end;

procedure TwubbenScience.Image2Click(Sender: TObject);
begin
  intermediate;
end;



procedure TwubbenScience.ImageViewer1Resize(Sender: TObject);
begin
if imageviewer1.Width > 1222 then
imageviewer1.Width := 1222;

if imageviewer1.Height > 815 then
imageviewer1.Height := 815;

end;

procedure TwubbenScience.ImageViewer2Resize(Sender: TObject);
begin
  if imageviewer2.Width > 966 then
    imageviewer2.Width := 966;
  if imageviewer2.Height > 660 then
    imageviewer2.Height := 660;
end;

procedure TwubbenScience.ImageViewer3Resize(Sender: TObject);
begin
  if imageviewer3.Height > 815 then
    imageviewer3.Height := 815;
  if imageviewer3.Width > 1212 then
    imageviewer3.Width := 1212;
end;

procedure TwubbenScience.Nextbutton1Click(Sender: TObject);
begin
  intermediate;
end;

procedure TwubbenScience.intermediate;
begin
  campusView.Visible := true;
  campusView.BringToFront;
  imageviewer1.Visible := false;
  imageviewer2.Visible := false;
  detailLegend.Visible := false;
  nextbutton2.BringToFront;
  campusLegend.Visible := true;
  campusLegend.BringToFront;

  campusView.HScrollBar.Value := 61;
  campusView.VScrollBar.Value := 500;

  wubbenscience.Caption := 'Main Campus';

  if destBuilding = 'HH' then
  begin
    image8.Visible := true;
    image15.Visible := false;
    Panel4.OnClick := finalHelper;
    Panel5.OnClick := nil;
  end
  else if destBuilding = 'WS' then
  begin
    image8.Visible := false;
    image15.Visible := true;
    Panel4.OnClick := nil;
    Panel5.OnClick := finalHelper;
  end;

end;

procedure TwubbenScience.nextButton2Click(Sender: TObject);
begin
   final;
end;


procedure TwubbenScience.nextButton3Click(Sender: TObject);
begin
  reallyFinal;
end;

procedure TwubbenScience.finalHelper(Sender: TObject);
begin
  final;
end;

procedure TwubbenScience.reallyFinalHelper(Sender: TObject);
begin
  reallyFinal;
end;


procedure twubbenscience.final;
begin
  campusLegend.Visible := false;
  detailLegend.Visible := true;
  campusView.Visible := false;

  nextbutton1.Visible := false;
  nextButton2.Visible := false;
  nextButton3.Visible := false;

  if destBuilding = 'HH' then
  begin
    imageviewer1.Visible := false;
    imageviewer2.Visible := true;
    imageviewer3.Visible := false;
    imageviewer2.BringToFront;

    line9.BringToFront;
    line10.BringToFront;
    line11.BringToFront;
    Image11.Visible := true;
    Image10.RotationAngle := 90;
    Image9.RotationAngle := 180;
    Image16.Visible := false;

    wubbenscience.Caption := 'Houston Hall';

    if (finalDestNum = 13) or (finalDestNum = 12) or (finalDestNum = 14) then
    begin

    end
    else if finalDestNum = 7 then
    begin
      imageviewer2.HScrollBar.Value := 342;
      imageviewer2.VScrollBar.Value := 65;
    end;
  end
  else if destBuilding = 'WS' then
  begin
    imageviewer1.Visible := true;
    imageviewer2.Visible := false;
    imageviewer3.Visible := false;

    wubbenscience.Caption := 'Wubben Science Building';

    imageviewer1.HScrollBar.Value := 500;
    imageviewer1.VScrollBar.Value := 250;

    line7.Visible := true;
    Image2.Visible := false;

    Image3.Position.X := 975;
    Image3.Position.Y := 631;
    Image3.RotationAngle := 270;
    Image3.Visible := true;


    if finalDestNum = 5 then
    begin
      Line1.Position.X := 294;
      Line15.Visible := true;
      image4.Position.X := 281;
      image4.Position.Y := 628;
      image4.RotationAngle := 0;
      image4.Visible := true;

      image5.Position.X := 278;
      image5.Position.Y := 600;
      image5.RotationAngle := 270;
      image5.Visible := true;

      nextButton3.Visible := true;
      nextButton3.BringToFront;

      Panel6.OnClick := reallyFinalHelper;

    end
    else if finalDestNum = 6 then
      Line1.Position.X := 215
    else if finalDestNum = 9 then
      Line1.Position.X := 253
    else if finalDestNum = 10 then
      Line1.Position.X := 294
    else if finalDestNum = 11 then
      Line1.Position.X := 357
    else if finalDestNum = 12 then
      Line1.Position.X := 378
    else if finalDestNum = 13 then
      Line1.Position.X := 376
    else if finalDestNum = 14 then
      Line1.Position.X := 397
    else if finalDestNum = 15 then
      Line1.Position.X := 558
    else if finalDestNum = 16 then
      Line1.Position.X := 520
    else if finalDestNum = 17 then
      Line1.Position.X := 580
    else if finalDestNum = 18 then
      Line1.Position.X := 518
    else if finalDestNum = 19 then
      Line1.Position.X := 824
    else if finalDestNum = 20 then
    begin
      Line1.Position.X := 658;
    end
    else if finalDestNum = 22 then
      Line1.Position.X := 658;

    Line1.Width := 984 - Line1.Position.X;
      Line1.Visible := true;


  end;

  detailLegend.BringToFront;

end;

procedure Twubbenscience.reallyFinal;
begin
    imageviewer1.Visible := false;
    imageviewer2.Visible := false;
    campusView.Visible := false;
   imageviewer3.visible := true;

   imageviewer3.BringToFront;

   imageviewer3.HScrollBar.Value := 0;
   imageviewer3.VScrollBar.Value := 400;

   nextButton1.Visible := false;
   nextbutton2.Visible := false;
   nextbutton3.Visible := false;
   campusLegend.Visible := false;
   detailLegend.Visible := true;
   detailLegend.BringToFront;
end;

procedure TwubbenScience.campusViewResize(Sender: TObject);
begin
  if campusView.Width > 660 then
    campusView.Width := 660;

  if campusView.Height > 1152 then
    campusView.Height := 1152;

end;

procedure TwubbenScience.ReturnClick(Sender: TObject);
begin
wubbenscience.Hide;
end;

procedure Twubbenscience.setLineVisibility(tf : boolean);
begin
  Line1.Visible := tf;
  Line2.Visible := tf;
  Line3.Visible := tf;
  Line4.Visible := tf;
  Line5.Visible := tf;
  Line6.Visible := tf;
  Line7.Visible := tf;
  Line15.Visible := tf;
end;

procedure Twubbenscience.showPath(start, finish: String);
var i, j, index1, index2, startNum, finishNum, floor1Num, floor2Num : Integer;
    line1End, line4End, line2Bot, lineBot,
    prefix1, prefix2 : String;
begin

start_label.Text := start;
end_label.Text := finish;

setLineVisibility(false);
Image2.Visible := false;
Image3.Visible := false;
Image4.Visible := false;
Image5.Visible := false;
Image6.Visible := false;

nextbutton1.Visible := false;
nextButton2.Visible := false;

panel6.OnClick := nil;

campusView.Visible := false;
imageviewer2.Visible := false;
imageviewer3.Visible := false;
imageviewer1.Visible := true;
imageviewer1.BringToFront;


index1 := -1;
index2 := -1;
prefix1 := '';
prefix2 := '';
for i := 1 to Length(start) do
  if (start[i] > '0') and (start[i] < '9') and (index1 = -1) then
    index1 := i;

for i := 1 to Length(finish) do
  if (finish[i] > '0') and (finish[i] < '9') and (index2 = -1) then
    index2 := i;

for j := 1 to index1 - 2 do
  prefix1 := prefix1 + start[j];

for j := 1 to index2 - 2 do
  prefix2 := prefix2 + finish[j];

  {if finish[index] = '1' then
    ImageViewer1.Bitmap.LoadFromFile('maps/action_findProfessor/WS/1st_floor.png')
  else if finish[index] = '2' then
    ImageViewer1.Bitmap.LoadFromFile('maps/action_findProfessor/WS/2nd_floor.png')
  else if finish[index] = '3' then
    ImageViewer1.Bitmap.LoadFromFile('maps/action_findProfessor/WS/3rd_floor.png');}

  //add code to make following apply to first floor only

  startNum := strToInt(start[index1 + 1] + start[index1 + 2]);
  finishNum := strToInt(finish[index2 + 1] + finish[index2 + 2]);
  floor1Num := strToInt(start[index1]);
  floor2Num := strToInt(finish[index2]);

  finalDestNum := finishNum;

  //showMessage('floor1Num: ' + inttostr(floor1Num) + ' pref1: ' + prefix1 + ' pref2: ' + prefix2);

  if prefix1 = 'WS' then
  begin
    wubbenscience.Caption := 'Wubben Science Building';
    imageviewer1.Visible := true;
    campusView.Visible := false;
    imageviewer2.Visible := false;
    imageviewer1.BringToFront;
    if prefix2 = 'WS' then
    begin
      //showMessage('doing nothing yet');
      //showWubben(strToInt(start[index]), startNum);
       //implement multiple floors
    end
    else if prefix2 = 'HH' then
    begin
      destBuilding := 'HH';
       line7.Visible := true;
       Image2.Position.Y := 717;
       Image2.Position.X := 977;
       Image2.RotationAngle := 180;
       Image2.Visible := true;

       nextButton1.Visible := true;
       nextButton2.Visible := true;
       nextButton1.BringToFront;

       if floor1Num = 1 then
       begin
           if startNum > 45 then
           begin
              Line4.Visible := true;
              Line3.Visible := true;
              Line1.Visible := true;
              Line1.Position.X := 769;
              Line1.Width := 217;
              Image3.Position.X := 975;
              Image3.Position.Y := 631;
              Image3.RotationAngle := 90;
              Image3.Visible := true;

              Image4.Position.Y := 627;
              Image4.Position.X := 760;
              Image4.RotationAngle := 180;
              Image4.Visible := true;

              Image5.Position.X := 758;
              Image5.Position.Y := 188;
              Image5.RotationAngle := 90;
              Image5.Visible := true;

              if startNum = 63 then
              begin
                imageviewer1.HScrollBar.Value := 0;
                imageviewer1.VScrollBar.Value := 0
              end
              else if startNum = 62 then
              begin
                  Line5.Position.Y := 198;
                  Line5.Height := 38;
                  Line5.Visible := true;

                  Image6.Position.X := 114;
                  Image6.Position.Y := 190;
                  Image6.RotationAngle := 0;
                  Image6.Visible := true;

                  imageviewer1.HScrollBar.Value := 0;
                  imageviewer1.VScrollBar.Value := 0
              end
              else if startNum = 61 then
              begin
                  Line5.Position.Y := 160;
                  Line5.Height := 38;
                  Line5.Visible := true;

                  Image6.Position.X := 114;
                  Image6.Position.Y := 185;
                  Image6.RotationAngle := 180;
                  Image6.Visible := true;

                  imageviewer1.HScrollBar.Value := 0;
                  imageviewer1.VScrollBar.Value := 0
              end
              else if startNum = 60 then
              begin
                  Line5.Position.Y := 168;
                  Line5.Height := 30;
                  Line5.Visible := true;

                  Image6.Position.X := 114;
                  Image6.Position.Y := 185;
                  Image6.RotationAngle := 180;
                  Image6.Visible := true;

                  imageviewer1.HScrollBar.Value := 0;
                  imageviewer1.VScrollBar.Value := 0
              end
              else if startNum = 57 then
              begin
                Line4.Position.X := 298;
                Line4.Width := 471;
              end
              else if startNum = 56 then
              begin
                Line4.Position.X := 336;
                Line4.Width := 433;
              end
              else if startNum = 55 then
              begin
                Line4.Position.X := 435;
                Line4.Width := 334;
              end
              else if (startNum = 54) or (startNum = 53) then
              begin
                Line4.Position.X := 461;
                Line4.Width := 308;
              end
              else if startNum = 52 then
              begin
                Line4.Position.X := 603;
                Line4.Width := 166;
              end
              else if startNum = 50 then
              begin
                Line4.Position.X := 635;
                Line4.Width := 134;
              end
              else if startNum = 49 then
              begin
                Line4.Position.X := 592;
                Line4.Width := 177;
              end
              else if startNum = 48 then
              begin
                Line4.Position.X := 708;
                Line4.Width := 61;
              end
              else if startNum = 47 then
              begin
                Line4.Visible := false;
                Image5.Visible := false;
              end
              else if startNum = 46 then
              begin
                Line4.Position.X := 728;
                Line4.Width := 41;
              end;



           end
           else if startNum > 35 then
           begin
              Line3.Visible := true;
              Line1.Visible := true;
              Line1.Position.X := 769;
              Line1.Width := 217;
              Image3.Position.X := 975;
              Image3.Position.Y := 631;
              Image3.RotationAngle := 90;
              Image3.Visible := true;

              Image4.Position.Y := 627;
              Image4.Position.X := 760;
              Image4.RotationAngle := 180;
              Image4.Visible := true;

              if startNum = 44 then
                Line3.Position.Y := 296
              else if startNum = 43 then
                Line3.Position.Y := 242
              else if startNum = 41 then
                Line3.Position.Y := 283;

              Line3.Height := 640 - Line3.Position.Y;
           end
           else if startNum = 34 then
           begin

           end
           else if startNum = 31 then
           begin

           end
           else
           begin
              Image3.Position.X := 975;
              Image3.Position.Y := 631;
              Image3.RotationAngle := 90;
              Image3.Visible := true;
              Line1.Visible := true;

              if startNum = 6 then
                Line1.Position.X := 215
              else if startNum = 9 then
                Line1.Position.X := 253
              else if startNum = 10 then
                Line1.Position.X := 294
              else if startNum = 11 then
                Line1.Position.X := 357
              else if startNum = 12 then
                Line1.Position.X := 378
              else if startNum = 13 then
                Line1.Position.X := 376
              else if startNum = 14 then
                Line1.Position.X := 397
              else if startNum = 15 then
                Line1.Position.X := 558
              else if startNum = 16 then
                Line1.Position.X := 520
              else if startNum = 17 then
                Line1.Position.X := 580
              else if startNum = 18 then
                Line1.Position.X := 518
              else if startNum = 19 then
                Line1.Position.X := 824
              else if startNum = 20 then
              begin
                Line1.Position.X := 658;
                imageviewer1.HScrollBar.Value := 391;
                imageviewer1.VScrollBar.Value := 264;
              end
              else if startNum = 22 then
                Line1.Position.X := 658;


              Line1.Width := 982 - Line1.Position.X;
           end;
       end;
    end;

  end
  else if prefix1 = 'HH' then
  begin
    wubbenscience.Caption := 'Houston Hall';
    imageviewer1.Visible := false;
    campusView.Visible := false;
    imageviewer2.Visible := true;
    imageviewer2.BringToFront;
    if prefix2 = 'WS' then
    begin
      destBuilding := 'WS';
      nextButton1.Visible := true;
      nextButton2.Visible := true;
      nextButton3.Visible := true;
      nextButton1.BringToFront;

      imageviewer2.HScrollBar.Value := 342;
      imageviewer2.VScrollBar.Value := 65;

      Image11.Visible := false;
      Image10.RotationAngle := 270;
      Image9.RotationAngle := 0;
      Image16.Visible := true;

    end
    else if prefix2 = 'HH' then
    begin

    end;

  end;

  detailLegend.Visible := true;
  detailLegend.BringToFront;

end;


end.
