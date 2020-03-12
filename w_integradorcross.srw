HA$PBExportHeader$w_integradorcross.srw
$PBExportComments$Window do Integrador Cross.
forward
global type w_integradorcross from window
end type
type st_total from statictext within w_integradorcross
end type
type st_3 from statictext within w_integradorcross
end type
type st_data from statictext within w_integradorcross
end type
type st_1 from statictext within w_integradorcross
end type
type st_contador from statictext within w_integradorcross
end type
type lb_arquivos from listbox within w_integradorcross
end type
end forward

global type w_integradorcross from window
integer width = 3154
integer height = 1724
boolean titlebar = true
string title = "IntegradorCross"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "Imagens\Integradorcross.ico"
boolean center = true
event trayevent pbm_custom01
event ue_timer ( )
st_total st_total
st_3 st_3
st_data st_data
st_1 st_1
st_contador st_contador
lb_arquivos lb_arquivos
end type
global w_integradorcross w_integradorcross

type variables
uo_integracao_cross iuo_integracao
n_icontray_cross in_tray
uo_intcross_timer iuo_timer

datetime idt_data, idt_dt_ini
string		is_usuario, is_url, is_senha, is_nm_hosp_conexa
long		il_qtd_reg, il_cod_conexa, il_intervalo_sinc, il_segundos_data, il_cpu
boolean	ib_ok = true
end variables

forward prototypes
public function integer wf_busca_arquivos ()
public function integer wf_tamanho (string ps_tipo)
public function integer wf_soma_quantidade ()
public function long wf_garantir_execucao_exclusiva ()
public function integer wf_integracao_cross ()
public subroutine wf_chamar_ws_cross (string ps_url, string ps_usuario, string ps_senha, datastore pds_dados, long pl_qtd_reg)
end prototypes

event trayevent;Choose Case lparam
	Case in_tray.WM_LBUTTONDBLCLK
		in_tray.of_delete_icon(this,false)
		This.Show()
		This.setposition( totop!)
		post wf_tamanho('NORMAL')
		//halt close

End Choose
end event

event ue_timer();long ll_numero

ll_numero = long(st_contador.text)

if ll_numero > 0 then
	ll_numero = ll_numero - 1
end if

st_contador.text = string(ll_numero)
end event

public function integer wf_busca_arquivos ();long ll_total, ll_for, ll_qtd_reprocessar
string ls_nome_arq, ls_comando
boolean lb_reprocessar // determina se ter$$HEX2$$e1002000$$ENDHEX$$arquivos renomeados "rep_*.xml" para reprocessar na pr$$HEX1$$f300$$ENDHEX$$xima itera$$HEX2$$e700e300$$ENDHEX$$o 

// Chamado 127539 - Gilton, 19/09/2019
// Quando houver perda de conex$$HEX1$$e300$$ENDHEX$$o, os arquivos n$$HEX1$$e300$$ENDHEX$$o importados s$$HEX1$$e300$$ENDHEX$$o movidos para a pasta \Erros, renomeados como "rep_" + nome_original + ".xml"
// Nesse momento recupera-se os arquivos renomeados, movendo de volta para a pasta \Recebidos.
if gl_count_desconexao > 0 then

	// Exemplo: cmd /C move "H:\Projetos\SECONCI\CROSS\Erros\rep_*.xml" "H:\Projetos\SECONCI\CROSS\Recebidos"
	ls_comando = 'cmd /C move "' + iuo_integracao.is_dir_erro + '\rep_*.xml" "' + iuo_integracao.is_dir_rec + '"'
	f_run(ls_comando, true)

	// Exemplo: cmd /C ren "H:\Projetos\SECONCI\CROSS\Recebidos\rep_*.xml" "////*.xml"
	ls_comando = 'cmd /C ren "' + iuo_integracao.is_dir_rec + '\rep_*.xml" "////*.xml"'
	f_run(ls_comando, true)

end if	
gl_count_desconexao = 0
// Fim chamado 127539

if not lb_arquivos.DirList(iuo_integracao.is_dir_rec + '\*', 0) then
	ll_total = -2
end if

ll_total = lb_arquivos.totalitems()

if ll_total < 1 then 
	timer(iuo_integracao.il_intervalo)
	return 1
end if

st_contador.visible = false

