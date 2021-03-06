; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "SysRep"
#define MyAppVersion "6.0"
#define MyAppPublisher "Lider Lar Estofados e Colch�es"
#define MyAppURL "http://www.liderlar.com.br"
#define MyAppExeName "PSysRep.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{5F826B21-3CFD-4AF2-B30D-8E3CEAE9BA75}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName=C:\{#MyAppName}
DisableDirPage=yes
DefaultGroupName={#MyAppName}
OutputBaseFilename=Instalador_SysRep
Compression=lzma
SolidCompression=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "brazilianportuguese"; MessagesFile: "compiler:Languages\BrazilianPortuguese.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked; OnlyBelowVersion: 0,6.1

[Files]
;Source: "C:\SysRep\fonte\PSysRep.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\SysRep\fonte\PSysRep.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\SysRep\ArqFtp\*"; DestDir: "{app}\ArqFtp"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\SysRep\ArqPed\*"; DestDir: "{app}\ArqPed"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\SysRep\banco\*"; DestDir: "{app}\banco"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\SysRep\conf\*"; DestDir: "{app}\conf"; Flags: ignoreversion recursesubdirs createallsubdirs
;Source: "C:\SysRep\ftproot\*"; DestDir: "{app}\ftproot"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\SysRep\Firebird-2.0.3.12981-1-Win32.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\SysRep\FB\firebird.conf"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\SysRep\FB\gds32.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\SysRep\FB\icudt30.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\SysRep\FB\icuin30.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\SysRep\FB\icuuc30.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\SysRep\FB\ib_util.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\SysRep\FB\firebird.msg"; DestDir: "{app}\FB"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\SysRep\FB\udf\*"; DestDir: "{app}\udf"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\SysRep\FB\intl\*"; DestDir: "{app}\intl"; Flags: ignoreversion recursesubdirs createallsubdirs


; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\{cm:ProgramOnTheWeb,{#MyAppName}}"; Filename: "{#MyAppURL}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: quicklaunchicon

[Run]
Filename: {app}\Firebird-2.0.3.12981-1-Win32.exe; WorkingDir: {tmp}; Parameters: "/VERYSILENT /NOICONS /COMPONENTS="" SuperServerComponent, ServerComponent, ClientComponent"" /NOGDS32"

