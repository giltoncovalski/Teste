HA$PBExportHeader$uo_integracao_cross.sru
$PBExportComments$UserObject com as regras de integra$$HEX2$$e700e300$$ENDHEX$$o do CROSS para o SX.
forward
global type uo_integracao_cross from nonvisualobject
end type
end forward

global type uo_integracao_cross from nonvisualobject
end type
global uo_integracao_cross uo_integracao_cross

type prototypes
function long CopyFileW (String lpExistingFileName, String lpNewFileName, Boolean bFailIfExists) library "kernel32.dll";
end prototypes

type variables
string is_dir_rec,is_dir_imp,is_dir_erro, is_atualiza_fone_cad_pac, is_nm_arquivo, is_direxec, is_in_gerar_log
long il_intervalo
datastore ids_agenda_con, ids_agenda_exa, ids_canc_con, ids_canc_exa, ids_transf_con, &
	ids_transf_exa, ids_compromisso
	
//Ch.: 89771 - Luiz Carlos, 13/07/2016
long il_cd_recurso, il_sq_compromisso
// Ch. 127539 - Gilton, 23/09/2019
boolean ib_erro_desconexao = false
end variables

forward prototypes
public function integer uf_carrega_parametros ()
private function integer uf_carrega_datastore ()
public function integer uf_importa_arquivo (string ps_arquivo, ref datastore pds_datastore)
public function integer uf_valida_origem (long pl_cd_dest_origem_cross, string ps_ds_dest_origem_cross, ref long pl_cd_dest_origem_sx, ref string ps_mensagem)
public function integer uf_valida_registro_comp (long pl_id_age_consulta_hor, ref string ps_mensagem)
public function integer uf_valida_data_comp (datetime pdt_agenda_ini, ref string ps_mensagem)
private function datetime uf_soma_minutos (datetime pd_data, long pl_minutos)
private function long uf_diferenca_minutos (datetime pdt_ini, datetime pdt_fim)
private function integer uf_valida_sql (string ps_mensagem, boolean pb_rollback)
public function integer uf_valida_concorrencia_recurso (long pl_cd_recurso, long pl_rec_cd_recurso, datetime pdt_agenda_ini, datetime pdt_agenda_fim, ref string ps_mensagem)
public function integer uf_valida_bloqueio (long pl_cd_recurso, long pl_rec_cd_recurso, datetime pdt_agenda_ini, datetime pdt_agenda_fim, ref string ps_mensagem)
protected function integer uf_valida_tp_compromisso (long pl_cd_recurso, ref string ps_tp_comp, ref string ps_mensagem)
public function integer uf_valida_convenio_recurso (long pl_cd_recurso, ref long pl_cd_plano_saude, ref long pl_cd_tp_plano, ref string ps_mensagem)
public function integer uf_calcula_idade (date pdt_data, ref long pl_idade)
public function long uf_prox_seq_compromisso (long p_cd_recurso)
public function integer uf_busca_tipo_arquivo (string ps_arquivo, ref string ps_tp_arquivo, ref string ps_tp_registro)
public function integer uf_valida_comp_origem (long pl_id_age_consulta_hor_origem, ref string ps_mensagem)
public function integer uf_salvar_transferencia (datastore pds_dados, string ps_tipo)
public function integer uf_salvar_cancelamento (datastore pds_dados, string ps_tipo)
public function integer uf_salvar_agendamento (datastore pds_dados, string ps_tipo)
public function integer uf_salvar_nao_importados (string ps_arquivo, ref datastore pds_dados)
public function integer uf_insere_nao_importado (string ps_arquivo, string ps_tp_arquivo, string ps_tp_registro, datastore pds_dados)
public function integer uf_valida_cancelamento (long pl_id_age_consulta_hor, ref string ps_mensagem)
public function integer uf_tipo_consulta_agend (string ps_arquivo, ref datastore pds_dados, ref datastore pds_dados_sx, ref string ps_mensagem)
public function integer uf_tipo_consulta_transf (string ps_arquivo, ref datastore pds_dados, ref datastore pds_dados_sx, ref string ps_mensagem)
public function integer uf_tipo_consulta_canc (string ps_arquivo, ref datastore pds_dados, ref datastore pds_dados_sx, ref string ps_mensagem)
public function integer uf_tipo_exame_agend (string ps_arquivo, ref datastore pds_dados, ref datastore pds_dados_sx, ref string ps_mensagem)
public function integer uf_valida_recurso_proced (long pl_cd_recurso, long pl_cd_procedimento, string ps_ds_procedimento, ref string ps_mensagem)
public function integer uf_valida_sala_proced (long pl_rec_cd_recurso, long pl_cd_procedimento, string ps_ds_procedimento, ref string ps_mensagem)
public function integer uf_valida_creden_proced (long pl_cd_procedimento, string ps_ds_procedimento, long pl_rec_cd_recurso, ref long pl_cd_credenciado, ref string ps_mensagem)
public function integer uf_tipo_exame_transf (string ps_arquivo, datastore pds_dados, ref datastore pds_dados_sx, ref string ps_mensagem)
public function integer uf_tipo_exame_canc (string ps_arquivo, datastore pds_dados, ref datastore pds_dados_sx, ref string ps_mensagem)
public function integer uf_valida_paciente (long pl_cd_paciente, ref long pl_cd_paciente_sx, ref string ps_nm_paciente, ref string ps_sexo, ref string ps_cns, ref string ps_fone, ref string ps_ddd, ref string ps_fone_trab, ref string ps_ddd_trab, ref date pdt_nascimento, ref decimal pd_peso, ref decimal pd_altura, ref long pl_idade, ref string ps_mensagem)
public function integer uf_busca_tp_recurso (integer pl_cd_recurso, ref string ps_tp_recurso)
public function integer uf_busca_dados_compromisso (long pl_id_age_consulta_hor, ref datastore pds_dados)
public function integer uf_valida_especialidade (long pl_cd_especialidade_cross, string ps_ds_especialidade_cross, string ps_tp_recurso, ref long pl_cd_especialidade_sx, ref string ps_ds_especialidade_sx, ref string ps_mensagem)
public function integer uf_valida_recurso (long pl_cd_recurso_sx, ref string ps_nm_recurso_sx, ref string ps_mensagem)
public function integer uf_valida_medico_espec (long pl_cd_especialidade, long pl_cd_recurso, string ps_nm_recurso, ref string ps_mensagem)
public function integer uf_valida_grade_recurso (long pl_cd_grade_recurso_cross, date pd_data_agenda, datetime pdt_agenda_ini, datetime pdt_agenda_fim, long pl_dia, string ps_encaixe, ref string ps_adicional, ref long pl_cd_grade_recurso_sx, ref long pl_cd_recurso_sx, ref long pl_rec_cd_recurso, ref long pl_duracao, ref long pl_cd_especialidade_sx, ref string ps_mensagem)
public function integer uf_valida_situacao_comp (long pl_id_age_consulta_hor, ref string ps_mensagem)
public function integer uf_valida_procedimento (long pl_cd_procedimento_cross, string ps_ds_procedimento_cross, ref long pl_cd_procedimento_sx, ref string ps_ds_procedimento_sx, ref string ps_tp_procedimento, ref string ps_mensagem)
public function integer uf_valida_motivo_cancel (long pl_cd_motivo_cross, ref long pl_cd_motivo_sx, ref string ps_mensagem)
public function integer uf_log_integracao (string ps_nm_arquivo, string ps_tipo, integer pl_qtd_lid, integer pl_qtd_imp, integer pl_qtd_rej, string ps_funcionario, long pl_cd_recurso, long pl_cd_paciente, string ps_nm_paciente)
public function integer uf_atualiza_fone_cad_paciente (datastore pds_dados, long pl_linha, long pl_cd_paciente_conexa)
public function integer uf_gravar_log_erro (string ps_texto)
public function integer uf_insere_paciente_celular (long pl_cd_paciente, long pl_ddd, string ps_numero, string ps_complemento, string ps_funcionario)
public function integer uf_gera_conexao (transaction pt_trans)
public function integer uf_log_erro (string ps_erro)
public function integer uf_verifica_chave (string ps_tp_registro, ref string ps_msg)
public function integer uf_reset ()
public function integer uf_registra_rep_cross (string ps_retorno, long pl_cd_recurso, long pl_cd_compromisso)
public function integer uf_log_erro_exportacao (string ps_erro)
public function integer uf_valida_encaixe (long pl_cd_recurso, long pl_cd_grade_recurso, datetime pdt_compromisso, datetime pdt_compromisso_fim, ref long pl_sq_compromisso, long pl_duracao, ref string ps_mensagem)
public function integer uf_valida_concorrencia_paciente (long pl_cd_paciente, datetime pdt_compromisso_ini, datetime pdt_compromisso_fim, long pl_cd_recurso, string ps_tipo_agenda, ref string ps_mensagem)
private function integer uf_valida_sql_new (transaction ptr_sqlnew, string ps_mensagem)
public function integer uf_renomeia_move_arquivo (string ps_arquivo)
public function integer uf_move_arquivo (string ps_tipo, string ps_arquivo)
public function long uf_inicia_integracao (string ps_nm_arquivo, ref boolean pb_reprocessar)
end prototypes

public function integer uf_carrega_parametros ();string ls_menu, ls_erro

ls_erro = ''
ls_menu = '~nAcesse: M$$HEX1$$f300$$ENDHEX$$dulo Agenda > Menu cadastro > Par$$HEX1$$e200$$ENDHEX$$metros da Integra$$HEX2$$e700e300$$ENDHEX$$o entre SX e CROSS'

SELECT nm_dir_arq_recebido, nm_dir_arq_importado, nm_dir_arq_erro,
       		nr_intervalo_sinc, in_imp_fone_cad_paciente, in_gerar_log
  INTO :is_dir_rec, :is_dir_imp, :is_dir_erro,
       	   :il_intervalo, :is_atualiza_fone_cad_pac, :is_in_gerar_log
  FROM parametro_conexa;

if sqlca.sqlcode = -1 then 
	messagebox('Aten$$HEX2$$e700e300$$ENDHEX$$o','Problemas ao consultar tabela PARAMETRO_CONEXA :~nLocal: uo_integracao_cross.uf_carrega_parametros~n'+ sqlca.sqlerrtext)
	return -1
elseif sqlca.sqlcode = 100 then 	
	ls_erro += '   - Os par$$HEX1$$e200$$ENDHEX$$metros da integra$$HEX2$$e700e300$$ENDHEX$$o CROSS x SX n$$HEX1$$e300$$ENDHEX$$o foram configurados.~n'
else
	if trim(is_dir_rec) = '' or isnull(is_dir_rec) then
		ls_erro += '   - O diret$$HEX1$$f300$$ENDHEX$$rio padr$$HEX1$$e300$$ENDHEX$$o para arquivos recebidos do CROSS n$$HEX1$$e300$$ENDHEX$$o foi configurado.~n'
		
	elseif trim(is_dir_imp) = '' or isnull(is_dir_imp) then
		ls_erro += '   - O diret$$HEX1$$f300$$ENDHEX$$rio padr$$HEX1$$e300$$ENDHEX$$o para arquivos importados do CROSS para o SX n$$HEX1$$e300$$ENDHEX$$o foi configurado.~n'
		
	elseif trim(is_dir_erro) = '' or isnull(is_dir_erro) then
		ls_erro += '   - O diret$$HEX1$$f300$$ENDHEX$$rio padr$$HEX1$$e300$$ENDHEX$$o para arquivos recebidos do CROSS com erro n$$HEX1$$e300$$ENDHEX$$o foi configurado.~n'
		
	elseif il_intervalo = 0 or isnull(il_intervalo) then
		ls_erro += '   - O Intervalo de Sincroniza$$HEX2$$e700e300$$ENDHEX$$o n$$HEX1$$e300$$ENDHEX$$o foi configurado.'	
	end if
end if

if ls_erro <> '' then
	messagebox('Aten$$HEX2$$e700e300$$ENDHEX$$o','Abaixo segue a lista(s) com a(s) inconsist$$HEX1$$ea00$$ENDHEX$$ncia(s) encontrada(s):~n' + ls_erro + ls_menu)
	return -1
end if

return 1 
end function

private function integer uf_carrega_datastore ();
//DadaStore para arquivos Tipo Consulta - Agendamento
ids_agenda_con = create datastore
ids_agenda_con.dataobject = 'd_integra_cross_a'

if not isvalid(ids_agenda_con.object) then
	messagebox('Aten$$HEX2$$e700e300$$ENDHEX$$o','O objeto D_INTEGRA_CROSS_A n$$HEX1$$e300$$ENDHEX$$o foi encontrado na vers$$HEX1$$e300$$ENDHEX$$o. Contate o Suporte.', stopsign!)
	return -1
end if

//DadaStore para arquivos Tipo Consulta - Transfer$$HEX1$$ea00$$ENDHEX$$ncia
ids_transf_con = create datastore
ids_transf_con.dataobject = 'd_integra_cross_b'

if not isvalid(ids_transf_con.object) then
	messagebox('Aten$$HEX2$$e700e300$$ENDHEX$$o','O objeto D_INTEGRA_CROSS_B n$$HEX1$$e300$$ENDHEX$$o foi encontrado na vers$$HEX1$$e300$$ENDHEX$$o. Contate o Suporte.', stopsign!)
	return -1
end if

//DadaStore para arquivos Tipo Consulta - Cancelamento
ids_canc_con = create datastore
ids_canc_con.dataobject = 'd_integra_cross_c'

if not isvalid(ids_canc_con.object) then
	messagebox('Aten$$HEX2$$e700e300$$ENDHEX$$o','O objeto D_INTEGRA_CROSS_C n$$HEX1$$e300$$ENDHEX$$o foi encontrado na vers$$HEX1$$e300$$ENDHEX$$o. Contate o Suporte.', stopsign!)
	return -1
end if

//DadaStore para arquivos Tipo Exame - Agendamento
ids_agenda_exa = create datastore
ids_agenda_exa.dataobject = 'd_integra_cross_d'

if not isvalid(ids_agenda_exa.object) then
	messagebox('Aten$$HEX2$$e700e300$$ENDHEX$$o','O objeto D_INTEGRA_CROSS_D n$$HEX1$$e300$$ENDHEX$$o foi encontrado na vers$$HEX1$$e300$$ENDHEX$$o. Contate o Suporte.', stopsign!)
	return -1
end if

//DadaStore para arquivos Tipo Exame - Transfer$$HEX1$$ea00$$ENDHEX$$ncia
ids_transf_exa = create datastore
ids_transf_exa.dataobject = 'd_integra_cross_e'

if not isvalid(ids_transf_exa.object) then
	messagebox('Aten$$HEX2$$e700e300$$ENDHEX$$o','O objeto D_INTEGRA_CROSS_E n$$HEX1$$e300$$ENDHEX$$o foi encontrado na vers$$HEX1$$e300$$ENDHEX$$o. Contate o Suporte.', stopsign!)
	return -1
end if

//DadaStore para arquivos Tipo Exame - Cancelamento
ids_canc_exa = create datastore
ids_canc_exa.dataobject = 'd_integra_cross_f'

if not isvalid(ids_canc_exa.object) then
	messagebox('Aten$$HEX2$$e700e300$$ENDHEX$$o','O objeto D_INTEGRA_CROSS_F n$$HEX1$$e300$$ENDHEX$$o foi encontrado na vers$$HEX1$$e300$$ENDHEX$$o. Contate o Suporte.', stopsign!)
	return -1
end if

//DadaStore para armazenar dados que ser$$HEX1$$e300$$ENDHEX$$o inseridos no SX (tabelas compromisso/compromisso_item).
ids_compromisso = create datastore
ids_compromisso.dataobject = 'd_integra_cross_comp'

if not isvalid(ids_compromisso.object) then
	messagebox('Aten$$HEX2$$e700e300$$ENDHEX$$o','O objeto D_INTEGRA_CROSS_COMP n$$HEX1$$e300$$ENDHEX$$o foi encontrado na vers$$HEX1$$e300$$ENDHEX$$o. Contate o Suporte.', stopsign!)
	return -1
end if

//ids_agenda_exa, 
//ids_cancela_con, 
//ids_cancela_exa, 
//ids_transf_con, 
//ids_transf_exa


return 1
end function

public function integer uf_importa_arquivo (string ps_arquivo, ref datastore pds_datastore);Constant string ls_metodo='uf_importa_arquivo'

long ll_retorno

ll_retorno = pds_datastore.importfile(XML!,ps_arquivo)

if ll_retorno < 0 then
	
	if pds_datastore.dataobject = 'd_integra_cross_a' then
		
		pds_datastore.dataobject = 'd_integra_cross_a1'
		pds_datastore.settransobject(SQLCA)
		ll_retorno = pds_datastore.importfile(XML!,ps_arquivo)
		
	elseif pds_datastore.dataobject = 'd_integra_cross_a1' then
		
		pds_datastore.dataobject = 'd_integra_cross_a'
		pds_datastore.settransobject(SQLCA)
		ll_retorno = pds_datastore.importfile(XML!,ps_arquivo)
	end if
	
	if ll_retorno < 0 then
		uf_log_erro(ls_metodo + ' - Erro ao importar o arquivo. Estrutura do XML n$$HEX1$$e300$$ENDHEX$$o compat$$HEX1$$ed00$$ENDHEX$$vel.')
		return -1
	end if
end if

return 1
end function

public function integer uf_valida_origem (long pl_cd_dest_origem_cross, string ps_ds_dest_origem_cross, ref long pl_cd_dest_origem_sx, ref string ps_mensagem);Constant string ls_metodo='uf_valida_origem'
boolean lb_inconsistente=false

long ll_cd_dest_origem
string ls_mensagem


// Destino Origem //
select cd_dest_origem
into :ll_cd_dest_origem
from destino_origem
where cd_conexa = :pl_cd_dest_origem_cross;

if uf_valida_sql('Evento: uo_integracao_cross.uf_valida_origem~n Tabela: DESTINO_ORIGEM', FALSE ) = -1 then return -1
	
if ll_cd_dest_origem = 0 or isnull(ll_cd_dest_origem) then
	ls_mensagem = 'Problema: A Origem do CROSS n$$HEX1$$e300$$ENDHEX$$o est$$HEX2$$e1002000$$ENDHEX$$vinculada ao sistema SX: ' + string(pl_cd_dest_origem_cross) + ' - ' + ps_ds_dest_origem_cross + '~r~n' + &
								'Solu$$HEX2$$e700e300$$ENDHEX$$o: M$$HEX1$$f300$$ENDHEX$$dulo Cadastros Gerais >> Menu Cadastro >> Destino Origem >> Destino Origem ~r~n~r~n'
	ps_mensagem += ls_mensagem
	
	lb_inconsistente = True
	
end if

if ll_cd_dest_origem = 0 then setnull(ll_cd_dest_origem)

pl_cd_dest_origem_sx = ll_cd_dest_origem

//LOG
if lb_inconsistente = True then
	
	uf_log_erro(ls_metodo + ' - Consist$$HEX1$$ea00$$ENDHEX$$ncia: V$$HEX1$$ed00$$ENDHEX$$nculo Origem SX x CROSS ~r~n' + &
											' - Resultado: Inconsistente ~r~n' + &
											' - Par$$HEX1$$e200$$ENDHEX$$metros avaliados:~r~n' + &
											' 		- Origem CROSS = ' + string(pl_cd_dest_origem_cross) )
else
	uf_log_erro(ls_metodo + ' - Consist$$HEX1$$ea00$$ENDHEX$$ncia: V$$HEX1$$ed00$$ENDHEX$$nculo Origem SX x CROSS ~r~n' + &
									' - Resultado: OK ' )

end if
//---------------------------------------------------------------------------------------//

return 1
end function

public function integer uf_valida_registro_comp (long pl_id_age_consulta_hor, ref string ps_mensagem);Constant string ls_metodo='uf_valida_registro_comp'
boolean lb_inconsistente=false

string ls_mensagem
long ll_count

select count(id_age_consulta_hor)
into :ll_count
from compromisso
where id_age_consulta_hor = :pl_id_age_consulta_hor;

if uf_valida_sql('Evento: uo_integracao_cross.uf_valida_registro_comp~n Tabela: COMPROMISSO', FALSE ) = -1 then return -1

if ll_count > 0 then
	ls_mensagem = 'Problema: O c$$HEX1$$f300$$ENDHEX$$digo do Agendamento CROSS j$$HEX2$$e1002000$$ENDHEX$$existe no SX.~r~n' + &
						'Solu$$HEX2$$e700e300$$ENDHEX$$o: Verificar informa$$HEX2$$e700e300$$ENDHEX$$o no sistema SALUX ou CROSS.~r~n~r~n'
	ps_mensagem += ls_mensagem
	
	lb_inconsistente = True
	
end if

//LOG
if lb_inconsistente = True then
	
	uf_log_erro(ls_metodo + ' - Consist$$HEX1$$ea00$$ENDHEX$$ncia: Compromisso j$$HEX2$$e1002000$$ENDHEX$$agendado ~r~n' + &
											' - Resultado: Inconsistente ~r~n' + &
											' - Par$$HEX1$$e200$$ENDHEX$$metros avaliados:~r~n' + &
											' 		- C$$HEX1$$f300$$ENDHEX$$digo do Agendamento no CROSS = ' + string(pl_id_age_consulta_hor) )					
else
	uf_log_erro(ls_metodo + ' - Consist$$HEX1$$ea00$$ENDHEX$$ncia: Compromisso j$$HEX2$$e1002000$$ENDHEX$$agendado ~r~n' + &
									' - Resultado: OK ' )

end if
//---------------------------------------------------------------------------------------//

return 1
end function

public function integer uf_valida_data_comp (datetime pdt_agenda_ini, ref string ps_mensagem);Constant string ls_metodo='uf_valida_data_comp'
boolean lb_inconsistente=false

datetime ldt_atual
string ls_mensagem=''

uf_log_erro(ls_metodo + ' - Consist$$HEX1$$ea00$$ENDHEX$$ncia: Valida$$HEX2$$e700e300$$ENDHEX$$o da data do Compromisso.')

select sysdate
into :ldt_atual
from dual;

if pdt_agenda_ini < ldt_atual then
	ls_mensagem = 'Problema: Data do agendamento CROSS $$HEX2$$e9002000$$ENDHEX$$inferior $$HEX2$$e0002000$$ENDHEX$$data atual.~r~n' + &
						'Solu$$HEX2$$e700e300$$ENDHEX$$o: Verificar informa$$HEX2$$e700e300$$ENDHEX$$o no sistema SALUX ou CROSS.~r~n~r~n'
	ps_mensagem += ls_mensagem	

	lb_inconsistente=True

end if


//LOG
if lb_inconsistente = True then
	
	uf_log_erro(ls_metodo + ' - Consist$$HEX1$$ea00$$ENDHEX$$ncia: Data do Agendamento ~r~n' + &
											' - Resultado: Inconsistente ~r~n' + &
											' - Par$$HEX1$$e200$$ENDHEX$$metros avaliados:~r~n' + &
											' 		- Data do Agendamento = ' + string(pdt_agenda_ini) )
else
	uf_log_erro(ls_metodo + ' - Consist$$HEX1$$ea00$$ENDHEX$$ncia: Data do Agendamento ~r~n' + &
									' - Resultado: OK ' )

end if
//---------------------------------------------------------------------------------------//

return 1
end function

private function datetime uf_soma_minutos (datetime pd_data, long pl_minutos);long ll_intervalo, ll_dias, ll_minutos, ll_minutos_next, ll_horas
datetime ldt_data, ldt_prox_datetime
time lt_horas, lt_horas_next, lt_hours
double ld_seconds

ldt_data = pd_data
ll_intervalo = pl_minutos

ll_dias = (ll_intervalo / 60 ) / 24
if ll_dias > 0 then
	ldt_prox_datetime = datetime(relativedate(date(ldt_data), ll_dias))
	ll_minutos = ll_intervalo - ( ll_dias * 24 * 60 )
	lt_horas = time(ldt_data)
	ld_seconds = ll_minutos * 60
	lt_horas_next = relativetime(lt_horas, ld_seconds)
	if lt_horas_next = time('23:59:59') then
		ldt_prox_datetime = datetime(relativedate(date(ldt_prox_datetime), 1))
		lt_horas_next = time('00:00:00')
		ll_minutos_next = ll_minutos
		ll_minutos = (secondsafter(time(ldt_data), time('23:59:59')) + 1) / 60
		ll_minutos_next = ll_minutos_next - ll_minutos
		ll_horas = ll_minutos_next / 60
		ll_minutos_next = ll_minutos_next - (ll_horas * 60)
		lt_hours = time(string(ll_horas) + ':' + string(ll_minutos_next))
		ldt_prox_datetime = datetime(date(ldt_prox_datetime), lt_hours)
	elseif lt_horas_next < time('23:59:59') then
		ldt_prox_datetime = datetime(date(ldt_prox_datetime), lt_horas_next)			
	elseif lt_horas_next < lt_horas then
		ldt_prox_datetime = datetime(relativedate(date(ldt_prox_datetime), 1))
		ldt_prox_datetime = datetime(date(ldt_prox_datetime), time(lt_horas_next))
	end if
else
	lt_horas = time(ldt_data)
	ll_minutos = ll_intervalo
	ld_seconds = ll_intervalo * 60
	lt_horas_next = relativetime(lt_horas, ld_seconds)
	if lt_horas_next = time('23:59:59') then
		ldt_prox_datetime = datetime(relativedate(date(ldt_data), 1))			
		lt_horas_next = time('00:00:00')
		ll_minutos_next = ll_minutos
		ll_minutos = (secondsafter(time(ldt_data), time('23:59:59')) + 1) / 60
		ll_minutos_next = ll_minutos_next - ll_minutos
		ll_horas = ll_minutos_next / 60
		ll_minutos_next = ll_minutos_next - (ll_horas * 60)
		lt_hours = time(string(ll_horas) + ':' + string(ll_minutos_next))
		ldt_prox_datetime = datetime(date(ldt_prox_datetime), lt_hours)
	elseif lt_horas_next < time('23:59:59') then
		ldt_prox_datetime = datetime(date(ldt_data), lt_horas_next)			
	end if
end if

return ldt_prox_datetime
end function

private function long uf_diferenca_minutos (datetime pdt_ini, datetime pdt_fim);long ll_seg, ll_hrs, ll_min, ll_dia, ll_seg_f, ll_seg_i, ll_dif_minutos

if date(pdt_ini) = date(pdt_fim) then
	ll_seg = SecondsAfter(time(pdt_ini), time(pdt_fim))
	ll_hrs = ll_seg / 3600
	ll_min = ( ll_seg - (ll_hrs * 3600) ) / 60
else
	ll_seg_f = SecondsAfter(time('00:00:00'), time(pdt_fim))
	ll_seg_i = SecondsAfter(time(pdt_ini), time('23:59:59')) + 1
	ll_seg   = ll_seg_f + ll_seg_i
	ll_hrs   = ll_seg / 3600
	ll_min   = ( ll_seg - (ll_hrs * 3600) ) / 60		

	ll_dia   = DaysAfter(date(pdt_ini), date(pdt_fim)) - 1
	ll_hrs   = ll_hrs + 24 * (ll_dia)		
end if

ll_dif_minutos = ll_hrs * 60 + ll_min

return ll_dif_minutos
end function

private function integer uf_valida_sql (string ps_mensagem, boolean pb_rollback);/*
	Sempre ap$$HEX1$$f300$$ENDHEX$$s fazer um comando SQL essa fun$$HEX2$$e700e300$$ENDHEX$$o deve ser chamada. 
	Caso ocorra Desconex$$HEX1$$e300$$ENDHEX$$o com o banco, $$HEX2$$e9002000$$ENDHEX$$feita uma conex$$HEX1$$e300$$ENDHEX$$o automaticamente.
	Isso evita do Painel ficar parado (Ocorreu em alguns clientes).
*/

string ls_server, ls_erro
long ll_dbcode, ll_count=0


//SQLCA = SQLCA

if SQLCA.sqlcode = -1 then
	
	ll_dbcode = SQLCA.SQLDBCode
	ls_erro = SQLCA.sqlerrtext
	
	if ll_dbcode = 0 or ll_dbcode = 03114 or ll_dbcode = 03113 then
		
		DISCONNECT USING SQLCA;
	
		if not isvalid(w_popup_cross) then Open (w_popup_cross)
	
		Do While True
			
			Yield()
			
			if uf_gera_conexao(SQLCA) = -1 then return -1
	
			ll_count++
	
			if SQLCA.SQLCODE <> 0 then
				if SQLCA.SQLDBCode = 1017 then
					SQLCA.LogPass	 = 'COLLABORATION'
					CONNECT USING SQLCA;
					if SQLCA.SQLCODE <> 0 then 
						if isvalid(w_popup_cross) then Close(w_popup_cross)
						Halt Close
					else
						if isvalid(w_popup_cross) then Close(w_popup_cross)
						Exit
					end if
				else
					Continue
				end if
			else
				if isvalid(w_popup_cross) then Close(w_popup_cross)
				return 0
			end if	
			
		Loop
		
	else
		Rollback;
		if isvalid(w_popup_cross) then Close(w_popup_cross)
		
		//Chamado 80247 - Luiz Carlos - 14/07/2015
		//messagebox('Aten$$HEX2$$e700e300$$ENDHEX$$o','Problemas ao acessar o banco de dados: ~n' + ls_erro)
		uf_log_erro(ls_erro)
		//Fim
		
		ps_mensagem = ls_erro
		return -1
	end if
	
end if

if isvalid(w_popup_cross) then Close(w_popup_cross)

return 1
end function

