; IMPORTANT INFO ABOUT GETTING STARTED: Lines that start with a
; semicolon, such as this one, are comments.  They are not executed.

; See http://duartes.org/gustavo/blog/home-row-computing for more information on this script
; See the AutoHotKey docs at http://www.autohotkey.com/docs/  for AutoHotKey documentation
; Most of the syntax is described at http://www.autohotkey.com/docs/Hotkeys.htm


; AppsKey + jkl;

!k::Send {Up}
!k up::Send {Up Up}

!j::Send {Down}
!j up::Send {Down Up}

!h::Send {Left}
!h up::Send {Left Up}

!l::Send {Right}
!l up::Send {Right Up}


!Space::SendInput {BS}

!s::Send :w{Enter}

; Make Windows Key + Apps Key work like Caps Lock
Capslock::Esc
#^::Capslock
