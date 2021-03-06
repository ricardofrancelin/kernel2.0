
unit F666Filho;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, StdCtrls, Buttons, ExtCtrls, DBCtrls,
  ComCtrls, F666Pai, GravaLog, Mask, Controle, CDSPesqDBEdit, RXDBCtrl,
  CDSFrancelinDesc, Menus;

type
  TYCadItem = class(TForm)
    BitOk: TBitBtn;
    BitCancelar: TBitBtn;
    dsMultiplaInstancia: TDataSource;
    StatusBar1: TStatusBar;
    pnlLog: TPanel;
    lblInclusao: TLabel;
    lblAlteracao: TLabel;
    eDataInc: TDBEdit;
    eDataAlt: TDBEdit;
    eUserInc: TDBEdit;
    eUserAlt: TDBEdit;
    gravaLog: TGravaLog;
    ControleTela: TControle;
    PopupMenu1: TPopupMenu;
    Solicitao1: TMenuItem;
    procedure BitOkClick(Sender: TObject);
    procedure BitCancelarClick(Sender: TObject);
    procedure BitCancelarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BitOkMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Solicitao1Click(Sender: TObject);
  private
    { Private declarations }
    vFechaTela : Boolean;
    procedure ProcessaMsg(var Msg: TMsg; var Handled: Boolean);
    function  key_status(Key: integer): boolean;
    procedure proCamposMaiusculosFilhos;
    procedure proAjusteAutomaticoTamanhoCamposFilhos;
    procedure GravaDadosLog(operacao: char; usuario, data:String);
    procedure proDesabilitaCamposChavesTelaFilho(dsFilho:TDataSource);
    procedure prcConfiguraDadosCadastroTelaFilha;

  public
    { Public declarations }
    vOperacao : String;    
    vSequencial : Integer;
    vNomeClasse : String;
    constructor Create(Owner: TComponent; operacao: char; usuario, data:String);
   // constructor Create(AOwner : TComponent; qryFilho:TSQLClientDataSet);Virtual;
    procedure prcPreencheCampo(vCampo, vValor : String);
  end;

  TYCadFilhoFormClass = class of TYCadItem;

  function  CampoObrigatorios(ds :TDataSource):Boolean;


var
  YCadItem: TYCadItem;
  RetornoFilho: array of OleVariant;
  
implementation

uses Lib, PrincV, YSolicitaF;

{$R *.dfm}

function  CampoObrigatorios(ds :TDataSource):Boolean;
var
 vCont : Integer;
begin
 Result := True;
 for vCont := 0 to ds.DataSet.FieldCount - 1 do
 begin
  if  TRIM(ds.DataSet.Fields[vCont].AsString) = '' then
  begin

   if ds.DataSet.Fields[vCont].Required = True then
   begin
     Result:=False;
     ShowMessage('? Obrigat?rio o preenchimento do campo: ' + ds.DataSet.Fields[vCont].DisplayLabel);
     ds.DataSet.Fields[vCont].FocusControl;
     Exit;
   end;

  end;
 end;
end;


procedure TYCadItem.BitOkClick(Sender: TObject);
begin
  if CampoObrigatorios(dsMultiplaInstancia) = True then
  begin
    try
      vFechaTela := True;
      dsMultiplaInstancia.DataSet.Post;
      CLose;
    except
      on E:Exception do
      begin
        ShowMessage('[ERRO] N?o foi poss?vel salvar as informa??es.' + #13
                    + 'Entre em contato com o departamento de Desenvolvimento.' + #13
                    + E.Message + #13
                    + E.ClassName);
      end;
    end;
  end;
end;

procedure TYCadItem.BitCancelarClick(Sender: TObject);
begin
 dsMultiplaInstancia.DataSet.Cancel;
 vFechaTela := True;
 Close;
end;

procedure TYCadItem.BitCancelarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
 StatusBar1.Panels[0].Text :='Cancelar';
end;

procedure TYCadItem.BitOkMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  StatusBar1.Panels[0].Text :='Confirmar';
end;

procedure TYCadItem.proCamposMaiusculosFilhos;
var
 i:Integer;