public function integer uf_valida_concorrencia_recurso (long pl_cd_recurso, long pl_rec_cd_recurso, datetime pdt_agenda_ini, datetime pdt_agenda_fim, ref string ps_mensagem);Constant string ls_metodo='uf_valida_concorrencia_recurso'
boolean lb_inconsistente=false

long ll_count
string ls_mensagem=''

if pl_cd_recurso > 0 and pl_rec_cd_recurso > 0 then

	select count(cd_recurso)
		into :ll_count
		from compromisso
		where cd_recurso = :pl_cd_recurso
		and rec_cd_recurso = :pl_rec_cd_recurso
		and ( (:pdt_agenda_ini <= dt_compromisso
				 and :pdt_agenda_fim >= dateadd(mi,duracao,dt_compromisso) )
			or (:pdt_agenda_ini > dt_compromisso
				 and :pdt_agenda_ini < dateadd(mi,duracao,dt_compromisso)
				 and :pdt_agenda_fim >= dateadd(mi,duracao,dt_compromisso) )
			or (:pdt_agenda_ini > dt_compromisso
				 and :pdt_agenda_ini < dateadd(mi,duracao, dt_compromisso)
				 and :pdt_agenda_fim > dt_compromisso
				 and :pdt_agenda_fim < dateadd(mi,duracao, dt_compromisso) )
			or (:pdt_agenda_ini <= dt_compromisso
				 and :pdt_agenda_fim > dt_compromisso
				 and :pdt_agenda_fim < dateadd(mi,duracao,dt_compromisso) ) );
			
	if uf_valida_sql('Evento: uo_integracao_cross.uf_valida_concorrencia_recurso~n Tabela: COMPROMISSO', FALSE ) = -1 then return -1
	
	If ll_count >0  Then
		ls_mensagem = 'Problema: O recurso j$$HEX2$$e1002000$$ENDHEX$$tem este hor$$HEX1$$e100$$ENDHEX$$rio reservado e n$$HEX1$$e300$$ENDHEX$$o permite outro agendamento para o mesmo.~r~n' + &
							'Solu$$HEX2$$e700e300$$ENDHEX$$o: M$$HEX1$$f300$$ENDHEX$$dulo Agenda >> Menu Movimento >> Agenda de Compromissos ~r~n~r~n'
		ps_mensagem += ls_mensagem	
		
		lb_inconsistente = True
		
	End If

end if

//LOG
if lb_inconsistente = True then
	
	uf_log_erro(ls_metodo + ' - Consist$$HEX1$$ea00$$ENDHEX$$ncia: Concorr$$HEX1$$ea00$$ENDHEX$$ncia do recurso ~r~n' + &
											' - Resultado: Inconsistente ~r~n' + &
											' - Par$$HEX1$$e200$$ENDHEX$$metros avaliados:~r~n' + &
											' 		- Recurso = ' + string(pl_cd_recurso) + '~r~n' + &
											' 		- Recurso F$$HEX1$$ed00$$ENDHEX$$sico (Sala) = ' + string(pl_rec_cd_recurso) + '~r~n' + &
											'		- Data in$$HEX1$$ed00$$ENDHEX$$cio agendamento = ' + string(pdt_agenda_ini) + '~r~n' + &
											'		- Data fim agendamento = ' + string(pdt_agenda_fim) )
else
	uf_log_erro(ls_metodo + ' - Consist$$HEX1$$ea00$$ENDHEX$$ncia: Concorr$$HEX1$$ea00$$ENDHEX$$ncia do recurso ~r~n' + &
									' - Resultado: OK ' )
	
end if
//----------------------------------------------------------------------------------------------------------//

return 1
end function

public function integer uf_valida_bloqueio (long pl_cd_recurso, long pl_rec_cd_recurso, datetime pdt_agenda_ini, datetime pdt_agenda_fim, ref string ps_mensagem);Constant string ls_metodo='uf_valida_bloqueio'
boolean lb_inconsistente=false
long ll_count
string ls_mensagem=''

//Testo se o per$$HEX1$$ed00$$ENDHEX$$odo a ser agendado n$$HEX1$$e300$$ENDHEX$$o esta dentro de um bloqueio.

if pl_cd_recurso > 0 and pl_rec_cd_recurso > 0 then

	SELECT count(cd_recurso)   
	  INTO :ll_count
	  FROM bloqueio_horario 
	 WHERE cd_recurso = :pl_cd_recurso AND
			 rec_cd_recurso =:pl_rec_cd_recurso AND
			(( :pdt_agenda_ini  >= dt_ini AND :pdt_agenda_ini <  dt_fim ) OR
			 ( :pdt_agenda_fim  >  dt_ini AND :pdt_agenda_fim  <= dt_fim ));
	
	if uf_valida_sql('Evento: uo_integracao_cross.uf_valida_bloqueio~n Tabela: BLOQUEIO_HORARIO', FALSE ) = -1 then return -1
	
	if ll_count > 0 then
		ls_mensagem = 'Problema: O per$$HEX1$$ed00$$ENDHEX$$odo a ser agendado est$$HEX2$$e1002000$$ENDHEX$$bloqueado na grade do recurso.~r~n' + &
							'Solu$$HEX2$$e700e300$$ENDHEX$$o: M$$HEX1$$f300$$ENDHEX$$dulo Agenda >> Menu Movimento >> Bloqueio de Agenda ~r~n~r~n'
		ps_mensagem += ls_mensagem	
		
		lb_inconsistente = True
		
	end if

end if		
	
//LOG	
if lb_inconsistente = True then
	
	uf_log_erro(ls_metodo + ' - Consist$$HEX1$$ea00$$ENDHEX$$ncia: Per$$HEX1$$ed00$$ENDHEX$$odo de agendamento bloqueado ~r~n' + &
										' - Resultado: Inconsistente ~r~n' + &
										' - Par$$HEX1$$e200$$ENDHEX$$metros avaliados:~r~n' + &
										' 		> Recurso = ' + string(pl_cd_recurso) + '~r~n' + &
										' 		> Recurso F$$HEX1$$ed00$$ENDHEX$$sico (Sala) = ' + string(pl_rec_cd_recurso) + '~r~n' + &
										' 		> In$$HEX1$$ed00$$ENDHEX$$cio do Agendamento = ' + string(pdt_agenda_ini) + '~r~n' + &
										' 		> Fim do Agendamento = ' + string(pdt_agenda_fim) )
else
	uf_log_erro(ls_metodo + ' - Consist$$HEX1$$ea00$$ENDHEX$$ncia: Per$$HEX1$$ed00$$ENDHEX$$odo de agendamento bloqueado ~r~n' + &
										' - Resultado: OK')	
end if	
//---------------------------------------------------------------------------------------//

return 1
end function

protected function integer uf_valida_tp_compromisso (long pl_cd_recurso, ref string ps_tp_comp, ref string ps_mensagem);Constant string ls_metodo='uf_valida_tp_compromisso'
boolean lb_inconsistente=false

string ls_tp_comp, ls_mensagem, ls_ds_comp
long ll_count

if ps_tp_comp = 'P' then
	ps_tp_comp = 'PCO'
	ls_ds_comp = 'Primeira Consulta'
elseif ps_tp_comp = 'R' then
	ps_tp_comp = 'REC'
	ls_ds_comp = 'Reconsulta'
else
	ls_ds_comp = 'Exame'
end if

if pl_cd_recurso = 0 or isnull(pl_cd_recurso) then return 1

//Valida rela$$HEX2$$e700e300$$ENDHEX$$o do recurso com o tipo de compromisso.
SELECT count(*)
INTO :ll_count
FROM recurso_x_tipo_compromisso
WHERE cd_recurso = :pl_cd_recurso
AND cd_tp_compromisso = :ps_tp_comp;

if uf_valida_sql('Evento: uo_integracao_cross.uf_valida_tp_compromisso~n Tabela: RECURSO_X_TIPO_COMPROMISSO', FALSE ) = -1 then return -1

if ll_count = 0 or isnull(ll_count) then
	ls_mensagem = 'Problema: O Recurso n$$HEX1$$e300$$ENDHEX$$o possui v$$HEX1$$ed00$$ENDHEX$$nculo com o Tipo de Compromisso do Agendamento: ' + ps_tp_comp + ' - ' + ls_ds_comp + '~r~n' + &
						'Solu$$HEX2$$e700e300$$ENDHEX$$o: M$$HEX1$$f300$$ENDHEX$$dulo Agenda >> Menu Cadastro >> Recurso x Tipo de Compromisso ~r~n~r~n'
	ps_mensagem += ls_mensagem
	
	lb_inconsistente = True
	
end if

//LOG
if lb_inconsistente = True then
	
	uf_log_erro(ls_metodo + ' - Consist$$HEX1$$ea00$$ENDHEX$$ncia: V$$HEX1$$ed00$$ENDHEX$$nculo Recurso x Tipo de Compromisso ~r~n' + &
											' - Resultado: Inconsistente ~r~n' + &
											' - Par$$HEX1$$e200$$ENDHEX$$metros avaliados:~r~n' + &
											' 		- Recurso = ' + string(pl_cd_recurso) + '~r~n' + &
											'		- Tipo de Compromisso = ' + ps_tp_comp )
else
	uf_log_erro(ls_metodo + ' - Consist$$HEX1$$ea00$$ENDHEX$$ncia: V$$HEX1$$ed00$$ENDHEX$$nculo Recurso x Tipo de Compromisso ~r~n' + &
									' - Resultado: OK ' )

end if
//---------------------------------------------------------------------------------------//

return 1
end function

public function integer uf_valida_convenio_recurso (long pl_cd_recurso, ref long pl_cd_plano_saude, ref long pl_cd_tp_plano, ref string ps_mensagem);Constant string ls_metodo='uf_valida_convenio_recurso'
boolean lb_inconsistente=False

long ll_count, ll_cd_plano, ll_cd_tp_plano
string ls_mensagem=''

if pl_cd_recurso > 0 then
	
	//Recurso (humano) x Plano sa$$HEX1$$fa00$$ENDHEX$$de (Plano ser$$HEX2$$e1002000$$ENDHEX$$sempre SUS)
	SELECT ps.cd_plano_saude
	INTO :ll_cd_plano
	FROM recurso_x_plano rp, plano_saude ps
	WHERE ps.cd_plano_saude = rp.cd_plano_saude
	AND rp.cd_recurso = :pl_cd_recurso
	AND ps.tp_convenio = 'SUS';
	
	if uf_valida_sql('Evento: uo_integracao_cross.uf_valida_convenio_recurso~n Tabela: RECURSO_X_PLANO', FALSE ) = -1 then return -1
	
	if ll_cd_Plano = 0 or isnull(ll_cd_plano) then
		ls_mensagem = 'Problema: O Recurso Humano n$$HEX1$$e300$$ENDHEX$$o possui v$$HEX1$$ed00$$ENDHEX$$nculo com o Plano de Sa$$HEX1$$fa00$$ENDHEX$$de SUS.~r~n' + &
							'Solu$$HEX2$$e700e300$$ENDHEX$$o: M$$HEX1$$f300$$ENDHEX$$dulo Agenda >> Menu Cadastro >> Recurso x Conv$$HEX1$$ea00$$ENDHEX$$nio ~r~n~r~n'
		ps_mensagem += ls_mensagem	
		
		lb_inconsistente = True
		
	end if
		
	if ll_cd_plano = 0 then setnull(ll_cd_plano)	
		
	pl_cd_plano_saude = ll_cd_plano
	pl_cd_tp_plano = 1

end if

//LOG
if lb_inconsistente = True then
	
	uf_log_erro(ls_metodo + ' - Consist$$HEX1$$ea00$$ENDHEX$$ncia: V$$HEX1$$ed00$$ENDHEX$$nculo Recurso x Plano de Sa$$HEX1$$fa00$$ENDHEX$$de (SUS) ~r~n' + &
											' - Resultado: Inconsistente ~r~n' + &
											' - Par$$HEX1$$e200$$ENDHEX$$metros avaliados:~r~n' + &
											' 		- Recurso = ' + string(pl_cd_recurso) )
else
	uf_log_erro(ls_metodo + ' - Consist$$HEX1$$ea00$$ENDHEX$$ncia: V$$HEX1$$ed00$$ENDHEX$$nculo Recurso x Plano de Sa$$HEX1$$fa00$$ENDHEX$$de (SUS) ~r~n' + &
									' - Resultado: OK ' )
	
end if
//----------------------------------------------------------------------------------------------------------//

return 1
end function

public function integer uf_calcula_idade (date pdt_data, ref long pl_idade);long ll_dia_atual, ll_mes_atual, ll_ano_atual
long ll_mes_nasc, ll_ano_nasc, ll_dia_nasc
long ll_dif_dia, ll_dif_mes, ll_dif_ano, ll_max_dia_mes
datetime ld_hoje 

select sysdate
into :ld_hoje
from dual;

ll_ano_atual = year (date(ld_hoje))
ll_ano_nasc  = year (date(pdt_data))
ll_mes_atual = month(date(ld_hoje))
ll_mes_nasc  = month(date(pdt_data))
ll_dia_atual = day  (date(ld_hoje))
ll_dia_nasc  = day  (date(pdt_data))

ll_dif_ano = ll_ano_atual - ll_ano_nasc

if ll_mes_atual <= ll_mes_nasc then
	ll_dif_ano --
	ll_dif_mes = 12 - ll_mes_nasc + ll_mes_atual
else
	ll_dif_mes = ll_mes_atual - ll_mes_nasc
end if

Choose case ll_mes_nasc
	Case 1,3,5,7,8,10,12
		ll_max_dia_mes = 31
	Case 4,6,9,11
		ll_max_dia_mes = 30
	Case 2
		
		if mod(ll_ano_nasc,4) = 0 then
			ll_max_dia_mes = 29
		else
			ll_max_dia_mes = 28
		end if
		
End Choose

if ll_dia_nasc > ll_dia_atual and ll_mes_nasc > ll_mes_atual then
	ll_dif_mes --
	ll_dif_dia = ll_max_dia_mes - ll_dia_nasc + ll_dia_atual
elseif ll_dia_nasc > ll_dia_atual and ll_mes_nasc < ll_mes_atual then
	ll_dif_mes --
	ll_dif_dia = ll_max_dia_mes - ll_dia_nasc + ll_dia_atual
elseif ll_dia_nasc > ll_dia_atual and ll_mes_nasc = ll_mes_atual then
	ll_dif_mes --
	ll_dif_dia = ll_max_dia_mes - ll_dia_nasc + ll_dia_atual
elseif ll_dia_nasc < ll_dia_atual and ll_mes_nasc > ll_mes_atual then
	ll_dif_dia = ll_dia_atual - ll_dia_nasc
elseif ll_dia_nasc < ll_dia_atual and ll_mes_nasc <= ll_mes_atual then
	ll_dif_dia = ll_dia_atual - ll_dia_nasc
else 
	ll_dif_dia = 0
end if

if ll_dif_mes > 11 then
	ll_dif_mes = ll_dif_mes - 12
	ll_dif_ano = ll_dif_ano + 1
end if

pl_idade = ll_dif_ano

return 1
end function

public function long uf_prox_seq_compromisso (long p_cd_recurso);Long ll_cd_compromisso, ll_retorno
String ls_erro
Transaction sqlnew

// Chamado 127539 - Gilton, 19/09/2019
// Vari$$HEX1$$e100$$ENDHEX$$vel criada para renomear o arquivo ao mover para pasta "Erros" quando desconex$$HEX1$$e300$$ENDHEX$$o de banco (ib_erro_desconexao = true).
ib_erro_desconexao = false

sqlnew = create transaction   
sqlnew.dbms = SQLCA.dbms       
sqlnew.database = SQLCA.database  
sqlnew.logid = SQLCA.logid      
sqlnew.logpass  =SQLCA.logpass   
sqlnew.servername =SQLCA.servername
sqlnew.dbparm   = SQLCA.dbparm 

connect using sqlnew;

// Gera o sequencial para pr$$HEX1$$f300$$ENDHEX$$ximo compromisso do recurso. Verifica se ja existe registro para o recurso.
SELECT nr_ult_compromisso
  INTO :ll_cd_compromisso
  FROM compromisso_mestre
 WHERE cd_recurso = :p_cd_recurso
 Using sqlnew;

ls_erro = 'Problemas as acessar o banco de dados.~nTabela: compromisso_mestre (SELECT)'
ll_retorno = uf_valida_sql_new(sqlnew, ls_erro)
if ll_retorno < 0 then 
	il_sq_compromisso = -1
	return -1
end if	

If sqlnew.SQLCode = 100 Then
	INSERT INTO compromisso_mestre ( cd_recurso, nr_ult_compromisso )
	Values ( :p_cd_recurso, 1 )
	Using sqlnew;
Else
	UPDATE compromisso_mestre 
	   SET nr_ult_compromisso = compromisso_mestre.nr_ult_compromisso + 1
	 WHERE compromisso_mestre.cd_recurso = :p_cd_recurso
	 Using sqlnew;
End If

ls_erro = 'Problemas as acessar o banco de dados.~nTabela: compromisso_mestre (INSERT/UPDATE)'
ll_retorno = uf_valida_sql_new(sqlnew, ls_erro)
if ll_retorno < 0 then 
	il_sq_compromisso = -1
	return -1
end if	

SELECT nr_ult_compromisso
  INTO :ll_cd_compromisso
  FROM compromisso_mestre
 WHERE cd_recurso = :p_cd_recurso
 Using sqlnew;

ls_erro = 'Problemas as acessar o banco de dados.~nTabela: compromisso_mestre (SELECT_2)'
ll_retorno = uf_valida_sql_new(sqlnew, ls_erro)
if ll_retorno < 0 then 
	il_sq_compromisso = -1
	return -1
end if	
 
Commit using sqlnew;

disconnect using sqlnew;

// Atribui o valor $$HEX2$$e0002000$$ENDHEX$$variavel de instancia, pois ap$$HEX1$$f300$$ENDHEX$$s desconex$$HEX1$$e300$$ENDHEX$$o n$$HEX1$$e300$$ENDHEX$$o conseguia atribuir o -1 do retorno da fun$$HEX2$$e700e300$$ENDHEX$$o (chamado 127539)
il_sq_compromisso = ll_cd_compromisso

// mant$$HEX1$$e900$$ENDHEX$$m o retorno para a fun$$HEX2$$e700e300$$ENDHEX$$o de transfer$$HEX1$$ea00$$ENDHEX$$ncia que a priori n$$HEX1$$e300$$ENDHEX$$o tinha o mesmo problema relatado acima
return ll_cd_compromisso
end function

public function integer uf_busca_tipo_arquivo (string ps_arquivo, ref string ps_tp_arquivo, ref string ps_tp_registro);Constant String ls_metodo='uf_busca_tipo_arquivo'

string ls_arquivo, ls_tipo_arq, ls_dataobject, ls_coluna, ls_tp_registro
long ll_retorno
datastore lds_agenda_con, lds_agenda_con1, lds_agenda_exa
string ls_text,ls_bloco
long ll_file, ll_start, ll_pos, ll_pos2

lds_agenda_con = create datastore
lds_agenda_con.dataobject = 'd_integra_cross_a'

if not isvalid(lds_agenda_con.object) then
	Messagebox('Aten$$HEX2$$e700e300$$ENDHEX$$o','O objeto D_INTEGRA_CROSS_A n$$HEX1$$e300$$ENDHEX$$o foi encontrado na vers$$HEX1$$e300$$ENDHEX$$o. Contate o Suporte.', stopsign!)
	return -1
end if

lds_agenda_exa = create datastore
lds_agenda_exa.dataobject = 'd_integra_cross_d'

if not isvalid(lds_agenda_exa.object) then
	Messagebox('Aten$$HEX2$$e700e300$$ENDHEX$$o','O objeto D_INTEGRA_CROSS_D n$$HEX1$$e300$$ENDHEX$$o foi encontrado na vers$$HEX1$$e300$$ENDHEX$$o. Contate o Suporte.', stopsign!)
	return -1
end if

ls_arquivo = ps_arquivo

//Pra verificar o tipo do arquivo (Exame ou Consulta) eu tenho que abrir o arquivo
// e verificar o nome da primeira coluna. Se o nome for TIPO_EXAME = Exame, se for TIPO_CONSULTA = Consulta.

ll_file = fileopen(ps_arquivo)

do while 1=1
	
	if fileread(ll_file,ls_text) < 1 then exit
	
	ls_bloco += ls_text

loop

fileclose(ll_file)

ls_text = ''
ll_start = pos(ls_bloco,'<Mensagem>',1) + 11

ll_pos = pos(ls_bloco,'<',ll_start)	
ll_pos2 = pos(ls_bloco,'>',ll_pos)
ls_text = mid(ls_bloco,ll_pos+1, ll_pos2 - ll_pos - 1)
	
ls_text = upper(ls_text)

if ls_text = 'TIPO_EXAME' then
	ls_tipo_arq = 'E'
elseif ls_text = 'TIPO_CONSULTA' then
	ls_tipo_arq = 'C'
end if

if ls_tipo_arq = 'C' then
	ll_retorno = lds_agenda_con.importfile(XML!,ls_arquivo,1,1,1,1)
	if ll_retorno < 0 then 
		uf_log_erro(ls_metodo + ' - Erro ao importar o arquivo. Estrutura do XML n$$HEX1$$e300$$ENDHEX$$o compat$$HEX1$$ed00$$ENDHEX$$vel.')
		return -1
	end if
	
	ls_tp_registro = lds_agenda_con.getitemstring(1,'tipo_consulta')
	
elseif ls_tipo_arq = 'E' then
	
	ll_retorno = lds_agenda_exa.importfile(XML!,ls_arquivo,1,1,1,1)
	if ll_retorno < 0 then
		uf_log_erro(ls_metodo + ' - Erro ao importar o arquivo. Estrutura do XML n$$HEX1$$e300$$ENDHEX$$o compat$$HEX1$$ed00$$ENDHEX$$vel.')
		return -1
	end if
	
	ls_tp_registro = lds_agenda_exa.getitemstring(1,'tipo_exame')
	
Else
	uf_log_erro(ls_metodo + ' - Erro ao importar o arquivo. Estrutura do XML n$$HEX1$$e300$$ENDHEX$$o compat$$HEX1$$ed00$$ENDHEX$$vel.')
	return -1
end if

ps_tp_arquivo = ls_tipo_arq
ps_tp_registro = ls_tp_registro

return 1
end function

public function integer uf_valida_comp_origem (long pl_id_age_consulta_hor_origem, ref string ps_mensagem);Constant string ls_metodo='uf_valida_comp_origem'
boolean lb_inconsistente = false

long ll_count
string ls_mensagem=''

select count(cd_recurso)
into :ll_count
from compromisso
where id_age_consulta_hor = :pl_id_age_consulta_hor_origem;

if uf_valida_sql('Evento: uo_integracao_cross.uf_valida_comp_origem~nTabela: COMPROMISSO~n',false) = -1 then return -1

if ll_count = 0 or isnull(ll_count) then
	
	ls_mensagem = 'Problema: Registro de Transfer$$HEX1$$ea00$$ENDHEX$$ncia. Compromisso de Origem n$$HEX1$$e300$$ENDHEX$$o existe no SX.~r~n' +&
									'Solu$$HEX2$$e700e300$$ENDHEX$$o: Verificar informa$$HEX2$$e700e300$$ENDHEX$$o no sistema SALUX ou CROSS.~r~n~r~n'
	ps_mensagem	+= ls_mensagem
	lb_inconsistente = True
	
end if

//LOG
if lb_inconsistente = True then
	
	uf_log_erro(ls_metodo + ' - Consist$$HEX1$$ea00$$ENDHEX$$ncia: Agendamento origem a ser transferido ~r~n' + &
											' - Resultado: Inconsistente ~r~n' + &
											' - Par$$HEX1$$e200$$ENDHEX$$metros avaliados:~r~n' + &
											' 		- C$$HEX1$$f300$$ENDHEX$$digo CROSS do Agendamento = ' + string(pl_id_age_consulta_hor_origem) )
else
	uf_log_erro(ls_metodo + ' - Consist$$HEX1$$ea00$$ENDHEX$$ncia: Agendamento origem a ser transferido ~r~n' + &
									' - Resultado: OK ' )	
	
end if
//----------------------------------------------------------------------------------------------------------//
return 1
end function

public function integer uf_salvar_transferencia (datastore pds_dados, string ps_tipo);Constant string ls_metodo='uf_salvar_transferencia'

//Ch.: 89771 - Luiz Carlos, 13/07/2016 - Valor das vari$$HEX1$$e100$$ENDHEX$$veis ll_cd_recurso_dest e ll_sq_comp_dest transferidas para instancia, para utilizar na rotina de verifica$$HEX2$$e700e300$$ENDHEX$$o de chaves.
long ll_for, ll_rowcount, ll_cd_rec_origem, ll_sq_comp_origem, ll_rec_cd_recurso_origem, ll_ddd_res, &
	ll_fone_res, ll_ddd_com, ll_fone_com, ll_idade, ll_cd_grade_origem, ll_dia_origem, &
	ll_id_age_consulta_hor_origem, ll_sq_comp_dest, ll_cd_recurso_dest, ll_cd_grade_recurso_dest, ll_dia_semana_dest, &
	ll_duracao_origem, ll_cd_paciente, ll_id_age_consulta_hor, ll_ddd, ll_fone, ll_cd_origem, ll_cd_pac_cross, &
	ll_cd_especialidade, ll_cd_plano_saude, ll_cd_tp_plano, ll_cd_mot_cancel, ll_rec_cd_recurso_dest, ll_cd_procedimento, &
	ll_cd_credenciado
string ls_tp_comp_origem, ls_sexo, ls_cns , ls_funcionario, ls_tp_compromisso, ls_nm_paciente, ls_extra, &
		ls_age_con_hor, ls_age_con_hor_origem, ls_adicional, ls_nm_contato
datetime ldt_comp_origem, ldt_insercao_origem, ldt_atual, ldt_comp_dest
decimal ll_peso, ll_altura
boolean lb_erro

ll_rowcount = pds_dados.rowcount()

if ll_rowcount = 0 then return 1

select sysdate
into :ldt_atual
from dual;

ls_funcionario = 'INTCROSS'

select cd_mot_cancel_agenda
into :ll_cd_mot_cancel
from motivo_cancel_agenda
where in_tipo = 'T';

if uf_valida_sql('Evento: integracao_cross.uf_salvar_transferencia~nTabela: motivo_cancel_agenda (SELECT)',TRUE) = -1 then return -1

for ll_for = 1 to ll_rowcount

	ll_id_age_consulta_hor_origem = pds_dados.getitemnumber(ll_for,'id_age_consulta_hor_origem')
	ls_age_con_hor_origem 		= string(ll_id_age_consulta_hor_origem)		
	ll_id_age_consulta_hor 		= pds_dados.getitemnumber(ll_for,'id_age_consulta_hor')
	ls_age_con_hor 				= string(ll_id_age_consulta_hor)
	ll_cd_recurso_dest 			= pds_dados.getitemnumber(ll_for,'cd_recurso')
	ll_cd_grade_recurso_dest 	= pds_dados.getitemnumber(ll_for,'cd_grade_recurso')
	ll_rec_cd_recurso_dest 		= pds_dados.getitemnumber(ll_for,'rec_cd_recurso')
	ldt_comp_dest 					= pds_dados.getitemdatetime(ll_for,'dt_compromisso')
	ll_dia_semana_dest 			= pds_dados.getitemnumber(ll_for,'dia_semana')
	ll_cd_pac_cross 					= pds_dados.getitemnumber(ll_for,'cd_paciente_conexa')
	ls_adicional 						= pds_dados.getitemstring(ll_for,'in_adicional')

	if ls_adicional = 'S' then
		
		setnull(ll_cd_grade_recurso_dest)
		
	end if

	//-> Busca os dados do compromisso de Origem.
	SELECT cd_recurso, 
			sq_compromisso, 
			cd_tp_compromisso, 
			dt_compromisso, 
			rec_cd_recurso,
			sexo, 
			cns, 
			ddd_res, 
			fone_res, 
			ddd_com, 
			fone_com, 
			idade, 
			peso, 
			altura, 
			dthr_insercao, 
			duracao,
			cd_grade_recurso, 
			dia_semana,
			cd_paciente,
			nm_cliente,
			cd_especialidade,
			cd_plano_saude,
			cd_tp_plano,
			cd_dest_origem,
			in_extra,
			nm_contato
	INTO :ll_cd_rec_origem, 
			:ll_sq_comp_origem, 
			:ls_tp_comp_origem, 
			:ldt_comp_origem, 
			:ll_rec_cd_recurso_origem,
			:ls_sexo, 
			:ls_cns, 
			:ll_ddd_res, 
			:ll_fone_res, 
			:ll_ddd_com, 
			:ll_fone_com, 
			:ll_idade, 
			:ll_peso, 
			:ll_altura, 
			:ldt_insercao_origem, 
			:ll_duracao_origem, 
			:ll_cd_grade_origem, 
			:ll_dia_origem,
			:ll_cd_paciente,
			:ls_nm_paciente,
			:ll_cd_especialidade,
			:ll_cd_plano_saude,
			:ll_cd_tp_plano,
			:ll_cd_origem,
			:ls_extra,
			:ls_nm_contato
	FROM compromisso
	WHERE id_age_consulta_hor = :ll_id_age_consulta_hor_origem;
	
	if uf_valida_sql('Evento: integracao_cross.uf_salvar_transferencia~nTabela: compromisso (SELECT)',TRUE) = -1 then
		lb_erro = true
		EXIT
	end if
	
	//ch:84611