timer(0)

for ll_for = 1 to ll_total
	
	lb_arquivos.selectitem( ll_for)
	
	yield()
	
	//Por algum algum motivo ainda n$$HEX1$$e300$$ENDHEX$$o descoberto, quando existem muitos arquivos o sistema para de funcionar.
	//Limitado a 100 por vez para garantir a estabilidade do processo.
	if ll_for > 100 then exit
	
	ls_nome_arq = trim(lb_arquivos.text(ll_for))

	iuo_integracao.uf_inicia_integracao(ls_nome_arq, ref lb_reprocessar)
	if lb_reprocessar then gl_count_desconexao++

	iuo_integracao.uf_reset() //Ch.: 89771 - Luiz Carlos, 13/07/2016
	
	if wf_soma_quantidade() = -1 then return -1
	
	yield()
next

st_contador.visible = True

lb_arquivos.reset()

timer(iuo_integracao.il_intervalo)
st_contador.text = string(iuo_integracao.il_intervalo)

return 1
end function

public function integer wf_tamanho (string ps_tipo);if ps_tipo = 'NORMAL' then
	This.WindowState = Normal!
end if

return 1
end function

public function integer wf_soma_quantidade ();long ll_total

ll_total = long(st_total.text)

ll_total++

st_total.text = String(ll_total)

return 1
end function

public function long wf_garantir_execucao_exclusiva ();string ls_mensagem
long 	ll_linha, ll_linhas
datastore lds

// Quando est$$HEX2$$e1002000$$ENDHEX$$executando pelo PB n$$HEX1$$e300$$ENDHEX$$o precisa fazer essa valida$$HEX2$$e700e300$$ENDHEX$$o.
if (handle(getApplication()) = 0) then return 1

lds = create datastore
lds.dataobject = 'ds_sessoes'
lds.settransobject(SQLCA)

ll_linhas = lds.retrieve()
choose case ll_linhas
	case is < 0
		messagebox('Aten$$HEX2$$e700e300$$ENDHEX$$o', 'Problemas ao verificar a exist$$HEX1$$ea00$$ENDHEX$$ncia de outras sess$$HEX1$$f500$$ENDHEX$$es executando o Integrador CROSS.~nEste aplicativo deve ser executado somente em um lugar.')
		//	N$$HEX1$$e300$$ENDHEX$$o h$$HEX2$$e1002000$$ENDHEX$$return de erro, pois isso impediria a execu$$HEX2$$e700e300$$ENDHEX$$o de toda a aplica$$HEX2$$e700e300$$ENDHEX$$o s$$HEX2$$f3002000$$ENDHEX$$por n$$HEX1$$e300$$ENDHEX$$o poder fazer a verifica$$HEX2$$e700e300$$ENDHEX$$o.
		return 1
		
	case 0
		// Melhor cen$$HEX1$$e100$$ENDHEX$$rio. N$$HEX1$$e300$$ENDHEX$$o h$$HEX2$$e1002000$$ENDHEX$$outra execu$$HEX2$$e700e300$$ENDHEX$$o deste m$$HEX1$$f300$$ENDHEX$$dulo al$$HEX1$$e900$$ENDHEX$$m desta pr$$HEX1$$f300$$ENDHEX$$pria.
		return 1
		
	case is >= 1
		
		ls_mensagem = 'N$$HEX1$$e300$$ENDHEX$$o $$HEX2$$e9002000$$ENDHEX$$poss$$HEX1$$ed00$$ENDHEX$$vel iniciar o integrador, pois ele j$$HEX2$$e1002000$$ENDHEX$$foi executado em outro(s) computador(es).~n~n'
		for ll_linha = 1 to ll_linhas
			ls_mensagem += '   $$HEX2$$22202000$$ENDHEX$$' + lds.getItemString(ll_linha, 'compute_mensagem')			
			if (ll_linha < ll_linhas) then ls_mensagem += '~n'
		next
		
		messagebox('Aten$$HEX2$$e700e300$$ENDHEX$$o', ls_mensagem)
		
		// H$$HEX2$$e1002000$$ENDHEX$$pelo menos um usu$$HEX1$$e100$$ENDHEX$$rio j$$HEX2$$e1002000$$ENDHEX$$executando este aplicativo e a execu$$HEX2$$e700e300$$ENDHEX$$o deste ser$$HEX2$$e1002000$$ENDHEX$$negada.
		return -1
		
