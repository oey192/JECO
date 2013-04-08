unit wubben;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Rtti, System.Classes,
  System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.Objects,
  JECOMap;

type
  TwubbenScience = class(TForm)
    Image1: TImage;
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
    Button1: TButton;
    Image2: TImage;
    Image3: TImage;
    StyleBook1: TStyleBook;
    procedure hideLines;
    procedure showPath(start, finish : String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  wubbenScience: TwubbenScience;

implementation

{$R *.fmx}

procedure Twubbenscience.hideLines;
begin
  Line1.Visible := false;
  Line1.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line1.StrokeThickness := 5;
  Line2.Visible := false;
  Line2.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line2.StrokeThickness := 5;
  Line3.Visible := false;
  Line3.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line3.StrokeThickness := 5;
  Line4.Visible := false;
  Line4.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line4.StrokeThickness := 5;
  Line5.Visible := false;
  Line5.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line5.StrokeThickness := 5;
  Line6.Visible := false;
  Line6.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line6.StrokeThickness := 5;
  Line7.Visible := false;
  Line7.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line7.StrokeThickness := 5;
  Line8.Visible := false;
  Line8.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line8.StrokeThickness := 5;
  Line9.Visible := false;
  Line9.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line9.StrokeThickness := 5;
  Line10.Visible := false;
  Line10.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line10.StrokeThickness := 5;
  Line11.Visible := false;
  Line11.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line11.StrokeThickness := 5;
  Line12.Visible := false;
  Line12.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line12.StrokeThickness := 5;
  Line13.Visible := false;
  Line13.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line13.StrokeThickness := 5;
  Line14.Visible := false;
  Line14.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line14.StrokeThickness := 5;
  Line15.Visible := false;
  Line15.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line15.StrokeThickness := 5;
  Line16.Visible := false;
  Line16.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line16.StrokeThickness := 5;
  Line17.Visible := false;
  Line17.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line17.StrokeThickness := 5;
  Line18.Visible := false;
  Line18.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line18.StrokeThickness := 5;
  Line19.Visible := false;
  Line19.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line19.StrokeThickness := 5;
  Line20.Visible := false;
  Line20.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line20.StrokeThickness := 5;
  Line21.Visible := false;
  Line21.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line21.StrokeThickness := 5;
  Line22.Visible := false;
  Line22.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line22.StrokeThickness := 5;
  Line23.Visible := false;
  Line23.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line23.StrokeThickness := 5;
  Line24.Visible := false;
  Line24.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line24.StrokeThickness := 5;
  Line25.Visible := false;
  Line25.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line25.StrokeThickness := 5;
  Line26.Visible := false;
  Line26.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line26.StrokeThickness := 5;
  Line27.Visible := false;
  Line27.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line27.StrokeThickness := 5;
  Line28.Visible := false;
  Line28.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line28.StrokeThickness := 5;
  Line29.Visible := false;
  Line29.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line29.StrokeThickness := 5;
  Line30.Visible := false;
  Line30.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line30.StrokeThickness := 5;
  Line31.Visible := false;
  Line31.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line31.StrokeThickness := 5;
  Line32.Visible := false;
  Line32.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line32.StrokeThickness := 5;
  Line33.Visible := false;
  Line33.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line33.StrokeThickness := 5;
  Line33.Visible := false;
  Line33.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line33.StrokeThickness := 5;
  Line34.Visible := false;
  Line34.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line34.StrokeThickness := 5;
  Line35.Visible := false;
  Line35.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line35.StrokeThickness := 5;
  Line36.Visible := false;
  Line36.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line36.StrokeThickness := 5;
  Line37.Visible := false;
  Line37.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line37.StrokeThickness := 5;
  Line38.Visible := false;
  Line38.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line38.StrokeThickness := 5;
  Line39.Visible := false;
  Line39.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line39.StrokeThickness := 5;
  Line40.Visible := false;
  Line40.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line40.StrokeThickness := 5;
  Line41.Visible := false;
  Line41.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line41.StrokeThickness := 5;
  Line42.Visible := false;
  Line42.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line42.StrokeThickness := 5;
  Line43.Visible := false;
  Line43.Stroke.Color := TAlphaColorRec.Deepskyblue;
  Line43.StrokeThickness := 5;
end;

procedure Twubbenscience.showPath(start, finish: String);
var i, index, startNum, finishNum : Integer;
begin

hideLines;

index := -1;
for i := 1 to Length(finish) do
  if (finish[i] > '0') and (finish[i] < '9') and (index = -1) then
    index := i;

  if finish[index] = '1' then
    Image1.BringToFront
  else if finish[index] = '2' then
    Image2.BringToFront
  else if finish[index] = '3' then
    Image3.BringToFront;

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
end;

end.
