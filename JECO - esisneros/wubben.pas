unit wubben;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Rtti, System.Classes,
  System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.Objects,
  JECOMap, FMX.Layouts, FMX.ExtCtrls, FMX.Effects, FMX.Filter.Effects;

type
  TwubbenScience = class(TForm)
    Line1: TLine;
    Line2: TLine;
    Line3: TLine;
    Line4: TLine;
    Line5: TLine;
    Line6: TLine;
    Line7: TLine;
    Line8: TLine;
    Line9: TLine;
    Line10: TLine;
    Line11: TLine;
    Line12: TLine;
    Line13: TLine;
    Line14: TLine;
    Line15: TLine;
    Line16: TLine;
    Line17: TLine;
    Line18: TLine;
    Line19: TLine;
    Line20: TLine;
    Line21: TLine;
    Line22: TLine;
    Line23: TLine;
    Line24: TLine;
    Line25: TLine;
    Line26: TLine;
    Line27: TLine;
    Line28: TLine;
    Line29: TLine;
    Line30: TLine;
    Line31: TLine;
    Line32: TLine;
    Line33: TLine;
    Line34: TLine;
    Line35: TLine;
    Line36: TLine;
    Line37: TLine;
    Line38: TLine;
    Line39: TLine;
    Line40: TLine;
    Line41: TLine;
    Line42: TLine;
    Line43: TLine;
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
  Line16.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line16.StrokeThickness := 5;
  Line17.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line17.StrokeThickness := 5;
  Line18.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line18.StrokeThickness := 5;
  Line19.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line19.StrokeThickness := 5;
  Line20.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line20.StrokeThickness := 5;
  Line21.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line21.StrokeThickness := 5;
  Line22.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line22.StrokeThickness := 5;
  Line23.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line23.StrokeThickness := 5;
  Line24.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line24.StrokeThickness := 5;
  Line25.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line25.StrokeThickness := 5;
  Line26.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line26.StrokeThickness := 5;
  Line27.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line27.StrokeThickness := 5;
  Line28.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line28.StrokeThickness := 5;
  Line29.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line29.StrokeThickness := 5;
  Line30.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line30.StrokeThickness := 5;
  Line31.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line31.StrokeThickness := 5;
  Line32.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line32.StrokeThickness := 5;
  Line33.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line33.StrokeThickness := 5;
  Line34.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line34.StrokeThickness := 5;
  Line35.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line35.StrokeThickness := 5;
  Line36.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line36.StrokeThickness := 5;
  Line37.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line37.StrokeThickness := 5;
  Line38.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line38.StrokeThickness := 5;
  Line39.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line39.StrokeThickness := 5;
  Line40.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line40.StrokeThickness := 5;
  Line41.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line41.StrokeThickness := 5;
  Line42.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line42.StrokeThickness := 5;
  Line43.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line43.StrokeThickness := 5;
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
  Line8.Visible := tf;
  Line9.Visible := tf;
  Line10.Visible := tf;
  Line11.Visible := tf;
  Line12.Visible := tf;
  Line13.Visible := tf;
  Line14.Visible := tf;
  Line15.Visible := tf;
  Line16.Visible := tf;
  Line17.Visible := tf;
  Line18.Visible := tf;
  Line19.Visible := tf;
  Line20.Visible := tf;
  Line21.Visible := tf;
  Line22.Visible := tf;
  Line23.Visible := tf;
  Line24.Visible := tf;
  Line25.Visible := tf;
  Line26.Visible := tf;
  Line27.Visible := tf;
  Line28.Visible := tf;
  Line29.Visible := tf;
  Line30.Visible := tf;
  Line31.Visible := tf;
  Line32.Visible := tf;
  Line33.Visible := tf;
  Line34.Visible := tf;
  Line35.Visible := tf;
  Line36.Visible := tf;
  Line37.Visible := tf;
  Line38.Visible := tf;
  Line39.Visible := tf;
  Line40.Visible := tf;
  Line41.Visible := tf;
  Line42.Visible := tf;
  Line43.Visible := tf;
end;

procedure Twubbenscience.showPath(start, finish: String);
var i, index, startNum, finishNum : Integer;
begin

if (start = 'Choose A Room') or (finish = 'Choose A Room') then
  setLineVisibility(true)
else
begin

start_label.Text := start;
end_label.Text := finish;

setLineVisibility(false);

index := -1;
for i := 1 to Length(finish) do
  if (finish[i] > '0') and (finish[i] < '9') and (index = -1) then
    index := i;

  {if finish[index] = '1' then
    ImageViewer1.Bitmap.LoadFromFile('maps/action_findProfessor/WS/1st_floor.png')
  else if finish[index] = '2' then
    ImageViewer1.Bitmap.LoadFromFile('maps/action_findProfessor/WS/2nd_floor.png')
  else if finish[index] = '3' then
    ImageViewer1.Bitmap.LoadFromFile('maps/action_findProfessor/WS/3rd_floor.png');}

  //add code to make following apply to first floor only

  startNum := strToInt(start[index + 1] + start[index + 2]);
  finishNum := strToInt(finish[index + 1] + finish[index + 2]);

  if ((startNum > 10) and (finishNum < 10)) or ((finishNum > 10) and (startNum < 10)) then
  begin
    Line1.BringToFront;
    Line1.Visible := true;
  end;

  if ((startNum > 11) and (finishNum < 11)) or ((finishNum > 11) and (startNum < 11)) then
  begin
    Line2.BringToFront;
    Line2.Visible := true;
  end;

  if ((startNum = 12) and (finishNum <> 12)) or ((finishNum = 12) and (startNum <> 12)) or ((startNum = 14) and (finishNum <> 14)) or ((finishNum = 14) and (startNum <> 14)) then
  begin
    Line3.BringToFront;
    Line3.Visible := true;
  end;

  if ((startNum > 14) and (finishNum < 14)) or ((finishNum > 14) and (startNum < 14)) then
  begin
    Line4.BringToFront;
    Line4.Visible := true;
  end;

  if (((finishNum < 18) and (finishNum <> 15) and (finishNum <> 17)) and ((startNum = 17) or (startNum = 15))) or (((startNum < 18) and (startNum <> 15) and (startNum <> 17)) and ((finishNum = 17) or (finishNum = 15))) or (((startNum < 20) and (startNum <> 15) and (startNum <> 17)) and (finishNum > 20)) or (((finishNum < 20) and (finishNum <> 15) and (finishNum <> 17)) and (startNum > 20)) then
  begin
    Line5.BringToFront;
    Line5.Visible := true;
  end;

  if (((startNum = 16) or (startNum = 18) or (startNum = 20) or (startNum = 22)) and not((finishNum = 16) or (finishNum = 18) or (finishNum = 20) or (finishNum = 22))) or (((finishNum = 16) or (finishNum = 18) or (finishNum = 20) or (finishNum = 22)) and not((startNum = 16) or (startNum = 18) or (startNum = 20) or (startNum = 22))) then
  begin
    Line21.BringToFront;
    Line21.Visible := true;
  end;
end;

end;
end.