//	if ps_tipo = 'E' then
//		ll_cd_recurso_dest = ll_cd_rec_origem
//	end if
	// FIm - ch:84611
	
	ll_sq_comp_dest = uf_prox_seq_compromisso(ll_cd_recurso_dest)
		
	//-> Insere o novo compromisso (destino).	
		
	INSERT INTO compromisso (cd_recurso, 
									sq_compromisso,
									cd_grade_recurso,
									rec_cd_recurso,
									dthr_insercao, 
									dt_compromisso,
									dia_semana,
									duracao,
									cd_paciente,
									cd_funcionario,
									cd_tp_compromisso,
									id_sit_compromisso,
									duracao_real,
									nm_cliente,
									id_age_consulta_hor,
									cd_dest_origem,
									sexo,
									cns,
									ddd_res,
									fone_res,
									ddd_com,
									fone_com,
									ddd,
									fone,
									idade,
									peso,
									altura,
									cd_paciente_conexa,
									in_extra,
									nm_contato)
		Values(:ll_cd_recurso_dest, 
				:ll_sq_comp_dest, 
				:ll_cd_grade_recurso_dest, 
				:ll_rec_cd_recurso_dest,
				:ldt_atual, 
				:ldt_comp_dest, 
				:ll_dia_semana_dest, 
				:ll_duracao_origem, 
				:ll_cd_paciente, 
				:ls_funcionario,
				:ls_tp_comp_origem, 
				'E', 
				:ll_duracao_origem, 
				:ls_nm_paciente, 
				:ll_id_age_consulta_hor,
				:ll_cd_origem,
				:ls_sexo,
				:ls_cns,
				:ll_ddd_res,
				:ll_fone_res,
				:ll_ddd_com,
				:ll_fone_com,
				:ll_ddd,
				:ll_fone,
				:ll_idade,
				:ll_peso,
				:ll_altura,
				:ll_cd_pac_cross,
				:ls_extra,
				:ls_nm_contato);
			
	if uf_valida_sql('Evento: integracao_cross.uf_salvar_transferencia~nTabela: compromisso (INSERT)',TRUE) = -1 then
		lb_erro = true
		EXIT
	end if
									
	UPDATE compromisso
	SET id_sit_compromisso = 'A',
			transacao = 'TRA',
			cd_especialidade = :ll_cd_especialidade,
			cd_plano_saude = :ll_cd_plano_saude,
			cd_tp_plano = :ll_cd_tp_plano
	WHERE cd_recurso = :ll_cd_recurso_dest
	AND sq_compromisso = :ll_sq_comp_dest;
	
	if uf_valida_sql('Evento: uo_integracao_cross.uf_salvar_transferencia~nTabela: compromisso (UPDATE)',TRUE) = -1 then
		lb_erro = true
		EXIT
	end if
	
	//->Insere na tabela de hist$$HEX1$$f300$$ENDHEX$$rico
	INSERT INTO hist_compromisso (cd_recurso, 
											sq_compromisso, 
											dt_compromisso, 
											cd_grade_recurso,
											cd_tp_compromisso, 
											rec_cd_recurso, 
											dia_semana, 
											id_sit_compromisso, 
											duracao_real,
											cd_paciente, 
											nm_cliente, 
											cd_plano_saude, 
											cd_tp_plano,
											in_extra, 
											cd_recurso_dest, 
											cd_mot_cancel_agenda, 
											sq_compromisso_dest,
											dthr_exclusao, 
											cd_funcionario, 
											duracao, 
											ddd, 
											fone, 
											sexo, 
											peso,
											idade, 
											altura,	
											cd_dest_origem, 
											DTHR_INSERCAO, 
											REC_CD_RECURSO_DEST, 
											cd_especialidade)
	 VALUES (:ll_cd_rec_origem,
				:ll_sq_comp_origem,
			  :ldt_comp_origem,
			  :ll_cd_grade_origem,
			  :ls_tp_comp_origem,
			  :ll_rec_cd_recurso_origem,
			  :ll_dia_origem,
			  'T',
			  :ll_duracao_origem,
			  :ll_cd_paciente,
			  :ls_nm_paciente,
			  :ll_cd_plano_saude,
			  :ll_cd_tp_plano,
			  :ls_extra,
			  :ll_cd_recurso_dest,
			  :ll_cd_mot_cancel,
			  :ll_sq_comp_dest,
			  :ldt_atual,
			  :ls_funcionario,
			  :ll_duracao_origem,
			  :ll_ddd,
			  :ll_fone,
			  :ls_sexo,
			  :ll_peso,
			  :ll_idade,
			  :ll_altura,
			  :ll_cd_origem,
			  :ldt_insercao_origem,
			  :ll_rec_cd_recurso_dest,
			  :ll_cd_especialidade);
	
	if uf_valida_sql('Evento: uo_integracao_cross.uf_salvar_transferencia~nTabela: hist_compromisso (SELECT)',TRUE) = -1 then
		lb_erro = true
		EXIT
	end if		
			
	//-> Se for tipo Exame realiza as movimenta$$HEX2$$e700f500$$ENDHEX$$es na compromisso_item.
	if ps_tipo = 'E' and ls_tp_comp_origem = 'EXA' then
		
		select cd_procedimento,
				cd_credenciado
		into :ll_cd_procedimento,
				:ll_cd_credenciado
		from compromisso_item
		where cd_recurso = :ll_cd_rec_origem
			and sq_compromisso = :ll_sq_comp_origem;
		
		if uf_valida_sql('Evento: uo_integracao_cross.uf_salvar_transferencia~nTabela: compromisso_item (SELECT)',TRUE) = -1 then
				lb_erro = true
				EXIT
			end if
		
		INSERT INTO compromisso_item(cd_recurso, 
										sq_compromisso,
										cd_procedimento,
										cd_funcionario,
										cd_credenciado,
										cd_plano_saude,
										cd_tp_plano)
			Values(:ll_cd_recurso_dest, 
					:ll_sq_comp_dest, 
					:ll_cd_procedimento, 
					:ls_funcionario, 
					:ll_cd_credenciado,
					:ll_cd_plano_saude,
					:ll_cd_tp_plano);
					
			if uf_valida_sql('Evento: uo_integracao_cross.uf_salvar_transferencia~nTabela: compromisso_item (INSERT)',TRUE) = -1 then
				lb_erro = true
				EXIT
			end if
		
		//->Insere na tabela de hist$$HEX1$$f300$$ENDHEX$$rico
		INSERT INTO hist_compromisso_item 
				(cd_recurso, 
				sq_compromisso, 
				cd_procedimento, 
				cd_plano_saude, 
				cd_tp_plano)
		VALUES (:ll_cd_rec_origem, 
				:ll_sq_comp_origem,
				:ll_cd_procedimento, 
				:ll_cd_plano_saude, 
				:ll_cd_tp_plano);
		
		if uf_valida_sql('Evento: uo_integracao_cross.uf_salvar_transferencia~nTabela: hist_compromisso_item (SELECT)',TRUE) = -1 then
			lb_erro = true
			EXIT
		end if	
		
		DELETE FROM compromisso_item
		WHERE cd_recurso = :ll_cd_rec_origem
		AND sq_compromisso = :ll_sq_comp_origem;
		
		if uf_valida_sql('Evento: uo_integracao_cross.uf_salvar_transferencia~nTabela: compromisso_item (DELETE)',TRUE) = -1 then
			lb_erro = true
			EXIT
		end if
		
	end if
	
	DELETE FROM compromisso
	WHERE cd_recurso = :ll_cd_rec_origem
	AND sq_compromisso = :ll_sq_comp_origem;
	
	if uf_valida_sql('Evento: uo_integracao_cross.uf_salvar_transferencia~nTabela: compromisso (DELETE)',TRUE) = -1 then
		lb_erro = true
		EXIT
	end if

	//-> Exclui o registro da tabela CONEXA_NAO_IMPORTADOS.
	if ps_tipo = 'C' then
		
		DELETE FROM conexa_nao_importados
		WHERE ce_id_tipo_arquivo = :ps_tipo
			AND ce_id_tipo_registro = 'T'
			AND c_id_age_consulta_hor = :ls_age_con_hor
			AND c_id_age_consulta_hor_origem = :ls_age_con_hor_origem;
			
		if uf_valida_sql('Evento: uo_integracao_cross.uf_salvar_transferencia~nTabela: conexa_nao_importados (DELETE)',TRUE) = -1 then
			lb_erro = true
			EXIT
		end if
		
	elseif ps_tipo = 'E' then
		
		DELETE FROM conexa_nao_importados
		WHERE ce_id_tipo_arquivo = :ps_tipo
			AND ce_id_tipo_registro = 'T'
			AND e_id_age_exame_hor = :ls_age_con_hor
			AND e_id_age_exame_hor_origem = :ls_age_con_hor_origem;
			
		if uf_valida_sql('Evento: uo_integracao_cross.uf_salvar_transferencia~nTabela: conexa_nao_importados (DELETE)',TRUE) = -1 then
			lb_erro = true
			EXIT
		end if
		
	end if	
	
	//Ch.: 89771 - Luiz Carlos, 13/07/2016
	il_cd_recurso = ll_cd_recurso_dest
	il_sq_compromisso = ll_sq_comp_dest
	//Fim Ch.: 89771 - Luiz Carlos, 13/07/2016
	
next

if lb_erro = true then return -1

Commit;

uf_log_erro(ls_metodo + ' - Transfer$$HEX1$$ea00$$ENDHEX$$ncia salva com sucesso.')

return 1
end function

public function integer uf_salvar_cancelamento (datastore pds_dados, string ps_tipo);Constant string ls_metodo='uf_salvar_cancelamento'

//Ch.: 89771 - Luiz Carlos, 13/07/2016 - Vari$$HEX1$$e100$$ENDHEX$$veis ll_cd_recurso e ll_sq_compromisso transferidas para instancia, para utilizar na rotina de verifica$$HEX2$$e700e300$$ENDHEX$$o de chaves.
long ll_id_age_consulta_hor, ll_rowcount, ll_for, ll_cd_procedimento, &
	ll_cd_grade_recurso, ll_cd_plano_saude, ll_cd_tp_plano, ll_cd_paciente, ll_rec_cd_recurso, &
	ll_cd_tratamento, ll_dia_semana, ll_ddd, ll_fone, ll_duracao, ll_duracao_real, ll_idade, &
	ll_cd_dest_origem, ll_cd_especialidade, ll_cd_mot_cancel_agenda
String ls_cd_tp_compromisso, ls_cd_funcionario, ls_observacoes, ls_in_extra, ls_nm_cliente, &
		ls_sexo, ls_tipo_comp, ls_tx_obs_cancelamento,ls_age_con_hor, ls_nm_contato
String ls_msg, ls_msg_log	
datetime ldt_compromisso, ldthr_insercao
decimal ldc_peso, ldc_altura, ldc_vl_compromisso
Boolean lbl_exclui = true

setNull(ls_msg)

ll_rowcount = pds_dados.rowcount()

if ll_rowcount = 0 then return 1

for ll_for = 1 to ll_rowcount

	ll_id_age_consulta_hor 		= pds_dados.getitemnumber(1,'id_age_consulta_hor')
	ll_cd_mot_cancel_agenda	= pds_dados.getitemnumber(1,'cd_mot_cancel')
	ls_age_con_hor 				= string(ll_id_age_consulta_hor)
	
	//busca os dados da tabela compromisso para serem enviados para a tabela hist_compromisso
	SELECT cd_recurso,
			 sq_compromisso,
			 cd_grade_recurso,   
			 cd_tp_compromisso,   
			 cd_plano_saude,   
			 cd_tp_plano,   
			 cd_funcionario,   
			 cd_paciente,   
			 rec_cd_recurso,   
			 cd_tratamento,   
			 dt_compromisso,   
			 dia_semana,   
			 observacoes,   
			 in_extra,   
			 nm_cliente,   
			 ddd,   
			 fone,   
			 duracao,   
			 duracao_real,   
			 dthr_insercao,   
			 vl_compromisso,   
			 sexo,   
			 peso,   
			 idade,   
			 altura,
			 cd_dest_origem,
			 cd_especialidade,
			 nm_contato
	  INTO :il_cd_recurso,
	  		 :il_sq_compromisso,
			 :ll_cd_grade_recurso,   
			 :ls_cd_tp_compromisso,   
			 :ll_cd_plano_saude,   
			 :ll_cd_tp_plano,   
			 :ls_cd_funcionario,   
			 :ll_cd_paciente,   
			 :ll_rec_cd_recurso,   
			 :ll_cd_tratamento,   
			 :ldt_compromisso,   
			 :ll_dia_semana,   
			 :ls_observacoes,   
			 :ls_in_extra,   
			 :ls_nm_cliente,   
			 :ll_ddd,   
			 :ll_fone,   
			 :ll_duracao,   
			 :ll_duracao_real,   
			 :ldthr_insercao,   
			 :ldc_vl_compromisso,   
			 :ls_sexo,   
			 :ldc_peso,   
			 :ll_idade,   
			 :ldc_altura,
			 :ll_cd_dest_origem,
			 :ll_cd_especialidade,
			 :ls_nm_contato
	  FROM compromisso
	 WHERE id_age_consulta_hor = :ll_id_age_consulta_hor;

	if uf_valida_sql('Evento: uo_integracao_cross.uf_salvar_cancelamento~nTabela: compromisso',TRUE) = -1 then return -1

	/**************************************************************************************
		(CH 124473) - Trecho tempor$$HEX1$$e100$$ENDHEX$$rio para capturar erro ocorrido no cliente que na base interna n$$HEX1$$e300$$ENDHEX$$o foi poss$$HEX1$$ed00$$ENDHEX$$vel simularmos 
					* Quando erro for p$$HEX1$$ea00$$ENDHEX$$go e tratamento definitivo for desenvolvido, este trecho poder$$HEX2$$e1002000$$ENDHEX$$ser exclu$$HEX1$$ed00$$ENDHEX$$do.
	***************************************************************************************/
    	setNull(ls_msg)
	setNull(ls_msg_log)
	
	if isNull(ll_cd_mot_cancel_agenda) then ls_msg = 'Motivo de cancelamento n$$HEX1$$e300$$ENDHEX$$o encontrado [ll_cd_mot_cancel_agenda nulo]~n'
	if isNull(ll_dia_semana) then ls_msg += 'Dia da semana n$$HEX1$$e300$$ENDHEX$$o encontrado [ll_dia_semana nulo]~n'
	if isNull(ldthr_insercao) then ls_msg += 'Data/hora da inser$$HEX2$$e700e300$$ENDHEX$$o n$$HEX1$$e300$$ENDHEX$$o encontrado [ldthr_insercao nulo]~n'
	if isNull(ls_in_extra) then	ls_msg += 'In_extra n$$HEX1$$e300$$ENDHEX$$o encontrado [ls_in_extra nulo]~n'
	if isNull(ll_duracao) then ls_msg += 'Dura$$HEX2$$e700e300$$ENDHEX$$o n$$HEX1$$e300$$ENDHEX$$o encontrada [ll_duracao nulo]~n'
	if isNull(ldt_compromisso) then ls_msg += 'Data do compromisso n$$HEX1$$e300$$ENDHEX$$o encontrada [ldt_compromisso nulo]~n'
	if isNull(ll_duracao_real) then ls_msg += 'Dura$$HEX2$$e700e300$$ENDHEX$$o real n$$HEX1$$e300$$ENDHEX$$o encontrada [ll_duracao_real nulo]~n'
	
	if not(isNull(ls_msg)) then
		ls_msg_log = ls_msg + 'Conexa_nao_importados.c_id_age_consulta_hor: ' + ls_age_con_hor
			
		insert into log_temp_cross_agenda (tx_log) values (:ls_msg_log);
			
		if uf_valida_sql('Evento: uo_integracao_cross.uf_salvar_cancelamento~nTabela: log_temp_cross_agenda', false) = -1 then return -1
			
		messagebox('Aten$$HEX2$$e700e300$$ENDHEX$$o', ls_msg + '~nPor gentileza comunicar o suporte da Salux.', Exclamation!)
			
		continue
	else	

		// Insere compromisso na tabela hist_compromisso
		INSERT INTO hist_compromisso ( cd_recurso, 
												sq_compromisso, 
												cd_mot_cancel_agenda, 
												cd_grade_recurso,
												cd_tp_compromisso, 
												cd_plano_saude, 
												cd_tp_plano, 
												cd_funcionario,
												cd_paciente, 
												rec_cd_recurso, 
												cd_tratamento, 
												dt_compromisso, 
												dia_semana,
												id_sit_compromisso, 
												observacoes, 
												in_extra, 
												nm_cliente, 
												ddd, 
												fone,
												duracao, 
												duracao_real, 
												dthr_insercao, 
												vl_compromisso, 
												sexo, 
												peso,
												idade, 
												altura, 
												cd_dest_origem, 
												cd_especialidade, 
												dthr_exclusao, 
												tx_observacao_cancelamento,
												nm_contato,
												id_age_consulta_hor) // Jeferson Neves | CH 115062 | 26/01/2018 - inserir coluna ao salvar um cancelamento.
		VALUES ( :il_cd_recurso, 
				:il_sq_compromisso, 
				:ll_cd_mot_cancel_agenda, 
				:ll_cd_grade_recurso,
				:ls_cd_tp_compromisso, 
				:ll_cd_plano_saude, 
				:ll_cd_tp_plano, 
				:ls_cd_funcionario,
				:ll_cd_paciente, 
				:ll_rec_cd_recurso, 
				:ll_cd_tratamento, 
				:ldt_compromisso, 
				:ll_dia_semana,
				'N', 
				:ls_observacoes, 
				:ls_in_extra, 
				:ls_nm_cliente, 
				:ll_ddd, 
				:ll_fone,
				:ll_duracao, 
				:ll_duracao_real, 
				:ldthr_insercao, 
				:ldc_vl_compromisso, 
				:ls_sexo, 
				:ldc_peso,
				:ll_idade, 
				:ldc_altura, 
				:ll_cd_dest_origem, 
				:ll_cd_especialidade, 
				sysdate, 
				:ls_tx_obs_cancelamento,
				:ls_nm_contato,
				:ll_id_age_consulta_hor); // Jeferson Neves | CH 115062 | 26/01/2018

		if uf_valida_sql('Evento: uo_integracao_cross.uf_salvar_cancelamento~nTabela: hist_compromisso', true) = -1 then return -1
	end if	

	if ps_tipo = 'E' then

		select cd_procedimento
		into :ll_cd_procedimento
		from compromisso_item
		where cd_recurso = :il_cd_recurso
		and sq_compromisso = :il_sq_compromisso;
		
		if uf_valida_sql('Evento: uo_integracao_cross.uf_salvar_cancelamento~nTabela: compromisso_item',TRUE) = -1 then return -1

		INSERT INTO hist_compromisso_item ( cd_recurso, 
														sq_compromisso, 
														cd_procedimento,
														cd_plano_saude, 
														cd_tp_plano )
			VALUES ( :il_cd_recurso, 
						:il_sq_compromisso, 
						:ll_cd_procedimento,
						:ll_cd_plano_saude, 
						:ll_cd_tp_plano );
						
		if uf_valida_sql('Evento: uo_integracao_cross.uf_salvar_cancelamento~nTabela: hist_compromisso_item',TRUE) = -1 then return -1				
				
		DELETE 
  		  FROM compromisso_item
	 	  WHERE cd_recurso =:il_cd_recurso 
			 AND sq_compromisso =:il_sq_compromisso;

		if uf_valida_sql('Evento: uo_integracao_cross.uf_salvar_cancelamento~nTabela: compromisso_item (DELETE)',TRUE) = -1 then return -1						
				
	end if
			
	DELETE 
  	  FROM compromisso
	 WHERE cd_recurso =:il_cd_recurso 
		AND sq_compromisso =:il_sq_compromisso;	
		
	if uf_valida_sql('Evento: uo_integracao_cross.uf_salvar_cancelamento~nTabela: compromisso (DELETE)',TRUE) = -1 then return -1							
		
	//-> Exclui o registro da tabela CONEXA_NAO_IMPORTADOS.
	if ps_tipo = 'C' then
		
		DELETE FROM conexa_nao_importados
		WHERE ce_id_tipo_arquivo = :ps_tipo
			AND ce_id_tipo_registro = 'C'
			AND c_id_age_consulta_hor = :ls_age_con_hor;
			
		if uf_valida_sql('Evento: uo_integracao_cross.uf_salvar_cancelamento~nTabela: conexa_nao_importados (DELETE)',TRUE) = -1 then return -1							
		
	elseif ps_tipo = 'E' then
		
		DELETE FROM conexa_nao_importados
		WHERE ce_id_tipo_arquivo = :ps_tipo
			AND ce_id_tipo_registro = 'C'
			AND e_id_age_exame_hor = :ls_age_con_hor;
			
		if uf_valida_sql('Evento: uo_integracao_cross.uf_salvar_cancelamento~nTabela: conexa_nao_importados (DELETE)',TRUE) = -1 then return -1							
		
	end if	
		
next

Commit;

uf_log_erro(ls_metodo + ' - Cancelamento salvo com sucesso.')

return 1
end function

public function integer uf_salvar_agendamento (datastore pds_dados, string ps_tipo);Constant string ls_metodo='uf_salvar_agendamento'

//Ch.: 89771 - Luiz Carlos, 13/07/2016 - Vari$$HEX1$$e100$$ENDHEX$$veis ll_cd_recurso e ll_sq_compromisso transferidas para instancia, para utilizar na rotina de verifica$$HEX2$$e700e300$$ENDHEX$$o de chaves.
long ll_rowcount, ll_for, ll_cd_grade_recurso, ll_rec_cd_recurso, &
	ll_dia,ll_duracao,ll_cd_paciente	, ll_id_age_consulta_hor,ll_ddd_res, ll_fone_res, ll_ddd, ll_fone, ll_fone_cel, ll_ddd_cel, &
	ll_idade, ll_cd_dest_origem, ll_ddd_com, ll_fone_com, ll_cd_paciente_cross, ll_cd_especialidade, ll_cd_tp_plano, &
	ll_cd_plano_saude, ll_cd_procedimento, ll_cd_credenciado, ll_duracao_ant, ll_comp_ant
decimal ld_peso, ld_altura
datetime ldt_insercao, ldt_compromisso	, ldt_atual, ldt_comp_fim
string ls_tipo_arquivo, ls_cd_tp_compromisso, ls_nm_cliente, ls_sexo, ls_cns, ls_funcionario, ls_id_sit_compromisso, &
	ls_extra, ls_encaixe, ls_erro, ls_age_con_hor, ls_adicional, ls_tp_recurso, ls_nm_contato
boolean lb_erro

//*** Par$$HEX1$$e200$$ENDHEX$$metro ps_tipo = tipo do arquivo ( C - Consulta / E - Exame )

select sysdate
into :ldt_atual
from dual;

ls_funcionario = 'INTCROSS'

ll_rowcount = pds_dados.rowcount()

if ll_rowcount = 0 then return 1

for ll_for = 1 to ll_rowcount
	
	//ls_id_sit_compromisso
	
	//Carrega DataStore com os dados que ser$$HEX1$$e300$$ENDHEX$$o inseridos no SX.
	il_cd_recurso 				= pds_dados.getitemnumber(ll_for,'cd_recurso')
	ll_cd_grade_recurso 		= pds_dados.getitemnumber(ll_for,'cd_grade_recurso')
	ldt_insercao 					= ldt_atual
	ldt_compromisso 			= pds_dados.getitemdatetime(ll_for,'dt_compromisso')
	ll_dia 							= pds_dados.getitemnumber(ll_for,'dia_semana')
	ll_duracao 						= pds_dados.getitemnumber(ll_for,'duracao')
	ll_cd_paciente 				= pds_dados.getitemnumber(ll_for,'cd_paciente')
	ll_rec_cd_recurso 			= pds_dados.getitemnumber(ll_for,'rec_cd_recurso')	
	ls_cd_tp_compromisso 	= pds_dados.getitemstring(ll_for,'cd_tp_compromisso')
	ll_duracao 						= pds_dados.getitemnumber(ll_for,'duracao_real')
	ls_nm_cliente 				= pds_dados.getitemstring(ll_for,'nm_cliente')	
	ll_id_age_consulta_hor 	= pds_dados.getitemnumber(ll_for,'id_age_consulta_hor')
	ls_age_con_hor 			= string(ll_id_age_consulta_hor)	
	ls_sexo 							= pds_dados.getitemstring(ll_for,'sexo')
	ls_cns 							= pds_dados.getitemstring(ll_for,'cns')
	ll_ddd_res 						= pds_dados.getitemnumber(ll_for,'ddd_res')
	ll_fone_res 					= pds_dados.getitemnumber(ll_for,'fone_res')
	ll_ddd_com 					= pds_dados.getitemnumber(ll_for,'ddd_com')
	ll_fone_com 					= pds_dados.getitemnumber(ll_for,'fone_com')
	ll_ddd 							= pds_dados.getitemnumber(ll_for,'ddd')
	ll_fone 							= pds_dados.getitemnumber(ll_for,'fone')
	ll_fone_cel 					= pds_dados.getitemnumber(ll_for,'tel_celular')//Gustavo Heerbach - ch 73578
	ll_ddd_cel 						= pds_dados.getitemnumber(ll_for,'tel_celular_ddd')//Gustavo Heerbach - ch 73578
	ll_idade 							= pds_dados.getitemnumber(ll_for,'idade')
	ll_cd_dest_origem 			= pds_dados.getitemnumber(ll_for,'cd_dest_origem')
	ld_peso 						= pds_dados.getitemdecimal(ll_for,'peso')
	ld_altura 						= pds_dados.getitemdecimal(ll_for,'altura')
	ls_extra 						= pds_dados.getitemstring(ll_for,'in_extra')
	ls_encaixe 						= pds_dados.getitemstring(ll_for,'in_encaixe')
	ll_cd_especialidade 		= pds_dados.getitemnumber(ll_for,'cd_especialidade')
	ll_cd_plano_saude 			= pds_dados.getitemnumber(ll_for,'cd_plano_saude')
	ll_cd_tp_plano 				= pds_dados.getitemnumber(ll_for,'cd_tp_plano')
	ll_cd_paciente_cross		= pds_dados.getitemnumber(ll_for,'cd_paciente_conexa')
	ll_cd_procedimento 		= pds_dados.getitemnumber(ll_for,'cd_procedimento')
	ll_cd_credenciado 			= pds_dados.getitemnumber(ll_for,'cd_credenciado')
	ls_adicional 					= pds_dados.getitemstring(ll_for,'in_adicional')
	ll_comp_ant 					= pds_dados.getitemnumber(ll_for,'sq_comp_anterior')
	ldt_comp_fim 				= pds_dados.getitemdatetime(ll_for,'dt_compromisso_fim')
	ls_tp_recurso 				= pds_dados.getitemstring(ll_for,'cd_tp_recurso')
	ls_nm_contato				= pds_dados.getitemstring(ll_for,'contato_nome')//Gustavo Heerbach - ch 75532
		
	if ls_tp_recurso <> 'RHP' then setnull(ll_cd_especialidade)
	
	if ls_adicional = 'S' then
		
		setnull(ll_cd_grade_recurso)
		
	end if
	
	if ls_encaixe = 'S' and ll_comp_ant > 0 then	
		
		//Quando for compromisso de encaixe, atualiza a dura$$HEX2$$e700e300$$ENDHEX$$o do compromisso anterior.
		update compromisso
			set duracao = duracao - :ll_duracao, dt_compromisso = :ldt_comp_fim , cd_funcionario_alt = :ls_funcionario
		 where cd_recurso = :il_cd_recurso
			and sq_compromisso = :ll_comp_ant;
			 
		if uf_valida_sql('Tabela: compromisso (UPDATE)',TRUE) = -1 then 
			lb_erro = true
			EXIT
		end if
		
	end if
	
	uf_prox_seq_compromisso(il_cd_recurso)
	
	if il_sq_compromisso = -1 then
		lb_erro = true
		EXIT
	end if
	
	INSERT INTO compromisso (cd_recurso, 
									sq_compromisso,
									cd_grade_recurso,
									rec_cd_recurso,
									dthr_insercao, 
									dt_compromisso,
									dia_semana,
									duracao,
									cd_paciente,
									cd_funcionario,
									cd_tp_compromisso,
									id_sit_compromisso,
									duracao_real,
									nm_cliente,
									id_age_consulta_hor,
									sexo,
									cns,
									ddd_res,
									fone_res,
									ddd_com,
									fone_com,
									fone_cel,
									ddd_cel,
									ddd,
									fone,
									idade,
									cd_dest_origem,
									peso,
									altura,
									in_extra,
									in_encaixe,
									cd_paciente_conexa,
									nm_contato)
		Values(:il_cd_recurso, 
				:il_sq_compromisso, 
				:ll_cd_grade_recurso, 
				:ll_rec_cd_recurso,
				:ldt_insercao, 
				:ldt_compromisso, 
				:ll_dia, 
				:ll_duracao, 
				:ll_cd_paciente, 
				:ls_funcionario,
				:ls_cd_tp_compromisso, 
				'E', 
				:ll_duracao, 
				:ls_nm_cliente, 
				:ll_id_age_consulta_hor,
				:ls_sexo,
				:ls_cns,
				:ll_ddd_res,
				:ll_fone_res,
				:ll_ddd_com,
				:ll_fone_com,
				:ll_fone_cel, 
				:ll_ddd_cel,
				:ll_ddd,
				:ll_fone,
				:ll_idade,
				:ll_cd_dest_origem,
				:ld_peso,
				:ld_altura,
				:ls_extra,
				:ls_encaixe,
				:ll_cd_paciente_cross,
				:ls_nm_contato);
				
		if uf_valida_sql('Tabela: compromisso (INSERT)',TRUE) = -1 then 
			lb_erro = true
			EXIT
		end if
		
		//-> Update necess$$HEX1$$e100$$ENDHEX$$rio para funcionamento correto da rastreabilidade.
		UPDATE compromisso
		SET id_sit_compromisso = 'A',
				transacao = 'INC',
				cd_especialidade = :ll_cd_especialidade,
				cd_plano_saude = :ll_cd_plano_saude,
				cd_tp_plano = :ll_cd_tp_plano
		WHERE cd_recurso = :il_cd_recurso
		AND sq_compromisso = :il_sq_compromisso;
		
		if uf_valida_sql('Tabela: compromisso (UPDATE)',TRUE) = -1 then 
			lb_erro = true
			EXIT
		end if
		
		//-> Se for tipo Exame insere na compromisso_item.
		if ps_tipo = 'E' and ls_cd_tp_compromisso = 'EXA' then
			
			INSERT INTO compromisso_item(cd_recurso, 
									sq_compromisso,
									cd_procedimento,
									cd_funcionario,
									cd_credenciado,
									cd_plano_saude,
									cd_tp_plano)

				Values(:il_cd_recurso, 
						:il_sq_compromisso, 
						:ll_cd_procedimento, 
						:ls_funcionario, 
						:ll_cd_credenciado,
						:ll_cd_plano_saude,
						:ll_cd_tp_Plano);
					
			if uf_valida_sql('Tabela: compromisso_item (INSERT)',TRUE) = -1 then 
				lb_erro = true
				EXIT
			end if
			
		end if
	
		//CH:76758 - Leonardo Pedersen - 19/01/2015
		if not isnull(ll_fone_cel) and ll_fone_cel > 0 and ll_cd_paciente > 0 then
			
			if uf_insere_paciente_celular(ll_cd_paciente, ll_ddd_cel, string(ll_fone_cel),'',ls_funcionario) = -1 then
				lb_erro = true
				EXIT
			end if
			
		end if
		// FIM - CH:76758
	
	//-> Exclui o registro da tabela CONEXA_NAO_IMPORTADOS.
	if ps_tipo = 'C' then
		
		DELETE FROM conexa_nao_importados
		WHERE ce_id_tipo_arquivo = :ps_tipo
			AND ce_id_tipo_registro = 'A'
			AND c_id_age_consulta_hor = :ls_age_con_hor;
			
		if uf_valida_sql('Evento: uo_integracao_cross.uf_salvar_agendamento~nTabela: conexa_nao_importados (DELETE)',TRUE) = -1 then return -1							
		
	elseif ps_tipo = 'E' then
		
		DELETE FROM conexa_nao_importados
		WHERE ce_id_tipo_arquivo = :ps_tipo
			AND ce_id_tipo_registro = 'A'
			AND e_id_age_exame_hor = :ls_age_con_hor;
			
		if uf_valida_sql('Evento: uo_integracao_cross.uf_salvar_agendamento~nTabela: conexa_nao_importados (DELETE)',TRUE) = -1 then return -1							
		
	end if	
	
