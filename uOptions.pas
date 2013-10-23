{
 -------------------------------------------------------------------------------
 GrFinger Sample
 (c) 2005 - 2010 Griaule Biometrics Ltda.
 http://www.griaulebiometrics.com
 -------------------------------------------------------------------------------

 This sample is provided with "GrFinger Fingerprint Recognition Library" and
 can't run without it. It's provided just as an example of using GrFinger
 Fingerprint Recognition Library and should not be used as basis for any
 commercial product.

 Griaule Biometrics makes no representations concerning either the merchantability
 of this software or the suitability of this sample for any particular purpose.

 THIS SAMPLE IS PROVIDED BY THE AUTHOR "AS IS" AND ANY EXPRESS OR
 IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 IN NO EVENT SHALL GRIAULE BE LIABLE FOR ANY DIRECT, INDIRECT,
 INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

 You can download the trial version of GrFinger directly from Griaule website.
                                                                   
 These notices must be retained in any copies of any part of this
 documentation and/or sample.

 -------------------------------------------------------------------------------
}

// -----------------------------------------------------------------------------------
// GUI routines: "Options" form
// -----------------------------------------------------------------------------------

unit uOptions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, GrFinger, uUtil, ExtCtrls;

type
  TformOptions = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    editIdentThres: TEdit;
    editIdentRotTol: TEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    editVerifyThres: TEdit;
    editVerifyRotTol: TEdit;
    btOk: TButton;
    btCancel: TButton;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    shMinutiaeColor: TShape;
    shMinutiaeColorMatched: TShape;
    cbShowMinutiaeReg: TCheckBox;
    cbShowMinutiaeMatch: TCheckBox;
    Label11: TLabel;
    GroupBox4: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    shSegmentColor: TShape;
    shSegmentColorMatched: TShape;
    Label9: TLabel;
    cbShowSegmentReg: TCheckBox;
    cbShowSegmentMatch: TCheckBox;
    GroupBox5: TGroupBox;
    Label10: TLabel;
    Label12: TLabel;
    shDirectionColor: TShape;
    shDirectionColorMatched: TShape;
    Label13: TLabel;
    cbShowDirectionReg: TCheckBox;
    cbShowDirectionMatch: TCheckBox;
    ColorDialog1: TColorDialog;
    procedure btCancelClick(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure shMinutiaeColorMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure shMinutiaeColorMatchedMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure shSegmentColorMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure shSegmentColorMatchedMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure shDirectionColorMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure shDirectionColorMatchedMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure AcceptChanges();
    procedure setParameters(thresholdId, rotationMaxId, thresholdVr, rotationMaxVr: Integer);
    function getParameters(var thresholdId, rotationMaxId, thresholdVr, rotationMaxVr,
                        minutiaeColor, minutiaeMatchColor, segmentsColor, segmentsMatchColor,
                        directionsColor, directionsMatchColor: Integer): boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formOptions: TformOptions;
  clMinutiaeColor: TColor;
  clMinutiaeMatchColor: TColor;
  clSegmentColor: TColor;
  clSegmentMatchColor: TColor;
  clDirectionColor: TColor;
  clDirectionMatchColor: TColor;
  bShowMinutiae: boolean;
  bShowMinutiaeMatch: boolean;
  bShowSegments: boolean;
  bShowSegmentsMatch: boolean;
  bShowDirection: boolean;
  bShowDirectionMatch: boolean;
  initialized: boolean;
  okpressed: boolean;

implementation

{$R *.dfm}

// Commit changes made by user
procedure TFormOptions.AcceptChanges();
begin
  clMinutiaeColor := shMinutiaeColor.Brush.Color;
  clMinutiaeMatchColor := shMinutiaeColorMatched.Brush.Color;
  clSegmentColor := shSegmentColor.Brush.Color;
  clSegmentMatchColor := shSegmentColorMatched.Brush.Color;
  clDirectionColor := shDirectionColor.Brush.Color;
  clDirectionMatchColor := shDirectionColorMatched.Brush.Color;
  bShowMinutiae := cbShowMinutiaeReg.Checked;
  bShowMinutiaeMatch := cbShowMinutiaeMatch.Checked;
  bShowSegments := cbShowSegmentReg.Checked;
  bShowSegmentsMatch := cbShowSegmentMatch.Checked;
  bShowDirection := cbShowDirectionReg.Checked;
  bShowDirectionMatch := cbShowDirectionMatch.Checked;
End;

// Set current values of threshold and rotation for verification and identification
procedure TformOptions.setParameters(thresholdId, rotationMaxId, thresholdVr, rotationMaxVr: Integer);
begin;
  editIdentThres.Text := IntToStr(thresholdId);
  editIdentRotTol.Text := IntToStr(rotationMaxId);
  editVerifyThres.Text := IntToStr(thresholdVr);
  editVerifyRotTol.Text := IntToStr(rotationMaxVr);
end;

function TformOptions.getParameters(var thresholdId, rotationMaxId, thresholdVr, rotationMaxVr,
                        minutiaeColor, minutiaeMatchColor, segmentsColor, segmentsMatchColor,
                        directionsColor, directionsMatchColor: Integer): boolean;
begin
  ShowModal();
  if not okpressed then begin
    getParameters := false;
    Exit;
  end;
  // convert threshold and rotation values
  thresholdId := StrToInt(editIdentThres.Text);
  rotationMaxId := StrToInt(editIdentRotTol.Text);
  thresholdVr := StrToInt(editVerifyThres.Text);
  rotationMaxVr := StrToInt(editVerifyRotTol.Text);
  // get colors
  minutiaeColor := shMinutiaeColor.Brush.Color;
  minutiaeMatchColor := shMinutiaeColorMatched.Brush.Color;
  segmentsColor := shSegmentColor.Brush.Color;
  segmentsMatchColor := shSegmentColorMatched.Brush.Color;
  directionsColor := shDirectionColor.Brush.Color;
  directionsMatchColor := shDirectionColorMatched.Brush.Color;
  // check if anything should not be displayed
  if not(cbShowMinutiaeReg.Checked) then minutiaeColor := GR_IMAGE_NO_COLOR;
  if not(cbShowMinutiaeMatch.Checked) then minutiaeMatchColor := GR_IMAGE_NO_COLOR;
  if not(cbShowSegmentReg.Checked) then segmentsColor := GR_IMAGE_NO_COLOR;
  if not(cbShowSegmentMatch.Checked) then segmentsMatchColor := GR_IMAGE_NO_COLOR;
  if not(cbShowDirectionReg.Checked) then directionsColor := GR_IMAGE_NO_COLOR;
  if not(cbShowDirectionMatch.Checked) then directionsMatchColor := GR_IMAGE_NO_COLOR;
  getParameters := true;
end;

// Flag that user pressed the "Cancel" button and close dialog
procedure TformOptions.btCancelClick(Sender: TObject);
begin
  okpressed := false;
  Self.Close();
end;

// Flag that user pressed the "OK" button and close dialog
procedure TformOptions.btOkClick(Sender: TObject);
begin
  okpressed := true;
  Self.Close();
end;

// Set current values in GUI
procedure TformOptions.FormShow(Sender: TObject);
begin
  // if not initialized, get initial values
  if not initialized then AcceptChanges();
  // set current values in GUI
  shMinutiaeColor.Brush.Color := clMinutiaeColor;
  shMinutiaeColorMatched.Brush.Color := clMinutiaeMatchColor;
  shSegmentColor.Brush.Color := clSegmentColor;
  shSegmentColorMatched.Brush.Color := clSegmentMatchColor;
  shDirectionColor.Brush.Color := clDirectionColor;
  shDirectionColorMatched.Brush.Color := clDirectionMatchColor;
  cbShowMinutiaeReg.Checked := bShowMinutiae;
  cbShowMinutiaeMatch.Checked := bShowMinutiaeMatch;
  cbShowSegmentReg.Checked := bShowSegments;
  cbShowSegmentMatch.Checked := bShowSegmentsMatch;
  cbShowDirectionReg.Checked := bShowDirection;
  cbShowDirectionMatch.Checked := bShowDirectionMatch;
  // flag as already initialized
  initialized := false;
end;

// display color dialog and set minutiae color
procedure TformOptions.shMinutiaeColorMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
        if ssDouble in Shift then begin
           ColorDialog1.Color := shMinutiaeColor.Brush.Color;
           if ColorDialog1.Execute then shMinutiaeColor.Brush.Color := ColorDialog1.Color;
        end
end;

// display color dialog and set matching minutiae color
procedure TformOptions.shMinutiaeColorMatchedMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
        if ssDouble in Shift then begin
           ColorDialog1.Color := shMinutiaeColorMatched.Brush.Color;
           if ColorDialog1.Execute then shMinutiaeColorMatched.Brush.Color := ColorDialog1.Color;
        end
end;

// display color dialog and set segments color
procedure TformOptions.shSegmentColorMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
        if ssDouble in Shift then begin
           ColorDialog1.Color := shSegmentColor.Brush.Color;
           if ColorDialog1.Execute then shSegmentColor.Brush.Color := ColorDialog1.Color;
        end
end;

// display color dialog and set matching segments color
procedure TformOptions.shSegmentColorMatchedMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
        if ssDouble in Shift then begin
           ColorDialog1.Color := shSegmentColorMatched.Brush.Color;
           if ColorDialog1.Execute then shSegmentColorMatched.Brush.Color := ColorDialog1.Color;
        end
end;

// display color dialog and set directions color
procedure TformOptions.shDirectionColorMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
        if ssDouble in Shift then begin
           ColorDialog1.Color := shDirectionColor.Brush.Color;
           if ColorDialog1.Execute then shDirectionColor.Brush.Color := ColorDialog1.Color;
        end
end;

// display color dialog and set matching directions color
procedure TformOptions.shDirectionColorMatchedMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
        if ssDouble in Shift then begin
           ColorDialog1.Color := shDirectionColorMatched.Brush.Color;
           if ColorDialog1.Execute then shDirectionColorMatched.Brush.Color := ColorDialog1.Color;
        end
end;

end.
