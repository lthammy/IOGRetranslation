?INCLUDE 'sFA_diary_menu'
?INCLUDE 'chunk_03BAE1'

!APUIO0                         2140

---------------------------------------------

name_dictionary_en [
    &name_will_en  ;00
    &name_kara_en  ;01
    &name_lily_en  ;02
    &name_erik_en  ;03
    &name_lance_en ;04
    &name_seth_en  ;05
    &name_lola_en  ;06
    &name_hamlet_en ;07
]

name_will_en `Will`
name_kara_en `Kara`
name_lily_en `Lilly`
name_erik_en `Erik`
name_lance_en `Lance`
name_seth_en `Seth`
name_lola_en `Lola`
name_hamlet_en `Hamlet`


---------------------------------------------

name_dictionary_jp [
    &name_will_jp  ;00
    &name_kara_jp  ;01
    &name_lily_jp  ;02
    &name_erik_jp  ;03
    &name_lance_jp ;04
    &name_seth_jp  ;05
    &name_lola_jp  ;06
    &name_hamlet_jp ;07
]

name_will_jp `Tim`
name_kara_jp `Karen`
name_lily_jp `Lillie`
name_erik_jp `Eric`
name_lance_jp `Rob`
name_seth_jp `Morris`
name_lola_jp `Laura`
name_hamlet_jp `Peggy`



---------------------------------------------

name_dictionary_command {
    PHP 
    PHB 
    PHY 
    LDA $0000, Y
    AND #$00FF
    ASL 
    TAY 

    LDA $0B24
    BNE do_en_name

  do_jp_name:
    SEP #$20
    LDA #$^name_dictionary_jp
    PHA 
    PLB 
    REP #$20
    LDA $&name_dictionary_jp, Y
    BRA do_name_end

  do_en_name:
    SEP #$20
    LDA #$^name_dictionary_en
    PHA 
    PLB 
    REP #$20
    LDA $&name_dictionary_en, Y

  do_name_end:
    TAY 
    STX $0998
    JSL $@sub_03E255
    LDX $0998
    PLY 
    INY 
    PLB 
    PLP 
    RTL
}

---------------------------------------------

widestring_0BF538 `[DLG:6,8][SIZ:A,8][SKP:2][LU1:B]Snd/Buttons[N]End Changes[N]Names[N][LU2:2]Type[N][SKP:5]   :Attack/Talk[N][SKP:5]   :Item/Cancel[N][SKP:5]   :Item Menu[N][SKP:5]   :Sprint`

widestring_0BF5AD `[DLG:6,8][SIZ:A,8]Arrangement  OK?[N]Start Journey[N]Names[N][LU2:2]Type[N][SKP:5]   :Attack/Talk[N][SKP:5]   :Item/Cancel[N][SKP:5]   :Item Menu[N][SKP:5]   :Sprint`

widestring_0BF625 `[DLG:D,C][SFX:0][ADR:&table_0BF667,D90]`

widestring_0BF66B `Japanese`

widestring_0BF672 `Original`


---------------------------------------------
;Always use stereo sound, frees up the flag for dictionaries

sub_0BE673 {
    LDA #$0000
    STA $0B04
    STZ $00EE
    ;LDA $0B24
    ;BNE code_0BE68C
    SEP #$20
    LDA #$91
    STA $APUIO0
    REP #$20
    BRA code_0BE695
}