next

if lb_erro = true then
	return -1
else
	COMMIT;
	
	uf_log_erro(ls_metodo + ' - Agendamento salvo com sucesso.')
	
	//if uf_valida_sql('Evento: uo_integracao_cross.uf_salvar_agendamento~nProcesso de Persistencia no Banco.',TRUE) = -1 then return -1
	
end if

return 1
end function

public function integer uf_salvar_nao_importados (string ps_arquivo, ref datastore pds_dados);
//if uf_insere_nao_importado(ps_arquivo, pds_dados) = -1 then return -1

//pds_dados.saveas('c:\dados_save',excel!,false)

if pds_dados.update() = -1 then
	ROLLBACK;
	messagebox('Aten$$HEX2$$e700e300$$ENDHEX$$o','Problemas ao salvar registro na tabela CONEXA_NAO_IMPORTADOS.')
	return -1
else
	COMMIT;
end if

return 1
end function

public function integer uf_insere_nao_importado (string ps_arquivo, string ps_tp_arquivo, string ps_tp_registro, datastore pds_dados);string ls_metodo='uf_insere_nao_importado'

long ll_row
string ls_tp_arquivo, ls_tp_registro
datetime ldt_atual, ldt_compromisso
datastore lds_nao_imp

//DadaStore para armazenar os dados dos arquivos inv$$HEX1$$e100$$ENDHEX$$lidos, que ser$$HEX1$$e300$$ENDHEX$$o inseridos na tabela CONEXA_NAO_IMPORTADOS.
lds_nao_imp = create datastore
lds_nao_imp.dataobject = 'd_integra_cross_nao_imp'
lds_nao_imp.settransobject(SQLCA)

if not isvalid(lds_nao_imp.object) then
	messagebox('Aten$$HEX2$$e700e300$$ENDHEX$$o','O objeto D_INTEGRA_CROSS_NAO_IMP n$$HEX1$$e300$$ENDHEX$$o foi encontrado na vers$$HEX1$$e300$$ENDHEX$$o. Contate o Suporte.', stopsign!)
	return -1
end if

select sysdate
into :ldt_atual
from dual;

ls_tp_arquivo = ps_tp_arquivo
ls_tp_registro = ps_tp_registro

ll_row = lds_nao_imp.insertrow(0)

lds_nao_imp.setitem(ll_row,'nm_arquivo',ps_arquivo)
lds_nao_imp.setitem(ll_row,'data_importacao',ldt_atual)
lds_nao_imp.setitem(ll_row,'id_tipo_arquivo',ls_tp_arquivo)
lds_nao_imp.setitem(ll_row,'id_tipo_registro',ls_tp_registro)
lds_nao_imp.setitem(ll_row,'cod_unidade_executante', string(pds_dados.getitemnumber(1,'cod_unidade_executante') ))

if ls_tp_registro = 'T' then
	if ls_tp_arquivo = 'C' then
		lds_nao_imp.setitem(ll_row,'id_age_consulta_hor_origem', string(pds_dados.getitemnumber(1,'id_age_consulta_hor_origem')) )
	else
		lds_nao_imp.setitem(ll_row,'id_age_exame_hor_origem', string(pds_dados.getitemnumber(1,'id_age_exame_hor_origem')) )
	end if
end if

if ls_tp_arquivo = 'C' then
	lds_nao_imp.setitem(ll_row,'id_age_consulta_hor', string(pds_dados.getitemnumber(1,'id_age_consulta_hor')) )
	lds_nao_imp.setitem(ll_row,'tipo', pds_dados.getitemstring(1,'tipo')) 
elseif ls_tp_arquivo = 'E' then
	lds_nao_imp.setitem(ll_row,'id_age_exame_hor', string(pds_dados.getitemnumber(1,'id_age_exame_hor')) )
end if

lds_nao_imp.setitem(ll_row,'id_motivo', string(pds_dados.getitemnumber(1,'id_motivo')) )
lds_nao_imp.setitem(ll_row,'cod_unidade_solicitante', string(pds_dados.getitemnumber(1,'cod_unidade_solicitante')) ) 
lds_nao_imp.setitem(ll_row,'nome_unidade_solicitante', pds_dados.getitemstring(1,'nome_unidade_solicitante')) 
lds_nao_imp.setitem(ll_row,'nome_usuario_solicitante', pds_dados.getitemstring(1,'nome_usuario_solicitante')) 
lds_nao_imp.setitem(ll_row,'dt_ultima_atualiz', string(pds_dados.getitemdatetime(1,'dt_ultima_atualiz')) ) 
lds_nao_imp.setitem(ll_row,'cod_paciente', string(pds_dados.getitemnumber(1,'cod_paciente')) ) 


if ls_tp_registro = 'C' then
	lds_nao_imp.setitem(ll_row,'data_hora_agenda', ldt_atual )
end if

if ls_tp_registro <> 'C' then
	
	if ls_tp_arquivo = 'C' then
		lds_nao_imp.setitem(ll_row,'id_age_consulta', string(pds_dados.getitemnumber(1,'id_age_consulta')) )
	elseif ls_tp_arquivo = 'E' then
		
		lds_nao_imp.setitem(ll_row,'id_age_exame', string(pds_dados.getitemnumber(1,'id_age_exame')) )
		
		if ls_tp_registro <> 'T' then
			lds_nao_imp.setitem(ll_row,'age_exame_nome', pds_dados.getitemstring(1,'age_exame_nome')) 
			lds_nao_imp.setitem(ll_row,'id_associacao', string(pds_dados.getitemnumber(1,'id_associacao')) )
			lds_nao_imp.setitem(ll_row,'nome_associacao', pds_dados.getitemstring(1,'nome_associacao'))
			lds_nao_imp.setitem(ll_row,'id_exame', string(pds_dados.getitemnumber(1,'id_exame')))
			lds_nao_imp.setitem(ll_row,'cod_exame', string(pds_dados.getitemnumber(1,'cod_exame')))
			lds_nao_imp.setitem(ll_row,'nome_exame', pds_dados.getitemstring(1,'nome_exame'))
			lds_nao_imp.setitem(ll_row,'tipo_tabela', pds_dados.getitemstring(1,'tipo_tabela'))
		end if
		
	end if
	
	lds_nao_imp.setitem(ll_row,'cod_dia', string(pds_dados.getitemnumber(1,'cod_dia')) )
	

	lds_nao_imp.setitem(ll_row,'data_agenda', string(pds_dados.getitemdate(1,'data_agenda')) )
	lds_nao_imp.setitem(ll_row,'hor_ini', string(pds_dados.getitemtime(1,'hor_ini')) )
	lds_nao_imp.setitem(ll_row,'hor_fim', string(pds_dados.getitemtime(1,'hor_fim')) )
	
	ldt_compromisso = datetime(pds_dados.getitemdate(1,'data_agenda'),pds_dados.getitemtime(1,'hor_ini'))
	lds_nao_imp.setitem(ll_row,'data_hora_agenda', ldt_compromisso )
	
	if ls_tp_arquivo <> 'E' or ls_tp_registro <> 'T' then
		lds_nao_imp.setitem(ll_row,'id_profissional', string(pds_dados.getitemnumber(1,'id_profissional')) )
		lds_nao_imp.setitem(ll_row,'doc_profissional', pds_dados.getitemstring(1,'doc_profissional')) 
		lds_nao_imp.setitem(ll_row,'origem', pds_dados.getitemstring(1,'origem')) 
		lds_nao_imp.setitem(ll_row,'nome_profissional', pds_dados.getitemstring(1,'nome_profissional')) 
		lds_nao_imp.setitem(ll_row,'id_especialidade', string(pds_dados.getitemnumber(1,'id_especialidade')) )
		lds_nao_imp.setitem(ll_row,'nome_especialidade', pds_dados.getitemstring(1,'nome_especialidade')) 
	end if

end if

if ls_tp_registro = 'A' then
	
	lds_nao_imp.setitem(ll_row,'cnes_unidade_solicitante', pds_dados.getitemstring(1,'cnes_unidade_solicitante')) 
	
	lds_nao_imp.setitem(ll_row,'nome_paciente', pds_dados.getitemstring(1,'nome_paciente')) 
	lds_nao_imp.setitem(ll_row,'sexo', pds_dados.getitemstring(1,'sexo')) 
	lds_nao_imp.setitem(ll_row,'dt_nascimento', string(pds_dados.getitemdate(1,'dt_nascimento')) )
	lds_nao_imp.setitem(ll_row,'rg', pds_dados.getitemstring(1,'rg')) 
	lds_nao_imp.setitem(ll_row,'cpf', pds_dados.getitemstring(1,'cpf')) 
	lds_nao_imp.setitem(ll_row,'nome_mae', pds_dados.getitemstring(1,'nome_mae')) 
	lds_nao_imp.setitem(ll_row,'nome_pai', pds_dados.getitemstring(1,'nome_pai')) 
	lds_nao_imp.setitem(ll_row,'endereco', pds_dados.getitemstring(1,'endereco')) 
	lds_nao_imp.setitem(ll_row,'endereco_numero', pds_dados.getitemstring(1,'endereco_numero')) 
	lds_nao_imp.setitem(ll_row,'bairro', pds_dados.getitemstring(1,'bairro')) 
	lds_nao_imp.setitem(ll_row,'municipio', pds_dados.getitemstring(1,'municipio')) 
	lds_nao_imp.setitem(ll_row,'uf', pds_dados.getitemstring(1,'uf')) 
	lds_nao_imp.setitem(ll_row,'cep', pds_dados.getitemstring(1,'cep')) 
	lds_nao_imp.setitem(ll_row,'tel_res_ddd', pds_dados.getitemstring(1,'tel_res_ddd')) 
	lds_nao_imp.setitem(ll_row,'tel_res', pds_dados.getitemstring(1,'tel_res')) 
	lds_nao_imp.setitem(ll_row,'tel_celular_ddd', pds_dados.getitemstring(1,'tel_celular_ddd')) 
	lds_nao_imp.setitem(ll_row,'tel_celular', pds_dados.getitemstring(1,'tel_celular')) 
	lds_nao_imp.setitem(ll_row,'tel_com_ddd', pds_dados.getitemstring(1,'tel_com_ddd')) 
	lds_nao_imp.setitem(ll_row,'tel_com', pds_dados.getitemstring(1,'tel_com')) 
	lds_nao_imp.setitem(ll_row,'tel_com_ramal', pds_dados.getitemstring(1,'tel_com_ramal')) 
	lds_nao_imp.setitem(ll_row,'email', pds_dados.getitemstring(1,'email')) 
	lds_nao_imp.setitem(ll_row,'contato_nome', pds_dados.getitemstring(1,'contato_nome')) 
	lds_nao_imp.setitem(ll_row,'contato_tel_ddd', pds_dados.getitemstring(1,'contato_tel_ddd')) 
	lds_nao_imp.setitem(ll_row,'contato_tel', pds_dados.getitemstring(1,'contato_tel')) 
	lds_nao_imp.setitem(ll_row,'num_cns', pds_dados.getitemstring(1,'num_cns')) 
end if

if lds_nao_imp.update() = -1 then
	ROLLBACK;
	
	uf_log_erro(ls_metodo + ' - Erro ao gravar conexa_nao_importados')
	
	messagebox('Aten$$HEX2$$e700e300$$ENDHEX$$o','Problemas ao salvar registro na tabela CONEXA_NAO_IMPORTADOS.')
	return -1
else
	COMMIT;
	
	if uf_valida_sql('Evento: uo_integracao_cross.uf_insere_nao_importado~nTabela: conexa_nao_importados',TRUE) = -1 then return -1
	
	uf_log_erro(ls_metodo + ' - Gravado na tabela conexa_nao_importados')
	
end if

return 1
end function

public function integer uf_valida_cancelamento (long pl_id_age_consulta_hor, ref string ps_mensagem);Constant string ls_metodo='uf_valida_cancelamento'
boolean lb_inconsistente = false

long ll_count
string ls_mensagem=''
datetime ldt_compromisso, ldt_atual

if pl_id_age_consulta_hor = 0 or isnull(pl_id_age_consulta_hor) then return 1

select cd_recurso, dt_compromisso
into :ll_count, :ldt_compromisso
from compromisso
where id_age_consulta_hor = :pl_id_age_consulta_hor;

if uf_valida_sql('Evento: uo_integracao_cross.uf_valida_cancelamento~nTabela: compromisso',false) = -1 then return -1

if ll_count = 0 or isnull(ll_count) then
	ls_mensagem = 'Problema: Registro de Cancelamento. C$$HEX1$$f300$$ENDHEX$$digo CROSS do Agendamento a ser Cancelado n$$HEX1$$e300$$ENDHEX$$o est$$HEX2$$e1002000$$ENDHEX$$vinculado ao sistema SX.~r~n' + &
					'Solu$$HEX2$$e700e300$$ENDHEX$$o: Verificar informa$$HEX2$$e700e300$$ENDHEX$$o no sistema SALUX ou CROSS.~r~n~r~n'
	ps_mensagem += ls_mensagem
	lb_inconsistente = True
	
else
	
	select sysdate
	into :ldt_atual
	from dual;
	
	if ldt_compromisso < ldt_atual then
		ls_mensagem = 'Problema: Registro de Cancelamento. A data do Compromisso a ser cancelado j$$HEX2$$e1002000$$ENDHEX$$expirou.~r~n' + &
						'Solu$$HEX2$$e700e300$$ENDHEX$$o: Verificar informa$$HEX2$$e700e300$$ENDHEX$$o no sistema SALUX ou CROSS.~r~n~r~n'
		ps_mensagem += ls_mensagem
		lb_inconsistente = True
		
	end if
	
end if

//LOG
if lb_inconsistente = True then
	uf_log_erro(ls_metodo + ' - Consist$$HEX1$$ea00$$ENDHEX$$ncia: Agendamento origem a ser cancelado ~r~n' + &
											' - Resultado: Inconsistente ~r~n' + &
											' - Par$$HEX1$$e200$$ENDHEX$$metros avaliados:~r~n' + &
											' 		- C$$HEX1$$f300$$ENDHEX$$digo CROSS do Agendamento = ' + string(pl_id_age_consulta_hor) )
else
	uf_log_erro(ls_metodo + ' - Consist$$HEX1$$ea00$$ENDHEX$$ncia: Agendamento origem a ser cancelado ~r~n' + &
									' - Resultado: OK ' )
end if
//-------------------------------------------------------------------------------------------//
return 1
end function

public function integer uf_tipo_consulta_agend (string ps_arquivo, ref datastore pds_dados, ref datastore pds_dados_sx, ref string ps_mensagem);Constant string ls_metodo='uf_tipo_consulta_agend'

long ll_linhas, ll_count, &
	ll_cd_especialidade_cross, ll_cd_especialidade_sx, &
	ll_cd_recurso_cross, ll_cd_recurso_sx, ll_pos, &
	ll_cd_dest_origem_cross, ll_cd_dest_origem_sx, &
	ll_cd_grade_recurso_cross, ll_cd_grade_recurso_sx, &
	ll_id_age_consulta_hor, ll_id_age_consulta, &
	ll_dia, ll_cd_paciente_cross, ll_rec_cd_recurso, ll_cd_paciente_sx, ll_row,&
	ll_cd_plano_saude, ll_cd_tp_plano, ll_duracao, ll_idade,ll_id_motivo, ll_sq_comp_anterior
	
string ls_ds_especialidade_cross,ls_ds_especialidade_sx, &
		ls_nm_recurso_cross, ls_nm_recurso_sx, &
		ls_ds_dest_origem_cross, ls_cns_cross, ls_nm_contato, &
		ls_tp_recurso, ls_mensagem, ls_tp_comp, ls_sexo, ls_cns, ls_fone, ls_ddd, ls_fone_trab,&
		ls_ddd_trab,ls_cd_funcionario, ls_nm_paciente, ls_nm_cliente, ls_encaixe, ls_adicional
	
datetime ldt_agenda_ini, ldt_agenda_fim, ldt_atual
date ld_data_agenda, ld_nascimento
time lt_hora_ini, lt_hora_fim
decimal ld_altura, ld_peso

uf_log_erro(ls_metodo + ' - In$$HEX1$$ed00$$ENDHEX$$cio das Consist$$HEX1$$ea00$$ENDHEX$$ncias: Consulta - Agendamento.')

ll_linhas = pds_dados.rowcount()
if ll_linhas = 0 then return 1

ls_mensagem = ''

select sysdate
into :ldt_atual
from dual;

//Busca os dados da datastore.
ld_data_agenda 				= pds_dados.getitemdate(1,'data_agenda')
lt_hora_ini 						= pds_dados.getitemtime(1,'hor_ini')
lt_hora_fim 						= pds_dados.getitemtime(1,'hor_fim')
ls_nm_recurso_cross 			= pds_dados.getitemstring(1,'nome_profissional')
ll_cd_especialidade_cross 	= pds_dados.getitemnumber(1,'id_especialidade')
ls_ds_especialidade_cross 	= pds_dados.getitemstring(1,'nome_especialidade')
ll_cd_dest_origem_cross 	= pds_dados.getitemnumber(1,'cod_unidade_solicitante')
ls_ds_dest_origem_cross 	= pds_dados.getitemstring(1,'nome_unidade_solicitante')
ll_cd_grade_recurso_cross 	= pds_dados.getitemnumber(1,'id_age_consulta')
ll_id_age_consulta_hor 		= pds_dados.getitemnumber(1,'id_age_consulta_hor')
ll_cd_paciente_cross 			= pds_dados.getitemnumber(1,'cod_paciente')
ls_nm_cliente 					= pds_dados.getitemstring(1,'nome_paciente')
ls_tp_comp 						= pds_dados.getitemstring(1,'tipo')
ll_id_motivo 						= pds_dados.getitemnumber(1,'id_motivo')
ls_nm_contato					= pds_dados.getitemstring(1,'contato_nome')//ch.75532
ls_cns_cross 						= pds_dados.getitemstring(1,'num_cns')//ch.75532

ll_pos = pos(ls_cns_cross,',')
if ll_pos > 0 then
	ls_cns_cross = mid(ls_cns_cross,1, ll_pos - 1)
end if

//No SX: Dia 1 = Domingo, Dia 2 = Segunda, Dia 3 = Ter$$HEX1$$e700$$ENDHEX$$a, ...
//No CROSS: Dia 0 = Domingo, Dia 1 = Segunda, Dia 2 = Ter$$HEX1$$e700$$ENDHEX$$a, ...
//Portanto, para integrar com o SX tenho que somar +1 no dia.

ll_dia = pds_dados.getitemnumber(1,'cod_dia')
ll_dia = ll_dia + 1

//***************//

//Se existe id_motivo, $$HEX2$$e9002000$$ENDHEX$$um compromisso de Encaixe.
if ll_id_motivo > 0 then
	ls_encaixe = 'S'
else
	ls_encaixe = 'N'
end if

ldt_agenda_ini = datetime(ld_data_agenda,lt_hora_ini)
ldt_agenda_fim = datetime(ld_data_agenda,lt_hora_fim)

//Validade do compromisso
if uf_valida_data_comp(ldt_agenda_ini, ref ls_mensagem) = -1 then return -1

// Duplicidade de agendamento //
if uf_valida_registro_comp(ll_id_age_consulta_hor, ref ls_mensagem) = -1 then return -1

//Grade Recurso
if uf_valida_grade_recurso(ll_cd_grade_recurso_cross, ld_data_agenda, ldt_agenda_ini, ldt_agenda_fim, ll_dia, ls_encaixe, ref ls_adicional, ref ll_cd_grade_recurso_sx, ref ll_cd_recurso_sx, ref ll_rec_cd_recurso, ref ll_duracao, ref ll_cd_especialidade_sx, ref ls_mensagem) = -1 then return -1

//Recurso
if uf_valida_recurso(ll_cd_recurso_sx, ref ls_nm_recurso_sx, ref ls_mensagem) = -1 then return -1

//Encaixe
if ls_encaixe = 'S' then
	if uf_valida_encaixe(ll_cd_recurso_sx, ll_cd_grade_recurso_sx, ldt_agenda_ini, ldt_agenda_fim, ref ll_sq_comp_anterior, ll_duracao, ref ls_mensagem) = -1 then return -1
end if

//Busca tipo do Recurso
if uf_busca_tp_recurso(ll_cd_recurso_sx, ref ls_tp_recurso) = -1 then return -1

//Concorr$$HEX1$$ea00$$ENDHEX$$ncia Recurso
if ls_encaixe = 'N' then
	if uf_valida_concorrencia_recurso(ll_cd_recurso_sx, ll_rec_cd_recurso, ldt_agenda_ini, ldt_agenda_fim, ref ls_mensagem) = -1 then return -1
end if

//Conv$$HEX1$$ea00$$ENDHEX$$nio(SUS) x Recurso
if uf_valida_convenio_recurso(ll_cd_recurso_sx, ref ll_cd_plano_saude, ref ll_cd_tp_plano, ref ls_mensagem) = -1 then return -1

//Tipo do Agendamento x Recurso
if uf_valida_tp_compromisso(ll_cd_recurso_sx, ref ls_tp_comp, ref ls_mensagem) = -1 then return -1

//Especialidade
if uf_valida_especialidade(ll_cd_especialidade_cross, ls_ds_especialidade_cross, ls_tp_recurso, ref ll_cd_especialidade_sx, ref ls_ds_especialidade_sx, ref ls_mensagem) = -1 then return -1

//Recurso/M$$HEX1$$e900$$ENDHEX$$dico x Especialidade
if ls_tp_recurso = 'RHP' then
	if uf_valida_medico_espec(ll_cd_especialidade_sx, ll_cd_recurso_sx,ls_nm_recurso_sx, ref ls_mensagem) = -1 then return -1
end if

//Destino Origem
if uf_valida_origem(ll_cd_dest_origem_cross, ls_ds_dest_origem_cross, ref ll_cd_dest_origem_sx, ref ls_mensagem) = -1 then return -1

//Hor$$HEX1$$e100$$ENDHEX$$rio Bloqueado
if uf_valida_bloqueio(ll_cd_recurso_sx, ll_rec_cd_recurso, ldt_agenda_ini, ldt_agenda_fim, ref ls_mensagem) = -1 then return -1

//Paciente
if uf_valida_paciente(ll_cd_paciente_cross, ref ll_cd_paciente_sx,ref ls_nm_paciente, ref ls_sexo, ref ls_cns, ref ls_fone, ref ls_ddd, ref ls_fone_trab, ref ls_ddd_trab, ref ld_nascimento, ref ld_peso, ref ld_altura, ref ll_idade, ref ls_mensagem) = -1 then return -1

//Concorr$$HEX1$$ea00$$ENDHEX$$ncia Paciente
if uf_valida_concorrencia_paciente(ll_cd_paciente_sx, ldt_agenda_ini, ldt_agenda_fim, ll_cd_recurso_sx, 'A', ref ls_mensagem) = -1 then return -1

ps_mensagem = ls_mensagem

//Carrega DataStore com os dados que ser$$HEX1$$e300$$ENDHEX$$o inseridos no SX.
ll_row = pds_dados_sx.insertrow(0)

pds_dados_sx.setitem(ll_row,'cd_recurso',ll_cd_recurso_sx)
if ll_cd_recurso_sx > 0 then
	pds_dados_sx.setitem(ll_row,'nm_recurso',ls_nm_recurso_sx)
else
	pds_dados_sx.setitem(ll_row,'nm_recurso',ls_nm_recurso_cross)
end if

pds_dados_sx.setitem(ll_row,'cd_grade_recurso',ll_cd_grade_recurso_sx)
pds_dados_sx.setitem(ll_row,'dthr_insercao',ldt_atual)
pds_dados_sx.setitem(ll_row,'dt_compromisso',ldt_agenda_ini)
pds_dados_sx.setitem(ll_row,'dt_compromisso_fim',ldt_agenda_fim)
pds_dados_sx.setitem(ll_row,'dia_semana',ll_dia)
pds_dados_sx.setitem(ll_row,'duracao',ll_duracao)
pds_dados_sx.setitem(ll_row,'cd_paciente',ll_cd_paciente_sx)
pds_dados_sx.setitem(ll_row,'cd_funcionario',ls_cd_funcionario)
pds_dados_sx.setitem(ll_row,'cd_tp_compromisso',ls_tp_comp)
pds_dados_sx.setitem(ll_row,'id_sit_compromisso','E')
pds_dados_sx.setitem(ll_row,'duracao_real',ll_duracao)

if ls_nm_paciente = '' or isnull(ls_nm_paciente) then
	pds_dados_sx.setitem(ll_row,'nm_cliente',ls_nm_cliente)
else
	pds_dados_sx.setitem(ll_row,'nm_cliente',ls_nm_paciente)
end if

if ls_sexo = '' or isnull(ls_sexo) then
	ls_sexo = pds_dados.getitemstring(1,'sexo')
	
	//Em alguns casos o sexo do paciente est$$HEX2$$e1002000$$ENDHEX$$como Indeterminado (I). Como n$$HEX1$$e300$$ENDHEX$$o existe no SX, seto nulo.
	if ls_sexo <> 'F' and ls_sexo <> 'M' then
		setnull(ls_sexo)
	end if
	
end if

pds_dados_sx.setitem(ll_row,'id_age_consulta_hor',ll_id_age_consulta_hor)
pds_dados_sx.setitem(ll_row,'sexo',ls_sexo)
pds_dados_sx.setitem(ll_row,'cns',ls_cns_cross)
pds_dados_sx.setitem(ll_row,'ddd_res', long(pds_dados.getitemstring(1,'tel_res_ddd')))
pds_dados_sx.setitem(ll_row,'fone_res', long(pds_dados.getitemstring(1,'tel_res')))
pds_dados_sx.setitem(ll_row,'tel_celular', long(pds_dados.getitemstring(1,'tel_celular')))
pds_dados_sx.setitem(ll_row,'tel_celular_ddd', long(pds_dados.getitemstring(1,'tel_celular_ddd')))
pds_dados_sx.setitem(ll_row,'ddd_com', long(pds_dados.getitemstring(1,'tel_com_ddd')))
pds_dados_sx.setitem(ll_row,'fone_com', long(pds_dados.getitemstring(1,'tel_com')))

if uf_atualiza_fone_cad_paciente(pds_dados, 1, ll_cd_paciente_cross) = -1 then return -1//ch75532

pds_dados_sx.setitem(ll_row,'idade', ll_idade)
pds_dados_sx.setitem(ll_row,'cd_dest_origem', ll_cd_dest_origem_sx)
pds_dados_sx.setitem(ll_row,'peso', ld_peso)
pds_dados_sx.setitem(ll_row,'altura', ld_altura)

