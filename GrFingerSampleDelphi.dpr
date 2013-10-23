program GrFingerSampleDelphi;

uses
  Forms,
  uMain in 'uMain.pas' {formMain},
  uOptions in 'uOptions.pas' {formOptions},
  GrFinger in '..\..\..\include\delphi\GrFinger.pas',
  uDBClass in 'uDBClass.pas',
  uUtil in 'uUtil.pas',
  uCallbacks in 'uCallbacks.pas';

{$R *.res}

 begin
  Application.Initialize;
  Application.Title := 'GrFinger - Sample application - Delphi';
  Application.CreateForm(TformMain, formMain);
  Application.CreateForm(TformOptions, formOptions);
  Application.Run;
end.