begin
 for i := 0 to ComponentCount - 1 do
  if (Components[i] is TDBEdit) then
  begin
    (Components[i] as TDBEdit).CharCase := ecUpperCase;
  end;
end;


constructor TYCadItem.Create(Owner: TComponent; operacao: char; usuario, data:String);
begin
 inherited Create(Owner);

 vOperacao := operacao;

 GravaDadosLog(operacao,usuario,data);
 if ControleTela.AutoAjusteLengthCampoTela = True then
  proAjusteAutomaticoTamanhoCamposFilhos;

 if ControleTela.CamposMaiusculos = True then
  proCamposMaiusculosFilhos;

end;

procedure TYCadItem.proAjusteAutomaticoTamanhoCamposFilhos;
var
 i,j:integer;
begin
 for i := 0 to ComponentCount - 1 do
 begin
  if (Components[i] is TDBEdit) then
  begin
     for j := 0 to  dsMultiplaInstancia.DataSet.FieldCount - 1 do
     begin
       if (Components[i] as TDBEdit).DataField = dsMultiplaInstancia.DataSet.Fields[j].FieldName then
       begin
         if (Components[i] as TDBEdit).MaxLength <= 0 then
               (Components[i] as TDBEdit).MaxLength := dsMultiplaInstancia.DataSet.Fields[j].DisplayWidth;
       end;
     end;
  end;

  if (Components[i] is TCDSPesqDBEdit) then
  begin
     for j := 0 to dsMultiplaInstancia.DataSet.FieldCount - 1 do
     begin
       if (Components[i] as TCDSPesqDBEdit).DataField = dsMultiplaInstancia.DataSet.Fields[j].FieldName then
       begin
         if (Components[i] as TCDSPesqDBEdit).MaxLength <= 0 then
                (Components[i] as TCDSPesqDBEdit).MaxLength := dsMultiplaInstancia.DataSet.Fields[j].DisplayWidth;
       end;
     end;
  end;

 end;
end;


procedure TYCadItem.GravaDadosLog(operacao: char; usuario, data:String);
begin
 if gravaLog.Ativada = True then
 begin
    pnlLog.Visible := True;
    eDataInc.DataField := gravaLog.DataCreate;
    eUserInc.DataField := gravaLog.UserCreate;
    eDataAlt.DataField := gravaLog.DataAlter;
    eUserAlt.DataField := gravaLog.UserAlter;

   if (operacao = 'I') and (gravaLog.Ativada = True) then
   begin
     if dsMultiplaInstancia.DataSet.State <> dsInsert then
         dsMultiplaInstancia.DataSet.Insert;

     dsMultiplaInstancia.DataSet.FieldByName(gravaLog.UserCreate).AsString := usuario;
     dsMultiplaInstancia.DataSet.FieldByName(gravaLog.DataCreate).AsDateTime := StrToDate(data);
     dsMultiplaInstancia.DataSet.FieldByName(gravaLog.UserAlter).AsString := usuario;
     dsMultiplaInstancia.DataSet.FieldByName(gravaLog.DataAlter).AsDateTime := StrToDate(data);
   end else if ( ( (operacao = 'E') or (operacao = 'V') ) and (gravaLog.Ativada = True) ) then
   begin
     if dsMultiplaInstancia.DataSet.State <> dsEdit then
          dsMultiplaInstancia.DataSet.Edit;

     if operacao = 'E' then
     begin
       dsMultiplaInstancia.DataSet.Edit;
       dsMultiplaInstancia.DataSet.FieldByName(gravaLog.UserAlter).AsString := usuario;
       dsMultiplaInstancia.DataSet.FieldByName(gravaLog.DataAlter).AsDateTime := StrToDate(data);
       dsMultiplaInstancia.DataSet.Post;
       dsMultiplaInstancia.DataSet.Edit;
     end else if operacao = 'V' then
     begin
       if TRIM(dsMultiplaInstancia.DataSet.FieldByName(gravaLog.UserAlter).AsString) = '' then
       begin
         dsMultiplaInstancia.DataSet.Edit;
         dsMultiplaInstancia.DataSet.FieldByName(gravaLog.UserAlter).AsString := usuario;
         dsMultiplaInstancia.DataSet.FieldByName(gravaLog.DataAlter).AsDateTime := StrToDate(data);
         dsMultiplaInstancia.DataSet.Post;
         dsMultiplaInstancia.DataSet.Edit;
       end;
     end;
   end;
 end else
 begin
    pnlLog.Visible := False;
    if operacao = 'E' then
    begin
      dsMultiplaInstancia.DataSet.Post;
      dsMultiplaInstancia.DataSet.Edit;
    end else
    begin
      //if operacao = 'X' then
      //   dsMultiplaInstancia.DataSet.Refresh;
    end;
 end;
