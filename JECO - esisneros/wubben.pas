unit wubben;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Rtti, System.Classes,
  System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.Objects,
  JECOMap, FMX.Layouts, FMX.ExtCtrls, FMX.Effects, FMX.Filter.Effects;

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
    procedure setLineVisibility(tf : boolean);
    procedure showPath(start, finish : String);
    procedure FormCreate(Sender: TObject);
    procedure ReturnClick(Sender: TObject);
    procedure ImageViewer1Resize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  wubbenScience: TwubbenScience;

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

  setLineVisibility(false);
end;

procedure TwubbenScience.ImageViewer1Resize(Sender: TObject);
begin
if imageviewer1.Width > 1222 then
imageviewer1.Width := 1222;

if imageviewer1.Height > 815 then
imageviewer1.Height := 815;

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
end;

procedure Twubbenscience.showPath(start, finish: String);
var i, j, index1, index2, startNum, finishNum, floor1Num, floor2Num : Integer;
    line1End, line4End, line2Bot, lineBot,
    prefix1, prefix2 : String;
begin

if (start = 'Choose A Room') or (finish = 'Choose A Room') then
begin
  showMessage('You must select a room to get directions to');
  //wubbenscience.Hide;
end
else
begin

start_label.Text := start;
end_label.Text := finish;

setLineVisibility(false);
Image2.Visible := false;

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

for j := 1 to index1 - 1 do
  prefix1 := prefix1 + start[j];

for j := 1 to index2 - 1 do
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

  if prefix1 = 'WS' then
  begin
    if prefix2 = 'WS' then
    begin
      showMessage('doing nothing yet');
      //showWubben(strToInt(start[index]), startNum);
       //implement multiple floors
    end
    else if prefix2 = 'HH' then
    begin
       line7.Visible := true;

    end;

  end
  else if prefix1 = 'HH' then
  begin
    if prefix2 = 'WS' then
    begin

    end
    else if prefix2 = 'H' then
    begin

    end;

  end;

end;

end;


end.