pds_dados_sx.setitem(ll_row,'in_adicional', ls_adicional)
pds_dados_sx.setitem(ll_row,'in_encaixe', ls_encaixe)
pds_dados_sx.setitem(ll_row,'in_extra', 'N')

pds_dados_sx.setitem(ll_row,'cd_especialidade', ll_cd_especialidade_sx)
if ll_cd_especialidade_sx > 0 then
	pds_dados_sx.setitem(ll_row,'ds_especialidade', ls_ds_especialidade_sx)
else
	pds_dados_sx.setitem(ll_row,'ds_especialidade', ls_ds_especialidade_cross)
end if

pds_dados_sx.setitem(ll_row,'cd_plano_saude', ll_cd_plano_saude)
pds_dados_sx.setitem(ll_row,'cd_tp_plano', ll_cd_tp_plano)
pds_dados_sx.setitem(ll_row,'cd_paciente_conexa', ll_cd_paciente_cross)
pds_dados_sx.setitem(ll_row,'rec_cd_recurso', ll_rec_cd_recurso)

pds_dados_sx.setitem(ll_row,'cd_recurso_cross',ll_cd_recurso_cross)
pds_dados_sx.setitem(ll_row,'nm_recurso_cross',ls_nm_recurso_cross)
pds_dados_sx.setitem(ll_row,'cd_especialidade_cross',ll_cd_especialidade_cross)
pds_dados_sx.setitem(ll_row,'ds_especialidade_cross',ls_ds_especialidade_cross)
pds_dados_sx.setitem(ll_row,'cd_dest_origem_cross',ll_cd_dest_origem_cross)
pds_dados_sx.setitem(ll_row,'ds_dest_origem_cross',ls_ds_dest_origem_cross)
pds_dados_sx.setitem(ll_row,'sq_comp_anterior',ll_sq_comp_anterior)
pds_dados_sx.setitem(ll_row,'cd_tp_recurso',ls_tp_recurso)
pds_dados_sx.setitem(ll_row,'contato_nome',ls_nm_contato)//ch.75532

uf_log_erro(ls_metodo + ' - Fim das Consist$$HEX1$$ea00$$ENDHEX$$ncias: Consulta - Agendamento.')

return 1

end function

public function integer uf_tipo_consulta_transf (string ps_arquivo, ref datastore pds_dados, ref datastore pds_dados_sx, ref string ps_mensagem);Constant string ls_metodo='uf_tipo_consulta_transf'

long ll_id_age_consulta_hor_origem, ll_linhas, ll_id_age_consulta_hor, ll_cd_recurso_cross, &
	ll_cd_especialidade_cross, ll_cd_dest_origem_cross, ll_cd_grade_recurso_cross, ll_cd_paciente_cross, &
	ll_cd_recurso_sx, ll_dia, ll_cd_grade_recurso_sx, ll_rec_cd_recurso, ll_duracao, ll_cd_plano_saude, &
	ll_cd_tp_plano, ll_cd_especialidade_sx, ll_cd_dest_origem_sx, ll_cd_paciente_sx,ll_idade,ll_row
string ls_mensagem = '', ls_ds_especialidade_cross, ls_ds_dest_origem_cross, ls_tp_comp, &
	ls_nm_recurso_cross, ls_nm_recurso_sx, ls_tp_recurso, ls_ds_especialidade_sx, ls_nm_paciente, &
	ls_sexo, ls_cns,ls_fone,ls_ddd,ls_fone_trab,ls_ddd_trab, ls_adicional
date ld_data_agenda, ld_nascimento
datetime ldt_agenda_ini, ldt_agenda_fim
time lt_hora_ini, lt_hora_fim
decimal ld_altura, ld_peso

ll_linhas = pds_dados.rowcount()
if ll_linhas = 0 then return 1

uf_log_erro(ls_metodo + ' - In$$HEX1$$ed00$$ENDHEX$$cio das Consist$$HEX1$$ea00$$ENDHEX$$ncias: Consulta - Transfer$$HEX1$$ea00$$ENDHEX$$ncia.')

//Busca os dados da datastore.
ld_data_agenda 						= pds_dados.getitemdate(1,'data_agenda')
lt_hora_ini 								= pds_dados.getitemtime(1,'hor_ini')
lt_hora_fim 								= pds_dados.getitemtime(1,'hor_fim')
ldt_agenda_ini 							= datetime(ld_data_agenda,lt_hora_ini)
ldt_agenda_fim 							= datetime(ld_data_agenda,lt_hora_fim)
ll_id_age_consulta_hor_origem 	= pds_dados.getitemnumber(1,'id_age_consulta_hor_origem')
ll_id_age_consulta_hor 				= pds_dados.getitemnumber(1,'id_age_consulta_hor')
ll_cd_recurso_cross 					= pds_dados.getitemnumber(1,'id_profissional')
ls_nm_recurso_cross 					= pds_dados.getitemstring(1,'nome_profissional')
ll_cd_especialidade_cross 			= pds_dados.getitemnumber(1,'id_especialidade')
ls_ds_especialidade_cross 			= pds_dados.getitemstring(1,'nome_especialidade')
ll_cd_grade_recurso_cross 			= pds_dados.getitemnumber(1,'id_age_consulta')
ll_cd_paciente_cross 					= pds_dados.getitemnumber(1,'cod_paciente')
ls_tp_comp 								= pds_dados.getitemstring(1,'tipo')

//No SX: Dia 1 = Domingo, Dia 2 = Segunda, Dia 3 = Ter$$HEX1$$e700$$ENDHEX$$a, ...
//No CROSS: Dia 0 = Domingo, Dia 1 = Segunda, Dia 2 = Ter$$HEX1$$e700$$ENDHEX$$a, ...
//Portanto, para integrar com o SX tenho que somar +1 no dia.

ll_dia = pds_dados.getitemnumber(1,'cod_dia')
ll_dia = ll_dia + 1

//***************//

//Validade do compromisso
if uf_valida_data_comp(ldt_agenda_ini, ref ls_mensagem) = -1 then return -1

//Verifica se o compromisso Origem existe no SX.
if uf_valida_comp_origem(ll_id_age_consulta_hor_origem, ref ls_mensagem) = -1 then return -1

//Valida a situa$$HEX2$$e700e300$$ENDHEX$$o do compromisso a ser exclu$$HEX1$$ed00$$ENDHEX$$do.
if uf_valida_situacao_comp(ll_id_age_consulta_hor_origem, ref ls_mensagem) = -1 then return -1

// Duplicidade de agendamento //
if uf_valida_registro_comp(ll_id_age_consulta_hor, ref ls_mensagem) = -1 then return -1

//Grade Recurso
if uf_valida_grade_recurso(ll_cd_grade_recurso_cross, ld_data_agenda, ldt_agenda_ini, ldt_agenda_fim, ll_dia, 'N' , ref ls_adicional, ref ll_cd_grade_recurso_sx, ref ll_cd_recurso_sx, ref ll_rec_cd_recurso, ref ll_duracao, ref ll_cd_especialidade_sx, ref ls_mensagem) = -1 then return -1

//Recurso
if uf_valida_recurso(ll_cd_recurso_sx, ref ls_nm_recurso_sx, ref ls_mensagem) = -1 then return -1

//Busca tipo do Recurso
if uf_busca_tp_recurso(ll_cd_recurso_sx, ref ls_tp_recurso) = -1 then return -1

//Concorr$$HEX1$$ea00$$ENDHEX$$ncia Recurso
if uf_valida_concorrencia_recurso(ll_cd_recurso_sx, ll_rec_cd_recurso, ldt_agenda_ini, ldt_agenda_fim, ref ls_mensagem) = -1 then return -1

//Conv$$HEX1$$ea00$$ENDHEX$$nio(SUS) x Recurso
if uf_valida_convenio_recurso(ll_cd_recurso_sx, ref ll_cd_plano_saude, ref ll_cd_tp_plano, ref ls_mensagem) = -1 then return -1

//Tipo do Agendamento x Recurso
if uf_valida_tp_compromisso(ll_cd_recurso_sx, ref ls_tp_comp, ref ls_mensagem) = -1 then return -1

//Especialidade
if uf_valida_especialidade(ll_cd_especialidade_cross, ls_ds_especialidade_cross, ls_tp_recurso, ref ll_cd_especialidade_sx, ref ls_ds_especialidade_sx, ref ls_mensagem) = -1 then return -1

//Recurso/M$$HEX1$$e900$$ENDHEX$$dico x Especialidade
if ls_tp_recurso = 'RHP' then
	if uf_valida_medico_espec(ll_cd_especialidade_sx, ll_cd_recurso_sx,ls_nm_recurso_sx, ref ls_mensagem) = -1 then return -1
end if

//Hor$$HEX1$$e100$$ENDHEX$$rio Bloqueado
if uf_valida_bloqueio(ll_cd_recurso_sx, ll_rec_cd_recurso, ldt_agenda_ini, ldt_agenda_fim, ref ls_mensagem) = -1 then return -1

//Paciente
if uf_valida_paciente(ll_cd_paciente_cross, ref ll_cd_paciente_sx,ref ls_nm_paciente, ref ls_sexo, ref ls_cns, ref ls_fone, ref ls_ddd, ref ls_fone_trab, ref ls_ddd_trab, ref ld_nascimento, ref ld_peso, ref ld_altura, ref ll_idade, ref ls_mensagem) = -1 then return -1

//Concorr$$HEX1$$ea00$$ENDHEX$$ncia Paciente
if uf_valida_concorrencia_paciente(ll_cd_paciente_sx, ldt_agenda_ini, ldt_agenda_fim, ll_cd_recurso_sx, 'T', ref ls_mensagem) = -1 then return -1

ps_mensagem = ls_mensagem

//Carrega DataStore com os dados que ser$$HEX1$$e300$$ENDHEX$$o inseridos no SX.
ll_row = pds_dados_sx.insertrow(0)
pds_dados_sx.setitem(ll_row,'cd_recurso',ll_cd_recurso_sx)
pds_dados_sx.setitem(ll_row,'nm_recurso',ls_nm_recurso_sx)
pds_dados_sx.setitem(ll_row,'cd_grade_recurso',ll_cd_grade_recurso_sx)
pds_dados_sx.setitem(ll_row,'dt_compromisso',ldt_agenda_ini)
pds_dados_sx.setitem(ll_row,'dia_semana',ll_dia)
pds_dados_sx.setitem(ll_row,'duracao',ll_duracao)
pds_dados_sx.setitem(ll_row,'cd_paciente',ll_cd_paciente_sx)
pds_dados_sx.setitem(ll_row,'id_age_consulta_hor',ll_id_age_consulta_hor)
pds_dados_sx.setitem(ll_row,'id_age_consulta_hor_origem',ll_id_age_consulta_hor_origem)
pds_dados_sx.setitem(ll_row,'in_extra', 'N')
pds_dados_sx.setitem(ll_row,'in_encaixe', 'N')
pds_dados_sx.setitem(ll_row,'in_adicional', ls_adicional)
pds_dados_sx.setitem(ll_row,'cd_paciente_conexa', ll_cd_paciente_cross)
pds_dados_sx.setitem(ll_row,'rec_cd_recurso', ll_rec_cd_recurso)
pds_dados_sx.setitem(ll_row,'cd_recurso_cross',ll_cd_recurso_cross)
pds_dados_sx.setitem(ll_row,'nm_recurso_cross',ls_nm_recurso_cross)
pds_dados_sx.setitem(ll_row,'cd_especialidade_cross',ll_cd_especialidade_cross)
pds_dados_sx.setitem(ll_row,'ds_especialidade_cross',ls_ds_especialidade_cross)

uf_log_erro(ls_metodo + ' - Fim das Consist$$HEX1$$ea00$$ENDHEX$$ncias: Consulta - Transfer$$HEX1$$ea00$$ENDHEX$$ncia.')

return 1
end function

public function integer uf_tipo_consulta_canc (string ps_arquivo, ref datastore pds_dados, ref datastore pds_dados_sx, ref string ps_mensagem);Constant string ls_metodo='uf_tipo_consulta_canc'

long ll_linhas, ll_id_age_consulta_hor, ll_linha, ll_id_motivo,ll_cd_motivo_cancel
string ls_mensagem

ll_linhas = pds_dados.rowcount()
if ll_linhas = 0 then return 1

uf_log_erro(ls_metodo + ' - In$$HEX1$$ed00$$ENDHEX$$cio das Consist$$HEX1$$ea00$$ENDHEX$$ncias: Consulta - Cancelamento.')

ll_id_age_consulta_hor = pds_dados.getitemnumber(1,'id_age_consulta_hor')
ll_id_motivo = pds_dados.getitemnumber(1,'id_motivo')

//Verifica se existe o compromisso a ser exclu$$HEX1$$ed00$$ENDHEX$$do.
if uf_valida_cancelamento(ll_id_age_consulta_hor, ref ls_mensagem) = -1 then return -1

//Valida a situa$$HEX2$$e700e300$$ENDHEX$$o do compromisso a ser exclu$$HEX1$$ed00$$ENDHEX$$do.
if uf_valida_situacao_comp(ll_id_age_consulta_hor, ref ls_mensagem) = -1 then return -1

//Valida o motivo de cancelamento.
if uf_valida_motivo_cancel(ll_id_motivo, ref ll_cd_motivo_cancel, ref ls_mensagem) = -1 then return -1

ps_mensagem = ls_mensagem

ll_linha = pds_dados_sx.insertrow(0)
pds_dados_sx.setitem(ll_linha,'id_age_consulta_hor',ll_id_age_consulta_hor)
pds_dados_sx.setitem(ll_linha,'cd_mot_cancel',ll_cd_motivo_cancel)

uf_log_erro(ls_metodo + ' - Fim das Consist$$HEX1$$ea00$$ENDHEX$$ncias: Consulta - Cancelamento.')

return 1
end function

public function integer uf_tipo_exame_agend (string ps_arquivo, ref datastore pds_dados, ref datastore pds_dados_sx, ref string ps_mensagem);Constant string ls_metodo='uf_tipo_exame_agend'

long ll_linhas, ll_count, &
	ll_cd_especialidade_cross, ll_cd_especialidade_sx, &
	ll_cd_recurso_cross, ll_cd_recurso_sx, ll_pos, &
	ll_cd_dest_origem_cross, ll_cd_dest_origem_sx, &
	ll_cd_grade_recurso_cross, ll_cd_grade_recurso_sx, &
	ll_id_age_exame_hor, ll_cd_procedimento_cross, ll_cd_procedimento_sx, &
	ll_dia, ll_cd_paciente_cross, ll_rec_cd_recurso, ll_cd_paciente_sx, ll_row,&
	ll_cd_plano_saude, ll_cd_tp_plano, ll_duracao, ll_idade,ll_id_motivo, ll_cd_credenciado, ll_sq_comp_anterior
	
string ls_ds_especialidade_cross,ls_ds_especialidade_sx, &
		ls_nm_recurso_cross, ls_nm_recurso_sx, ls_cns_cross, &
		ls_ds_dest_origem_cross, ls_ds_procedimento_cross, ls_ds_procedimento_sx, ls_nm_contato, &
		ls_tp_recurso, ls_mensagem, ls_tp_comp, ls_sexo, ls_cns, ls_fone, ls_ddd, ls_fone_trab,&
		ls_ddd_trab,ls_cd_funcionario, ls_nm_paciente, ls_nm_cliente, ls_encaixe, ls_adicional, ls_tp_procedimento
	
datetime ldt_agenda_ini, ldt_agenda_fim, ldt_atual
date ld_data_agenda, ld_nascimento
time lt_hora_ini, lt_hora_fim
decimal ld_altura, ld_peso

ll_linhas = pds_dados.rowcount()
if ll_linhas = 0 then return 1

ls_mensagem = ''

select sysdate
into :ldt_atual
from dual;

uf_log_erro(ls_metodo + ' - In$$HEX1$$ed00$$ENDHEX$$cio das Consist$$HEX1$$ea00$$ENDHEX$$ncias: Exame - Agendamento.')

//Busca os dados da datastore.
ld_data_agenda 				= pds_dados.getitemdate(1,'data_agenda')
lt_hora_ini 						= pds_dados.getitemtime(1,'hor_ini')
lt_hora_fim 						= pds_dados.getitemtime(1,'hor_fim')
ls_nm_recurso_cross 			= pds_dados.getitemstring(1,'nome_profissional')
ll_cd_recurso_cross 			= pds_dados.getitemnumber(1,'id_associacao')
ls_nm_recurso_cross 			= pds_dados.getitemstring(1,'nome_associacao')
ll_cd_especialidade_cross 	= pds_dados.getitemnumber(1,'id_especialidade')
ls_ds_especialidade_cross 	= pds_dados.getitemstring(1,'nome_especialidade')
ll_cd_dest_origem_cross 	= pds_dados.getitemnumber(1,'cod_unidade_solicitante')
ls_ds_dest_origem_cross 	= pds_dados.getitemstring(1,'nome_unidade_solicitante')
ll_cd_grade_recurso_cross 	= pds_dados.getitemnumber(1,'id_age_exame')
ll_id_age_exame_hor 			= pds_dados.getitemnumber(1,'id_age_exame_hor')
ll_cd_paciente_cross 			= pds_dados.getitemnumber(1,'cod_paciente')
ls_nm_cliente 					= pds_dados.getitemstring(1,'nome_paciente')
ll_id_motivo						= pds_dados.getitemnumber(1,'id_motivo')
ll_cd_procedimento_cross 	= pds_dados.getitemnumber(1,'id_exame')
ls_ds_procedimento_cross 	= pds_dados.getitemstring(1,'nome_exame')
ls_nm_contato					= pds_dados.getitemstring(1,'contato_nome')//ch.75532
ls_cns_cross 						= pds_dados.getitemstring(1,'num_cns')//ch.75532

ll_pos = pos(ls_cns_cross,',')
if ll_pos > 0 then
	ls_cns_cross = mid(ls_cns_cross,1, ll_pos - 1)
end if

if ll_id_motivo > 0 then
	ls_encaixe = 'S'
else
	ls_encaixe = 'N'
end if

ls_tp_comp = 'EXA'

//No SX: Dia 1 = Domingo, Dia 2 = Segunda, Dia 3 = Ter$$HEX1$$e700$$ENDHEX$$a, ...
//No CROSS: Dia 0 = Domingo, Dia 1 = Segunda, Dia 2 = Ter$$HEX1$$e700$$ENDHEX$$a, ...
//Portanto, para integrar com o SX tenho que somar +1 no dia.

ll_dia = pds_dados.getitemnumber(1,'cod_dia')
ll_dia = ll_dia + 1

ldt_agenda_ini = datetime(ld_data_agenda,lt_hora_ini)
ldt_agenda_fim = datetime(ld_data_agenda,lt_hora_fim)

//Validade do compromisso
if uf_valida_data_comp(ldt_agenda_ini, ref ls_mensagem) = -1 then return -1

//Duplicidade de agendamento
if uf_valida_registro_comp(ll_id_age_exame_hor, ref ls_mensagem) = -1 then return -1

//Grade Recurso
if uf_valida_grade_recurso(ll_cd_grade_recurso_cross, ld_data_agenda, ldt_agenda_ini, ldt_agenda_fim, ll_dia, ls_encaixe, ref ls_adicional, ref ll_cd_grade_recurso_sx, ref ll_cd_recurso_sx, ref ll_rec_cd_recurso, ref ll_duracao, ref ll_cd_especialidade_sx, ref ls_mensagem) = -1 then return -1

//Recurso
if uf_valida_recurso(ll_cd_recurso_sx, ref ls_nm_recurso_sx, ref ls_mensagem) = -1 then return -1

//Encaixe
if ls_encaixe = 'S' then
	if uf_valida_encaixe(ll_cd_recurso_sx, ll_cd_grade_recurso_sx, ldt_agenda_ini, ldt_agenda_fim, ref ll_sq_comp_anterior, ll_duracao, ref ls_mensagem) = -1 then return -1
end if

//Busca tipo do Recurso
if uf_busca_tp_recurso(ll_cd_recurso_sx, ref ls_tp_recurso) = -1 then return -1

//Procedimento
if uf_valida_procedimento(ll_cd_procedimento_cross, ls_ds_procedimento_cross, ref ll_cd_procedimento_sx, ref ls_ds_procedimento_sx, ref ls_tp_procedimento, ref ls_mensagem) = -1 then return -1

if ls_tp_procedimento = 'EX' then

	//Procedimento x CRedenciado
	if uf_valida_creden_proced(ll_cd_procedimento_sx, ls_ds_procedimento_sx, ll_rec_cd_recurso, ref ll_cd_credenciado, ref ls_mensagem) = -1 then return -1
	
	//Recurso Humano x Procedimento
	if uf_valida_recurso_proced(ll_cd_recurso_sx, ll_cd_procedimento_sx, ls_ds_procedimento_sx, ref ls_mensagem) = -1 then return -1
	
	//Recurso F$$HEX1$$ed00$$ENDHEX$$sico (Sala) x Procedimento
	if uf_valida_sala_proced(ll_rec_cd_recurso, ll_cd_procedimento_sx, ls_ds_procedimento_sx, ref ls_mensagem) = -1 then return -1

else
	//Se o procedimento n$$HEX1$$e300$$ENDHEX$$o fo do tipo EX, o tipo do agendamento ser$$HEX2$$e1002000$$ENDHEX$$Consulta, e a tabela compromisso_item n$$HEX1$$e300$$ENDHEX$$o ser$$HEX2$$e1002000$$ENDHEX$$alimentada.
	ls_tp_comp = 'P'
end if

//Concorr$$HEX1$$ea00$$ENDHEX$$ncia Recurso
if ls_encaixe = 'N' then
	if uf_valida_concorrencia_recurso(ll_cd_recurso_sx, ll_rec_cd_recurso, ldt_agenda_ini, ldt_agenda_fim, ref ls_mensagem) = -1 then return -1
end if

//Conv$$HEX1$$ea00$$ENDHEX$$nio(SUS) x Recurso
if uf_valida_convenio_recurso(ll_cd_recurso_sx, ref ll_cd_plano_saude, ref ll_cd_tp_plano, ref ls_mensagem) = -1 then return -1

//Tipo do Agendamento x Recurso
if uf_valida_tp_compromisso(ll_cd_recurso_sx, ref ls_tp_comp, ref ls_mensagem) = -1 then return -1

//Especialidade
if uf_valida_especialidade(ll_cd_especialidade_cross, ls_ds_especialidade_cross, ls_tp_recurso, ref ll_cd_especialidade_sx, ref ls_ds_especialidade_sx, ref ls_mensagem) = -1 then return -1

//Recurso/M$$HEX1$$e900$$ENDHEX$$dico x Especialidade
if ls_tp_recurso = 'RHP' then
	if uf_valida_medico_espec(ll_cd_especialidade_sx, ll_cd_recurso_sx,ls_nm_recurso_sx, ref ls_mensagem) = -1 then return -1
end if

//Destino Origem
if uf_valida_origem(ll_cd_dest_origem_cross, ls_ds_dest_origem_cross, ref ll_cd_dest_origem_sx, ref ls_mensagem) = -1 then return -1

//Hor$$HEX1$$e100$$ENDHEX$$rio Bloqueado
if uf_valida_bloqueio(ll_cd_recurso_sx, ll_rec_cd_recurso, ldt_agenda_ini, ldt_agenda_fim, ref ls_mensagem) = -1 then return -1

//Paciente
if uf_valida_paciente(ll_cd_paciente_cross, ref ll_cd_paciente_sx,ref ls_nm_paciente, ref ls_sexo, ref ls_cns, ref ls_fone, ref ls_ddd, ref ls_fone_trab, ref ls_ddd_trab, ref ld_nascimento, ref ld_peso, ref ld_altura, ref ll_idade, ref ls_mensagem) = -1 then return -1

//Concorr$$HEX1$$ea00$$ENDHEX$$ncia Paciente
if uf_valida_concorrencia_paciente(ll_cd_paciente_sx, ldt_agenda_ini, ldt_agenda_fim, ll_cd_recurso_sx, 'A', ref ls_mensagem) = -1 then return -1

ps_mensagem = ls_mensagem
	
//Carrega DataStore com os dados que ser$$HEX1$$e300$$ENDHEX$$o inseridos no SX.
ll_row = pds_dados_sx.insertrow(0)

pds_dados_sx.setitem(ll_row,'cd_recurso',ll_cd_recurso_sx)
if ll_cd_recurso_sx > 0 then
	pds_dados_sx.setitem(ll_row,'nm_recurso',ls_nm_recurso_sx)
else
	pds_dados_sx.setitem(ll_row,'nm_recurso',ls_nm_recurso_cross)
end if

pds_dados_sx.setitem(ll_row,'cd_grade_recurso',ll_cd_grade_recurso_sx)
pds_dados_sx.setitem(ll_row,'dthr_insercao',ldt_atual)
pds_dados_sx.setitem(ll_row,'dt_compromisso',ldt_agenda_ini)
pds_dados_sx.setitem(ll_row,'dt_compromisso_fim',ldt_agenda_fim)
pds_dados_sx.setitem(ll_row,'dia_semana',ll_dia)
pds_dados_sx.setitem(ll_row,'duracao',ll_duracao)
pds_dados_sx.setitem(ll_row,'cd_paciente',ll_cd_paciente_sx)
pds_dados_sx.setitem(ll_row,'cd_funcionario',ls_cd_funcionario)
pds_dados_sx.setitem(ll_row,'cd_tp_compromisso',ls_tp_comp)
pds_dados_sx.setitem(ll_row,'id_sit_compromisso','E')
pds_dados_sx.setitem(ll_row,'duracao_real',ll_duracao)

if ls_nm_paciente = '' or isnull(ls_nm_paciente) then
	pds_dados_sx.setitem(ll_row,'nm_cliente',ls_nm_cliente)
else
	pds_dados_sx.setitem(ll_row,'nm_cliente',ls_nm_paciente)
end if

if ls_sexo = '' or isnull(ls_sexo) then
	ls_sexo = pds_dados.getitemstring(1,'sexo')
	
	//Em alguns casos o sexo do paciente est$$HEX2$$e1002000$$ENDHEX$$como Indeterminado (I). Como n$$HEX1$$e300$$ENDHEX$$o existe no SX, seto nulo.
	if ls_sexo <> 'F' and ls_sexo <> 'M' then
		setnull(ls_sexo)
	end if
	
end if

pds_dados_sx.setitem(ll_row,'id_age_consulta_hor',ll_id_age_exame_hor)
pds_dados_sx.setitem(ll_row,'sexo',ls_sexo)
pds_dados_sx.setitem(ll_row,'cns',ls_cns_cross)

if uf_atualiza_fone_cad_paciente(pds_dados, 1, ll_cd_paciente_cross) = -1 then return -1//ch75532

pds_dados_sx.setitem(ll_row,'ddd_res', long(pds_dados.getitemstring(1,'tel_res_ddd')))
pds_dados_sx.setitem(ll_row,'fone_res', long(pds_dados.getitemstring(1,'tel_res')))
pds_dados_sx.setitem(ll_row,'tel_celular', long(pds_dados.getitemstring(1,'tel_celular')))
pds_dados_sx.setitem(ll_row,'tel_celular_ddd', long(pds_dados.getitemstring(1,'tel_celular_ddd')))
pds_dados_sx.setitem(ll_row,'ddd_com', long(pds_dados.getitemstring(1,'tel_com_ddd')))
pds_dados_sx.setitem(ll_row,'fone_com', long(pds_dados.getitemstring(1,'tel_com')))
pds_dados_sx.setitem(ll_row,'idade', ll_idade)
pds_dados_sx.setitem(ll_row,'cd_dest_origem', ll_cd_dest_origem_sx)
pds_dados_sx.setitem(ll_row,'peso', ld_peso)
pds_dados_sx.setitem(ll_row,'altura', ld_altura)

pds_dados_sx.setitem(ll_row,'in_extra', 'N')
pds_dados_sx.setitem(ll_row,'in_adicional', ls_adicional)
pds_dados_sx.setitem(ll_row,'in_encaixe', ls_encaixe)

pds_dados_sx.setitem(ll_row,'cd_especialidade', ll_cd_especialidade_sx)
if ll_cd_especialidade_sx > 0 then
	pds_dados_sx.setitem(ll_row,'ds_especialidade', ls_ds_especialidade_sx)
else
	pds_dados_sx.setitem(ll_row,'ds_especialidade', ls_ds_especialidade_cross)
end if

pds_dados_sx.setitem(ll_row,'cd_plano_saude', ll_cd_plano_saude)
pds_dados_sx.setitem(ll_row,'cd_tp_plano', ll_cd_tp_plano)

if ll_cd_paciente_sx = 0 or isnull(ll_cd_paciente_sx) then
	pds_dados_sx.setitem(ll_row,'cd_paciente_conexa', ll_cd_paciente_cross)
end if