end;

{------------------------------------------------------------------------------}
//Desabilita a PK da tela, para evitar altera??o de Pk por usu?rio
{------------------------------------------------------------------------------}
procedure TYCadItem.proDesabilitaCamposChavesTelaFilho(dsFilho:TDataSource);
var
 j,i : Integer;
begin

 if ControleTela.DesabilitaCampoChave = True then
 begin
   for j := 0 to dsMultiplaInstancia.DataSet.FieldCount - 1 do
   begin
     if (pfInKey in dsMultiplaInstancia.DataSet.Fields[j].ProviderFlags) then
     begin

       for i := 0 to ComponentCount - 1 do
       begin

           //DBEdit [padr?o Delphi]
           if (Components[i] is TDBEdit) then
           begin
             if (Components[i] as TDBEdit).DataField = dsMultiplaInstancia.DataSet.Fields[j].FieldName then
             begin
                if (Components[i] is TDBEdit) then
                begin
                  (Components[i] as TDBEdit).Color := ControleTela.CorCampoChaveDesabilitado;
                  (Components[i] as TDBEdit).ReadOnly := True;
                end;
             end;
           end;
           
           //PescEdit [t&t]
           if (Components[i] is TCDSPesqDBEdit) then
           begin
             if (Components[i] as TCDSPesqDBEdit).DataField = dsMultiplaInstancia.DataSet.Fields[j].FieldName then
             begin
                if (Components[i] is TCDSPesqDBEdit) then
                begin
                  (Components[i] as TCDSPesqDBEdit).Color := ControleTela.CorCampoChaveDesabilitado;
                  (Components[i] as TCDSPesqDBEdit).ReadOnly := True;
                end;
             end;
           end;

           //DBDate Edit [RXLIB]
           if (Components[i] is TDBDateEdit) then
           begin
             if (Components[i] as TDBDateEdit).DataField = dsMultiplaInstancia.DataSet.Fields[j].FieldName then
             begin
                if (Components[i] is TDBDateEdit) then
                begin
                  (Components[i] as TDBDateEdit).Color := ControleTela.CorCampoChaveDesabilitado;
                  (Components[i] as TDBDateEdit).ReadOnly := True;
                end;
             end;
           end;
       end;
     end;

   end;
 end else
 begin
   for j := 0 to dsMultiplaInstancia.DataSet.FieldCount - 1 do
   begin
     if (pfInKey in dsMultiplaInstancia.DataSet.Fields[j].ProviderFlags) then
     begin
       for i := 0 to ComponentCount - 1 do
       begin
         if dsMultiplaInstancia.DataSet.State <> dsInsert then
         begin
           //DBEdit [padr?o Delphi]
           if (Components[i] is TDBEdit) then
           begin
             if (Components[i] as TDBEdit).DataField = dsMultiplaInstancia.DataSet.Fields[j].FieldName then
             begin
                if (Components[i] is TDBEdit) then
                begin
                  (Components[i] as TDBEdit).Color := ControleTela.CorCampoChaveDesabilitado;
                  (Components[i] as TDBEdit).ReadOnly := True;
                end;
             end;
           end;
           //PescEdit [t&t]
           if (Components[i] is TCDSPesqDBEdit) then
           begin
             if (Components[i] as TCDSPesqDBEdit).DataField = dsMultiplaInstancia.DataSet.Fields[j].FieldName then
             begin
                if (Components[i] is TCDSPesqDBEdit) then
                begin
                  (Components[i] as TCDSPesqDBEdit).Color := ControleTela.CorCampoChaveDesabilitado;
                  (Components[i] as TCDSPesqDBEdit).ReadOnly := True;
                end;
             end;
           end;

           //DBDate Edit [RXLIB]
           if (Components[i] is TDBDateEdit) then
           begin
             if (Components[i] as TDBDateEdit).DataField = dsMultiplaInstancia.DataSet.Fields[j].FieldName then
             begin
                if (Components[i] is TDBDateEdit) then
                begin
                  (Components[i] as TDBDateEdit).Color := ControleTela.CorCampoChaveDesabilitado;
                  (Components[i] as TDBDateEdit).ReadOnly := True;
                end;
             end;
           end;

         end else
         begin
           if (Components[i] is TDBEdit) then
           begin
             if (Components[i] as TDBEdit).DataField = dsMultiplaInstancia.DataSet.Fields[j].FieldName then
             begin
                if (Components[i] is TDBEdit) then
                begin
                  (Components[i] as TDBEdit).Color := clWindow;
                  (Components[i] as TDBEdit).ReadOnly := False;
                end;
             end;
           end;

           if (Components[i] is TCDSPesqDBEdit) then
           begin
             if (Components[i] as TCDSPesqDBEdit).DataField = dsMultiplaInstancia.DataSet.Fields[j].FieldName then
             begin
                if (Components[i] is TCDSPesqDBEdit) then
                begin
                  (Components[i] as TCDSPesqDBEdit).Color := clWindow;
                  (Components[i] as TCDSPesqDBEdit).ReadOnly := False;
                end;
             end;
           end;

           if (Components[i] is TDBDateEdit) then
           begin
             if (Components[i] as TDBDateEdit).DataField = dsMultiplaInstancia.DataSet.Fields[j].FieldName then
             begin
                if (Components[i] is TDBDateEdit) then
                begin
                  (Components[i] as TDBDateEdit).Color := clWindow;
                  (Components[i] as TDBDateEdit).ReadOnly := False;
                end;
             end;
           end;

         end;

       end;
     end;
   end;
 end;