end choose

return -2
end function

public function integer wf_integracao_cross ();Datastore lds_dados_integracao
Long	ll_linhas
Datetime ldt_fim

// Chamado 128914 - Gilton, 31/10/2019
// Caso a exporta$$HEX2$$e700e300$$ENDHEX$$o para o CROSS seja feita pelo exportador.cross.exe n$$HEX1$$e300$$ENDHEX$$o executa essa fun$$HEX2$$e700e300$$ENDHEX$$o
if gb_exportador_cross then return 1

//DS para pegar os dados a serem integrados
lds_dados_integracao = create datastore
lds_dados_integracao.dataobject = 'd_dados_integracao'
lds_dados_integracao.setTransObject(SQLCA)

//Busca a data atual
SELECT sysdate
	INTO :idt_data
	FROM dual;

if isNull(idt_data) then
	gl_count_desconexao ++
	if (gl_count_desconexao > 4) then 
		iuo_integracao.uf_log_erro_exportacao('Desconex$$HEX1$$e300$$ENDHEX$$o ao banco de dados detectada. Reconex$$HEX1$$e300$$ENDHEX$$o autom$$HEX1$$e100$$ENDHEX$$tica em instantes.')
		gl_count_desconexao = 0
	end if	
	return -1 
else
	gl_count_desconexao = 0
end if	

//Armazena a data fim para um dia anterior a data atual.
ldt_fim = datetime(relativedate(date(idt_data), -1), time('23:59:59'))

ll_linhas = lds_dados_integracao.retrieve(idt_dt_ini, ldt_fim) 

if ll_linhas < 0 then  
	iuo_integracao.uf_log_erro_exportacao('Erro ao carregar estrutura com os dados a serem integrados.')
	return -1 
elseif ll_linhas > 0 then
	try
		wf_chamar_ws_cross(is_url, is_usuario, is_senha, lds_dados_integracao, il_qtd_reg)
		
	catch (throwable ex)
		if (isValid(iuo_integracao)) then iuo_integracao.uf_log_erro_exportacao('Problemas ao chamar o Web Service do CROSS: ' + ex.text + ' - W_INTEGRADORCROSS - OPEN.')	
	finally
		
	end try
end if

return 1
end function

public subroutine wf_chamar_ws_cross (string ps_url, string ps_usuario, string ps_senha, datastore pds_dados, long pl_qtd_reg);long 		ll_retorno, ll_linha, ll_linhas, ll_cd_compromisso, ll_cd_recurso, ll_ret, ll_qtd_reg, ll_cd_motivo, ll_pos, ll_pos_fim
string		ls_retorno, ls_tipo, ls_cd_cross, ls_age_cross, ls_pac_cross, ls_status, ls_alta, ls_falta, ls_unidade, &
			ls_func, ls_dt_atualiza, ls_cd_pront, ls_cd_motivo, ls_log, ls_comando, ls_response

// Trecho destinado ao response a ser criado na pasta tempor$$HEX1$$e100$$ENDHEX$$ria (problemas de IO no AMEL) 
// Chamado 128914 - Gilton, 21/10/2019
/*ContextKeyword lcxk_base
string ls_temp[]
string ls_response_temp 

this.GetContextService("Keyword", lcxk_base)
lcxk_base.getContextKeywords("TEMP", ls_temp)
ls_response_temp = ls_temp[1] + '\response.log'*/
// Fim response Temp

ll_linhas = pds_dados.rowcount()

ll_qtd_reg = pl_qtd_reg

