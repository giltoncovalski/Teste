HA$PBExportHeader$w_popup_cross.srw
$PBExportComments$Window de popup do Integrador Cross.
forward
global type w_popup_cross from window
end type
type st_2 from statictext within w_popup_cross
end type
type st_msg from statictext within w_popup_cross
end type
end forward

global type w_popup_cross from window
integer x = 832
integer y = 360
integer width = 1929
integer height = 252
boolean border = false
windowtype windowtype = popup!
long backcolor = 16777215
boolean center = true
st_2 st_2
st_msg st_msg
end type
global w_popup_cross w_popup_cross

type variables
pointer oldpointer
long ii_popup = 0 
end variables

on w_popup_cross.create
this.st_2=create st_2
this.st_msg=create st_msg
this.Control[]={this.st_2,&
this.st_msg}
end on

on w_popup_cross.destroy
destroy(this.st_2)
destroy(this.st_msg)
end on

event open;
this.move( 864, 942)

oldpointer = setpointer(HourGlass!)


Yield()

timer(1, this)
end event

event timer;Yield()

ii_popup++

Choose Case ii_popup
	Case 1
		st_msg.text = 'Tentando reconectar ao banco de dados.'
	Case 2
		st_msg.text = 'Tentando reconectar ao banco de dados..'
	Case 3
		st_msg.text = 'Tentando reconectar ao banco de dados...'
	Case 4
		st_msg.text = 'Tentando reconectar ao banco de dados....'
End Choose

if ii_popup = 4 then ii_popup = 0

end event

event close;setpointer( oldpointer )
end event

event resize;this.bringtotop = true
end event

type st_2 from statictext within w_popup_cross
integer x = 87
integer y = 56
integer width = 1298
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16711680
long backcolor = 16777215
string text = "Instabilidade na rede."
boolean focusrectangle = false
end type

type st_msg from statictext within w_popup_cross
integer x = 87
integer y = 124
integer width = 1655
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16711680
long backcolor = 16777215
boolean enabled = false
string text = "Tentando reconectar ao banco de dados...."
boolean focusrectangle = false
end type

