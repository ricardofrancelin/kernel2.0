{###############################################################################

FORMUL?RIO PADR?O 3 CAMADAS
[OBS - Que falta faz o JavaDoc, Poderia Existir o DelphiDoc. Maldita ExBorland]

 Autor : Ricardo Antonio Francelin
 Data Cria??o: [N?o me lembro]
 Data ?ltima Altera??o: 24/03/2009
 Data ?ltima Altera??o Patrick: 02/04/2019 

 ##Pesamento do dia:
  " Hoje fui perseguido por uma massa ensandecida de crentes!!!
    Eles querem me queimar!!!!!!! "


PS=Yanaga seu troxa!! Enfia o seu Java querido no @#%$%$$##?*    
###############################################################################}

unit F666Pai;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, DB, Buttons, ExtCtrls, ToolWin,
  ComCtrls, Menus, DBClient, FMTBcd, SqlExpr, Provider, Grids,
  DBGrids, Controle, GravaLog, Printers, CDSPesqDBEdit, RXCtrls, RXDBCtrl,
  jpeg, ActnList, UCBase, RxToolEdit, DateUtils;

type
  TYCad = class(TForm)
    dsQry: TDataSource;
    Sp1: TStatusBar;
    ColorDialog1: TColorDialog;
    FontDialog1: TFontDialog;
    PageControlPrincipal: TPageControl;
    abaCadastro: TTabSheet;
    abaPesquisa: TTabSheet;
    pnlPesquisa: TPanel;
    DBGridPesq: TDBGrid;
    nmComparador: TComboBox;
    nmParametro: TEdit;
    btnPesquisaOk: TBitBtn;
    btnPesquisaCancel: TBitBtn;
    nmNomeFisico: TComboBox;
    nmTipo: TComboBox;
    BitBtn1: TBitBtn;
    bitUtilizarFiltroVoltar: TBitBtn;
    GroupBox1: TGroupBox;
    lblMsg1: TLabel;
    lblMsn2: TLabel;
    abaAjuda: TTabSheet;
    Panel3: TPanel;
    bitCancelaAjuda: TBitBtn;
    memoAjudaTela: TMemo;
    abaRelatorio: TTabSheet;
    Panel4: TPanel;
    pnlListagem: TPanel;
    btnCancelaVoltarListagem: TBitBtn;
    ScrollBox1: TScrollBox;
    nmCampos: TComboBox;
    QryPai: TClientDataSet;
    gravaLog: TGravaLog;
    pnlLog: TPanel;
    lblInclusao: TLabel;
    lblAlteracao: TLabel;
    eDataInc: TDBEdit;
    eDataAlt: TDBEdit;
    eUserInc: TDBEdit;
    eUserAlt: TDBEdit;
    ControleTela: TControle;
    Panel11: TPanel;
    ScrollBox2: TScrollBox;
    Image1: TImage;
    nmParametroData: TDateEdit;
    pEntreDatas: TPanel;
    DataInicio: TDateEdit;
    DataFim: TDateEdit;
    cMaiusculo: TCheckBox;
    ActionList1: TActionList;
    acIncluir: TAction;
    acAtualizar: TAction;
    acSalvar: TAction;
    acRemover: TAction;
    acCancelar: TAction;
    acEditar: TAction;
    acPesquisaTela: TAction;
    acSair: TAction;
    acAjuda: TAction;
    pnlBotoes: TPanel;
    BitIncluir: TBitBtn;
    BitAtualizar: TBitBtn;
    BitSalvar: TBitBtn;
    BitRemove: TBitBtn;
    BitCancelar: TBitBtn;
    BitEditar: TBitBtn;
    BitPrimeiro: TBitBtn;
    BitAnterior: TBitBtn;
    BitProximo: TBitBtn;
    BitUltimo: TBitBtn;
    BitPesquisa: TBitBtn;
    BitRelatorio: TBitBtn;
    BitHelp: TBitBtn;
    BitSair: TBitBtn;
    PopupMenu1: TPopupMenu;
    AjudadoSistema1: TMenuItem;
    N3: TMenuItem;
    Fecharnometela1: TMenuItem;
    N1: TMenuItem;
    UCControlsPai: TUCControls;
    pnlBitMenuAuxiliar: TPanel;
    bitBotaoMenuAux: TBitBtn;
    bitSolicitacao: TBitBtn;
    Solicitao1: TMenuItem;
    MenuAuxiliar1: TMenuItem;
    procedure BitIncluirClick(Sender: TObject);
    procedure dsQryDataChange(Sender: TObject; Field: TField);
    procedure BitPesquisaClick(Sender: TObject);

    procedure PrcBotoesVisiveis(b1,         {Incluir}
                                b2,         {Atualizar}
                                b3,         {Ultimo}
                                b4,         {Primeiro}
                                b5,         {Proximo}
                                b6,         {Anterior}
                                b7,         {Remover}
                                b8,         {Salvar}
                                b9,         {Cancelar}
                                b10,        {Editar}
                                b11,        {Pesquisar}
                                b12,        {Help}
                                b13,        {Relatorio}
                                b14:string);{Sair}

    procedure Fecharnometela1Click(Sender: TObject);
    procedure BitSairClick(Sender: TObject);
    procedure BitIncluirMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BitAtualizarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BitUltimoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BitPrimeiroMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BitProximoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BitAnteriorMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BitRemoveMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BitSalvarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BitCancelarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BitEditarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BitPesquisaMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BitHelpMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BitRelatorioMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BitSairMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ToolBar1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FontedaTela1Click(Sender: TObject);
    procedure CordeFundodaTela1Click(Sender: TObject);
    procedure RestaurarPadro2Click(Sender: TObject);
    procedure btnPesquisaCancelClick(Sender: TObject);
    procedure btnPesquisaOkClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure bitUtilizarFiltroVoltarClick(Sender: TObject);
    procedure bitCancelaAjudaClick(Sender: TObject);
    procedure BitHelpClick(Sender: TObject);
    procedure btnCancelaVoltarListagemClick(Sender: TObject);
    procedure BitRelatorioClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure QryPaiReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure QryPaiAfterInsert(DataSet: TDataSet);
    procedure nmCamposChange(Sender: TObject);
    procedure nmComparadorChange(Sender: TObject);
    procedure nmParametroKeyPress(Sender: TObject; var Key: Char);
    procedure QryPaiAfterScroll(DataSet: TDataSet);
    procedure QryPaiAfterOpen(DataSet: TDataSet);
    procedure QryPaiBeforePost(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure nmParametroChange(Sender: TObject);
    procedure nmParametroDataKeyPress(Sender: TObject; var Key: Char);
    procedure DataFimKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridPesqDblClick(Sender: TObject);
    procedure acIncluirExecute(Sender: TObject);
    procedure acAtualizarExecute(Sender: TObject);
    procedure acSalvarExecute(Sender: TObject);
    procedure acRemoverExecute(Sender: TObject);
    procedure acCancelarExecute(Sender: TObject);
    procedure acEditarExecute(Sender: TObject);
    procedure acPesquisaTelaExecute(Sender: TObject);
    procedure acSairExecute(Sender: TObject);
    procedure acAjudaExecute(Sender: TObject);
    procedure bitBotaoMenuAuxClick(Sender: TObject);
    procedure bitSolicitacaoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Solicitao1Click(Sender: TObject);
    procedure AjudadoSistema1Click(Sender: TObject);
    procedure MenuAuxiliar1Click(Sender: TObject);

  private
    { Private declarations }
    vDescricaoCampo01 : String;
    vDescricaoCampo02 : String;

    vNomeClasse : String;

    procedure ProcessaMsg(var Msg: TMsg; var Handled: Boolean);
    procedure proAcionaAtalhos(key:Word);
    function  key_status(Key: integer): boolean;
    procedure proHabilitaDesabilitaCampoChave(vTipo:Boolean);
    procedure proDesabilitaCamposChavesTela;
    procedure CamposVisiveisComponente(parametro : string);
    procedure proAjusteAutomaticoTamanhoCampos;
    procedure proCamposMaiusculos;
    function  fncVerificaConexao:Boolean;
    procedure proPopularCamposPesquisa;
    procedure proExecutarPesquisa(campo,operador,parametro, parametro1, tipo:string);
    procedure proExecutarPesquisaSemParametro;
    procedure proCancelarPesquisa(sql:string);
    function  funDeletar(qry:TDataSource):Boolean;
    procedure proSalvaLog;
    function  funcExisteWHERE(sql:String):Boolean;
    procedure proTipoDeparametro;
    procedure prcConfiguraDadosCadastroTela;
  public
    { Public declarations }
    vParametroLivre : String;
    vParametroLivre1 : String;
    vFechaTela : Boolean;
    vSqlAntigo  : String;
    vSqlPesquisa : String;

    //Procedimentos virtuais para serem sobrescritos se necess?rio--------------
    procedure proGravaFilhos;virtual;
    procedure proValidarEspecifica;virtual;
    procedure proAntesSalvarPai;virtual;
    procedure proDepoisSalvarPai;Virtual;
    procedure proAntesDeletar;virtual;
    procedure proAntesExecutarControle;Virtual;
    procedure proDepoisExecutarControle;Virtual;
    procedure proCamposVisiveisPesquisa;Virtual;
    procedure proDepoisCancelar;Virtual;
    procedure proAntesPesquisar;Virtual;
    procedure proAntesAbrirAjuda;Virtual;
    //--------------------------------------------------------------------------

    procedure proCarregarArquivoAjuda(caminho_nome_arquico:String);
    function  funRetornaAutoIncremento(campo,tabela:String; filtro:string=''):Integer;
    function  GENERATE(gerador:string):Integer;

    procedure ABRE_TELA(NomeObj : TYCad);

    procedure proTelaSemRegistro(parFiltro:String);
    function  ValidarData(Data: TDateTime): Boolean;

    procedure Controle(
                qry:TClientDataSet;
                  Sender:TOBject;
                    Form:TForm;
                      Data:TDataSource;
                        Matriz1,
                          Matriz2:Array of TComponent;
                            Visivel:Array of boolean);

  published


  end;

  TYCadFormClass = class of TYCad;

  function nomeConstraint(texto:String):String;
  function CampoObrigatorios(qryFoco : TClientDataSet):Boolean;
  procedure CamposVisiveisPesquisa(formChamador:TYCad;campos_visiveis:Array of integer);
  //procedure CRIA_FORM_FILHO(NomeForm :TYCadFilhoFormClass; log:TGravaLog; tipo:TTipoOperacao);

var

  YCad           : TYCad;
  vFocoInclusao  : TDBEdit;
  vFocoAlteracao : TDBEdit;
  vNomeTela      : String;
  Retorno: array of OleVariant;
  RetornoFilho: array of OleVariant;


implementation

uses  MensagemPadraoU, F666Filho, PrincV, Lib, FACAD_MenuU,
  FACAD_CadConstraintU, LibAcademico, YCADHelpU, FACAD_RelatorioU,
  FMenuFlutuanteU, YSolicitaF;

{$R *.DFM}

{-------------------------------------------------------------------------------}
{procedure para mostra apenas campo desejados na pesquisa padr?o de tela}
{-------------------------------------------------------------------------------}
procedure CamposVisiveisPesquisa(formChamador:TYCad; campos_visiveis:Array of integer);
var
 vCont : Integer;
begin
 for vCont := 0 to formChamador.DBGridPesq.Columns.Count - 1 do
 begin
  formChamador.DBGridPesq.Columns.Items[vCont].Visible := False;
 end;

 for vCont := 0 to High(campos_visiveis) do
 begin
  formChamador.DBGridPesq.Columns.Items[campos_visiveis[vCont]].Visible  := True
 end;

end;

procedure TYCad.CamposVisiveisComponente(parametro : string);
var
 vCont : Integer;
 vStrIndice : String;
begin
 for vCont := 0 to DBGridPesq.Columns.Count - 1 do
 begin
  DBGridPesq.Columns.Items[vCont].Visible := False;
 end;

 vStrIndice := '';
 for vCont := 1 to length(parametro) do
 begin
  if (parametro[vcont] <> ';') then
    vStrIndice := vStrIndice + parametro[vcont]
  else begin
    DBGridPesq.Columns.Items[StrToInt(vStrIndice)].Visible  := True;
    vStrIndice := '';
  end;
  
 end;
end;

{-------------------------------------------------------------------------------
 Procedure Para controlar bot?es da tela e processos de
 Inser??o, Dele??o, Edi??o, Salvar, Pesquisa, Exit
-------------------------------------------------------------------------------}
procedure TYCad.Controle(
          qry:TClientDataSet;
          Sender:TOBject;
          Form:TForm;
          Data:TDataSource;
          Matriz1,
          Matriz2:Array of TComponent;
          Visivel:Array of boolean);
//var a : string;
begin

if (sender as Sender.ClassType) = Matriz1[0] then
   begin
     if (Matriz2[0] <> Nil) and (Matriz2[0] is TDBEdit) then
        (Matriz2[0] as TDBEdit).SetFocus;
     Data.DataSet.Append {Insert};
     proDesabilitaCamposChavesTela;
   end
else if (sender as Sender.ClassType) = Matriz1[1] then
   begin
     Data.DataSet.Edit;
     proDesabilitaCamposChavesTela;

     if (Matriz2[0] <> Nil) and (Matriz2[0] is TDBEdit)  then
        (Matriz2[0] as TDBEdit).Enabled := Visivel[0];
     if (Matriz2[1] <> Nil) and (Matriz2[1] is TDBEdit)  then
        (Matriz2[1] as TDBEdit).Enabled := Visivel[1];

     if (Matriz2[0] <> Nil) and (Matriz2[0] is TDBEdit)  then
        (Matriz2[0] as TDBEdit).SetFocus
     else if (Matriz2[1] <> Nil) and (Matriz2[1] is TDBEdit)  then
        (Matriz2[1] as TDBEdit).SetFocus;

   end
else if (sender as Sender.ClassType) = Matriz1[2] then
   begin
     //if MessageDlg('Confirma dele??o do registro', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     if MensagemPadrao(mAlerta,[bSim,bNao],'Mensagem do sistema [UAcad?mico3C]','Dele??o de registro.','Deseja realmente remover o registro selecionado?') = bSim then
     begin
        proAntesDeletar;
        proDesabilitaCamposChavesTela;
        try
         Screen.Cursor := crSQLWait;
         try
           Data.DataSet.Delete;
           qry.ApplyUpdates(-1);
         finally
           Screen.Cursor := crDefault;
         end;
        except
          on e: Exception do
          begin
            MessageDlg('Aten??o n?o foi possivel remover o registro selecioado.' + #13 +
              'Provavelmente o registro tenha depend?ncias com outra tabelas do sistema.' + #13 + 'Erro do sistema:' + e.Message,mtError,[mbOK],0);
            Abort;
          end;
        end;
     end;
   end
else if (sender as Sender.ClassType) = Matriz1[3] then
   begin
     try
      if Data.DataSet.State = dsInsert then
         begin
           if MensagemPadrao(mOk,[bSim,bNao],'Mensagem do sistema [UAcad?mico3C]','Inclus?o de registro.','Confirma grava??o?') = bSim then
           //if MessageDlg('Confirma grava??o ?',mtConfirmation,[mbYES, mbNO],0) = mrYES then
           begin
              proAntesSalvarPai;
              if CampoObrigatorios(qry) = True then
              begin
                proValidarEspecifica;
                proSalvaLog;
                Data.DataSet.Post;
                try
                  Screen.Cursor := crSQLWait;
                  try
                   qry.ApplyUpdates(-1);
                  finally
                   Screen.Cursor := crDefault;
                  end;
                except
                  Abort;
                end;
                proGravaFilhos;
                proDepoisSalvarPai;
                proDesabilitaCamposChavesTela;
              end;
           end
           else
              abort;
         end
      else
         begin
           //if MessageDlg('Confirma altera??o ?',mtConfirmation,[mbYES, mbNO],0) = mrYES then
           if MensagemPadrao(mAlerta,[bSim,bNao],'Mensagem do sistema [UAcad?mico3C]','Altera??o de registro.','Confirma Altera??o?') = bSim then
           begin
              proAntesSalvarPai;
              if CampoObrigatorios(qry) = True then
              begin
                proValidarEspecifica;
                proSalvaLog;
                Data.DataSet.Post;
                try
                  Screen.Cursor := crSQLWait;
                  try
                    qry.ApplyUpdates(-1);
                  finally
                    Screen.Cursor := crDefault;
                  end;
                except
                  Abort;
                end;
                proGravaFilhos;
                proDepoisSalvarPai;
              end;
           end
           else
              abort;
         end;
      if (Matriz2[0] <> Nil) and (Matriz2[0] is TDBEdit) then (Matriz2[0] as TDBEdit).SetFocus;
     except
      on e: Exception do
          begin
            MessageDlg('Aten??o n?o foi possivel incluir o registro.' + #13 +
              'Erro do sistema:' + #13
              + e.Message   + #13
              + e.ClassName + #13, mtError, [mbOK],0);
            Abort;
          end;
     end;
   end
else if (sender as Sender.ClassType) = Matriz1[4] then
begin
   Data.DataSet.Cancel;
   Data.DataSet.Close;
   Data.DataSet.Open;
   proDepoisCancelar;
end

else if (sender as Sender.ClassType) = Matriz1[5] then
begin
  //Data.DataSet.Close;
  //Data.DataSet.Open;
  Data.DataSet.Refresh
end
else if (sender as Sender.ClassType) = Matriz1[6] then
   Data.DataSet.First
else if (sender as Sender.ClassType) = Matriz1[7] then
   Data.DataSet.Last
else if (sender as Sender.ClassType) = Matriz1[8] then
   Data.DataSet.Prior
else if (sender as Sender.ClassType) = Matriz1[9] then
   Data.DataSet.Next;

TControl(Matriz1[00]).Enabled :=  not (Data.State in [dsInsert,dsEdit]);
TControl(Matriz1[01]).Enabled := (not (Data.State in [dsInsert,dsEdit])) and ((not Data.DataSet.BOF) or (not Data.DataSet.EOF) );
TControl(Matriz1[02]).Enabled := (not (Data.State in [dsInsert,dsEdit])) and ((not Data.DataSet.BOF) or (not Data.DataSet.EOF) );
TControl(Matriz1[03]).Enabled :=      (Data.State in [dsInsert,dsEdit]);
TControl(Matriz1[04]).Enabled :=      (Data.State in [dsInsert,dsEdit]);
TControl(Matriz1[05]).Enabled :=  not (Data.State in [dsInsert,dsEdit]);
TControl(Matriz1[06]).Enabled := (not (Data.State in [dsInsert,dsEdit])) and (not Data.DataSet.BOF);
TControl(Matriz1[07]).Enabled := (not (Data.State in [dsInsert,dsEdit])) and (not Data.DataSet.EOF);
TControl(Matriz1[08]).Enabled := (not (Data.State in [dsInsert,dsEdit])) and (not Data.DataSet.BOF);
TControl(Matriz1[09]).Enabled := (not (Data.State in [dsInsert,dsEdit])) and (not Data.DataSet.EOF);
TControl(Matriz1[10]).Enabled :=  not (Data.State in [dsInsert,dsEdit]);

end;

procedure TYCad.BitIncluirClick(Sender: TObject);
begin
 proAntesExecutarControle;
 Controle(  QryPai,            {Query Pai}
            Sender,
            YCad,              { Form }
            dsQry,             { DataSource }
          [ BitIncluir,        { Incluir }
            BitEditar,         { Alterar }
            BitRemove,         { Excluir }
            BitSalvar,         { Confirmar }
            BitCancelar,       { Cancelar }
            BitAtualizar,      { Atualizar }
            BitPrimeiro,       { Primeiro }
            BitUltimo,         { Ultimo }
            BitAnterior,       { Anterior }
            BitProximo,        { Proximo }
            BitPesquisa,       { Pesquisa }
            BitSair            { Fechar Tela }
          ],
          [
           vFocoInclusao,      { 1? campo para Inclus?o }
           vFocoAlteracao      { 1? campo para Altera?ao}
          ],
          [
          False,               { 1? campo, Durante a inclus?o habilita este campo ? }
          True                 { 2? campo, Durante a Altera??o habilita este campo ? }
          ]) ;
 proDepoisExecutarControle;
end;


procedure TYCad.dsQryDataChange(Sender: TObject; Field: TField);
var
 x: Integer;
begin
  BitIncluirClick(Sender);
end;

procedure TYCad.BitPesquisaClick(Sender: TObject);
begin
  //proCamposVisiveisPesquisa;

  proAntesPesquisar;
  if TRIM(ControleTela.CamposVisiveisPesquisa) <> '' then
    CamposVisiveisComponente(ControleTela.CamposVisiveisPesquisa);

  abaPesquisa.TabVisible := True;
  abaCadastro.TabVisible := False;
  abaAjuda.TabVisible := False;
  abaRelatorio.TabVisible := False;

end;

//------------------------------------------------------------------------------
//Procedure para validar botoes visiveis na tela
//Parametro 'S' visivel, paramento, 'N' Invisivel
//------------------------------------------------------------------------------
procedure TYCad.PrcBotoesVisiveis(b1, b2, b3, b4, b5, b6, b7, b8, b9,
  b10, b11, b12, b13, b14 : String);
begin

 if b1='S' then
  BitIncluir.Visible:=True
 else
  BitIncluir.Visible:=False;

 if b2='S' then
  BitAtualizar.Visible:=True
 else
  BitAtualizar.Visible:=False;

 if b3='S' then
  BitUltimo.Visible:=True
 else
  BitUltimo.Visible:=False;

 if b4='S' then
  BitPrimeiro.Visible:=True
 else
  BitPrimeiro.Visible:=False;

 if b5='S' then
  BitProximo.Visible:=True
 else
  BitProximo.Visible:=False;

 if b6='S' then
  BitAnterior.Visible:=True
 else
  BitAnterior.Visible:=False;

 if b7='S' then
  BitRemove.Visible:=True
 else
  BitRemove.Visible:=False;

 if b8='S' then
  BitSalvar.Visible:=True
 else
  BitSalvar.Visible:=False;

 if b9='S' then
  BitCancelar.Visible:=True
 else
  BitCancelar.Visible:=False;

 if b10='S' then
  BitEditar.Visible:=True
 else
  BitEditar.Visible:=False;

 if b11='S' then
  BitPesquisa.Visible:=True
 else
  BitPesquisa.Visible:=False;

 if b12='S' then
  BitHelp.Visible:=True
 else
  BitHelp.Visible:=False;

 if b13='S' then
  BitRelatorio.Visible:=True
 else
  BitRelatorio.Visible:=False;

 if b14='S' then
  BitSair.Visible:=True
 else
  BitSair.Visible:=False;
end;


procedure TYCad.Fecharnometela1Click(Sender: TObject);
begin
 if BitSair.Enabled = True then
  BitSair.Click;
end;

procedure TYCad.BitSairClick(Sender: TObject);
begin
 vFechaTela := True;
 Close;
end;

procedure TYCad.BitIncluirMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 Sp1.SimpleText:='Insere Novo Registro';
end;

procedure TYCad.BitAtualizarMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
 Sp1.SimpleText:='Atualziar';
end;

procedure TYCad.BitUltimoMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 Sp1.SimpleText:='Mover para o Ultimo Registro';
end;

procedure TYCad.BitPrimeiroMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
 Sp1.SimpleText:='Mover para o Primeiro Registro';
end;

procedure TYCad.BitProximoMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 Sp1.SimpleText:='Mover para o Proximo Registro';
end;

procedure TYCad.BitAnteriorMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
 Sp1.SimpleText:='Mover para o Registro Anterior';
end;

procedure TYCad.BitRemoveMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 Sp1.SimpleText:='Remover Registro';
end;

procedure TYCad.BitSalvarMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 Sp1.SimpleText:='Salvar Registro';
end;

procedure TYCad.BitCancelarMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
 Sp1.SimpleText:='Cancelar';
end;

procedure TYCad.BitEditarMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 Sp1.SimpleText:='Editar';
end;

procedure TYCad.BitPesquisaMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
 Sp1.SimpleText:='Abre tela de Pesquisa';
end;

procedure TYCad.BitHelpMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 Sp1.SimpleText:='Ajuda';
end;

procedure TYCad.BitRelatorioMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
 Sp1.SimpleText:='Relat?rio de Tela';
end;

procedure TYCad.BitSairMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 Sp1.SimpleText:='Fechar Tela ';
end;

procedure TYCad.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 Sp1.SimpleText:='...';
end;

procedure TYCad.ToolBar1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 Sp1.SimpleText:='...';
end;

procedure TYCad.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 if QryPai.State in [DsEdit,DsInsert] then
 begin
  MessageDlg('Salve as Altera??es pendentes antes de Fechar.', mtConfirmation, [mbOk], 0);
  CanClose:=False;
 end;
end;


procedure TYCad.FontedaTela1Click(Sender: TObject);
begin
 if FontDialog1.Execute = True then
 begin
  Self.Font:=FontDialog1.Font;
 end;
end;

procedure TYCad.CordeFundodaTela1Click(Sender: TObject);
begin
 if ColorDialog1.Execute = True then
 begin
   Self.Color := ColorDialog1.Color;
   Self.pnlPesquisa.Color := ColorDialog1.Color;
   Self.pnlListagem.Color := ColorDialog1.Color;
 end;
end;

procedure TYCad.RestaurarPadro2Click(Sender: TObject);
begin
 Self.Color:=clBtnFace;
 Self.pnlPesquisa.Color := clBtnFace;
 Self.pnlListagem.Color := clBtnFace;
 Self.Font.Size:=8;
 Self.Font.Name:='MS Sans Serif';
 Self.Font.Color:=clBlack;
 Self.Font.Charset:=DEFAULT_CHARSET;
 Self.Font.Style := [];
end;

function TYCad.fncVerificaConexao: Boolean;
begin
 QryPai.Close;
 //QryPai.CommandText := QryPai.CommandText 
 QryPai.Open;
 try
   Result := True;
 Except
  ShowMessage('ATEN??O - Erro ao tentar abrir a Query PAI, verifique.');
  Result := False
 end;
end;

{-------------------------------------------------------------------------------}
{Virifica campos obrigat?rios}
{-------------------------------------------------------------------------------}
function  CampoObrigatorios(qryFoco : TClientDataSet):Boolean;
var
 vCont : Integer;
begin
 Result := True;
 for vCont := 0 to qryFoco.FieldCount - 1 do
 begin
  if  TRIM(qryFoco.Fields[vCont].AsString) = '' then
  begin

   if qryFoco.Fields[vCont].Required = True then
   begin
     Result:=False;
     MensagemPadrao(mAlerta,[bOk],'Campo Obrigat?rio: ','? obrigat?rio o preenchimento do campo: ' + qryFoco.Fields[vCont].DisplayLabel,'Campo obrigat?rio n?o informado.');
     qryFoco.Fields[vCont].FocusControl;
     Exit;
   end;

  end;
 end;

end;

procedure TYCad.btnPesquisaCancelClick(Sender: TObject);
begin
  proCancelarPesquisa(vSqlAntigo);
  abaPesquisa.TabVisible := False;
  abaAjuda.TabVisible := False;
  abaCadastro.TabVisible := True;
  abaRelatorio.TabVisible := False;  
end;

{-------------------------------------------------------------------------------}
{Carregar todos campos da tabela para pesquisa}
{-------------------------------------------------------------------------------}
procedure TYCad.proPopularCamposPesquisa;
var
 vCont : Integer;
begin
 nmCampos.Items.Clear;
 nmNomeFisico.Items.Clear;
 nmTipo.Items.Clear;
 {
 for vCont := 0 to  QryPai.FieldCount - 1 do
 begin
  if DBGrid1.Columns.Items[vCont].Visible =  True then
  begin
    if QryPai.Fields[vCont].FieldKind <> fkLookup then
    begin
      if QryPai.Fields[vCont].DataType = ftString  then
      begin
        listCamposDisponiveis.Items.Add(QryPai.Fields[vCont].DisplayLabel);
        nmCampos.Items.Add(QryPai.Fields[vCont].DisplayLabel);
        nmNomeFisico.Items.Add(QryPai.Fields[vCont].FieldName);
        nmTipo.Items.Add('S');
      end else if QryPai.Fields[vCont].DataType = ftInteger then
      begin
        listCamposDisponiveis.Items.Add(QryPai.Fields[vCont].DisplayLabel);
        nmCampos.Items.Add(QryPai.Fields[vCont].DisplayLabel);
        nmNomeFisico.Items.Add(QryPai.Fields[vCont].FieldName);
        nmTipo.Items.Add('N');
      end;
    end;
  end;
 end;
 }

 //proCamposVisiveisPesquisa;
 if TRIM(ControleTela.CamposVisiveisPesquisa) <> '' then
   CamposVisiveisComponente(ControleTela.CamposVisiveisPesquisa);

 for vCont := 0 to  DBGridPesq.Columns.Count  - 1 do
 begin
  if DBGridPesq.Columns.Items[vCont].Visible =  True then
  begin
    if (QryPai.Fields[vCont].FieldKind <> fkLookup) and (QryPai.Fields[vCont].FieldKind <> fKcalculated) then
    begin
      if QryPai.Fields[vCont].DataType = ftString  then
      begin
        nmCampos.Items.Add(QryPai.Fields[vCont].DisplayLabel);
        nmNomeFisico.Items.Add(QryPai.Fields[vCont].FieldName);
        nmTipo.Items.Add('S');
      end else if QryPai.Fields[vCont].DataType = ftInteger then
      begin
        nmCampos.Items.Add(QryPai.Fields[vCont].DisplayLabel);
        nmNomeFisico.Items.Add(QryPai.Fields[vCont].FieldName);
        nmTipo.Items.Add('N');
      end else if (QryPai.Fields[vCont].DataType = ftDateTime) or (QryPai.Fields[vCont].DataType = ftDate) then
      begin
        nmCampos.Items.Add(QryPai.Fields[vCont].DisplayLabel);
        nmNomeFisico.Items.Add(QryPai.Fields[vCont].FieldName);
        nmTipo.Items.Add('D');
      end;
    end;
  end;
 end;


 nmCampos.ItemIndex := 0;
 nmComparador.ItemIndex := 0;
 proTipoDeparametro;
end;


{-------------------------------------------------------------------------------}
{executa pesquisa padr?o de tela}
{-------------------------------------------------------------------------------}
procedure TYCad.proExecutarPesquisa(campo, operador, parametro, parametro1, tipo: string);
var
 vParametro : String;
 vOperador  : String;
begin

  if ((tipo = 'S') or (tipo = 'D')) and (operador <> 'ENTRE') then
  begin

     if operador = 'CONTEM' then
       vParametro := QuotedStr('%'+parametro+'%')
     else
       vParametro := QuotedStr(parametro);

     if operador = 'IGUAL' then
        vOperador := '='
     else if operador = 'CONTEM' then
        vOperador := 'LIKE'
     else if operador = 'MAIOR' then
        vOperador := '>'
     else if operador = 'MENOR' then
        vOperador := '<';

      try

        if funcExisteWHERE(vSqlPesquisa) = True then
        begin
          QryPai.close;
          QryPai.CommandText := vSqlPesquisa + ' and ' +  campo + ' ' +
          vOperador + ' ' + vParametro;
        end else
        begin
          QryPai.close;
          QryPai.CommandText := vSqlPesquisa + ' where ' +  campo + ' ' +
          vOperador + ' ' + vParametro;
        end;

        QryPai.Open;

      except
        proCancelarPesquisa(vSqlAntigo);
      end;

  end else if (tipo = 'N') then
  begin

     if operador = 'CONTEM' then
       vParametro := '%'+parametro+'%'
     else
       vParametro := parametro;

     if operador = 'IGUAL' then
        vOperador := '='
     else if operador = 'CONTEM' then
        vOperador := 'LIKE'
     else if operador = 'MAIOR' then
        vOperador := '>'
     else if operador = 'MENOR' then
        vOperador := '<';

     try
       if funcExisteWHERE(vSqlPesquisa) = True then
       begin
        QryPai.close;
        QryPai.CommandText := vSqlPesquisa + ' and ' +  campo + ' ' +
        vOperador + ' ' + vParametro;
       end else
       begin
        QryPai.close;
        QryPai.CommandText := vSqlPesquisa + ' where ' +  campo + ' ' +
        vOperador + ' ' + vParametro;
       end;

      QryPai.Open;
     except
       proCancelarPesquisa(vSqlAntigo);
     end;

  end else if (tipo = 'D') and (operador = 'ENTRE') then
  begin

     try
       if funcExisteWHERE(vSqlPesquisa) = True then
       begin
        QryPai.close;
        QryPai.CommandText := vSqlPesquisa + ' and ' +  campo + ' ' +
        '>=' +  QuotedStr(Parametro) + ' and ' + campo + ' <= ' + QuotedStr(Parametro1)
       end else
       begin
        QryPai.close;
        QryPai.CommandText := vSqlPesquisa + ' where ' +  campo + ' ' +
        '>=' + QuotedStr(Parametro) + ' and ' + campo + ' <= ' + QuotedStr(Parametro1)
       end;

      QryPai.Open;
     except
       proCancelarPesquisa(vSqlAntigo);
     end;

  end;

end;

procedure TYCad.btnPesquisaOkClick(Sender: TObject);
begin
 if (nmTipo.Items.Strings[nmCampos.ItemIndex] = 'S') and ((nmComparador.Items.Strings[nmComparador.ItemIndex] = 'MAIOR') or
    (nmComparador.Items.Strings[nmComparador.ItemIndex] = 'MENOR') or (nmComparador.Items.Strings[nmComparador.ItemIndex] = 'ENTRE')) then
 begin
   ShowMessage('Campo selecionado para filtro n?o pode ser usando com os operadores [MAIOR, MENOR, ENTRE]');
   Exit;
 end;

  if (nmTipo.Items.Strings[nmCampos.ItemIndex] = 'N') and ((nmComparador.Items.Strings[nmComparador.ItemIndex] = 'CONTEM') or
     (nmComparador.Items.Strings[nmComparador.ItemIndex] = 'ENTRE')) then
 begin
   ShowMessage('Campo selecionado para filtro n?o pode ser usando com o operador [COMTEM, ENTRE]');
   Exit;
 end;

 if (nmTipo.Items.Strings[nmCampos.ItemIndex] = 'D') and (nmComparador.Items.Strings[nmComparador.ItemIndex] = 'CONTEM') then
 begin
   ShowMessage('Campo selecionado para filtro n?o pode ser usando com o operador [COMTEM]');
   Exit;
 end;

 if (nmTipo.Items.Strings[nmCampos.ItemIndex] = 'N') or (nmTipo.Items.Strings[nmCampos.ItemIndex] = 'S') then
 begin
   if trim(nmParametro.Text) = '' then
   begin
     proExecutarPesquisaSemParametro;
   end else
   begin
     proExecutarPesquisa(nmNomeFisico.Items.Strings[nmCampos.ItemIndex],nmComparador.Items.Strings[nmComparador.ItemIndex],
        nmParametro.Text,'',nmTipo.Items.Strings[nmCampos.ItemIndex]);
   end;
 end else if nmTipo.Items.Strings[nmCampos.ItemIndex] = 'D' then
 begin

   if nmComparador.ItemIndex <> 4 then
   begin

     if ValidarData(nmParametroData.Date) = False then
     begin
       ShowMessage('Informe uma Data V?lida para filtrar.');
     end else
     begin
       proExecutarPesquisa(nmNomeFisico.Items.Strings[nmCampos.ItemIndex],nmComparador.Items.Strings[nmComparador.ItemIndex],
          nmParametroData.Text,'',nmTipo.Items.Strings[nmCampos.ItemIndex]);
     end;

   end else
   begin

     if ValidarData(DataInicio.Date) = False then
       ShowMessage('Informe uma Data Inicial v?lida.')
     else if ValidarData(DataFim.Date) = False then
       ShowMessage('Informe uma Data Final v?lida.')
     else begin
       proExecutarPesquisa(nmNomeFisico.Items.Strings[nmCampos.ItemIndex],nmComparador.Items.Strings[nmComparador.ItemIndex],
          DataInicio.Text,DataFim.Text, nmTipo.Items.Strings[nmCampos.ItemIndex]);
     end;

   end;

 end;

  if TRIM(ControleTela.CamposVisiveisPesquisa) <> '' then
    CamposVisiveisComponente(ControleTela.CamposVisiveisPesquisa);

end;

{-------------------------------------------------------------------------------}
{Cancela pesquisa}
{-------------------------------------------------------------------------------}
procedure TYCad.proCancelarPesquisa(sql: string);
begin
  QryPai.close;
  QryPai.CommandText := sql;
  QryPai.Open;
end;

procedure TYCad.BitBtn1Click(Sender: TObject);
begin
  proCancelarPesquisa(vSqlAntigo);
  //proCamposVisiveisPesquisa;
  if TRIM(ControleTela.CamposVisiveisPesquisa) <> '' then
    CamposVisiveisComponente(ControleTela.CamposVisiveisPesquisa);
  
end;

procedure TYCad.bitUtilizarFiltroVoltarClick(Sender: TObject);
begin
  if not(QryPai.IsEmpty) then
  begin
    abaPesquisa.TabVisible := False;
    abaAjuda.TabVisible := False;
    abaCadastro.TabVisible := True;
    abaRelatorio.TabVisible := False;
  end else
   ShowMessage('O Filtro informado para pesquisa n?o retornou registro.');
end;


procedure TYCad.bitCancelaAjudaClick(Sender: TObject);
begin
  abaPesquisa.TabVisible := False;
  abaAjuda.TabVisible := False;
  abaCadastro.TabVisible := True;
  abaRelatorio.TabVisible := False;
end;

procedure TYCad.BitHelpClick(Sender: TObject);
begin
{ proAntesAbrirAjuda;
  abaPesquisa.TabVisible := False;
  abaCadastro.TabVisible := False;
  abaAjuda.TabVisible := True;
  abaRelatorio.TabVisible := False; }

  CRIA_TELA_PADRAO_HELP(vNomeClasse,'TELAS');

end;

procedure TYCad.proCarregarArquivoAjuda(caminho_nome_arquico: String);
begin
 try
//    memoAjudaTela.Lines.LoadFromFile(caminho_nome_arquico);
 except
   ShowMessage('N?o foi poss?vel carregar o arquivo referente a ajuda da tela, prov?velmente o arquivo '+
      'n?o existe ou o caminho onde se encontra est? incorreto');
 end;
end;


procedure TYCad.btnCancelaVoltarListagemClick(Sender: TObject);
begin
  abaPesquisa.TabVisible := False;
  abaAjuda.TabVisible := False;
  abaRelatorio.TabVisible := False;
  abaCadastro.TabVisible := True;
end;

procedure TYCad.BitRelatorioClick(Sender: TObject);
begin
  if ControleTela.PermiteRelatorioPadrao = True then
  begin
    abaPesquisa.TabVisible := False;
    abaAjuda.TabVisible := False;
    abaRelatorio.TabVisible := True;
    abaCadastro.TabVisible := False;
  end else
   ShowMessage('Funcionalidade desabilitada para essa tela.');  
end;

{-------------------------------------------------------------------------------}
{fun??o para gerar auto incremento}
{-------------------------------------------------------------------------------}
function TYCad.funRetornaAutoIncremento(campo, tabela: String; filtro:string=''): Integer;
var
 qryAux : TClientDataSet;
begin
 qryAux := TClientDataSet.Create(Nil);
 try
  qryAux.RemoteServer := PrincDM.sckAcademicoX;
  qryAux.ProviderName := 'dspGenerica';
  qryAux.Close;
  qryAux.CommandText := 'select max(' + campo + ') + 1 as qt from ' + tabela + ' ' + filtro;
  qryAux.Open;
  if qryAux.FieldByName('qt').AsInteger > 0 then
   Result := qryAux.FieldByName('qt').AsInteger
  else
   Result := 1;

 finally
  qryAux.Free;
 end;

end;

procedure TYCad.proTelaSemRegistro(parFiltro:String);
begin
  QryPai.close;
  QryPai.CommandText := vSqlAntigo + ' ' + parFiltro;
  QryPai.Open;
end;

procedure TYCad.proGravaFilhos;
begin
   //procedimento virtual, N?o implementar aqui
end;

procedure TYCad.proValidarEspecifica;
begin
   //procedimento virtual, N?o implementar aqui
end;

procedure TYCad.proAntesSalvarPai;
begin
  //procedimento virtual, N?o implementar aqui
end;

procedure TYCad.proAntesExecutarControle;
begin
  //procedimento virtual, N?o implementar aqui
end;

procedure TYCad.proDepoisExecutarControle;
begin
   //procedimento virtual, N?o implementar aqui
end;

procedure TYCad.FormShow(Sender: TObject);
begin
  if Trim(vSqlPesquisa) <> '' then
  begin
    if (pos('1=-1', vSqlPesquisa) <= 0) then
    begin
      proPopularCamposPesquisa;
    end;
  end;   
  Application.OnMessage := ProcessaMsg;
  vFechaTela := False;
  if vNomeTela = '' then
    vNomeTela := YCad.Caption;
end;

procedure TYCad.proAntesDeletar;
begin
   //procedimento virtual, N?o implementar aqui
end;

procedure TYCad.proCamposVisiveisPesquisa;
begin
{
 if TRIM(ControleTela.CamposVisiveisPesquisa) <> '' then
 begin
   CamposVisiveisPesquisa(Self,[])]);
 end;
}
end;

procedure TYCad.proDepoisCancelar;
begin
   //procedimento virtual, N?o implementar aqui
end;

procedure TYCad.proDepoisSalvarPai;
begin
   //procedimento virtual, N?o implementar aqui
end;

{Fun??o usada para anco FireBird e Interbase}
function TYCad.GENERATE(gerador:string): Integer;
var
 qryAux : TClientDataSet;
begin
 qryAux := TClientDataSet.Create(Nil);
 try
  qryAux.RemoteServer := QryPai.RemoteServer;
  qryAux.ProviderName := 'dspGenerica';
  qryAux.CommandText := 'SELECT GEN_ID(' + gerador + ',1) AS QT FROM RDB$DATABASE';
  qryAux.Open;
  if qryAux.FieldByName('qt').AsInteger > 0 then
   Result := qryAux.FieldByName('qt').AsInteger
  else
   Result := 1;

 finally
  qryAux.Free;
 end;

end;

{Deletar registro datasourse}
function TYCad.funDeletar(qry: TDataSource): Boolean;
begin
 Result := True;
 qry.DataSet.Delete;
 try
  qry.DataSet.Post;
 except
   Result := False
 end
end;

procedure TYCad.QryPaiReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin

 MensagemPadrao(mErro,[bok],'Erro',e.Message,funRetornaDescricaoConstraint(nomeConstraint(e.Message)));
 {
 if MensagemPadrao(mAlerta,[bSim,bNao],'Cadastro de ERROS','Ajuste de mensagens de erros do sistema','Deseja melhorar o erro encontrado nessa tela?') = bSim then
 begin
   CRIA_FORM_LIB(TFACAD_CadConstraint,
                  'select * from adm_constraint where nm_constraint = ' + QuotedStr(nomeConstraint(e.Message)),
                    'select * from adm_constraint where  nm_constraint = ' + QuotedStr(nomeConstraint(e.Message)), '','','');
 end;
  }
  {
  QryPai.Cancel;
  QryPai.Close;
  QryPai.Open;
  proDesabilitaCamposChavesTela;
  Abort;
  }
end;

procedure TYCad.ABRE_TELA(NomeObj : TYCad);
begin
 NomeObj.ShowModal;
 NomeObj.Free;
end;

procedure TYCad.QryPaiAfterInsert(DataSet: TDataSet);
var
vControle : Boolean;
begin
  if gravaLog.Ativada = True then
  begin
     {
     DataSet.FieldByName(gravaLog.UserCreate).AsString := gravaLog.UsuarioLogado;
     DataSet.FieldByName(gravaLog.DataCreate).AsDateTime := StrToDate(gravaLog.DataInclusao);
     DataSet.FieldByName(gravaLog.UserAlter).AsString := gravaLog.UsuarioLogado;
     DataSet.FieldByName(gravaLog.DataAlter).AsDateTime := StrToDate(gravaLog.DataAlteracao);
     }
     DataSet.FieldByName(gravaLog.UserCreate).AsString := UsuarioLogado.Login;
     DataSet.FieldByName(gravaLog.DataCreate).AsDateTime := UsuarioLogado.DataAcesso;
     DataSet.FieldByName(gravaLog.UserAlter).AsString := UsuarioLogado.Login;
     DataSet.FieldByName(gravaLog.DataAlter).AsDateTime := UsuarioLogado.DataAcesso;

  end;
  if ControleTela.AutoIncremento = True then
  begin
    if (TRIM(ControleTela.CampoTabela) <> '') and (TRIM(ControleTela.TabelaBanco) <> '') then
    begin
      vControle := False;
      if (pfInKey in QryPai.Fields.FieldByName(ControleTela.CampoTabela).ProviderFlags) then
      begin
        if QryPai.Fields.FieldByName(ControleTela.CampoTabela).ReadOnly = True then
        begin
         vControle := True;
         //proHabilitaDesabilitaCampoChave(False);
        end;
      end;
      DataSet.FieldByName(ControleTela.CampoTabela).AsInteger := funRetornaAutoIncremento(ControleTela.CampoTabela,ControleTela.TabelaBanco);
      if vControle = True then
        //proHabilitaDesabilitaCampoChave(True);
    end;
  end;
end;

procedure TYCad.proSalvaLog;
begin
 if gravaLog.Ativada = True then
 begin
   //  QryPai.FieldByName(gravaLog.UserAlter).AsString := gravaLog.UsuarioLogado;
   //  QryPai.FieldByName(gravaLog.DataAlter).AsDateTime := StrToDate(gravaLog.DataAlteracao);
   QryPai.FieldByName(gravaLog.UserAlter).AsString := UsuarioLogado.Login;
   QryPai.FieldByName(gravaLog.DataAlter).AsDateTime := UsuarioLogado.DataAcesso;
 end;
end;

procedure TYCad.proCamposMaiusculos;
var
 i:Integer;
begin
 for i := 0 to ComponentCount - 1 do
  if (Components[i] is TDBEdit) then
  begin
    (Components[i] as TDBEdit).CharCase := ecUpperCase;
  end;
end;

function StrToArrayChar(texto:string):Pointer;
var
 cTmp: Array of Char;
 i:integer;
begin
  SetLength(cTmp,length(texto));
  for i:=1 to length(texto) do
  begin
    cTmp[i] := texto[i];
  end;
  result := @cTmp;
end;

procedure TYCad.proAjusteAutomaticoTamanhoCampos;
var
 i,j:integer;
begin
 for i := 0 to ComponentCount - 1 do
 begin
  if (Components[i] is TDBEdit) then
  begin
     for j := 0 to  QryPai.FieldCount - 1 do
     begin
       if (Components[i] as TDBEdit).DataField = QryPai.Fields[j].FieldName then
       begin
         if (Components[i] as TDBEdit).MaxLength <= 0 then
              (Components[i] as TDBEdit).MaxLength := QryPai.Fields[j].DisplayWidth;
       end;
     end;
  end;

  if (Components[i] is TCDSPesqDBEdit) then
  begin
     for j := 0 to  QryPai.FieldCount - 1 do
     begin
       if (Components[i] as TCDSPesqDBEdit).DataField = QryPai.Fields[j].FieldName then
       begin
         if (Components[i] as TCDSPesqDBEdit).MaxLength <= 0 then
              (Components[i] as TCDSPesqDBEdit).MaxLength := QryPai.Fields[j].DisplayWidth;
       end;
     end;
  end;

 end;
end;

procedure TYCad.nmCamposChange(Sender: TObject);
begin
 nmParametro.Clear;
 proTipoDeparametro
end;

procedure TYCad.nmComparadorChange(Sender: TObject);
begin
 nmParametro.Clear;
 proTipoDeparametro;
end;

procedure TYCad.nmParametroKeyPress(Sender: TObject; var Key: Char);
begin
 if nmTipo.Items.Strings[nmCampos.ItemIndex] = 'N' then
 begin
   if not( key in['0'..'9',#8,#7,#6,#5,#5,#13] ) then
     key := #0;
 end;

 if key = #13 then
  btnPesquisaOk.Click;
end;

{Fun??o para verificar se determinada string cont?m a string WHERE}
function TYCad.funcExisteWHERE(sql: String): Boolean;
var
  ver: String;
  i, ii, cont: Integer;
  de : String;
  Texto : TStringList;
begin
 cont :=0;
 de := 'WHERE';
 Result := False;
 Texto := TStringList.Create;
 Texto.Text := sql;
 try

   for i:= 0 to Texto.Count -1 do
   begin
     for ii := 1 to Length(Texto.Strings[i]) do
     begin
       ver:= Copy(Texto.Strings[i], ii, Length(de));
       if Uppercase(ver) = de then
        Result := True
     end;
   end;

 finally
   Texto.Free;
 end;

end;

procedure TYCad.proAntesPesquisar;
begin
  //procedimento virtual, N?o implementar aqui
end;

procedure TYCad.proAntesAbrirAjuda;
begin
   //procedimento virtual, N?o implementar aqui
end;

{------------------------------------------------------------------------------}
//Deabilita a PK da tela, para evitar altera??o de Pk por usu?rio BURRO
{------------------------------------------------------------------------------}
procedure TYCad.proDesabilitaCamposChavesTela;
var
 j,i : Integer;
begin


 if ControleTela.DesabilitaCampoChave = True then
 begin
 {
   for j := 0 to QryPai.FieldCount - 1 do
   begin
     if (pfInKey in QryPai.Fields[j].ProviderFlags) then
     begin

       for i := 0 to ComponentCount - 1 do
       begin

           //DBEdit [padr?o Delphi]
           if (Components[i] is TDBEdit) then
           begin
             if (Components[i] as TDBEdit).DataField = QryPai.Fields[j].FieldName then
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
             if (Components[i] as TCDSPesqDBEdit).DataField = QryPai.Fields[j].FieldName then
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
             if (Components[i] as TDBDateEdit).DataField = QryPai.Fields[j].FieldName then
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
   }
 end else
 begin
   {
   for j := 0 to QryPai.FieldCount - 1 do
   begin
     if (pfInKey in QryPai.Fields[j].ProviderFlags) then
     begin
       for i := 0 to ComponentCount - 1 do
       begin
         if QryPai.State <> dsInsert then
         begin
           //DBEdit [padr?o Delphi]
           if (Components[i] is TDBEdit) then
           begin
             if (Components[i] as TDBEdit).DataField = QryPai.Fields[j].FieldName then
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
             if (Components[i] as TCDSPesqDBEdit).DataField = QryPai.Fields[j].FieldName then
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
             if (Components[i] as TDBDateEdit).DataField = QryPai.Fields[j].FieldName then
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
             if (Components[i] as TDBEdit).DataField = QryPai.Fields[j].FieldName then
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
             if (Components[i] as TCDSPesqDBEdit).DataField = QryPai.Fields[j].FieldName then
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
             if (Components[i] as TDBDateEdit).DataField = QryPai.Fields[j].FieldName then
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
   }
 end;
 
end;

procedure TYCad.QryPaiAfterScroll(DataSet: TDataSet);
begin
 proDesabilitaCamposChavesTela;
end;

procedure TYCad.QryPaiAfterOpen(DataSet: TDataSet);
begin
 proDesabilitaCamposChavesTela;
end;

procedure TYCad.QryPaiBeforePost(DataSet: TDataSet);
begin
 proDesabilitaCamposChavesTela;
end;

{Verifica se tipo de parametro ? Data ou Texto}
procedure TYCad.proTipoDeparametro;
begin
 if nmTipo.Items.Strings[nmCampos.ItemIndex] = 'D' then
 begin
   if nmComparador.ItemIndex = 4 then
   begin
     nmParametroData.Clear;
     nmParametroData.Visible := False;
     nmParametro.Clear;
     nmParametro.Visible := False;
     pEntreDatas.Visible := True;
     DataInicio.Clear;
     DataFim.Clear;
   end else
   begin
     nmParametroData.Visible := True;
     nmParametroData.Clear;
     nmParametro.Clear;
     nmParametro.Visible := False;
     DataInicio.Clear;
     DataFim.Clear;
     pEntreDatas.Visible := False;
   end;
 end else
 begin
   nmParametroData.Clear;
   nmParametroData.Visible := False;
   nmParametro.Visible := True;
   nmParametro.Clear;
   DataInicio.Clear;
   DataFim.Clear;
   pEntreDatas.Visible := False;
 end;

end;

{Valida Data}
function TYCad.ValidarData(Data: TDateTime): Boolean;
var
   Ano, Mes, Dia : Word;
begin
   Result := False;
   DecodeDate(Data, Ano, Mes, Dia);
   if IsValidDate(Ano, Mes, Dia) then
     Result := True;
end;


{Habilita ou Desabilita campos setados como chave}
procedure TYCad.proHabilitaDesabilitaCampoChave(vTipo: Boolean);
var
 j:Integer;
begin
   for j := 0 to QryPai.FieldCount - 1 do
   begin
     if (pfInKey in QryPai.Fields[j].ProviderFlags) then
       QryPai.Fields[j].ReadOnly := vTipo
    else
       //QryPai.Fields[j].ReadOnly := not(vTipo);
   end;
end;

function TYCad.key_status(Key: integer): boolean;
begin
  Result := Odd(GetKeyState(Key));
end;

procedure TYCad.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key_status(VK_LMENU)) and (Key = VK_F4) then
 begin
   vFechaTela := false;
   exit;
 end;
 proAcionaAtalhos(key);
end;

procedure TYCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if not vFechaTela then
   Action := caNone
 else
   Action := caFree;
end;

procedure TYCad.nmParametroChange(Sender: TObject);
begin
 if cMaiusculo.Checked = True then
  nmParametro.CharCase := ecUpperCase
 else
  nmParametro.CharCase := ecNormal;
end;

procedure TYCad.proExecutarPesquisaSemParametro;
begin
  QryPai.close;
  QryPai.CommandText := vSqlPesquisa;
  QryPai.Open;  
end;

procedure TYCad.nmParametroDataKeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then
  btnPesquisaOk.Click;
end;

procedure TYCad.DataFimKeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then
  btnPesquisaOk.Click;
end;


procedure TYCad.proAcionaAtalhos(key: Word);
begin
 if (key = VK_F3) and (BitIncluir.Enabled = True) then
  BitIncluir.Click
 else if (key = VK_F4) and (BitAtualizar.Enabled = True) then
  BitAtualizar.Click
 else if (key = VK_F10) and (BitSalvar.Enabled = True) then
  BitSalvar.Click
 else if (key = VK_F7) and (BitRemove.Enabled = True) then
  BitRemove.Click
 else if (key = VK_F12) and (BitCancelar.Enabled = True) then
  BitCancelar.Click
 else if (key = VK_F11) and (BitEditar.Enabled = True) then
  BitEditar.Click
 else if (key = VK_F5) and (BitPesquisa.Enabled = True) then
  BitPesquisa.Click
 else if (key = VK_F6) and (BitRelatorio.Enabled = True) then
  BitRelatorio.Click
 else if (key = VK_F1) and (BitHelp.Enabled = True) then
  BitHelp.Click
 else if (key = VK_Escape) and (BitSair.Enabled = True) then
  BitSair.Click
end;

procedure TYCad.DBGridPesqDblClick(Sender: TObject);
begin
 bitUtilizarFiltroVoltar.Click;
end;

function nomeConstraint(texto:String):String;
var
 retorno : String;
 contador : Integer;
 inicio : Boolean;
begin
 inicio := False;
 retorno := '';
 for contador := 0 to Length(texto) do
 begin

  if (texto[contador] = #39 ) and (inicio = True) then
  begin
   inicio := False;
   Result := TRIM (retorno);
   Exit;
  end;

  if inicio = True then
   retorno := retorno + texto[contador];

  if (texto[contador] = #39 ) and (inicio = False) then
   inicio := True

 end;
  //ShowMessage(retorno);
  ShowMessage(texto);  
  Result := TRIM (retorno);
end;


procedure TYCad.ProcessaMsg(var Msg: TMsg; var Handled: Boolean);
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

procedure TYCad.acIncluirExecute(Sender: TObject);
begin
 if (BitIncluir.Enabled = True) and (PageControlPrincipal.ActivePageIndex = 0) then
  BitIncluir.Click;
end;

procedure TYCad.acAtualizarExecute(Sender: TObject);
begin
 if (BitAtualizar.Enabled = True) and (PageControlPrincipal.ActivePageIndex = 0) then
  BitAtualizar.Click;
end;

procedure TYCad.acSalvarExecute(Sender: TObject);
begin
  if (BitSalvar.Enabled = True) and (PageControlPrincipal.ActivePageIndex = 0) then
  BitSalvar.Click;
end;

procedure TYCad.acRemoverExecute(Sender: TObject);
begin
 if (BitRemove.Enabled = True) and (PageControlPrincipal.ActivePageIndex = 0) then
  BitRemove.Click;
end;

procedure TYCad.acCancelarExecute(Sender: TObject);
begin
 if (BitCancelar.Enabled = True) and (PageControlPrincipal.ActivePageIndex = 0) then
  BitCancelar.Click;
end;

procedure TYCad.acEditarExecute(Sender: TObject);
begin
 if (BitEditar.Enabled = True) and (PageControlPrincipal.ActivePageIndex = 0) then
  BitEditar.Click;
end;

procedure TYCad.acPesquisaTelaExecute(Sender: TObject);
begin
 if (BitPesquisa.Enabled = True) and (PageControlPrincipal.ActivePageIndex = 0) then
  BitPesquisa.Click;
end;

procedure TYCad.acSairExecute(Sender: TObject);
begin
 if (BitSair.Enabled = True) and (PageControlPrincipal.ActivePageIndex = 0) then
  BitSair.Click;
end;

procedure TYCad.acAjudaExecute(Sender: TObject);
begin
 if (BitHelp.Enabled = True) and (PageControlPrincipal.ActivePageIndex = 0) then
  BitHelp.Click;
end;

procedure TYCad.bitBotaoMenuAuxClick(Sender: TObject);
begin
 CriaTelaMenuFlutuante
end;

procedure TYCad.prcConfiguraDadosCadastroTela;
var
 cdsAux : TClientDataSet;
begin
  cdsAux := TClientDataSet.Create(Nil);
  try
    cdsAux.RemoteServer := QryPai.RemoteServer;
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

procedure TYCad.bitSolicitacaoClick(Sender: TObject);
var
x : Integer;
begin

  PrincDM.vEmpresa := '';
  PrincDM.vCd_Filial := '';
  PrincDM.vCd_Aluno := '';
  PrincDM.vCd_Matricula := '';
  PrincDM.vCd_Ingresso := '';
  PrincDM.vCd_matriculaCurso := '';
  PrincDm.vNr_Solicitacao_Ref := '';

    for x:=0 to QryPai.Fields.Count-1 do
    begin

     if UpperCase(QryPai.Fields.Fields[x].FieldName) = 'EMPRESA' then
       PrincDM.vEmpresa := QryPai.Fieldbyname('empresa').AsString;

     if UpperCase(QryPai.Fields.Fields[x].FieldName) = 'CD_FILIAL' then
       PrincDM.vCd_filial := QryPai.Fieldbyname('cd_filial').AsString;

     if UpperCase(QryPai.Fields.Fields[x].FieldName) = 'CD_ALUNO' then
       PrincDM.vCd_aluno := QryPai.Fieldbyname('cd_aluno').AsString;

     if UpperCase(QryPai.Fields.Fields[x].FieldName) = 'CD_MATRICULA' then
       PrincDM.vCd_matricula := QryPai.Fieldbyname('cd_matricula').AsString;

     if UpperCase(QryPai.Fields.Fields[x].FieldName) = 'CD_INGRESSO' then
       PrincDM.vCd_Ingresso := QryPai.Fieldbyname('cd_ingresso').AsString;

     if UpperCase(QryPai.Fields.Fields[x].FieldName) = 'CD_MATRICULACURSO' then
       PrincDM.vCd_matriculaCurso := QryPai.Fieldbyname('cd_matriculacurso').AsString;

     if UpperCase(QryPai.Fields.Fields[x].FieldName) = 'NR_SOLICITACAO' then
       PrincDM.vNr_Solicitacao_Ref := QryPai.Fieldbyname('NR_SOLICITACAO').AsString;

    end;
  

 CRIA_TELA_SOLICITACAO(UpperCase(ClassName),tpSolicita, '');
end;


procedure TYCad.FormCreate(Sender: TObject);
begin
  vNomeClasse := ClassName;
  prcConfiguraDadosCadastroTela;
  //if fncVerificaConexao = True then
  if 1=1 then
  begin
    if (TRIM(UCControlsPai.GroupName) <> '') and (TRIM(UCControlsPai.GroupName) <> 'Modelo Padrao [N?o alterar]') then
      UsuarioLogado.UserControl.Log('ACESSO TELA:' + UCControlsPai.GroupName,2);
   if gravaLog.Ativada = True then
   begin
     pnlLog.Visible := True;
     eDataInc.DataField := gravaLog.DataCreate;
     eUserInc.DataField := gravaLog.UserCreate;
     eDataAlt.DataField := gravaLog.DataAlter;
     eUserAlt.DataField := gravaLog.UserAlter;
   end else
     pnlLog.Visible := False;

   if ControleTela.CamposMaiusculos = True then
    proCamposMaiusculos;

   if ControleTela.AutoAjusteLengthCampoTela = True then
    proAjusteAutomaticoTamanhoCampos;

   vFocoInclusao := ControleTela.CampoFocoInclusao;
   vFocoAlteracao := ControleTela.CampoFocoALteracao;

   abaPesquisa.TabVisible := False;
   abaAjuda.TabVisible := False;
   abaCadastro.TabVisible := True;
   abaRelatorio.TabVisible := False;
   //proPopularCamposPesquisa;
   vSqlAntigo :=  QryPai.CommandText;
   Fecharnometela1.Caption:='Fechar Tela '  + vNomeTela;
 end;

  if Height < 475 then
    Height := 475;

  abaAjuda.TabVisible := False;
  abaRelatorio.TabVisible := False;
end;

procedure TYCad.Solicitao1Click(Sender: TObject);
begin
 bitSolicitacao.Click;
end;

procedure TYCad.AjudadoSistema1Click(Sender: TObject);
begin
 BitHelp.Click;
end;

procedure TYCad.MenuAuxiliar1Click(Sender: TObject);
begin
 CriaTelaMenuFlutuante;
end;

end.