pds_dados_sx.setitem(ll_row,'rec_cd_recurso', ll_rec_cd_recurso)
pds_dados_sx.setitem(ll_row,'cd_credenciado', ll_cd_credenciado)
pds_dados_sx.setitem(ll_row,'cd_procedimento', ll_cd_procedimento_sx)
pds_dados_sx.setitem(ll_row,'cd_recurso_cross',ll_cd_recurso_cross)
pds_dados_sx.setitem(ll_row,'nm_recurso_cross',ls_nm_recurso_cross)
pds_dados_sx.setitem(ll_row,'cd_especialidade_cross',ll_cd_especialidade_cross)
pds_dados_sx.setitem(ll_row,'ds_especialidade_cross',ls_ds_especialidade_cross)
pds_dados_sx.setitem(ll_row,'cd_dest_origem_cross',ll_cd_dest_origem_cross)
pds_dados_sx.setitem(ll_row,'ds_dest_origem_cross',ls_ds_dest_origem_cross)
pds_dados_sx.setitem(ll_row,'cd_procedimento_cross',ll_cd_procedimento_cross)
pds_dados_sx.setitem(ll_row,'ds_procedimento_cross',ls_ds_procedimento_cross)
pds_dados_sx.setitem(ll_row,'sq_comp_anterior',ll_sq_comp_anterior)
pds_dados_sx.setitem(ll_row,'cd_tp_recurso',ls_tp_recurso)
pds_dados_sx.setitem(ll_row,'contato_nome',ls_nm_contato)//ch.75532

uf_log_erro(ls_metodo + ' - Fim das Consist$$HEX1$$ea00$$ENDHEX$$ncias: Exame - Agendamento.')

return 1

end function

public function integer uf_valida_recurso_proced (long pl_cd_recurso, long pl_cd_procedimento, string ps_ds_procedimento, ref string ps_mensagem);Constant string ls_metodo='uf_valida_recurso_proced'
boolean lb_inconsistente=false

long ll_count
string ls_mensagem

if pl_cd_recurso = 0 or isnull(pl_cd_recurso) or pl_cd_procedimento = 0 or isnull(pl_cd_procedimento) then return 1

//Valida rela$$HEX2$$e700e300$$ENDHEX$$o do procedimento com o recurso (humano)	
SELECT count(*)
INTO :ll_count
FROM recurso_x_procedimento
WHERE cd_recurso = :pl_cd_recurso
	AND cd_procedimento = :pl_cd_procedimento;

if ll_count = 0 or isnull(ll_count) then
	ls_mensagem = 'Problema: O recurso humano n$$HEX1$$e300$$ENDHEX$$o possui v$$HEX1$$ed00$$ENDHEX$$nculo com o procedimento: ' + &
						string(pl_cd_procedimento) + ' - ' + ps_ds_procedimento + '.~r~n' + &
						'Solu$$HEX2$$e700e300$$ENDHEX$$o: M$$HEX1$$f300$$ENDHEX$$dulo Agenda >> Menu Cadastro >> Recurso x Procedimento ~r~n~r~n'
	ps_mensagem += ls_mensagem
	
	lb_inconsistente = True
	
end if


//LOG
if lb_inconsistente = True then
	
	uf_log_erro(ls_metodo + ' - Consist$$HEX1$$ea00$$ENDHEX$$ncia: V$$HEX1$$ed00$$ENDHEX$$nculo Recurso x Procedimento ~r~n' + &
											' - Resultado: Inconsistente ~r~n' + &
											' - Par$$HEX1$$e200$$ENDHEX$$metros avaliados:~r~n' + &
											' 		- Recurso = ' + string(pl_cd_recurso) + '~r~n' + &
											' 		- Procedimento = ' + string(pl_cd_procedimento) )											
else
	uf_log_erro(ls_metodo + ' - Consist$$HEX1$$ea00$$ENDHEX$$ncia: V$$HEX1$$ed00$$ENDHEX$$nculo Recurso x Procedimento ~r~n' + &
									' - Resultado: OK ' )

end if
//---------------------------------------------------------------------------------------//

return 1
end function

public function integer uf_valida_sala_proced (long pl_rec_cd_recurso, long pl_cd_procedimento, string ps_ds_procedimento, ref string ps_mensagem);Constant string ls_metodo='uf_valida_sala_proced'
boolean lb_inconsistente=false

long ll_count
string ls_mensagem

if pl_rec_cd_recurso = 0 or isnull(pl_rec_cd_recurso) or pl_cd_procedimento = 0 or isnull(pl_cd_procedimento) then return 1

//Valida rela$$HEX2$$e700e300$$ENDHEX$$o do procedimento com o recurso (humano)	
SELECT count(*)
INTO :ll_count
FROM recurso_x_procedimento
WHERE cd_recurso = :pl_rec_cd_recurso
	AND cd_procedimento = :pl_cd_procedimento;

if ll_count = 0 or isnull(ll_count) then
	ls_mensagem = 'Problema: O recurso f$$HEX1$$ed00$$ENDHEX$$sico (Sala) n$$HEX1$$e300$$ENDHEX$$o possui v$$HEX1$$ed00$$ENDHEX$$nculo com o procedimento: ' + &
						string(pl_cd_procedimento) + ' - ' + ps_ds_procedimento + '.~r~n' + &
						'Solu$$HEX2$$e700e300$$ENDHEX$$o: M$$HEX1$$f300$$ENDHEX$$dulo Agenda >> Menu Cadastro >> Recurso x Procedimento ~r~n~r~n'
	ps_mensagem += ls_mensagem
	
	lb_inconsistente = True
	
end if

//LOG
if lb_inconsistente = True then
	
	uf_log_erro(ls_metodo + ' - Consist$$HEX1$$ea00$$ENDHEX$$ncia: Recurso F$$HEX1$$ed00$$ENDHEX$$sico (Sala) x Procedimento ~r~n' + &
											' - Resultado: Inconsistente ~r~n' + &
											' - Par$$HEX1$$e200$$ENDHEX$$metros avaliados:~r~n' + &
											' 		- Recurso F$$HEX1$$ed00$$ENDHEX$$sico (Sala) = ' + string(pl_rec_cd_recurso) + '~r~n' + &
											' 		- Procedimento = ' + string(pl_cd_procedimento) )
else
	uf_log_erro(ls_metodo + ' - Consist$$HEX1$$ea00$$ENDHEX$$ncia: Recurso F$$HEX1$$ed00$$ENDHEX$$sico (Sala) x Procedimento ~r~n' + &
									' - Resultado: OK ' )

end if
//---------------------------------------------------------------------------------------//

return 1
end function

public function integer uf_valida_creden_proced (long pl_cd_procedimento, string ps_ds_procedimento, long pl_rec_cd_recurso, ref long pl_cd_credenciado, ref string ps_mensagem);Constant string ls_metodo='uf_valida_creden_proced'
boolean lb_inconsistente=false

string ls_cd_sala_ambulatorio, ls_mensagem
long ll_centro_custo, ll_credenciado, ll_cd_hospital

if pl_cd_procedimento = 0 or isnull(pl_cd_procedimento) or pl_rec_cd_recurso = 0 or isnull(pl_rec_cd_recurso) then return 1

select cd_sala_ambulatorio, cd_hospital
into :ls_cd_sala_ambulatorio, :ll_cd_hospital
from recurso_associacao
where cd_recurso = :pl_rec_cd_recurso;

if uf_valida_sql('Evento: uo_integracao_cross.uf_valida_creden_proced~nTabela: recurso_associacao',false) = -1 then return -1

select cd_centro_custo
into :ll_centro_custo
from sala_ambulatorio
where cd_sala_ambulatorio = :ls_cd_sala_ambulatorio
and cd_hospital = :ll_cd_hospital;

if uf_valida_sql('Evento: uo_integracao_cross.uf_valida_creden_proced~nTabela: sala_ambulatorio',false) = -1 then return -1

select cd_credenciado
into :ll_credenciado 
from creden_proced
where cd_hospital = :ll_cd_hospital
and cd_procedimento = :pl_cd_procedimento	
and cd_centro_custo = :ll_centro_custo;

if uf_valida_sql('Evento: uo_integracao_cross.uf_valida_creden_proced~nTabela: sala_ambulatorio',false) = -1 then return -1

if ll_credenciado = 0 or isnull(ll_credenciado) then
	ls_mensagem = 'Problema: N$$HEX1$$e300$$ENDHEX$$o existe credenciado vinculado ao procedimento: ' + &
						string(pl_cd_procedimento) + ' - ' + ps_ds_procedimento + '.~r~n' + &
						'Solu$$HEX2$$e700e300$$ENDHEX$$o: M$$HEX1$$f300$$ENDHEX$$dulo Cadastros Gerais >> Menu Faturamento >> Prestador de Servi$$HEX1$$e700$$ENDHEX$$o x Procedimento ~r~n~r~n'
	ps_mensagem += ls_mensagem
	
	lb_inconsistente=True
	
end if

if ll_credenciado = 0 then setnull(ll_credenciado)

pl_cd_credenciado = ll_credenciado


//LOG
if lb_inconsistente = True then
	
	uf_log_erro(ls_metodo + ' - Consist$$HEX1$$ea00$$ENDHEX$$ncia: V$$HEX1$$ed00$$ENDHEX$$nculo Procedimento x Credenciado ~r~n' + &
											' - Resultado: Inconsistente ~r~n' + &
											' - Par$$HEX1$$e200$$ENDHEX$$metros avaliados:~r~n' + &
											' 		- Procedimento = ' + string(pl_cd_procedimento) + '~r~n' + &
											' 		- Recurso F$$HEX1$$ed00$$ENDHEX$$sico (Sala) = ' + string(pl_rec_cd_recurso) + '~r~n' + &
											'		- Credenciado = ' + string(pl_cd_credenciado) )
else
	uf_log_erro(ls_metodo + ' - Consist$$HEX1$$ea00$$ENDHEX$$ncia: V$$HEX1$$ed00$$ENDHEX$$nculo Procedimento x Credenciado ~r~n' + &
									' - Resultado: OK ' )

end if
//---------------------------------------------------------------------------------------//

return 1
end function

public function integer uf_tipo_exame_transf (string ps_arquivo, datastore pds_dados, ref datastore pds_dados_sx, ref string ps_mensagem);Constant string ls_metodo='uf_tipo_exame_transf'

long ll_id_age_consulta_hor_origem, ll_linhas, ll_id_age_consulta_hor, ll_cd_recurso_cross, &
	ll_cd_especialidade_cross, ll_cd_dest_origem_cross, ll_cd_grade_recurso_cross, ll_cd_paciente_cross, &
	ll_cd_recurso_sx, ll_dia, ll_cd_grade_recurso_sx, ll_rec_cd_recurso, ll_duracao, ll_cd_plano_saude, &
	ll_cd_tp_plano, ll_cd_especialidade_sx, ll_cd_dest_origem_sx, ll_cd_paciente_sx,ll_idade,ll_row
string ls_mensagem = '', ls_ds_especialidade_cross, ls_ds_dest_origem_cross, ls_tp_comp, &
	ls_nm_recurso_cross, ls_nm_recurso_sx, ls_tp_recurso, ls_ds_especialidade_sx, ls_nm_paciente, &
	ls_sexo, ls_cns,ls_fone,ls_ddd,ls_fone_trab,ls_ddd_trab, ls_adicional
date ld_data_agenda, ld_nascimento
datetime ldt_agenda_ini, ldt_agenda_fim
time lt_hora_ini, lt_hora_fim
decimal ld_altura, ld_peso

ll_linhas = pds_dados.rowcount()
if ll_linhas = 0 then return 1

uf_log_erro(ls_metodo + ' - In$$HEX1$$ed00$$ENDHEX$$cio das Consist$$HEX1$$ea00$$ENDHEX$$ncias: Exame - Transfer$$HEX1$$ea00$$ENDHEX$$ncia.')

//Busca os dados da datastore.
ld_data_agenda = pds_dados.getitemdate(1,'data_agenda')
lt_hora_ini = pds_dados.getitemtime(1,'hor_ini')
lt_hora_fim = pds_dados.getitemtime(1,'hor_fim')

ldt_agenda_ini = datetime(ld_data_agenda,lt_hora_ini)
ldt_agenda_fim = datetime(ld_data_agenda,lt_hora_fim)

ll_id_age_consulta_hor_origem = pds_dados.getitemnumber(1,'id_age_exame_hor_origem')
ll_id_age_consulta_hor = pds_dados.getitemnumber(1,'id_age_exame_hor')

ll_cd_grade_recurso_cross = pds_dados.getitemnumber(1,'id_age_exame')
ll_cd_paciente_cross = pds_dados.getitemnumber(1,'cod_paciente')
//ls_tp_comp = pds_dados.getitemstring(1,'tipo')

//No SX: Dia 1 = Domingo, Dia 2 = Segunda, Dia 3 = Ter$$HEX1$$e700$$ENDHEX$$a, ...
//No CROSS: Dia 0 = Domingo, Dia 1 = Segunda, Dia 2 = Ter$$HEX1$$e700$$ENDHEX$$a, ...
//Portanto, para integrar com o SX tenho que somar +1 no dia.

ll_dia = pds_dados.getitemnumber(1,'cod_dia')
ll_dia = ll_dia + 1

//***************//

//Validade do compromisso
if uf_valida_data_comp(ldt_agenda_ini, ref ls_mensagem) = -1 then return -1

//Verifica se o compromisso Origem existe no SX.
if uf_valida_comp_origem(ll_id_age_consulta_hor_origem, ref ls_mensagem) = -1 then return -1

//Valida a situa$$HEX2$$e700e300$$ENDHEX$$o do compromisso a ser exclu$$HEX1$$ed00$$ENDHEX$$do.
if uf_valida_situacao_comp(ll_id_age_consulta_hor_origem, ref ls_mensagem) = -1 then return -1

// Duplicidade de agendamento //
if uf_valida_registro_comp(ll_id_age_consulta_hor, ref ls_mensagem) = -1 then return -1

//Grade Recurso
if uf_valida_grade_recurso(ll_cd_grade_recurso_cross, ld_data_agenda, ldt_agenda_ini, ldt_agenda_fim, ll_dia, 'N', ref ls_adicional, ref ll_cd_grade_recurso_sx, ref ll_cd_recurso_sx, ref ll_rec_cd_recurso, ref ll_duracao, ref ll_cd_especialidade_sx, ref ls_mensagem) = -1 then return -1

//Recurso
if uf_valida_recurso(ll_cd_recurso_sx, ref ls_nm_recurso_sx, ref ls_mensagem) = -1 then return -1

//Busca tipo do Recurso
if uf_busca_tp_recurso(ll_cd_recurso_sx, ref ls_tp_recurso) = -1 then return -1

//Concorr$$HEX1$$ea00$$ENDHEX$$ncia Recurso
if uf_valida_concorrencia_recurso(ll_cd_recurso_sx, ll_rec_cd_recurso, ldt_agenda_ini, ldt_agenda_fim, ref ls_mensagem) = -1 then return -1

//Hor$$HEX1$$e100$$ENDHEX$$rio Bloqueado
if uf_valida_bloqueio(ll_cd_recurso_sx, ll_rec_cd_recurso, ldt_agenda_ini, ldt_agenda_fim, ref ls_mensagem) = -1 then return -1

//Paciente
if uf_valida_paciente(ll_cd_paciente_cross, ref ll_cd_paciente_sx,ref ls_nm_paciente, ref ls_sexo, ref ls_cns, ref ls_fone, ref ls_ddd, ref ls_fone_trab, ref ls_ddd_trab, ref ld_nascimento, ref ld_peso, ref ld_altura, ref ll_idade, ref ls_mensagem) = -1 then return -1

//Concorr$$HEX1$$ea00$$ENDHEX$$ncia Paciente
if uf_valida_concorrencia_paciente(ll_cd_paciente_sx, ldt_agenda_ini, ldt_agenda_fim, ll_cd_recurso_sx, 'T', ref ls_mensagem) = -1 then return -1

ps_mensagem = ls_mensagem

//Carrega DataStore com os dados que ser$$HEX1$$e300$$ENDHEX$$o inseridos no SX.
ll_row = pds_dados_sx.insertrow(0)
pds_dados_sx.setitem(ll_row,'cd_grade_recurso',ll_cd_grade_recurso_sx)
pds_dados_sx.setitem(ll_row,'dt_compromisso',ldt_agenda_ini)
pds_dados_sx.setitem(ll_row,'dt_compromisso_fim',ldt_agenda_fim)
pds_dados_sx.setitem(ll_row,'dia_semana',ll_dia)
pds_dados_sx.setitem(ll_row,'duracao',ll_duracao)
pds_dados_sx.setitem(ll_row,'cd_paciente',ll_cd_paciente_sx)
pds_dados_sx.setitem(ll_row,'id_age_consulta_hor',ll_id_age_consulta_hor)
pds_dados_sx.setitem(ll_row,'id_age_consulta_hor_origem',ll_id_age_consulta_hor_origem)
pds_dados_sx.setitem(ll_row,'in_extra', 'N')
pds_dados_sx.setitem(ll_row,'in_encaixe', 'N')
pds_dados_sx.setitem(ll_row,'in_adicional', ls_adicional)
pds_dados_sx.setitem(ll_row,'cd_paciente_conexa', ll_cd_paciente_cross)
pds_dados_sx.setitem(ll_row,'rec_cd_recurso', ll_rec_cd_recurso)
pds_dados_sx.setitem(ll_row,'cd_recurso', ll_cd_recurso_sx)
pds_dados_sx.setitem(ll_row,'nm_recurso', ls_nm_recurso_sx)

uf_log_erro(ls_metodo + ' - Fim das Consist$$HEX1$$ea00$$ENDHEX$$ncias: Exame - Transfer$$HEX1$$ea00$$ENDHEX$$ncia.')

return 1
end function

public function integer uf_tipo_exame_canc (string ps_arquivo, datastore pds_dados, ref datastore pds_dados_sx, ref string ps_mensagem);Constant string ls_metodo='uf_tipo_exame_canc'

long ll_linhas, ll_id_age_consulta_hor, ll_linha, ll_id_motivo,ll_cd_motivo_cancel
string ls_mensagem

ll_linhas = pds_dados.rowcount()
if ll_linhas = 0 then return 1

uf_log_erro(ls_metodo + ' - In$$HEX1$$ed00$$ENDHEX$$cio das Consist$$HEX1$$ea00$$ENDHEX$$ncias: Exame - Cancelamento.')

ll_id_age_consulta_hor = pds_dados.getitemnumber(1,'id_age_exame_hor')
ll_id_motivo = pds_dados.getitemnumber(1,'id_motivo')

if uf_valida_cancelamento(ll_id_age_consulta_hor, ref ls_mensagem) = -1 then return -1

//Valida a situa$$HEX2$$e700e300$$ENDHEX$$o do compromisso a ser exclu$$HEX1$$ed00$$ENDHEX$$do.
if uf_valida_situacao_comp(ll_id_age_consulta_hor, ref ls_mensagem) = -1 then return -1

//Valida o motivo de cancelamento.
if uf_valida_motivo_cancel(ll_id_motivo, ref ll_cd_motivo_cancel, ref ls_mensagem) = -1 then return -1

ps_mensagem = ls_mensagem

ll_linha = pds_dados_sx.insertrow(0)
pds_dados_sx.setitem(ll_linha,'id_age_consulta_hor',ll_id_age_consulta_hor)
pds_dados_sx.setitem(ll_linha,'cd_mot_cancel',ll_cd_motivo_cancel)

uf_log_erro(ls_metodo + ' - Fim das Consist$$HEX1$$ea00$$ENDHEX$$ncias: Exame - Cancelamento.')

return 1
end function

public function integer uf_valida_paciente (long pl_cd_paciente, ref long pl_cd_paciente_sx, ref string ps_nm_paciente, ref string ps_sexo, ref string ps_cns, ref string ps_fone, ref string ps_ddd, ref string ps_fone_trab, ref string ps_ddd_trab, ref date pdt_nascimento, ref decimal pd_peso, ref decimal pd_altura, ref long pl_idade, ref string ps_mensagem);
if pl_cd_paciente > 0 then

	//Busca os dados do paciente que ser$$HEX1$$e300$$ENDHEX$$o utilizados no compromisso.
	SELECT cd_paciente,
			nm_paciente,
			 sexo,
			 cns,
			 nr_fone,
			 nr_ddd_fone,
			 nr_fone_trab,
			 nr_ddd_fone_trab,
			 dt_nascimento,
			 peso,
			 altura
	  INTO :pl_cd_paciente_sx,
	  		:ps_nm_paciente,
			 :ps_sexo,
			:ps_cns,
			:ps_fone,
			:ps_ddd,
			:ps_fone_trab,
			:ps_ddd_trab,
			:pdt_nascimento,
			:pd_peso,
			:pd_altura
	  FROM paciente
	 WHERE cd_conexa = :pl_cd_paciente;
	 
	if uf_valida_sql('Evento: uo_integracao_cross.uf_valida_paciente~n Tabela: PACIENTE', FALSE ) = -1 then return -1

	if pl_cd_paciente_sx > 0 then
		if	uf_calcula_idade(pdt_nascimento, ref pl_idade) = -1 then return -1
	end if

end if
 
if pl_cd_paciente_sx = 0 then setnull(pl_cd_paciente_sx) 
 
 return 1
end function

public function integer uf_busca_tp_recurso (integer pl_cd_recurso, ref string ps_tp_recurso);//Tipo Recurso
select cd_tp_recurso
into :ps_tp_recurso
from recurso
where cd_recurso = :pl_cd_recurso;

if uf_valida_sql('Evento: uo_integracao_cross.uf_valida_recurso~n Tabela: RECURSO', FALSE ) = -1 then return -1

return 1
end function

public function integer uf_busca_dados_compromisso (long pl_id_age_consulta_hor, ref datastore pds_dados);long ll_cd_recurso, ll_cd_especialidade,ll_cd_paciente,ll_duracao, ll_row
string ls_nm_recurso, ls_ds_especialidade, ls_nm_cliente, ls_cd_tp_compromisso
datetime ldt_compromisso, ldt_compromisso_fim

select c.cd_recurso,
		r.nm_recurso,
		c.cd_especialidade,
		e.ds_especialidade,
		c.cd_paciente,
		c.nm_cliente,
		c.dt_compromisso,
		c.duracao,
		c.cd_tp_compromisso
into :ll_cd_recurso,
		:ls_nm_recurso,
		:ll_cd_especialidade,
		:ls_ds_especialidade,
		:ll_cd_paciente,
		:ls_nm_cliente,
		:ldt_compromisso,
		:ll_duracao,
		:ls_cd_tp_compromisso
from compromisso c, recurso r, especialidade e
where c.cd_recurso = r.cd_recurso
and c.cd_especialidade = e.cd_especialidade(+)
and c.id_age_consulta_hor = :pl_id_age_consulta_hor;

if uf_valida_sql('Evento: uf_busca_dados_compromisso~nTabela: compromisso',false) = -1 then return -1

ldt_compromisso_fim = uf_soma_minutos(ldt_compromisso, ll_duracao)

ll_row = pds_dados.rowcount()

if ll_row = 0 then
	ll_row = pds_dados.insertrow(0)
end if

if ll_cd_recurso = 0 then setnull(ll_cd_recurso)
if ll_cd_especialidade = 0 then setnull(ll_cd_especialidade)
if ll_cd_paciente = 0 then setnull(ll_cd_paciente)
if ll_duracao = 0 then setnull(ll_duracao)

pds_dados.setitem(ll_row,'cd_recurso',ll_cd_recurso)
pds_dados.setitem(ll_row,'nm_recurso',ls_nm_recurso)
pds_dados.setitem(ll_row,'cd_especialidade',ll_cd_especialidade)
pds_dados.setitem(ll_row,'ds_especialidade',ls_ds_especialidade)
pds_dados.setitem(ll_row,'cd_paciente',ll_cd_paciente)
pds_dados.setitem(ll_row,'nm_cliente',ls_nm_cliente)
pds_dados.setitem(ll_row,'dt_compromisso',ldt_compromisso)
pds_dados.setitem(ll_row,'dt_compromisso_fim',ldt_compromisso_fim)
pds_dados.setitem(ll_row,'duracao',ll_duracao)
pds_dados.setitem(ll_row,'cd_tp_compromisso',ls_cd_tp_compromisso)

return 1
end function

public function integer uf_valida_especialidade (long pl_cd_especialidade_cross, string ps_ds_especialidade_cross, string ps_tp_recurso, ref long pl_cd_especialidade_sx, ref string ps_ds_especialidade_sx, ref string ps_mensagem);Constant string ls_metodo='uf_valida_especialidade'
boolean lb_inconsistente=false

long ll_cd_especialidade_sx
string ls_ds_especialidade_sx
string ls_mensagem

ls_mensagem = ''

//Especialidade
if pl_cd_especialidade_cross > 0 then

	select e.cd_especialidade, e.ds_especialidade
	into :ll_cd_especialidade_sx, :ls_ds_especialidade_sx
	from especialidade e, especialidade_cross ec
	where ec.cd_especialidade = e.cd_especialidade
	and ec.cd_cross = :pl_cd_especialidade_cross;
	
//	where cd_conexa = :pl_cd_especialidade_cross;
		
	//if uf_valida_sql('Evento: uo_integracao_cross.uf_valida_especialidade~n Tabela: ESPECIALIDADE', FALSE ) = -1 then return -1
	
	if sqlca.sqlcode = -1 then
	
		select e.cd_especialidade, e.ds_especialidade
		into :ll_cd_especialidade_sx, :ls_ds_especialidade_sx
		from especialidade e, especialidade_cross ec
		where ec.cd_especialidade = e.cd_especialidade
		and ec.cd_cross = :pl_cd_especialidade_cross
		and e.cd_especialidade = :pl_cd_especialidade_sx;
		
		//where cd_conexa = :pl_cd_especialidade_cross
			//and cd_especialidade = :pl_cd_especialidade_sx;
		
		if uf_valida_sql('Evento: uo_integracao_cross_agenda.uf_valida_especialidade~n Tabela: ESPECIALIDADE_CROSS', FALSE ) = -1 then return -1
		
		if ll_cd_especialidade_sx = 0 or isnull(ll_cd_especialidade_sx) then
		
			if (pl_cd_especialidade_sx = 0 or isnull(pl_cd_especialidade_sx)) or (pl_cd_especialidade_sx <> ll_cd_especialidade_sx)  then
				ls_mensagem = 'Problema: A Especialidade n$$HEX1$$e300$$ENDHEX$$o est$$HEX2$$e1002000$$ENDHEX$$configurada na grade do Recurso: Especialidade = ' + string(pl_cd_especialidade_cross) + ' - ' + ps_ds_especialidade_cross + '~r~n' + &
												'Solu$$HEX2$$e700e300$$ENDHEX$$o: M$$HEX1$$f300$$ENDHEX$$dulo Agenda >> Menu Cadastro >> Grade Recurso >> Humano ~r~n~r~n'
			else
				setnull(ll_cd_especialidade_sx)
				ls_mensagem = 'Problema: A Especialidade do CROSS n$$HEX1$$e300$$ENDHEX$$o est$$HEX2$$e1002000$$ENDHEX$$vinculada ao sistema SX: ' + string(pl_cd_especialidade_cross) + ' - ' + ps_ds_especialidade_cross + '~r~n' + &
												'Solu$$HEX2$$e700e300$$ENDHEX$$o: M$$HEX1$$f300$$ENDHEX$$dulo Cadastros Gerais >> Menu Cadastro >> Especialidade ~r~n~r~n'
			end if
			ps_mensagem += ls_mensagem
			
			lb_inconsistente=True
			
		end if
	else
		
		if ll_cd_especialidade_sx = 0 or isnull(ll_cd_especialidade_sx) then
			setnull(ll_cd_especialidade_sx)
			ls_mensagem = 'Problema: A Especialidade do CROSS n$$HEX1$$e300$$ENDHEX$$o est$$HEX2$$e1002000$$ENDHEX$$vinculada ao sistema SX: ' + string(pl_cd_especialidade_cross) + ' - ' + ps_ds_especialidade_cross + '~r~n' + &
											'Solu$$HEX2$$e700e300$$ENDHEX$$o: M$$HEX1$$f300$$ENDHEX$$dulo Cadastros Gerais >> Menu Cadastro >> Especialidade ~r~n~r~n'
			ps_mensagem += ls_mensagem
			
			lb_inconsistente = True
			
		end if
		
	end if

end if
//***********************//

if ll_cd_especialidade_sx = 0 then setnull(ll_cd_especialidade_sx)
if ls_ds_especialidade_sx = '' then setnull(ls_ds_especialidade_sx)

pl_cd_especialidade_sx = ll_cd_especialidade_sx
ps_ds_especialidade_sx = ls_ds_especialidade_sx

//LOG
if lb_inconsistente = True then
	
	uf_log_erro(ls_metodo + ' - Consist$$HEX1$$ea00$$ENDHEX$$ncia: V$$HEX1$$ed00$$ENDHEX$$nculo Especialidade SX x Especialidade CROSS ~r~n' + &
											' - Resultado: Inconsistente ~r~n' + &
											' - Par$$HEX1$$e200$$ENDHEX$$metros avaliados:~r~n' + &
											' 		- Especialidade CROSS = ' + string(pl_cd_especialidade_cross) + '~r~n' + &
											' 		- Especialidade SX = ' + string(pl_cd_especialidade_sx) )
else
	uf_log_erro(ls_metodo + ' - Consist$$HEX1$$ea00$$ENDHEX$$ncia: V$$HEX1$$ed00$$ENDHEX$$nculo Especialidade SX x Especialidade CROSS ~r~n' + &
									' - Resultado: OK ' )

end if
//---------------------------------------------------------------------------------------//

return 1
end function

public function integer uf_valida_recurso (long pl_cd_recurso_sx, ref string ps_nm_recurso_sx, ref string ps_mensagem);long ll_cd_recurso
string ls_nm_recurso, ls_tp_recurso, ls_mensagem

//Recurso
select cd_recurso, nm_recurso
into :ll_cd_recurso, :ls_nm_recurso
from recurso
where cd_recurso = :pl_cd_recurso_sx;