end;


procedure TYCadItem.FormCreate(Sender: TObject);
begin
  vNomeClasse := ClassName;
  prcConfiguraDadosCadastroTelaFilha;
  proDesabilitaCamposChavesTelaFilho(dsMultiplaInstancia);
  StatusBar1.Panels[1].Text := 'Use o bot?o contr?rio do mouse para mais op??es.'
end;

procedure TYCadItem.FormShow(Sender: TObject);
begin
 Application.OnMessage := ProcessaMsg;
 vFechaTela := False;
end;

procedure TYCadItem.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key_status(VK_LMENU)) and (Key = VK_F4) then
 begin
   vFechaTela := False;
 end;
end;

procedure TYCadItem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if not vFechaTela then
   Action := caNone
 else
   Action := caFree;
end;

function TYCadItem.key_status(Key: integer): boolean;
begin
  Result := Odd(GetKeyState(Key));
end;


procedure TYCadItem.ProcessaMsg(var Msg: TMsg; var Handled: Boolean);
begin
  if Msg.message = WM_KEYDOWN then
    if not (Screen.ActiveControl is TCustomMemo) and
       not (Screen.ActiveControl is TButtonControl) then
    begin
      if not (Screen.ActiveControl is TCustomControl) then
      begin
        if Msg.wParam = VK_Down then
           Msg.wParam := VK_Tab;
        if Msg.wParam = VK_UP then
        begin
          Msg.wParam := VK_CLEAR;
          Screen.ActiveForm.Perform(WM_NextDlgCtl,1,0);
        end;
      end;
      if Msg.wParam = VK_Return then
        Msg.wParam := VK_Tab;
    end;

end;