for ll_linha = 1 to ll_linhas
	
	if ll_linha > ll_qtd_reg then exit // Limite de envios
	
	ls_tipo 					= pds_dados.getItemString(ll_linha, 'tipo_arquivo')
	ls_cd_cross 				= string(il_cod_conexa)
	ls_age_cross 			= string(pds_dados.getItemNumber(ll_linha, 'age_cross'))
	ls_pac_cross 			= string(pds_dados.getItemNumber(ll_linha, 'pac_cross'))
	ls_status 				= pds_dados.getItemString(ll_linha, 'situacao')							
	ls_alta 					= pds_dados.getItemString(ll_linha, 'alta')
	ls_falta 					= pds_dados.getItemString(ll_linha, 'falta')
	ll_cd_motivo				= pds_dados.getItemNumber(ll_linha, 'cd_motivo')
	ls_unidade 				= is_nm_hosp_conexa
	ls_func 					= pds_dados.getItemString(ll_linha, 'nm_funcionario')
	ls_dt_atualiza 			= pds_dados.getItemString(ll_linha, 'dt_ult_atualiz')
	ls_cd_pront 				= string(pds_dados.getItemNumber(ll_linha, 'cd_pront'))
	ll_cd_recurso 			= pds_dados.getItemNumber(ll_linha, 'cd_recurso')
	ll_cd_compromisso	= pds_dados.getItemNumber(ll_linha, 'sq_compromisso')

	// Chamado 125606 - Gilton, 06/05/2019
	// Alterado para usar um subprograma feito no .NET (Giordani) por termos tido problemas com DLLs do PB para WS
	// Monta-se o comando, executa a linha de comando e na sequencia l$$HEX2$$ea002000$$ENDHEX$$o arquivo texto para pegar o retorno do CROSS
	ls_comando = '"' + gs_direxec + '\salux.integrador.cross.exe"' + &
		    ' usuario=' + ps_usuario + &
			' senha=' + ps_senha + &
			' tipo=' + ls_tipo + &
			' codunidadeexe=' + ls_cd_cross + &
			' codigoagendamento=' + ls_age_cross + &
			' codigopaciente=' + ls_pac_cross + &
			' status=' + ls_status + &
			' alta=' + ls_alta + &
			' falta=' + ls_falta + &
			' nomeunidade="' + ls_unidade + '"' + &
			' nomeusuarioacao="' + ls_func + '"' + &
			' dtatualizacao="' + ls_dt_atualiza + '"' + &
			' numeroprontuario=' + ls_cd_pront

	// Somente envia par$$HEX1$$e200$$ENDHEX$$metro motivo se existir
	if (ll_cd_motivo > 0) then ls_comando += ' codigomotivo=' + String(ll_cd_motivo)	
	// Adicionado aqui para manter a ordem anterior de envio dos parametros
	ls_comando += ' codunidadeorigem=' + ls_cd_cross
	// Passa o caminho completo para o EXE salvar o log corretamente
//	if not (gb_retorno_cross_temp) then
		ls_comando += ' responsefile="' + gs_direxec + '"\response.log'
//	else
//		ls_comando += ' responsefile="' + ls_response_temp + '"'
//	end if	

	// Se estiver em modo debug, coloca em modo debug tamb$$HEX1$$e900$$ENDHEX$$m o EXE chamado
	if gb_debug then
		ls_comando += ' debug'
		messageBox('Informa$$HEX2$$e700e300$$ENDHEX$$o', 'Path: ' + gs_direxec + '~r~n' + &
										   'Comando: ' + ls_comando)	
	end if											

	// Executa e aguarda o programa que aciona o WS
	f_run(ls_comando, true)

	// Le o arquivo texto salvo pelo programa, contendo o retorno do CROSS
//	if not (gb_retorno_cross_temp) then
		ls_response = f_fileread(gs_direxec + '\response.log')
		FileDelete(gs_direxec + '\response.log')
//	else
//		ls_response = f_fileread(ls_response_temp)
//		FileDelete(ls_response_temp)
//	end if	
	
	// Localiza a tag com a mensagem de retorno
	ll_pos = Pos(ls_response, '<RecepcaoResult>', 1)
	// Localiza a mensagem de retorno
	if ll_pos > 0 then ll_pos += 16
	// Localiza o fechamento da tag com a mensagem de retorno
	ll_pos_fim = Pos(ls_response, '</RecepcaoResult>', 1)
	// Extrai a mensagem de retorno
	ls_retorno = Mid(ls_response, ll_pos, (ll_pos_fim - ll_pos))

	if gb_debug then
		messageBox('Teste', 'Response: ' + ls_response + '~r~n' + &
								   'Retorno: ' + ls_retorno)
	end if	

	// Popula a tabela rep_cross de acordo com o retorno do WS
	if iuo_integracao.uf_registra_rep_cross(ls_retorno, ll_cd_recurso, ll_cd_compromisso) = -1 then
		ls_log = String(ll_cd_recurso) + ' - ' + String(ll_cd_compromisso) + ' - ' + ls_retorno
		iuo_integracao.uf_log_erro_exportacao(ls_log)
		continue
	end if
	