if uf_valida_sql('Evento: uo_integracao_cross.uf_valida_recurso~n Tabela: RECURSO', FALSE ) = -1 then return -1

//if ll_cd_recurso = 0 or isnull(ll_cd_recurso) then
//	ls_mensagem = 'Problema: O Recurso do CROSS n$$HEX1$$e300$$ENDHEX$$o est$$HEX2$$e1002000$$ENDHEX$$vinculado ao sistema SX: ' + string(pl_cd_recurso_cross) + ' - ' + ps_nm_recurso_cross + '~r~n'+ &
//									'Solu$$HEX2$$e700e300$$ENDHEX$$o: M$$HEX1$$f300$$ENDHEX$$dulo Agenda >> Menu Cadastro >> Recurso ~r~n~r~n'
//	ps_mensagem += ls_mensagem
//end if

if ll_cd_recurso = 0 then setnull(ll_cd_recurso)

pl_cd_recurso_sx = ll_cd_recurso
ps_nm_recurso_sx = ls_nm_recurso

return 1
end function

public function integer uf_valida_medico_espec (long pl_cd_especialidade, long pl_cd_recurso, string ps_nm_recurso, ref string ps_mensagem);Constant string ls_metodo='uf_valida_medico_espec'
boolean lb_inconsistente=false

long ll_cd_medico
string ls_nm_medico, ls_mensagem , ls_ds_especialidade

if pl_cd_recurso = 0 or isnull(pl_cd_recurso) then return 1
if pl_cd_especialidade = 0 or isnull(pl_cd_especialidade) then return 1

//V$$HEX1$$ed00$$ENDHEX$$nculo Especialidade x M$$HEX1$$e900$$ENDHEX$$dico
		
SELECT m.cd_medico, m.nm_medico, e.ds_especialidade
INTO :ll_cd_medico, :ls_nm_medico, :ls_ds_especialidade
FROM especialidade e, medico_especialidade me, recurso_associacao ra, medico m
WHERE ra.cd_medico = me.cd_medico
 AND me.cd_especialidade = e.cd_especialidade
 AND me.cd_medico = m.cd_medico
 AND ra.cd_recurso = :pl_cd_recurso
 AND e.cd_especialidade = :pl_cd_especialidade;
		
if uf_valida_sql('Evento: uo_integracao_cross.uf_valida_medico_espec~n Tabela: MEDICO_ESPECIALIDADE', FALSE ) = -1 then return -1

if ll_cd_medico = 0 or isnull(ll_cd_medico) then
	ls_mensagem = 'Problema: O Profissional n$$HEX1$$e300$$ENDHEX$$o possui v$$HEX1$$ed00$$ENDHEX$$nculo com a Especialidade: ~r~n'+&
						'Profissional: ' + string(pl_cd_recurso) + ' - ' + ps_nm_recurso + '~r~nEspecialidade: ' + string(pl_cd_especialidade) + ' - ' + ls_ds_especialidade + '~r~n' + &
						'Solu$$HEX2$$e700e300$$ENDHEX$$o: M$$HEX1$$f300$$ENDHEX$$dulo Cadastros Gerais >> Menu V$$HEX1$$ed00$$ENDHEX$$nculo >> Especialidade x Profissional ~r~n~r~n'
	ps_mensagem += ls_mensagem
	
	lb_inconsistente=True
	
end if

//LOG
if lb_inconsistente = True then
	
	uf_log_erro(ls_metodo + ' - Consist$$HEX1$$ea00$$ENDHEX$$ncia: V$$HEX1$$ed00$$ENDHEX$$nculo M$$HEX1$$e900$$ENDHEX$$dico x Especialidade ~r~n' + &
											' - Resultado: Inconsistente ~r~n' + &
											' - Par$$HEX1$$e200$$ENDHEX$$metros avaliados:~r~n' + &
											' 		- Recurso = ' + string(pl_cd_recurso) + '~r~n' + &
											'     - Especialidade = ' + String(pl_cd_especialidade) )
else
	uf_log_erro(ls_metodo + ' - Consist$$HEX1$$ea00$$ENDHEX$$ncia: V$$HEX1$$ed00$$ENDHEX$$nculo M$$HEX1$$e900$$ENDHEX$$dico x Especialidade ~r~n' + &
									' - Resultado: OK ' )

end if
//---------------------------------------------------------------------------------------//		

return 1
end function

public function integer uf_valida_grade_recurso (long pl_cd_grade_recurso_cross, date pd_data_agenda, datetime pdt_agenda_ini, datetime pdt_agenda_fim, long pl_dia, string ps_encaixe, ref string ps_adicional, ref long pl_cd_grade_recurso_sx, ref long pl_cd_recurso_sx, ref long pl_rec_cd_recurso, ref long pl_duracao, ref long pl_cd_especialidade_sx, ref string ps_mensagem);Constant string ls_metodo='uf_valida_grade_recurso'
boolean lb_inconsistente=false

long ll_cd_grade_recurso_sx, ll_duracao, ll_rec_cd_recurso, ll_duracao_grade, ll_total_duracao, &
		ll_nr_horarios, ll_for, ll_grade
string ls_mensagem=''
datetime ldt_grade_ini, ldt_grade_fim, ldt_ini, ldt_fim

ldt_ini = datetime(date('01/01/1900'),time(pdt_agenda_ini))
ldt_fim = datetime(date('01/01/1900'),time(pdt_agenda_fim))

// Grade Recurso //
select gr.cd_grade_recurso, gr.cd_recurso, gri.duracao_intervalo, gri.hora_inicial, gri.hora_final, gri.cd_recurso, gri.cd_especialidade
into :ll_cd_grade_recurso_sx, :pl_cd_recurso_sx, :ll_duracao_grade, :ldt_grade_ini, :ldt_grade_fim, :ll_rec_cd_recurso, :pl_cd_especialidade_sx
from grade_recurso_item gri, grade_recurso gr
where gri.cd_grade_recurso = gr.cd_grade_recurso
	and :pd_data_agenda >= gr.dt_ini
	and :pd_data_agenda <= gr.dt_fim
	ANd gri.cd_conexa = :pl_cd_grade_recurso_cross
	AND gri.dia_semana = :pl_dia
	AND :ldt_ini >= gri.hora_inicial
	AND :ldt_ini < gri.hora_final
	AND gr.in_situacao = 'L'
	AND gr.in_ativo = 'S'
	AND gri.in_ativo = 'S';

if uf_valida_sql('Evento: uo_integracao_cross.uf_valida_grade_recurso_1~n Tabela: GRADE_RECURSO', FALSE ) = -1 then return -1

if ll_cd_grade_recurso_sx = 0 or isnull(ll_cd_grade_recurso_sx) then
	
	//Gustavo heerbach - 17/11/2014 ch.75485
	SELECT count(*), max(cd_recurso)
	INTO :ll_cd_grade_recurso_sx, :ll_rec_cd_recurso
	FROM grade_recurso_dif
	WHERE cd_conexa = :pl_cd_grade_recurso_cross
		AND dt_agenda = :pd_data_agenda
		AND :ldt_ini >= hora_inicial
		AND :ldt_fim <= hora_final;
	
	if uf_valida_sql('Evento: uo_integracao_cross.uf_valida_grade_recurso_2~n Tabela: GRADE_RECURSO_DIF', FALSE ) = -1 then return -1
	
	if ll_cd_grade_recurso_sx > 1 then
		// Giordani Ramos. ch. 96540. Este log deixar$$HEX2$$e1002000$$ENDHEX$$de ser gravado na pasta de erros e passar$$HEX2$$e1002000$$ENDHEX$$a ser exibido na tela de gerenciamento da integra$$HEX2$$e700e300$$ENDHEX$$o CROSS, no Agenda.
		ps_mensagem = 'Para o c$$HEX1$$f300$$ENDHEX$$digo do recurso SX (' + string(ll_rec_cd_recurso) + ') existem hor$$HEX1$$e100$$ENDHEX$$rios duplicados na tela de Per$$HEX1$$ed00$$ENDHEX$$odo de Trabalho Diferenciado(AGCA007_T). Favor ajustar os registros e realizar a integra$$HEX2$$e700e300$$ENDHEX$$o novamente.'
		lb_inconsistente = true
		// uf_gravar_log_erro(ls_mensagem)
		// Fim ch. 96540.
	end if
	//fim  ch.75485
	
	SELECT CD_GRADE_REC_DIF, cd_recurso, rec_cd_recurso, duracao_intervalo, hora_inicial, hora_final, cd_especialidade
	into :ll_cd_grade_recurso_sx, :pl_cd_recurso_sx, :ll_rec_cd_recurso, :ll_duracao_grade, :ldt_grade_ini, :ldt_grade_fim, :pl_cd_especialidade_sx
	FROM grade_recurso_dif
	WHERE cd_conexa = :pl_cd_grade_recurso_cross
		AND dt_agenda = :pd_data_agenda
		AND :ldt_ini >= hora_inicial
		AND :ldt_fim <= hora_final;	

	if uf_valida_sql('Evento: uo_integracao_cross.uf_valida_grade_recurso_3~n Tabela: GRADE_RECURSO_DIF', FALSE ) = -1 then return -1
	
	if ll_cd_grade_recurso_sx = 0 or isnull(ll_cd_grade_recurso_sx) then
		ls_mensagem = 'Problema: A Grade do CROSS n$$HEX1$$e300$$ENDHEX$$o est$$HEX2$$e1002000$$ENDHEX$$vinculada ao sistema SX. C$$HEX1$$f300$$ENDHEX$$digo da Grade no CROSS: ' + string(pl_cd_grade_recurso_cross) + '~r~n' + &
							'Solu$$HEX2$$e700e300$$ENDHEX$$o: M$$HEX1$$f300$$ENDHEX$$dulo Agenda >> Menu Cadastro >> Grade de Recurso >> Humano (Verifique Compatibilidade de hor$$HEX1$$e100$$ENDHEX$$rios)' + '~r~n~r~n'
		ps_mensagem += ls_mensagem
		
		lb_inconsistente=True
		
	end if
	
	if ll_cd_grade_recurso_sx > 0 then
		ps_adicional = 'S'
	end if	
end if
	
ll_duracao = uf_diferenca_minutos(pdt_agenda_ini, pdt_agenda_fim)
	
if ll_rec_cd_recurso > 0 and ps_encaixe = 'N' then	
	if ll_duracao <> ll_duracao_grade then
		ls_mensagem = 'Problema: A dura$$HEX2$$e700e300$$ENDHEX$$o do Compromisso $$HEX2$$e9002000$$ENDHEX$$diferente da dura$$HEX2$$e700e300$$ENDHEX$$o especificada na grade do Recurso.~r~n' + &
							'Dura$$HEX2$$e700e300$$ENDHEX$$o Compromisso = ' + string(ll_duracao) + ' min. - Dura$$HEX2$$e700e300$$ENDHEX$$o Grade = ' + string(ll_duracao_grade) + ' min.~r~n' + &
							'Solu$$HEX2$$e700e300$$ENDHEX$$o: M$$HEX1$$f300$$ENDHEX$$dulo Agenda >> Menu Cadastro >> Grade de Recurso >> Humano ~r~n~r~n'
		ps_mensagem += ls_mensagem
		
		lb_inconsistente=True
		
	end if
	
end if

if ll_rec_cd_recurso > 0 then
	
	//Verifica se a Grade est$$HEX2$$e1002000$$ENDHEX$$com os hor$$HEX1$$e100$$ENDHEX$$rios condizentes com o hor$$HEX1$$e100$$ENDHEX$$rio do compromisso.
	ll_total_duracao = uf_diferenca_minutos(ldt_grade_ini, ldt_grade_fim)
	ll_nr_horarios = int(ll_total_duracao/ll_duracao_grade)
	
	for ll_for = 1 to ll_nr_horarios
		
		if ldt_ini = ldt_grade_ini then
			ll_for = 1
			EXIT
		end if
		
		ldt_grade_ini = uf_soma_minutos(ldt_grade_ini,ll_duracao_grade)
		
	next
	
	if ll_for < 1 then
		ls_mensagem = 'Problema: O hor$$HEX1$$e100$$ENDHEX$$rio inicial da Grade n$$HEX1$$e300$$ENDHEX$$o est$$HEX2$$e1002000$$ENDHEX$$de acordo com o hor$$HEX1$$e100$$ENDHEX$$rio da Grade do CROSS.~r~n' + &
							'Solu$$HEX2$$e700e300$$ENDHEX$$o: M$$HEX1$$f300$$ENDHEX$$dulo Agenda >> Menu Cadastro >> Grade de Recurso >> Humano ~r~n~r~n'
		ps_mensagem += ls_mensagem
		
		lb_inconsistente=True
		
	end if
	
	ll_for = 0
	
end if		
		
if ll_cd_grade_recurso_sx = 0 then setnull(ll_cd_grade_recurso_sx)
if ll_rec_cd_recurso = 0 then setnull(ll_rec_cd_recurso)
if pl_cd_especialidade_sx = 0	then setnull(pl_cd_especialidade_sx)
if pl_cd_recurso_sx = 0	then setnull(pl_cd_recurso_sx)
		
		
pl_cd_grade_recurso_sx = ll_cd_grade_recurso_sx
pl_rec_cd_recurso = ll_rec_cd_recurso
pl_duracao = ll_duracao

//LOG
if lb_inconsistente = True then
	
	uf_log_erro(ls_metodo + ' - Consist$$HEX1$$ea00$$ENDHEX$$ncia: Grade do Recurso (V$$HEX1$$ed00$$ENDHEX$$nculo Grade SX x CROSS, Dura$$HEX2$$e700e300$$ENDHEX$$o, Hor$$HEX1$$e100$$ENDHEX$$rio Inicial) ~r~n' + &
											' - Resultado: Inconsistente ~r~n' + &
											' - Par$$HEX1$$e200$$ENDHEX$$metros avaliados:~r~n' + &
											' 		- Grade CROSS = ' + string(pl_cd_grade_recurso_cross) + '~r~n' + &
											'     - Recurso SX = ' + String(pl_cd_recurso_sx) + '~r~n' + &
											' 		- Dia semana = ' + string(pl_dia) + '~r~n' + &
											'		- Data = ' + string(pd_data_agenda) + '~r~n' + &
											'		- Hora inicial = ' + String(ldt_ini) + '~r~n' + &
											'		- Hora final = ' + String(ldt_fim) )
else
	uf_log_erro(ls_metodo + ' - Consist$$HEX1$$ea00$$ENDHEX$$ncia: Grade do Recurso (V$$HEX1$$ed00$$ENDHEX$$nculo Grade SX x CROSS, Dura$$HEX2$$e700e300$$ENDHEX$$o, Hor$$HEX1$$e100$$ENDHEX$$rio Inicial) ~r~n' + &
									' - Resultado: OK ' )

end if
//---------------------------------------------------------------------------------------//		
		
return 1
end function

public function integer uf_valida_situacao_comp (long pl_id_age_consulta_hor, ref string ps_mensagem);Constant string ls_metodo='uf_valida_situacao_comp'
boolean lb_inconsistente=false

string ls_situacao, ls_mensagem

select id_sit_compromisso
into :ls_situacao
from compromisso
where ID_AGE_CONSULTA_HOR = :pl_ID_AGE_CONSULTA_HOR;

if uf_valida_sql('Evento: uo_integracao_cross.uf_valida_situacao_comp~n Tabela: COMPROMISSO', FALSE ) = -1 then return -1

Choose Case ls_situacao
	Case 'R'
		ls_mensagem = 'Problema: O Compromisso est$$HEX2$$e1002000$$ENDHEX$$com situa$$HEX2$$e700e300$$ENDHEX$$o Realizado e n$$HEX1$$e300$$ENDHEX$$o pode mais ser alterado. ~r~n' + &
					'Solu$$HEX2$$e700e300$$ENDHEX$$o: M$$HEX1$$f300$$ENDHEX$$dulo Agenda >> Menu Movimento >> Agenda de Compromisso ~r~n~r~n'
		ps_mensagem += ls_mensagem
		
		lb_inconsistente = True
		
	Case 'C'
		ls_mensagem = 'Problema: O Compromisso est$$HEX2$$e1002000$$ENDHEX$$com situa$$HEX2$$e700e300$$ENDHEX$$o Comparecido e n$$HEX1$$e300$$ENDHEX$$o pode mais ser alterado. ~r~n' + &
					'Solu$$HEX2$$e700e300$$ENDHEX$$o: M$$HEX1$$f300$$ENDHEX$$dulo Agenda >> Menu Movimento >> Agenda de Compromisso ~r~n~r~n'
		ps_mensagem += ls_mensagem	
		
		lb_inconsistente = True
		
	Case 'E'
		ls_mensagem = 'Problema: O Compromisso est$$HEX2$$e1002000$$ENDHEX$$com situa$$HEX2$$e700e300$$ENDHEX$$o Em Agendamento e n$$HEX1$$e300$$ENDHEX$$o pode mais ser alterado. ~r~n' + &
					'Solu$$HEX2$$e700e300$$ENDHEX$$o: M$$HEX1$$f300$$ENDHEX$$dulo Agenda >> Menu Movimento >> Agenda de Compromisso ~r~n~r~n'
		ps_mensagem += ls_mensagem	
		
		lb_inconsistente = True
		
End Choose
	

//LOG
if lb_inconsistente = True then
	
	uf_log_erro(ls_metodo + ' - Consist$$HEX1$$ea00$$ENDHEX$$ncia: Situa$$HEX2$$e700e300$$ENDHEX$$o do Agendamento ~r~n' + &
											' - Resultado: Inconsistente ~r~n' + &
											' - Par$$HEX1$$e200$$ENDHEX$$metros avaliados:~r~n' + &
											' 		- C$$HEX1$$f300$$ENDHEX$$digo do Agendamento no CROSS = ' + string(pl_id_age_consulta_hor) )
else
	uf_log_erro(ls_metodo + ' - Consist$$HEX1$$ea00$$ENDHEX$$ncia: Situa$$HEX2$$e700e300$$ENDHEX$$o do Agendamento ~r~n' + &
									' - Resultado: OK ' )

end if
//---------------------------------------------------------------------------------------//

return 1
end function

public function integer uf_valida_procedimento (long pl_cd_procedimento_cross, string ps_ds_procedimento_cross, ref long pl_cd_procedimento_sx, ref string ps_ds_procedimento_sx, ref string ps_tp_procedimento, ref string ps_mensagem);Constant string ls_metodo='uf_valida_procedimento'
boolean lb_inconsistente=false

string ls_mensagem='', ls_ativo

if pl_cd_procedimento_cross = 0 or isnull(Pl_cd_procedimento_cross) then return 1

SELECT p.cd_procedimento, p.ds_procedimento, p.id_tipo_procedimento, p.in_ativo
  INTO :pl_cd_procedimento_sx, :ps_ds_procedimento_sx, :ps_tp_procedimento, :ls_ativo
  FROM procedimento p, procedimento_cross pc
 WHERE pc.cd_procedimento = p.cd_procedimento
	 and pc.cd_cross = :pl_cd_procedimento_cross;

if uf_valida_sql('Evento: uo_integracao_cross.uf_valida_procedimento~nTabela: Procedimento',false) = -1 then return -1

if pl_cd_procedimento_sx = 0 or isnull(pl_cd_procedimento_sx) then
	setnull(pl_cd_procedimento_sx)
	ls_mensagem = 'Problema: O Procedimento do CROSS n$$HEX1$$e300$$ENDHEX$$o est$$HEX2$$e1002000$$ENDHEX$$vinculado ao sistema SX: ' + string(pl_cd_procedimento_cross) + ' - ' + ps_ds_procedimento_cross +  '~r~n' + &
				'Solu$$HEX2$$e700e300$$ENDHEX$$o: M$$HEX1$$f300$$ENDHEX$$dulo Cadastros Gerais >> Menu Cadastro >> Procedimento >> Procedimento~r~n~r~n'
	ps_mensagem += ls_mensagem
	
	lb_inconsistente = True
	
else
	
	//CH:93044
	if ls_ativo = 'N' then
		
		ls_mensagem = 'Problema: O Procedimento do SX est$$HEX2$$e1002000$$ENDHEX$$inativo: ' + string(pl_cd_procedimento_sx) + ' - ' + ps_ds_procedimento_sx +  '~r~n' + &
				'Solu$$HEX2$$e700e300$$ENDHEX$$o: M$$HEX1$$f300$$ENDHEX$$dulo Cadastros Gerais >> Menu Cadastro >> Procedimento >> Procedimento~r~n~r~n'
		ps_mensagem += ls_mensagem
		
		setnull(pl_cd_procedimento_sx)
		
		lb_inconsistente = True
		
	end if
	//FIM - CH:93044
	
end if

if pl_cd_procedimento_sx = 0 then setnull(pl_cd_procedimento_sx)


//LOG
if lb_inconsistente = True then
	
	uf_log_erro(ls_metodo + ' - Consist$$HEX1$$ea00$$ENDHEX$$ncia: V$$HEX1$$ed00$$ENDHEX$$nculo Procedimento SX x CROSS ~r~n' + &
											' - Resultado: Inconsistente ~r~n' + &
											' - Par$$HEX1$$e200$$ENDHEX$$metros avaliados:~r~n' + &
											' 		- Procedimento CROSS = ' + string(pl_cd_procedimento_cross) )
else
	uf_log_erro(ls_metodo + ' - Consist$$HEX1$$ea00$$ENDHEX$$ncia: V$$HEX1$$ed00$$ENDHEX$$nculo Procedimento SX x CROSS ~r~n' + &
									' - Resultado: OK ' )

end if
//---------------------------------------------------------------------------------------//

return 1
end function

public function integer uf_valida_motivo_cancel (long pl_cd_motivo_cross, ref long pl_cd_motivo_sx, ref string ps_mensagem);Constant string ls_metodo='uf_valida_motivo_cancel'
boolean lb_inconsistente=false

long ll_cd_motivo
string ls_mensagem

if isnull(pl_cd_motivo_cross) then
	ls_mensagem = 'Problema: Motivo de Cancelamento do CROSS informado. ~r~n' + &
								'Solu$$HEX2$$e700e300$$ENDHEX$$o: Verifique o arquivo vindo do CROSS. ~r~n~r~n'
	ps_mensagem += ls_mensagem
	return 1
end if

select cd_mot_cancel_agenda
into :ll_cd_motivo
from motivo_cancel_agenda
where cd_cross = :pl_cd_motivo_cross;

if uf_valida_sql('Evento: uo_integracao_cross.uf_valida_motivo_cancel~n Tabela: MOTIVO_CANCEL_AGENDA', FALSE ) = -1 then return -1
	
if ll_cd_motivo = 0 or isnull(ll_cd_motivo) then
	ls_mensagem = 'Problema: Motivo de Cancelamento do CROSS n$$HEX1$$e300$$ENDHEX$$o vinculado ao SX: ' + string(pl_cd_motivo_cross) + '~r~n' + &
								'Solu$$HEX2$$e700e300$$ENDHEX$$o: M$$HEX1$$f300$$ENDHEX$$dulo Agenda >> Menu Cadastro >> Motivos ~r~n~r~n'
	ps_mensagem += ls_mensagem
	
	lb_inconsistente = True
	
end if

if ll_cd_motivo = 0 then setnull(ll_cd_motivo)

pl_cd_motivo_sx = ll_cd_motivo

//LOG
if lb_inconsistente = True then
	
	uf_log_erro(ls_metodo + ' - Consist$$HEX1$$ea00$$ENDHEX$$ncia: V$$HEX1$$ed00$$ENDHEX$$nculo Motivo de Cancelamento SX x CROSS ~r~n' + &
											' - Resultado: Inconsistente ~r~n' + &
											' - Par$$HEX1$$e200$$ENDHEX$$metros avaliados:~r~n' + &
											' 		- Motivo CROSS = ' + string(pl_cd_motivo_cross) )
else
	uf_log_erro(ls_metodo + ' - Consist$$HEX1$$ea00$$ENDHEX$$ncia: V$$HEX1$$ed00$$ENDHEX$$nculo Motivo de Cancelamento SX x CROSS ~r~n' + &
									' - Resultado: OK ' )

end if
//---------------------------------------------------------------------------------------//	

return 1
end function

public function integer uf_log_integracao (string ps_nm_arquivo, string ps_tipo, integer pl_qtd_lid, integer pl_qtd_imp, integer pl_qtd_rej, string ps_funcionario, long pl_cd_recurso, long pl_cd_paciente, string ps_nm_paciente);long ll_id

select infosaude.seq_log_importacao_conexa.nextval
into :ll_id
from dual;


insert into log_importacao_conexa (ID_LOG_IMPORTACAO_CONEXA,
											  NM_ARQUIVO,
											  DATA_IMP,
											  IN_TIPO,
											  QTD_LINHAS_LID,
											  QTD_LINHAS_IMP,
											  QTD_LINHAS_REJ,
											  CD_FUNCIONARIO_INC,
											  qtd_linhas_exc,
											  CD_RECURSO,
											  CD_PACIENTE,
											  NM_PACIENTE)
	Values (:ll_id, 
				:ps_nm_arquivo,
				sysdate,
				:ps_tipo,
				:pl_qtd_lid,
				:pl_qtd_imp,
				:pl_qtd_rej,
				:ps_funcionario,
				0,
				:pl_cd_recurso,
				:pl_cd_paciente,
				:ps_nm_paciente);
				
if uf_valida_sql('Evento: uo_integracao_cross.uf_log_integracao~n Tabela: LOG_IMPORTACAO_CONEXA', TRUE ) = -1 then return -1

Commit;

return 1
end function

public function integer uf_atualiza_fone_cad_paciente (datastore pds_dados, long pl_linha, long pl_cd_paciente_conexa);//Gustavo Heerbach - ch75532 em 29/10/2014 - Atualizar na tabela do paciente as informa$$HEX2$$e700f500$$ENDHEX$$es do telefone e cns
//quando is_atualiza_fone_cad_pac = 'S' e o paciente for de integra$$HEX2$$e700e300$$ENDHEX$$o com o CROSS

string ls_tel_res_ddd, ls_tel_res, ls_tel_celular, ls_tel_celular_ddd, ls_tel_com_ddd, ls_tel_com, ls_cns, ls_funcao
long ll_pos

ls_funcao = 'Evento: uo_integracao_cross.uf_atualiza_fone_cad_paciente~n Tabela: PACIENTE'

if  IsNull(is_atualiza_fone_cad_pac) or is_atualiza_fone_cad_pac <> 'S' then return 0

if IsNull(pl_cd_paciente_conexa) or pl_cd_paciente_conexa < 1 then return 0

ls_tel_res_ddd 		= TRIM(pds_dados.getitemstring(pl_linha,'tel_res_ddd'))
ls_tel_res			= TRIM(pds_dados.getitemstring(pl_linha,'tel_res'))
ls_tel_com_ddd		= TRIM(pds_dados.getitemstring(pl_linha,'tel_com_ddd'))
ls_tel_com			= TRIM(pds_dados.getitemstring(pl_linha,'tel_com'))
ls_cns					= TRIM(pds_dados.getitemstring(pl_linha,'num_cns'))

ll_pos = pos(ls_cns,',')
if ll_pos > 0 then
	ls_cns = mid(ls_cns,1, ll_pos - 1)
end if

if ls_tel_res_ddd = ''		then SetNull(ls_tel_res_ddd)
if ls_tel_res = '' 			then SetNull(ls_tel_res)
if ls_tel_com_ddd = '' 	then SetNull(ls_tel_com_ddd)
if ls_tel_com = '' 			then SetNull(ls_tel_com)
if ls_cns = '' 				then SetNull(ls_cns)

// Gustavo Heerbach - ch77882 em 16/03/2015 - atualizar somente os campos que possuirem valores
// Gilton, 17/05/2019 - Unificado o update para otimiza$$HEX2$$e700e300$$ENDHEX$$o. NVL garante que sobrescreva s$$HEX2$$f3002000$$ENDHEX$$com valor que n$$HEX1$$e300$$ENDHEX$$o seja nulo
UPDATE paciente 
  SET cns = NVL(:ls_cns, cns),
    nr_ddd_fone = NVL(:ls_tel_res_ddd, nr_ddd_fone),
    nr_fone = NVL(:ls_tel_res, nr_fone),
    nr_ddd_fone_trab = NVL(:ls_tel_com_ddd, nr_ddd_fone_trab),
    nr_fone_trab = NVL(:ls_tel_com, nr_fone_trab)
	 WHERE cd_conexa = :pl_cd_paciente_conexa;
	 
if uf_valida_sql(ls_funcao, true) = -1 then return -1	 
	 
Commit;

return 1
end function

public function integer uf_gravar_log_erro (string ps_texto);
long ll_file
string ls_arquivo, ls_log_erro
datetime ldt_atual

ls_arquivo = is_nm_arquivo

if pos(ls_arquivo,'.xml',1) > 0 then
	ls_arquivo = mid(ls_arquivo,1,len(ls_arquivo) - 4)
end if

ls_log_erro = '\' + ls_arquivo

SELECT sysdate
   INTO :ldt_atual
  FROM dual;
  
ls_log_erro +=  '_log_erro_' + string(ldt_atual, 'ddmmyyyy_hhmmss') + '.txt'
 
ls_arquivo = is_dir_erro + ls_log_erro

ll_file = FileOpen (ls_arquivo , LineMode!, Write!, LockReadWrite!, Append!)

if ll_file = -1 then return -1

FileWrite(ll_file, ps_texto)	

FileClose(ll_file)

return 1
end function

public function integer uf_insere_paciente_celular (long pl_cd_paciente, long pl_ddd, string ps_numero, string ps_complemento, string ps_funcionario);long ll_Seq, ll_existe
string ls_funcao