procedure TYCadItem.prcPreencheCampo(vCampo, vValor: String);
begin
  if pos('CdsFrancelinDesc', vValor) <= 0 then
  begin
    try
      if TRIM(vvalor) <> '' then
      begin
        if (dsMultiplaInstancia.DataSet.State = dsEdit) or (dsMultiplaInstancia.DataSet.State = dsInsert) then
        begin
          if dsMultiplaInstancia.DataSet.FieldByName(vCampo).DataType = ftTimeStamp then
          begin
            if DataValida(vValor) then
              dsMultiplaInstancia.DataSet.FieldByName(vCampo).Value := vValor
            else
              dsMultiplaInstancia.DataSet.FieldByName(vCampo).IsNull;
          end else
          begin
            dsMultiplaInstancia.DataSet.FieldByName(vCampo).Value := vValor;
          end;
        end;
      end else
        dsMultiplaInstancia.DataSet.FieldByName(vCampo).IsNull;
    except
      on E : Exception do
      begin
        ShowMessage('[ERRO] N?o foi poss?vel preencher o campo ['+vCampo+'].' + #13 + e.Message);
      end;
    end;
  end;
end;

procedure TYCadItem.prcConfiguraDadosCadastroTelaFilha;
var
 cdsAux : TClientDataSet;
begin
  cdsAux := TClientDataSet.Create(Nil);
  try
    cdsAux.RemoteServer := PrincDM.sckAcademicoX;
    cdsAux.ProviderName := 'dspGenerica';
    cdsAux.Close;
    cdsAux.CommandText :=
       ' select COUNT(*)  as qt from adm_telas'
     + ' where DS_NOME_FISICO = ' + QuotedStr(UpperCase(vNomeClasse));
    cdsAux.Open;
    if cdsAux.fieldbyname('qt').AsInteger <= 0 then
    begin
     cdsAux.Close;
     cdsAux.CommandText :=
      'INSERT INTO ADM_TELAS (DS_NOME_FISICO, TP_TELA, DS_TELA, DS_OBS) VALUES ('
       + QuotedStr(vNomeClasse) + ',' + QuotedStr('T') + ',' + QuotedStr(Caption) + ',' + QuotedStr('CRIADA AUTOM?TICAMENTE PELO SISTEMA') + ')';
     try
      cdsAux.Execute;
     except
      ShowMessage('[ERRO] Erro ao tentar gerar o registro de cadastro de telas.' + #13 + 'Verifique.');
     end;
    end;
  finally
    cdsAux.Free;
  end;

end;

procedure TYCadItem.Solicitao1Click(Sender: TObject);
var
x : Integer;
begin

  PrincDM.vEmpresa := '';
  PrincDM.vCd_Filial := '';
  PrincDM.vCd_Aluno := '';
  PrincDM.vCd_Matricula := '';
  PrincDM.vCd_Ingresso := '';
  PrincDM.vCd_matriculaCurso := '';

    for x:=0 to dsMultiplaInstancia.DataSet.Fields.Count-1 do
    begin

     if UpperCase(dsMultiplaInstancia.DataSet.Fields.Fields[x].FieldName) = 'EMPRESA' then
       PrincDM.vEmpresa := dsMultiplaInstancia.DataSet.Fieldbyname('empresa').AsString;

     if UpperCase(dsMultiplaInstancia.DataSet.Fields.Fields[x].FieldName) = 'CD_FILIAL' then
       PrincDM.vCd_filial := dsMultiplaInstancia.DataSet.Fieldbyname('cd_filial').AsString;

     if UpperCase(dsMultiplaInstancia.DataSet.Fields.Fields[x].FieldName) = 'CD_ALUNO' then
       PrincDM.vCd_aluno :=dsMultiplaInstancia.DataSet.Fieldbyname('cd_aluno').AsString;

     if UpperCase(dsMultiplaInstancia.DataSet.Fields.Fields[x].FieldName) = 'CD_MATRICULA' then
       PrincDM.vCd_matricula := dsMultiplaInstancia.DataSet.Fieldbyname('cd_matricula').AsString;

     if UpperCase(dsMultiplaInstancia.DataSet.Fields.Fields[x].FieldName) = 'CD_INGRESSO' then
       PrincDM.vCd_Ingresso := dsMultiplaInstancia.DataSet.Fieldbyname('cd_ingresso').AsString;

     if UpperCase(dsMultiplaInstancia.DataSet.Fields.Fields[x].FieldName) = 'CD_MATRICULACURSO' then
       PrincDM.vCd_matriculaCurso := dsMultiplaInstancia.DataSet.Fieldbyname('cd_matriculacurso').AsString;

    end;

 CRIA_TELA_SOLICITACAO(UpperCase(ClassName),tpSolicita,'');
end;

end.
