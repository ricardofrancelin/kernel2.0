unit Lib666;

interface
uses SysUtils, Provider, DB, DBClient, DBLocal, DBLocalS, SqlExpr, Winsock, Dialogs, Forms, QDBCtrls,
 {Unit de outras bibliotecas} CDSPesqDBEdit;

procedure proAjusteAutomaticoTamanhoCampos(Chamador:TForm;cds:TClientDataSet);

implementation


procedure proAjusteAutomaticoTamanhoCampos(Chamador:TForm;cds:TClientDataSet);
var
 i,j:integer;
begin
 for i := 0 to Chamador.ComponentCount - 1 do
 begin
  if (Chamador.Components[i] is TDBEdit) then
  begin
     for j := 0 to cds.FieldCount - 1 do
     begin
       if (Chamador.Components[i] as TDBEdit).DataField = cds.Fields[j].FieldName then
            (Chamador.Components[i] as TDBEdit).MaxLength := cds.Fields[j].DisplayWidth;
     end;
  end;

  if (Chamador.Components[i] is TCDSPesqDBEdit) then
  begin
     for j := 0 to cds.FieldCount - 1 do
     begin
       if (Chamador.Components[i] as TCDSPesqDBEdit).DataField = cds.Fields[j].FieldName then
            (Chamador.Components[i] as TCDSPesqDBEdit).MaxLength := cds.Fields[j].DisplayWidth;
     end;
  end;
  

 end;
end;


end.