next
end subroutine

on w_integradorcross.create
this.st_total=create st_total
this.st_3=create st_3
this.st_data=create st_data
this.st_1=create st_1
this.st_contador=create st_contador
this.lb_arquivos=create lb_arquivos
this.Control[]={this.st_total,&
this.st_3,&
this.st_data,&
this.st_1,&
this.st_contador,&
this.lb_arquivos}
end on

on w_integradorcross.destroy
destroy(this.st_total)
destroy(this.st_3)
destroy(this.st_data)
destroy(this.st_1)
destroy(this.st_contador)
destroy(this.lb_arquivos)
end on

event open;datastore lds_versao, lds_param_integra
long ll_versao, ll_linhas_param
string ls_versao
datetime ldt_dt_ini

lds_versao = create datastore
lds_versao.dataobject = 'versao'

ll_versao 	= lds_versao.getitemnumber(1,'cd_versionamento')
ls_versao 	= string(ll_versao)
ls_versao 	= mid(ls_versao,1,1) + '.' + mid(ls_versao,2,3) + '.' + mid(ls_versao,5,2)

if isnull(ls_versao) then ls_versao = ''

title = 'IntegradorCROSS v' + ls_versao

Select sysdate
into :idt_data
from dual;

// Segundos decorridos no dia em que iniciou o processo   | Ch100160 | 30/05/2017
il_segundos_data = Hour(time(idt_data)) * 3600 + Minute(time(idt_data)) * 60 + Second(time(idt_data))
// segundos desde a inicializa$$HEX2$$e700e300$$ENDHEX$$o do sistema
il_cpu = Cpu() / 1000

st_data.text = string(idt_data,'dd/mm/yyyy hh:mm')

// Giordani Ramos. ch. 96540.
if (wf_garantir_execucao_exclusiva() = -1) then halt close
// Fim ch. 96540.

iuo_integracao = create uo_integracao_cross
if iuo_integracao.il_intervalo > 0 then
	//Transforma para segundos
	iuo_integracao.il_intervalo = iuo_integracao.il_intervalo * 60
end if

iuo_timer = create uo_intcross_timer
iuo_timer.uf_seta_window(w_integradorcross)
iuo_timer.start(1)

Post wf_busca_arquivos()

// Jeferson Neves | CH100160 | 24/05/2017 - Integra$$HEX2$$e700e300$$ENDHEX$$o CROSS 
lds_param_integra = create datastore
lds_param_integra.dataobject = 'd_param_integra'
lds_param_integra.setTransObject(SQLCA)

//DS para pegar par$$HEX1$$e200$$ENDHEX$$metros para integra$$HEX2$$e700e300$$ENDHEX$$o	
ll_linhas_param = lds_param_integra.retrieve() 

if ll_linhas_param < 0 then 
	//se erro, grava log informando o ocorrido
	iuo_integracao.uf_log_erro_exportacao('Erro ao carregar estrutura com par$$HEX1$$e200$$ENDHEX$$metros para integra$$HEX2$$e700e300$$ENDHEX$$o.')
	ib_ok = false
