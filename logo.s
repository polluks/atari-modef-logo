VDLST   equ     $0200
SDLST   equ     $0230
COLPF1	equ	$D017
COLPF2  equ     $D018
WSYNC   equ     $D40A
VCOUNT  equ     $D40B
NMIEN   equ     $D40E

        org $8150
        ins "output.raw"
        
	org $4000
start:  lda #<dl
        sta SDLST
        lda #>DL
        sta SDLST+1
        lda #<dli
        sta VDLST
        lda #>dli
        sta VDLST+1
        lda #$C0
        sta NMIEN

loop:   jmp loop

dli:    PHA
        LDA VCOUNT 
        STA WSYNC
        STA COLPF2
	EOR #$FF
	STA COLPF1
        PLA
        RTI
        
dl:     dta $70, $70, $70
        dta $CF, $50, $81
        dta $8F, $8F, $8F, $8f, $8f, $8f, $8f, $8f, $8f
        dta $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f
        dta $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f
        dta $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f
        dta $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f
        dta $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f
        dta $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f
        dta $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f
        dta $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f
        dta $8f, $8f, $8f
        dta $CF, $00, $90
        dta $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f
        dta $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f
        dta $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f
        dta $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f
        dta $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f
        dta $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f
        dta $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f
        dta $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f
        dta $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f
        dta $8f, $8f, $8f, $8f, $8f, $8f, $8f
        dta $41, .lo(dl), .hi(dl)

        org $02E0
        .word start
