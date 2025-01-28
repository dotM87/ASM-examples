format PE GUI 4.0
entry inicio

include 'Win32a.inc'

ventana_1	equ		1
salir_btn	equ		1000

section '.data' data readable writeable

Ist  dd 0
pWnd dd 0
variable1 dd 0
variable2 dd 0
 
section '.code' code readable executable

inicio:
	invoke GetModuleHandle,0
	mov [Ist],eax
	invoke DialogBoxParam,eax,ventana_1,0,DlgProc,0 
fin:
	invoke ExitProcess,0

proc DlgProc,hWnd,uMsg,wParam,lParam

	push edi esi ebx
	
	mov eax,[uMsg]
	cmp	eax,WM_COMMAND
	je	jCOMMAND;>>>>>BOTONES
	cmp	eax,WM_INITDIALOG
	je	jINITDIALOG;>>>>>VALORES INICIALES
	cmp	eax,WM_CLOSE
	je	jCLOSE;>>>>>>>>CIERRA LA VENTANA
	xor eax,eax
	jmp finish

jINITDIALOG:
	mov eax,[hWnd]
	mov [pWnd],eax
	
	mov eax,1
	jmp finish
	
jCOMMAND:
	mov eax,[wParam]
	cmp	eax,salir_btn
	je	salir
	cmp	eax,2001
	je	botonLeer
	cmp	eax,2002
	je	botonImprimir
	cmp eax,2003
	je botonSumar
	xor eax,eax
	jmp finish
	
botonLeer:
	invoke GetDlgItemInt,[pWnd],1001,0,0
	mov [variable1],eax
	mov eax,1
	jmp finish
	
botonImprimir:
	invoke SetDlgItemInt,[pWnd],1002,[variable1],0
	mov eax,1
	jmp finish
	
botonSumar:
	invoke GetDlgItemInt,[pWnd],1001,0,0
	mov ebx,eax
	invoke GetDlgItemInt,[pWnd],1002,0,0
	add ebx,eax
	invoke SetDlgItemInt,[pWnd],1003,ebx,0
	mov eax,1
	jmp finish

	
salir:
	invoke SendMessage,[hWnd],WM_CLOSE,0,0
	mov eax,1
	jmp finish
	
jCLOSE:	
	invoke EndDialog,[hWnd],0
	mov eax,1
	
finish:
	pop ebx esi edi
	ret
endp

section '.idata' import data readable writeable
  ;importamos solo los procedimientos basicos para abrir una ventana
;  library kernel, 'KERNEL32.DLL',\
;	  user,   'USER32.DLL'

;  import  kernel,\
;	  GetModuleHandle,'GetModuleHandleA',\
;	  ExitProcess,	  'ExitProcess'

 ; import  user,\
;	  DialogBoxParam, 'DialogBoxParamA',\
;	  EndDialog,	  'EndDialog',\
;	  SendMessage,	  'SendMessageA'
  ;otra forma para importar los procedimientos importando archivos INC
  library kernel32,'KERNEL32.DLL',user32,'USER32.DLL',gdi32,'GDI32.DLL'
  include 'api\kernel32.inc'
  include 'api\user32.inc'
  include 'api\gdi32.inc'

section '.rsrc' resource from 'Proyecto1.res' data readable