elseif ll_linhas_param > 0 then
	il_cod_conexa 			= lds_param_integra.getitemnumber(lds_param_integra.getRow(), 'cod_conexa')
	is_nm_hosp_conexa 	= lds_param_integra.getitemstring(lds_param_integra.getRow(), 'nm_hospital_conexa')
	is_url 						= lds_param_integra.getitemstring(lds_param_integra.getRow(), 'ds_url_ws_recepcao')
	is_usuario 				= lds_param_integra.getitemstring(lds_param_integra.getRow(), 'ds_usuario_ws')
	is_senha 				= lds_param_integra.getitemstring(lds_param_integra.getRow(), 'ds_senha_ws')
	idt_dt_ini 				= lds_param_integra.getitemdatetime(lds_param_integra.getRow(), 'dt_param_retorno')
	il_qtd_reg 				= lds_param_integra.getitemnumber(lds_param_integra.getRow(), 'qtd_reg_int')
	il_intervalo_sinc		= lds_param_integra.getitemnumber(lds_param_integra.getRow(), 'nr_intervalo_sinc')
	
	// Verificar se usu$$HEX1$$e100$$ENDHEX$$rio, senha e url est$$HEX1$$e300$$ENDHEX$$o com com valores.
	if isnull(il_cod_conexa) or il_cod_conexa = 0 then
		iuo_integracao.uf_log_erro_exportacao('C$$HEX1$$f300$$ENDHEX$$digo Conexa n$$HEX1$$e300$$ENDHEX$$o informado.')
		ib_ok = false
	elseif isnull(is_nm_hosp_conexa) or is_nm_hosp_conexa = '' then
		iuo_integracao.uf_log_erro_exportacao('Nome do Hospital Conexa n$$HEX1$$e300$$ENDHEX$$o informado.')
		ib_ok = false
	elseif isnull(is_url) or is_url = '' then
		iuo_integracao.uf_log_erro_exportacao('Url de acesso ao web service n$$HEX1$$e300$$ENDHEX$$o informada.')
		ib_ok = false
	elseif isnull(is_usuario) or is_usuario = '' then
		iuo_integracao.uf_log_erro_exportacao('Usu$$HEX1$$e100$$ENDHEX$$rio do web service n$$HEX1$$e300$$ENDHEX$$o informado.')
		ib_ok = false
	elseif isnull(is_senha) or is_senha = '' then
		iuo_integracao.uf_log_erro_exportacao('Senha do web service n$$HEX1$$e300$$ENDHEX$$o informado.')
		ib_ok = false
	elseif isnull(idt_dt_ini) or Date(idt_dt_ini) = Date('01/01/1900') then
		iuo_integracao.uf_log_erro_exportacao('Data inicial n$$HEX1$$e300$$ENDHEX$$o informada.')
		ib_ok = false
	elseif isnull(il_qtd_reg) or il_qtd_reg = 0 then
		iuo_integracao.uf_log_erro_exportacao('Quantidade de registros n$$HEX1$$e300$$ENDHEX$$o informada.')
		ib_ok = false
	elseif isNull(il_intervalo_sinc) or il_intervalo_sinc = 0 then
		iuo_integracao.uf_log_erro_exportacao('Campo nr_intervalo_sinc da tabela parametro_conexa inv$$HEX1$$e100$$ENDHEX$$lido.')
		ib_ok = false
	end if
	
	//chama fun$$HEX2$$e700e300$$ENDHEX$$o que fara ir$$HEX2$$e1002000$$ENDHEX$$obter os dados a serem integrados...
	if ib_ok then Post wf_integracao_cross()

end if

end event

event timer;
if wf_busca_arquivos() = -1 then 
	messagebox('Aten$$HEX2$$e700e300$$ENDHEX$$o','Problemas ao realizar a integra$$HEX2$$e700e300$$ENDHEX$$o com o sistema. Contate o suporte.')
	timer(0)
	return -1
end if

if ib_ok then
	if wf_integracao_cross() = -1 then 
		//se retornou -1, o log ja foi gravado, aqui somente ir$$HEX2$$e1002000$$ENDHEX$$parar o timer e retronar -1.
		timer(0)
		return -1
	end if
end if

st_contador.text = string(iuo_integracao.il_intervalo)



end event

event resize;if sizetype = 1 then in_tray.of_add_icon(this)
end event

type st_total from statictext within w_integradorcross
integer x = 1760
integer y = 1556
integer width = 631
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "000000"
boolean focusrectangle = false
end type

type st_3 from statictext within w_integradorcross
integer x = 1097
integer y = 1556
integer width = 631
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Total de arquivos lidos:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_data from statictext within w_integradorcross
integer x = 320
integer y = 1556
integer width = 558
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "00/00/0000 00:00"
boolean focusrectangle = false
end type

type st_1 from statictext within w_integradorcross
integer x = 18
integer y = 1556
integer width = 265
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Iniciado:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_contador from statictext within w_integradorcross
integer x = 1349
integer y = 584
integer width = 407
integer height = 180
integer textsize = -24
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "60"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type lb_arquivos from listbox within w_integradorcross
integer x = 18
integer y = 24
integer width = 3086
integer height = 1528
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

