unit ULog;

interface

uses
  System.SysUtils;

type TLog = class
  public
     class procedure EscreverLog(E: exception);
end;

implementation



{ TLog }

class procedure TLog.EscreverLog(E: exception);
var
  f: TextFile;
begin
    { open a text file }
    AssignFile(f, 'd:\logs\erros.log');
    Rewrite(f);
    Writeln(f,DateTimeToStr(Now)+' - ' + E.Message);
    Flush(f);
    CloseFile(f);
end;

end.
