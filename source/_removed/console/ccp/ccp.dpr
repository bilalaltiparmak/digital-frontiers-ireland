program ccp;
{
  Ivan Malone
  Digital Frontiers Ireland
  Date: 29/08/2012

  Email: info@digitalfrontiersireland.com
    Web: http://www.digitalfrontiersireland.com

This software and its code are offered under the
GNU General Public License (gpl) version 3 or above.

See http://www.gnu.org/copyleft/gpl.html
}

{Todo List
    TODO: Logic for copying/moving files is not correct
    TODO: Improve file copy procedure
    TODO: Improve file move procedure
    TODO: Provide better paramater checking
    TODO: Provide more options for controling behaviour
    TODO: Add capability to copy/cut from multiple locations
    TODO: Add file and directory mask capability
    TODO: Add recursion for file search masks etc
    TODO: Add capability to do multiple cut or copies in one operation
    TODO: Add capability to keep building a cut/copy list without
          overwriting previous data, ie: not cleared unless -clear
          is called
    TODO: Better error checking
    TODO: Make it easier to view manipulate list of files
    TODO: Paste TO location, instead of current directory

}
{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils, Classes, IdHashMessageDigest;


type TActionToTake        =     (aNone, aCopy, aCut, aPaste, aClear);

Const
     CCP_FILELIST         =     'ccp_filelist.txt';


function MD5(const fileName : string) : string;
 var
   idmd5 : TIdHashMessageDigest5;
   fs : TFileStream;
 begin
   idmd5 := TIdHashMessageDigest5.Create;
   fs := TFileStream.Create(fileName, fmOpenRead OR fmShareDenyWrite) ;
   try
     result := IDMD5.HashStreamAsHex(fs);
   finally
     fs.Free;
     idmd5.Free;
   end;
 end;

Procedure CopyFile( Const sourcefilename, targetfilename: String );
Var
  S, T: TFileStream;
Begin
  S := TFileStream.Create( sourcefilename, fmOpenRead );
  try
    T := TFileStream.Create( targetfilename,
                             fmOpenWrite or fmCreate );
    try
      T.CopyFrom(S, S.Size ) ;
    finally
      T.Free;
    end;
  finally
    S.Free;
  end;
End;

PROCEDURE ShowHelp();
Begin
WriteLn('CCP by Ivan Malone (ivanm@digitalfrontiersireland.com)');
WriteLn('');
WriteLn('This program is licensed under the terms of the GNU GPL v3');
WriteLn('See http://www.gnu.org/licenses/gpl-3.0.html for further details');
WriteLn('');
WriteLn('   Email: support@digitalfrontiersireland.com');
WriteLn('     WWW: www.digitalfrontiersireland.com');
WriteLn('');
WriteLn('Cut, Copy, Paste is a basic file copy/move utility');
WriteLn('');
WriteLn('Usage: ');
WriteLn('     Copying: ' + ExtractFileName(paramstr(0)) + ' -copy file1 file2 file3 etc');
WriteLn('      Moving: ' + ExtractFileName(paramstr(0)) + ' -cut file1 file2 file3 etc');
WriteLn('');
WriteLn('     Pasting: ' + ExtractFileName(paramstr(0)) + ' -paste');
WriteLn('');
WriteLn('File masks are not yet supported');
WriteLn('Only files in the current directory can be added for cut or copy');
WriteLn('');
WriteLn('Type ' + ExtractFileName(paramstr(0)) + ' -clear to clear history');



End;

PROCEDURE CopyFiles(Var aFileList : TStringList);
Var
  i           :     integer;
  MD1, MD2    :     string;
  Failed      :     TStringList;
  Count       :     integer;
Begin
Count := 0;
Failed := TStringList.Create;
Failed.Clear;

for i := 1 to aFileList.Count -1 do
  Begin
  // if file doesn't exist at location
  if NOT FileExists(includetrailingpathdelimiter(GetCurrentDir) + ExtractFileName(aFileList.Strings[i])) then
     Begin
     // check source file exists
     if NOT FileExists(aFileList.Strings[i]) then
        Begin
        // Source file missing
        WriteLn('Missing file: ' + aFileList.Strings[i]);
        Failed.Add(aFileList.Strings[i]);
        End
     ELSE
        Begin
        // Source File Exists

        // check destination
        if FileExists(includetrailingpathdelimiter(GetCurrentDir) + ExtractFileName(aFileList.Strings[i])) then
           Begin
           // file already exists at location
           WriteLn('File already exists');
           Failed.Add(aFileList.Strings[i]);
           End
        ELSE
           Begin
           // Notify user about to copy
           WriteLn(IntToStr(i) + ': Copying: ' + ExtractFileName(aFileList.Strings[i]));
          // copy file
           CopyFile(aFileList.Strings[i],includetrailingpathdelimiter(GetCurrentDir) + ExtractFileName(aFileList.Strings[i]));
           WriteLn(IntToStr(i) + ': Copied: ' + ExtractFileName(aFileList.Strings[i]));

           // Get MD5 Has of Before and After
           MD1 := MD5(aFileList.Strings[i]);
           MD2 := MD5(includetrailingpathdelimiter(GetCurrentDir) + ExtractFileName(aFileList.Strings[i]));

           End;



//        WriteLn('Source MD5: ' + MD1 + ' - Destination MD5: ' + MD2);

     // Compare them
     if (MD1 <> MD2) OR (NOT FileExists(includetrailingpathdelimiter(GetCurrentDir) + ExtractFileName(aFileList.Strings[i]))) then
        Begin
          WriteLn(IntToStr(i) + ': Failed to copy file successfully');
          WriteLn(IntToStr(i) + ': MD5 Check: Before(' + MD1 + '), After(' + MD2 + ')');
          Failed.Add(aFileList.Strings[i]);
        End
     ELSE
        Begin
        // Increase success count
        Inc(Count,1);
        End;
     End;
  End;
  End; // END FOR
WriteLn('');
WriteLn('Copied: ' + IntToStr(Count));
if Failed.Count > 0 then
   Begin
   WriteLn('Failed: ' + IntToStr(Failed.Count));
   End;

Failed.Free;
End;

PROCEDURE MoveFiles(Var aFileList : TStringList);
Var
  i : integer;
Begin
CopyFiles(aFileList);
for i := 1 to aFileList.Count -1 do
Begin
   Try
      Begin
      WriteLn('Removing: ' + aFileList.Strings[i]);
      DeleteFile(aFileList.Strings[i]);
      End;
   except
    Begin
    WriteLn('Something went wrong while trying to remove a file ' + aFileList.Strings[i]);
    End;
  End;
End;

End;


PROCEDURE ProcessCommandLine();
Var
  i       :     integer;
  j       :     integer;
  aAction :     TActionToTake;
  FileList:     TStringList;
  Skipped :     TStringList;
Begin
aAction := aNone;
FileList := TStringList.Create;
Skipped := TStringList.Create;

// Check for supported switch
for i := 1 to ParamCount do
     Begin
     if LowerCase(ParamStr(i)) = '-cut' then
        Begin
          // Cut
          aAction := aCut;
          Break;
        End;

     if LowerCase(ParamStr(i)) = '-copy' then
        Begin
          // Copy
          aAction := aCopy;
          Break;
        End;

     if LowerCase(ParamStr(i)) = '-paste' then
        Begin
        // Paste
        aAction := aPaste;
        Break;
        End;

     if LowerCase(ParamStr(i)) = '-clear' then
        Begin
        // Clear
        aAction := aClear;
        WriteLn('Clearing history file');
        if aAction = aClear then DeleteFile(includetrailingpathdelimiter(ExtractFilePath(ParamStr(0))) + CCP_FILELIST);
        Exit;
        End;
     End;
// by now, some action should have been chosen
if aAction = aNone then
   Begin
   // No action was chosen or incorrect command line argument,
   // so show the user some help and exit;
   WriteLn('One or more Incorrect Arguments supplied, see help');
   Exit;
   End
else
   Begin
   // some action was chosen
   // i contains the position of the argument specifid on the command line
   // so we know we can ignore that when reading the rest of the switches
   // from the command line


   // check if enough paramaters are entered
   if (ParamCount <= 1) then
      Begin
      // check if paste is an action
      if aAction <> aPaste then
         Begin
         // Looks like not enough arguments are supplied (such as files)
         WriteLn('You did not enter enough arguments');
         ShowHelp();
         Exit;
         End
      else
         Begin
           // we are doing a paste, so check if our history file exists
           if FileExists(includetrailingpathdelimiter(ExtractFilePath(ParamStr(0))) + CCP_FILELIST) then
              Begin
              // Found file
              WriteLn('Found history file, opening it...');
              FileList.Clear;
              FileList.LoadFromFile(includetrailingpathdelimiter(ExtractFilePath(ParamStr(0))) + CCP_FILELIST);
              if FileList.Strings[0] = 'copy' then
                 Begin
                 aAction := aCopy;
                 End
              ELSE
                 Begin
                 if FileList.Strings[0] = 'cut' then
                    Begin
                    aAction := aCut;
                    End
                 else
                    Begin
                      aAction := aNone;
                    End;
                 End;

              if aAction = aNone then
                 Begin
                 WriteLn('It appears the history file is corrupt, aborting operating');
                 Exit;
                 End;

              if aAction = aCopy then
                 Begin
                   // Begin copying files
                 CopyFiles(FileList);
                 // delete history file
                 DeleteFile(includetrailingpathdelimiter(ExtractFilePath(ParamStr(0))) + CCP_FILELIST);
                 End;

              if aAction = aCut then
                 Begin
                   // Begin moving files
                 MoveFiles(FileList);
                 DeleteFile(includetrailingpathdelimiter(ExtractFilePath(ParamStr(0))) + CCP_FILELIST);
                 End;
              End
           else
              Begin
                // history file doesn't exist
                WriteLn('Unsure what to do, did you mark files for copying or moving already?');
                Exit;
              End;
         // success, clear history file
         Try
            Begin
            DeleteFile(includetrailingpathdelimiter(GetCurrentDir) + CCP_FILELIST);
            Exit;
            End
         EXCEPT
            Begin
            WriteLn('Some kind of error while trying to delete history file, it may be write protected or you dont have access to it');
            WriteLn('File: ' + includetrailingpathdelimiter(GetCurrentDir) + CCP_FILELIST);
            Exit;
            End;
         End; // end except
         End;
      End
   ELSE
      Begin
      // Enough command line arguments were entered
      // if -paste is entered, throw a wobbler, if not then
      // begin to check and add files to our filelist
      if aAction = aPaste then
         Begin
           WriteLn('A paste operation should not include any arguments or files');
           Exit;
         End;
      FileList.Clear;
      Skipped.Clear;
      FileList.BeginUpdate;
      Skipped.BeginUpdate;

      // process all except 0 and the i'th paramater
      for j := 1 to ParamCount do
         Begin
         if j <> i then
            Begin
            // check if file exists
            if FileExists(ParamStr(j)) then
              Begin
              FileList.Add(includetrailingpathdelimiter(GetCurrentDir) + ParamStr(j));

              WriteLn('Found: ' + ParamStr(j));
              End
            ELSE
              Begin
              WriteLn('Not found: ' + ParamStr(j) + ', skipping');
              Skipped.Add(includetrailingpathdelimiter(GetCurrentDir) + ParamStr(j))
              End;
            End;
         End;
      Skipped.EndUpdate;
      FileList.EndUpdate;

      // Check we have enough files to procede
      if FileList.Count = 0 then
         Begin
         // we dont have enough files

         // were any files skipped?
         if Skipped.Count > 0 then
            Begin
            // one or more files were skipped
            WriteLn('Unable to process the following files:');
            for i := 0 to Skipped.Count - 1 do
               Begin
                 WriteLn('Skipped: ' + Skipped.Strings[i]);
               End;
            WriteLn('Check that file files exist and are accessable before trying again');
            Exit;
            End
         ELSE
            Begin
            // no files were skipped
            WriteLn('Unable to procede, check the command line for invalid files or arguments');
            Exit;
            End;
         End;
      // if we are here, everything should be grand to continue

      // We use the first item in FileList (with paste) to determine if we are
      // to copy or paste the files, so save that action there
      if aAction = aCopy then
         Begin
         FileList.Insert(0,'copy');
         End;
      if aAction = aPaste then
         Begin
         FileList.Insert(0,'copy');
         End;

      // Save to the file
      FileList.SaveToFile(includetrailingpathdelimiter(ExtractFilePath(ParamStr(0))) + CCP_FILELIST);
      WriteLn('Remembered ' + IntToStr(FileList.Count - 1) + ', Skipped ' + IntToStr(Skipped.Count));
      WriteLn('Dont forget to use the -paste option to paste your files, no action has been taken at this time');
      End;
   End;
Skipped.Free;
FileList.Free;
End;


begin
  try
  // Check if any command line paramaters were entered (0/first = exename)
   if (ParamCount < 1) or
      (ParamStr(1) = '-h') or
      (ParamStr(1) = '-?') or
      (ParamStr(1) = '/h') or
      (ParamStr(1) = '/?') or
      (ParamStr(1) = 'h') or
      (ParamStr(1) = 'help') then
      Begin
      // no command line param's entered or a help switch entered
      ShowHelp;
      Exit;
      End
   ELSE
      Begin
        // One or more command line arguments entered
        ProcessCommandLine();
      End;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
