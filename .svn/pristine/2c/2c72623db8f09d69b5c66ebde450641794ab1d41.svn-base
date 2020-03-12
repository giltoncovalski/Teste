HA$PBExportHeader$uo_intcross_timer.sru
$PBExportComments$Objeto timer do integrador cross.
forward
global type uo_intcross_timer from timing
end type
end forward

global type uo_intcross_timer from timing
end type
global uo_intcross_timer uo_intcross_timer

type variables
window iw_window
end variables

forward prototypes
public function integer uf_seta_window (window pw_window)
end prototypes

public function integer uf_seta_window (window pw_window);iw_window = pw_window

return 1
end function

event timer;if isValid(iw_window) then iw_window.dynamic Event ue_timer()
end event

on uo_intcross_timer.create
call super::create
TriggerEvent( this, "constructor" )
end on

on uo_intcross_timer.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