if  IsNull(is_atualiza_fone_cad_pac) or is_atualiza_fone_cad_pac <> 'S' then return 1

//Insere um telefone do tipo celular para o paciente.

ls_funcao = 'Fun$$HEX2$$e700e300$$ENDHEX$$o: uo_integracao_cross.uf_insere_paciente_celular~nTabela: paciente_telefone'

//CH:85342 - Leonardo Pedersen - 29/01/2016
//-> Troquei para Select Count(*), pois estava vindo mais de uma linha.

//Gustavo Heerbach - ch77882 em 16/03/2015 - Se existir o cel passado por referencia nao atualizar e nem inserir
 SELECT count(*)
	INTO :ll_existe
   FROM paciente_telefone
 WHERE cd_paciente = :pl_cd_paciente
	 AND cd_tipo_fone = 2
	 AND nr_fone = :ps_numero
	 AND nr_ddd_fone = :pl_ddd;

if uf_valida_sql(ls_funcao + ' (sql 1)',True) = -1 then return -1

if ll_existe > 0 and not isnull(ll_existe) then return 1//fim 77882

select max(cd_telefone)
into :ll_seq
from paciente_telefone
where cd_paciente = :pl_cd_paciente;

if uf_valida_sql('Fun$$HEX2$$e700e300$$ENDHEX$$o: UO_INTEGRACAO_CROSS.UF_INSERE_PACIENTE_CELULAR~tTabela:PACIENTE_TELEFONE',True) = -1 then return -1

if isnull(ll_seq) or ll_seq = 0 then 
	ll_seq = 1
else
	ll_seq++
end if

Insert into paciente_telefone (CD_PACIENTE, CD_TELEFONE, CD_TIPO_FONE, NR_FONE, NR_DDD_FONE, NR_COMPLEMENTO, CD_FUNCIONARIO)
Values(:pl_cd_paciente, :ll_seq, 2, :ps_numero, :pl_ddd, :ps_complemento , :ps_funcionario);

if uf_valida_sql('Fun$$HEX2$$e700e300$$ENDHEX$$o: UO_INTEGRACAO_CROSS.UF_INSERE_PACIENTE_CELULAR~tTabela:PACIENTE_TELEFONE',True) = -1 then return -1

return 1
end function

public function integer uf_gera_conexao (transaction pt_trans);string ls_server

ls_server = gs_servername
	
pt_trans.dbms = 'O90'
pt_trans.servername = ls_server
pt_trans.DBParm = "CommitOnDisconnect='No',NLS_Charset='Local',DecimalSeparator=','"

pt_trans.logid = 'SYBSA'
pt_trans.LogPass	 = 'SYSLOGINS'
CONNECT USING pt_trans;

// Caso n$$HEX1$$e300$$ENDHEX$$o consiga conectar, quem chamou precisa saber disso
if (pt_trans.SQLDBCode <> 0) then return -1

return 1
end function

public function integer uf_log_erro (string ps_erro);//Chamado 80247 - Luiz Carlos - 14/07/2015

Long ll_file_log, ll_retorno_read
String ls_file_log, ls_log_atual, ls_read
Datetime ldt_atual

if is_in_gerar_log = 'N' or isnull(is_in_gerar_log) then return 1

//Data do momento do Log
Select sysdate
into :ldt_atual
from dual;

//Abertura do arquivo de Log

ll_file_log = FileOpen(is_direxec + '\log_integrador_cross.txt', LineMode!, Write! )
		
//Leitura do arquivo de Log		
do while ll_retorno_read > 0
	ll_retorno_read = FileReadEx(ll_file_log, ls_read)
	
	if ll_retorno_read > 0 then
		ls_file_log = ls_file_log + ls_read
	end if
loop

//Cria Log atual e adiciona aos dados de Log anteriores
//ls_log_atual = '---------------------------------------------------' + '~r~n'
ls_log_atual = String(ldt_atual) + ' - ' + is_nm_arquivo + ' - ' + ps_erro + '~r~n'
ls_log_atual += '---------------------------------------------------'
ls_file_log = ls_file_log + ls_log_atual

//Escreve os dados de Log no arquivo e fecha-o
FileWrite(ll_file_log, ls_file_log)
FileClose(ll_file_log)

return 1
end function

public function integer uf_verifica_chave (string ps_tp_registro, ref string ps_msg);//Ch.: 89771 - Luiz Carlos, 13/07/2016
long ll_retorno, ll_valida_sql

ps_msg = ''

do while true
	
	choose case ps_tp_registro
		case 'A'
			
			SELECT 1
			INTO :ll_retorno
			from compromisso
			where cd_recurso = :il_cd_recurso and
			sq_compromisso = :il_sq_compromisso;
			
			ll_valida_sql = uf_valida_sql('Fun$$HEX2$$e700e300$$ENDHEX$$o: UO_INTEGRACAO_CROSS.uf_verifica_chave~tTabela: compromisso', true)
			
			if ll_valida_sql = - 1 then 
				ps_msg = 'Erro na verifica$$HEX2$$e700e300$$ENDHEX$$o da chave do registro de agendamento. Fun$$HEX2$$e700e300$$ENDHEX$$o: UO_INTEGRACAO_CROSS.uf_verifica_chave. Tabela: compromisso.'
				return -1 
			elseif ll_valida_sql = 0 then
				continue
			end if
			
			if isnull(ll_retorno) or ll_retorno = 0 then ll_retorno = -1
			
		case 'T'
			SELECT 1
			INTO :ll_retorno
			from compromisso
			where cd_recurso = :il_cd_recurso and
			sq_compromisso = :il_sq_compromisso;
			
			if uf_valida_sql('Fun$$HEX2$$e700e300$$ENDHEX$$o: UO_INTEGRACAO_CROSS.uf_verifica_chave~tTabela: compromisso', true) = - 1 then 
				ps_msg = 'Erro na verifica$$HEX2$$e700e300$$ENDHEX$$o da chave do registro transferencia. Fun$$HEX2$$e700e300$$ENDHEX$$o: UO_INTEGRACAO_CROSS.uf_verifica_chave. Tabela: compromisso.'
				return -1
			end if
			
			if isnull(ll_retorno) or ll_retorno = 0 then ll_retorno = -1
			
		case 'C'
			SELECT 1
			INTO :ll_retorno
			FROM DUAL
			WHERE NOT EXISTS (SELECT 1
										FROM compromisso 
										WHERE cd_recurso = :il_cd_recurso
										AND sq_compromisso = :il_sq_compromisso);
			
			if uf_valida_sql('Fun$$HEX2$$e700e300$$ENDHEX$$o: UO_INTEGRACAO_CROSS.uf_verifica_chave~tTabela: compromisso', true) = - 1 then 
				ps_msg = 'Erro na verifica$$HEX2$$e700e300$$ENDHEX$$o da chave do registro de cancelamento. Fun$$HEX2$$e700e300$$ENDHEX$$o: UO_INTEGRACAO_CROSS.uf_verifica_chave. Tabela: compromisso.'
				return -1
			end if
			
			if isnull(ll_retorno) or ll_retorno = 0 then ll_retorno = -1
		
	end choose
	
	exit

loop

if ll_retorno = -1 then ps_msg = 'Falha de conex$$HEX1$$e300$$ENDHEX$$o, arquivo n$$HEX1$$e300$$ENDHEX$$o importado. Ser$$HEX2$$e1002000$$ENDHEX$$efetuado uma nova tentativa.'

return ll_retorno
end function

public function integer uf_reset ();ids_compromisso.reset()
ids_agenda_con.reset()
ids_canc_con.reset()
ids_transf_con.reset()
ids_agenda_exa.reset()
ids_canc_exa.reset()
ids_transf_exa.reset()

setnull(il_cd_recurso)
setnull(il_sq_compromisso)

return 1
end function

public function integer uf_registra_rep_cross (string ps_retorno, long pl_cd_recurso, long pl_cd_compromisso);/* Jeferson Neves | CH100160 | 25/05/2017 
	Function criada para atualizar a tabela rep_cross durante a integra$$HEX2$$e700e300$$ENDHEX$$o autom$$HEX1$$e100$$ENDHEX$$tica com o CROSS
*/

string 	ls_status, ls_sqlerr

if ps_retorno = 'Registro efetuado com sucesso.' then 
	ls_status = 'I'
else
	ls_status = 'E'
end if

insert into rep_cross (cd_recurso, 
							seq,
							ds_retorno, 
							id_status_int, 
							sq_compromisso,
							dt_inclusao)
				   values (:pl_cd_recurso,
							 rep_cross_seq1.nextval,
							 :ps_retorno,
							 :ls_status,
							 :pl_cd_compromisso,
							 sysdate);

if uf_valida_sql('Erro ao popular a tabela rep_cross.',TRUE) = -1 then 
	return -1
else 
	commit;
	return 1
end if
end function

public function integer uf_log_erro_exportacao (string ps_erro);/*	Jeferson Neves | CH100160 | 25/05/2017
	Fun$$HEX2$$e700e300$$ENDHEX$$o para graca$$HEX2$$e700e300$$ENDHEX$$o de log de erro no processo de integra$$HEX2$$e700e300$$ENDHEX$$o CROSS (Exporta$$HEX2$$e700e300$$ENDHEX$$o)
*/

Long ll_file_log, ll_retorno_read
String ls_file_log, ls_log_atual, ls_read
Datetime ldt_atual

//Data do momento do Log
Select sysdate
into :ldt_atual
from dual;

//Abertura do arquivo de Log de exporta$$HEX2$$e700e300$$ENDHEX$$o CROSS
ll_file_log = FileOpen(is_direxec + '\log_exportador_cross.txt', LineMode!, Write! )   
		
//Leitura do arquivo
do while ll_retorno_read > 0											
	ll_retorno_read = FileReadEx(ll_file_log, ls_read)
	
	if ll_retorno_read > 0 then
		ls_file_log = ls_file_log + ls_read
	end if
loop

//Cria Log atual e adiciona aos dados de Log anteriores
ls_log_atual = 'Data: ' + String(ldt_atual) + ' - Ocorr$$HEX1$$ea00$$ENDHEX$$ncia: ' + ps_erro + '~r~n'
ls_log_atual += '-----------------------------------------------------------------------'
ls_file_log = ls_file_log + ls_log_atual

//Escreve os dados de Log no arquivo e fecha-o
FileWrite(ll_file_log, ls_file_log)
FileClose(ll_file_log)

return 1
end function

public function integer uf_valida_encaixe (long pl_cd_recurso, long pl_cd_grade_recurso, datetime pdt_compromisso, datetime pdt_compromisso_fim, ref long pl_sq_compromisso, long pl_duracao, ref string ps_mensagem);Long ll_comp_ant, ll_duracao_ant

if pl_cd_recurso = 0 or isnull(pl_cd_recurso) then return 1
if pl_cd_grade_recurso = 0 or isnull(pl_cd_grade_recurso) then return 1

SELECT sq_compromisso, (SELECT duracao FROM compromisso
                        WHERE cd_recurso = :pl_cd_recurso
                        AND sq_compromisso = q.sq_compromisso) AS duracao
INTO :ll_comp_ant, :ll_duracao_ant								
FROM (SELECT MIN(sq_compromisso) AS sq_compromisso
  FROM compromisso c
  WHERE cd_recurso = :pl_cd_recurso
  AND dt_compromisso = :pdt_compromisso) q;
	
if uf_valida_sql('Evento: uo_integracao_cross.uf_valida_encaixe ~nTabela: COMPROMISSO', false) = -1 then return -1

if ll_comp_ant = 0 then setnull(ll_comp_ant)

pl_sq_compromisso = ll_comp_ant

// Chamado 124637 - Gilton, 05/04/2019 
// Se a dura$$HEX2$$e700e300$$ENDHEX$$o do encaixe for igual ou maior que a dura$$HEX2$$e700e300$$ENDHEX$$o do compromisso original, n$$HEX1$$e300$$ENDHEX$$o deve permitir a grava$$HEX2$$e700e300$$ENDHEX$$o
if ((ll_comp_ant > 0) and not(ll_duracao_ant > pl_duracao)) then
	ps_mensagem += 'Problema: A dura$$HEX2$$e700e300$$ENDHEX$$o do compromisso original (' + string(ll_comp_ant) + ')~r~n' + &
							'$$HEX2$$e9002000$$ENDHEX$$insuficiente para alocar o encaixe.' + '~r~n'
end if	

return 1
end function

public function integer uf_valida_concorrencia_paciente (long pl_cd_paciente, datetime pdt_compromisso_ini, datetime pdt_compromisso_fim, long pl_cd_recurso, string ps_tipo_agenda, ref string ps_mensagem);constant string ls_metodo='uf_valida_concorrencia_paciente'
boolean lb_inconsistente=false

long ll_count
string ls_mensagem

//Testa se o paciente j$$HEX2$$e1002000$$ENDHEX$$possui agendamento para o hor$$HEX1$$e100$$ENDHEX$$rio.
// Chamado 126607 - Gilton, 19/06/2019 - N$$HEX1$$e300$$ENDHEX$$o valida hor$$HEX1$$e100$$ENDHEX$$rio do agendamento se for transfer$$HEX1$$ea00$$ENDHEX$$ncia de recurso, 
//  												   pois nesse caso sempre criticaria o hor$$HEX1$$e100$$ENDHEX$$rio da agenda origem
if pl_cd_paciente > 0 then

	select count(*)
	into :ll_count
    from compromisso
   where cd_paciente = :pl_cd_paciente
   and ( (:pdt_compromisso_ini <= dt_compromisso
          and :pdt_compromisso_fim >= dateadd(mi,duracao,dt_compromisso) )
      or (:pdt_compromisso_ini > dt_compromisso
          and :pdt_compromisso_ini < dateadd(mi,duracao,dt_compromisso)
          and :pdt_compromisso_fim >= dateadd(mi,duracao,dt_compromisso) )
      or (:pdt_compromisso_ini > dt_compromisso
          and :pdt_compromisso_ini < dateadd(mi,duracao, dt_compromisso)
          and :pdt_compromisso_fim > dt_compromisso
          and :pdt_compromisso_fim < dateadd(mi,duracao, dt_compromisso) )
      or (:pdt_compromisso_ini <= dt_compromisso
          and :pdt_compromisso_fim > dt_compromisso
          and :pdt_compromisso_fim < dateadd(mi,duracao,dt_compromisso) ) )
	and (cd_recurso = :pl_cd_recurso or :ps_tipo_agenda <> 'T');	

	if uf_valida_sql('Evento: uo_integracao_cross.uf_valida_concorrencia_paciente~n Tabela: COMPROMISSO', FALSE ) = -1 then return -1

	if ll_count > 0 then 
		ls_mensagem = 'Problema: O Paciente j$$HEX2$$e1002000$$ENDHEX$$possui um Agendamento nesse hor$$HEX1$$e100$$ENDHEX$$rio.~r~n' + &
							'Solu$$HEX2$$e700e300$$ENDHEX$$o: M$$HEX1$$f300$$ENDHEX$$dulo Agenda >> Menu Movimento >> Agenda de Compromissos >> Hist$$HEX1$$f300$$ENDHEX$$rico do Paciente ~r~n~r~n'
		ps_mensagem += ls_mensagem
		
		lb_inconsistente=True
		
	end if

end if

//LOG
if lb_inconsistente = True then
	
	uf_log_erro(ls_metodo + ' - Consist$$HEX1$$ea00$$ENDHEX$$ncia: Concorr$$HEX1$$ea00$$ENDHEX$$ncia do paciente ~r~n' + &
											' - Resultado: Inconsistente ~r~n' + &
											' - Par$$HEX1$$e200$$ENDHEX$$metros avaliados:~r~n' + &
											' 		- Paciente = ' + string(pl_cd_paciente) + '~r~n' + &
											'		- Data in$$HEX1$$ed00$$ENDHEX$$cio agendamento = ' + string(pdt_compromisso_ini) + '~r~n' + &
											'		- Data fim agendamento = ' + string(pdt_compromisso_fim) )
else
	uf_log_erro(ls_metodo + ' - Consist$$HEX1$$ea00$$ENDHEX$$ncia: Concorr$$HEX1$$ea00$$ENDHEX$$ncia do paciente ~r~n' + &
									' - Resultado: OK ' )
	
end if
//----------------------------------------------------------------------------------------------------------//

return 1
end function

private function integer uf_valida_sql_new (transaction ptr_sqlnew, string ps_mensagem);/*
	Sempre ap$$HEX1$$f300$$ENDHEX$$s fazer um comando SQL essa fun$$HEX2$$e700e300$$ENDHEX$$o deve ser chamada. 
	Caso ocorra Desconex$$HEX1$$e300$$ENDHEX$$o com o banco, $$HEX2$$e9002000$$ENDHEX$$feita uma conex$$HEX1$$e300$$ENDHEX$$o automaticamente.
	Isso evita a parada do aplicativo.
*/

string ls_server, ls_erro
long ll_dbcode, ll_count=0
boolean lb_conectou = false

if ptr_sqlnew.sqlcode = -1 then
	
	ll_dbcode = ptr_sqlnew.SQLDBCode
	ls_erro = ps_mensagem + '~r~n' + ptr_sqlnew.sqlerrtext
	
	if ll_dbcode = 0 or ll_dbcode = 03114 or ll_dbcode = 03113 then
		// Chamado 127539 - Gilton, 19/09/2019
		// Alimenta a variavel abaixo para incluir o arquivo no reprocessamento posterior
		ib_erro_desconexao = true
		
		DISCONNECT USING ptr_sqlnew;
	
		return -1
	else
		Rollback;
		MessageBox('Aten$$HEX2$$e700e300$$ENDHEX$$o', ls_erro)
		
		if isvalid(w_popup_cross) then Close(w_popup_cross)
		
		uf_log_erro(ls_erro)

		return -1
	end if
	
end if

if isvalid(w_popup_cross) then Close(w_popup_cross)

return 1
end function

public function integer uf_renomeia_move_arquivo (string ps_arquivo);// Chamado 127539 - Gilton, 19/09/2019
// Transfere o arquivo utilizado para o local definido na tela de par$$HEX1$$e200$$ENDHEX$$metros do CROSS, pasta de erros, quando o erro for por perda de conex$$HEX1$$e300$$ENDHEX$$o
// Na chamada dessa fun$$HEX2$$e700e300$$ENDHEX$$o utiliza-se um prefixo, renomeando para rep_[nome_arquivo].xml
// Dessa forma o processo de integra$$HEX2$$e700e300$$ENDHEX$$o pode resgatar esses arquivos dentre os demais para reprocessamento na pr$$HEX1$$f300$$ENDHEX$$xima itera$$HEX2$$e700e300$$ENDHEX$$o do integrador.

CopyFileW(is_dir_rec + '\' + ps_arquivo, is_dir_erro + '\rep_' + ps_arquivo, FALSE)
FileDelete(is_dir_rec + '\' + ps_arquivo)

return 1
end function

public function integer uf_move_arquivo (string ps_tipo, string ps_arquivo);//-> Transfere o arquivo utilizado para o local definido na tela de par$$HEX1$$e200$$ENDHEX$$metros do CROSS, 
//		de acordo com o status da opera$$HEX2$$e700e300$$ENDHEX$$o.

if ps_tipo = 'I' then //Importados
	
	CopyFileW(is_dir_rec + '\' + ps_arquivo, is_dir_imp + '\' + ps_arquivo, FALSE)
	FileDelete(is_dir_rec + '\' + ps_arquivo)
	
elseif ps_tipo = 'E' then //Erro
	
	CopyFileW(is_dir_rec + '\' + ps_arquivo, is_dir_erro + '\' + ps_arquivo, FALSE)
	FileDelete(is_dir_rec + '\' + ps_arquivo)
	
end if

return 1
end function

public function long uf_inicia_integracao (string ps_nm_arquivo, ref boolean pb_reprocessar);long ll_for, ll_total, ll_file, ll_cd_recurso, ll_cd_paciente
string ls_arquivo, ls_nome_arq, ls_mensagem, ls_tp_arq, ls_tp_registro, ls_nm_paciente

Constant string ls_metodo='uf_inicia_integracao'

pb_reprocessar = false

if not fileexists(is_dir_rec) then
	messagebox('Aten$$HEX2$$e700e300$$ENDHEX$$o','O diret$$HEX1$$f300$$ENDHEX$$rio configurado como padr$$HEX1$$e300$$ENDHEX$$o para arquivos recebidos do CROSS n$$HEX1$$e300$$ENDHEX$$o existe.~n'+ &
								'Acesse: M$$HEX1$$f300$$ENDHEX$$dulo Agenda > Menu cadastro > Par$$HEX1$$e200$$ENDHEX$$metros da Integra$$HEX2$$e700e300$$ENDHEX$$o entre SX e CROSS')
	return -1
end if
	
ls_nome_arq = ps_nm_arquivo
ls_arquivo = is_dir_rec + '\' + ls_nome_arq

is_nm_arquivo = ps_nm_arquivo //ch.75485

uf_log_erro(ls_metodo + ' - In$$HEX1$$ed00$$ENDHEX$$cio da Integra$$HEX2$$e700e300$$ENDHEX$$o')

if uf_busca_tipo_arquivo(ls_nome_arq, ref ls_tp_arq, ref ls_tp_registro) = -1 then 
	if uf_move_arquivo('E',ls_nome_arq) = -1 then return -1
	return 1
end if

Choose case ls_tp_arq
		
	//Consulta	
	Case 'C'

		ib_erro_desconexao = false // Caso ocorra desconex$$HEX1$$e300$$ENDHEX$$o, mudar$$HEX2$$e1002000$$ENDHEX$$para true (para reprocessamento posterior)
		
		//Agendamento
		if ls_tp_registro = 'A' then
			
			if uf_importa_arquivo(ls_arquivo, ref ids_agenda_con) = -1 then 
				if uf_move_arquivo('E',ls_nome_arq) = -1 then return -1
				return 1
			end if
			
			if uf_tipo_consulta_agend(ls_nome_arq, ref ids_agenda_con, ref ids_compromisso, ref ls_mensagem ) = -1 then 
				if uf_move_arquivo('E',ls_nome_arq) = -1 then return -1
				return 1
			end if
			
			if ls_mensagem = '' then
																					  
				if uf_salvar_agendamento(ids_compromisso, 'C') = -1 then
					// Chamado 127539 - Gilton, 23/09/2019
					// Ao mover para a pasta \Erros, se o erro foi de desconex$$HEX1$$e300$$ENDHEX$$o, renomeia para "rep_xxx", para reprocessado posterior
					if ib_erro_desconexao then 
						pb_reprocessar = true
						uf_renomeia_move_arquivo(ls_nome_arq)
					else
						uf_move_arquivo('E',ls_nome_arq)
					end if	
					
					return -1
				end if
			else	
				if uf_insere_nao_importado(ls_nome_arq, 'C', 'A', ids_agenda_con) = -1 then return -1
			end if
			
		//Transfer$$HEX1$$ea00$$ENDHEX$$ncia	
		elseif ls_tp_registro = 'T' then
			
			if uf_importa_arquivo(ls_arquivo, ref ids_transf_con) = -1 then 
				if uf_move_arquivo('E',ls_nome_arq) = -1 then return -1
				return 1
			end if
			
			if uf_tipo_consulta_transf(ls_nome_arq, ref ids_transf_con, ref ids_compromisso, ref ls_mensagem ) = -1 then 
				if uf_move_arquivo('E',ls_nome_arq) = -1 then return -1
				return 1
			end if
			
			if ls_mensagem = '' then
				
				if uf_salvar_transferencia(ids_compromisso, 'C') = -1 then 
					if uf_move_arquivo('E',ls_nome_arq) = -1 then return -1
					return -1
				end if
				
			else	
				if uf_insere_nao_importado(ls_nome_arq, 'C', 'T', ids_transf_con) = -1 then return -1
			end if
			
		//Cancelamento	
		elseif ls_tp_registro = 'C' then
			
			if uf_importa_arquivo(ls_arquivo, ref ids_canc_con) = -1 then 
				if uf_move_arquivo('E',ls_nome_arq) = -1 then return -1
				return 1
			end if
			
			if uf_tipo_consulta_canc(ls_nome_arq, ref ids_canc_con, ref ids_compromisso, ref ls_mensagem ) = -1 then
				if uf_move_arquivo('E',ls_nome_arq) = -1 then return -1
				return 1
			end if
			
			if ls_mensagem = '' then
				
				if uf_salvar_cancelamento(ids_compromisso, 'C') = -1 then 
					if uf_move_arquivo('E',ls_nome_arq) = -1 then return -1
					return -1
				end if
				
			else	
				if uf_insere_nao_importado(ls_nome_arq, 'C', 'C', ids_canc_con) = -1 then return -1
			end if
				
		end if

	//Exame
	Case 'E'

		//Agendamento
		if ls_tp_registro = 'A' then
			
			if uf_importa_arquivo(ls_arquivo, ref ids_agenda_exa) = -1 then 
				if uf_move_arquivo('E',ls_nome_arq) = -1 then return -1
				return 1
			end if
			
			if uf_tipo_exame_agend(ls_nome_arq, ref ids_agenda_exa, ref ids_compromisso, ref ls_mensagem ) = -1 then 
				if uf_move_arquivo('E',ls_nome_arq) = -1 then return -1
				return 1
			end if
			
			if ls_mensagem = '' then
				
				if uf_salvar_agendamento(ids_compromisso, 'E') = -1 then 
					if uf_move_arquivo('E',ls_nome_arq) = -1 then return -1
					return -1
				end if
				
			else	
				if uf_insere_nao_importado(ls_nome_arq, 'E', 'A', ids_agenda_exa) = -1 then return -1
			end if
			
		//Transfer$$HEX1$$ea00$$ENDHEX$$ncia	
		elseif ls_tp_registro = 'T' then
			
			if uf_importa_arquivo(ls_arquivo, ref ids_transf_exa) = -1 then 
				if uf_move_arquivo('E',ls_nome_arq) = -1 then return -1
				return 1
			end if
			
			if uf_tipo_exame_transf(ls_nome_arq, ids_transf_exa, ref ids_compromisso, ref ls_mensagem ) = -1 then 
				if uf_move_arquivo('E',ls_nome_arq) = -1 then return -1
				return 1
			end if
			
			if ls_mensagem = '' then
				
				if uf_salvar_transferencia(ids_compromisso, 'E') = -1 then 
					if uf_move_arquivo('E',ls_nome_arq) = -1 then return -1
					return -1
				end if
				
			else
				if uf_insere_nao_importado(ls_nome_arq, 'E', 'T', ids_transf_exa) = -1 then return -1
			end if
			
		//Cancelamento
		elseif ls_tp_registro = 'C' then
			
			if uf_importa_arquivo(ls_arquivo, ref ids_canc_exa) = -1 then 
				if uf_move_arquivo('E',ls_nome_arq) = -1 then return -1
				return 1
			end if
			
			if uf_tipo_exame_canc(ls_nome_arq, ids_canc_exa, ref ids_compromisso, ref ls_mensagem ) = -1 then 
				if uf_move_arquivo('E',ls_nome_arq) = -1 then return -1
				return 1
			end if
			
			if ls_mensagem = '' then
				
				if uf_salvar_cancelamento(ids_compromisso, 'E') = -1 then 
					if uf_move_arquivo('E',ls_nome_arq) = -1 then return -1
					return -1
				end if
				
			else	
				if uf_insere_nao_importado(ls_nome_arq, 'E', 'C', ids_canc_exa) = -1 then return -1
			end if
			
		end if

End Choose

if ls_mensagem <> '' then
		
//	if uf_salvar_nao_importados(ls_nome_arq, ids_nao_imp) = -1 then 
//		if uf_move_arquivo('E',ls_nome_arq) = -1 then return -1
//		return -1
//	end if

	ll_cd_recurso = ids_compromisso.getitemnumber(1,'cd_recurso')
	ll_cd_paciente = ids_compromisso.getitemnumber(1,'cd_paciente')
	ls_nm_paciente = ids_compromisso.getitemstring(1,'nm_cliente')

	if uf_log_integracao(ls_nome_arq,'A',1,0,1,'INTCROSS',ll_cd_recurso,ll_cd_paciente,ls_nm_paciente) = -1 then return -1
	
else
	
	//Ch.: 89771 - Luiz Carlos, 13/07/2016
	if this.uf_verifica_chave(ls_tp_registro, ls_mensagem) = -1 then
		//ROLLBACK;
		commit;		
		this.uf_log_erro(ls_mensagem)
		return -1
	end if
	//Fim Ch.: 89771 - Luiz Carlos, 13/07/2016
	
	ll_cd_recurso = ids_compromisso.getitemnumber(1,'cd_recurso')
	ll_cd_paciente = ids_compromisso.getitemnumber(1,'cd_paciente')
	ls_nm_paciente = ids_compromisso.getitemstring(1,'nm_cliente')
	
	if uf_log_integracao(ls_nome_arq,'A',1,1,0,'INTCROSS',ll_cd_recurso,ll_cd_paciente,ls_nm_paciente) = -1 then return -1
end if

if uf_move_arquivo('I',ls_nome_arq) = -1 then return -1

uf_log_erro(ls_metodo + ' - Fim da Integra$$HEX2$$e700e300$$ENDHEX$$o')

return 1
end function

on uo_integracao_cross.create
call super::create
TriggerEvent( this, "constructor" )
end on

on uo_integracao_cross.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;//Chamado 80247 - Luiz Carlos - 14/07/2015
is_direxec = GetCurrentDirectory()
//Fim

if uf_carrega_parametros() = -1 then return -1
if uf_carrega_datastore() = -1 then return -1
end event

