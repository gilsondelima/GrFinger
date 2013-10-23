{
 -------------------------------------------------------------------------------
 GrFinger Sample
 (c) 2005 - 2010 Griaule Biometrics Ltda.
 http://www.griaulebiometrics.com
 -------------------------------------------------------------------------------

 This sample is provided with "GrFinger Fingerprint Recognition Library" and
 can't run without it. It's provided just as an example of using GrFinger
 Fingerprint RecognitionGriaule Biometrics Library and should not be used as basis for any
 commercial product.

  makes no representations concerning either the merchantability
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
// Callback routines
// -----------------------------------------------------------------------------------

unit uCallbacks;

interface

uses GrFinger;

procedure StatusCallback(idSensor: Pchar; event: GRCAP_STATUS_EVENTS); stdcall;
procedure FingerCallback(idSensor: Pchar; event: GRCAP_FINGER_EVENTS); stdcall;
Procedure ImageCallback(idSensor: PChar; imageWidth: Integer; imageHeight: Integer; rawImage: PChar; res: Integer); stdcall;
function InitializeGrCap():Integer;

implementation

uses uMain, uUtil;

// Initialize capture library
function InitializeGrCap():Integer;
begin
  // Initializing GrCapture. Passing adress of the "StatusCallback" sub.
  InitializeGrCap := GrCapInitialize(@StatusCallback);
end;

// This sub is called evertime an status event is raised.
Procedure StatusCallback(idSensor: Pchar; event: GRCAP_STATUS_EVENTS); stdcall;
begin
  // Signals that a status event ocurred.
  WriteEvent(idSensor, event);
  // Checking if event raised is a plug or unplug.
  if (event = GR_PLUG) then
    // Start capturing from plugged sensor.
    GrCapStartCapture(idSensor, @FingerCallback, @ImageCallback)
  else if (event = GR_UNPLUG) then
    // Stop capturing from unplugged sensor.
    GrCapStopCapture(idSensor);
end;

// This Function is called every time a finger is placed or removed from sensor.
Procedure FingerCallback(idSensor: Pchar; event: GRCAP_FINGER_EVENTS); stdcall;
Begin
  // Just signals that a finger event ocurred.
  WriteEvent(idSensor, event);
End;

// This function is called every time a finger image is captured
Procedure ImageCallback(idSensor: PChar; imageWidth: Integer; imageHeight: Integer; rawImage: PChar; res: Integer); stdcall;
Begin
  // Copying aquired image
  raw.height := imageHeight;
  raw.width := imageWidth;
  raw.res := res;
  Move(rawImage^, raw.img^, imageWidth*imageHeight);

  // Signaling that an Image Event occurred.
  WriteEvent(idSensor, GR_IMAGE);

  // Display fingerprint image
  PrintBiometricDisplay(false, GR_DEFAULT_CONTEXT);

  // now we have a fingerprint, so we can extract template
  formMain.btEnroll.Enabled := false;
  formMain.btExtract.Enabled := true;
  formMain.btIdentify.Enabled := false;
  formMain.btVerify.Enabled := false;

  // extracting template from image.
  if formMain.ckAutoExtract.Checked then
  Begin
      formMain.btExtractClick(nil);
        // identify fingerprint
        if formMain.ckBoxAutoIdentify.Checked then
          formMain.btIdentifyClick(nil);
  End
  else
      formMain.btExtract.Enabled := true;

end;

end.
