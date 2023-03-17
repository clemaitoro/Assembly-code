.device atmega328p ; what type of processor do I use?

.equ DDRB = 4 ; address of data direction register; don’t change!

.equ PORTB = 5 ; address of output port register; don’t change!

; This are the output registers.
ldi r16,$10 ; register 16 now contains 0001 0000 (Which output to use.)
ldi r17,$00 ; register 17 now contains 0000 0000 (To put something off)
out DDRB,r16 ; write this to the data direction register to make
; the pin with the LED act as output

; This are the counter regsiters.
ldi r18,$00 ; register 18 now contains 0000 0000 (playSound loop)
ldi r19,$00 ; register 19 now contains 0000 0000 (playSound counter)

; This are the special registers.
ldi r27,04 ; How long to play a tone
ldi r28,20 ; Which tone to play
ldi r29,00 ; Counter for playSound (how much times played, automatically changed)
ldi r30,00 ; Counter for playSound (frequency, automatically changed)
ldi r31,$01 ; register 31 contains 0000 0001

; ----------------------------------------------------------------------------------------------------
; This is the main program.



ldi r27,04 ; How long to play a tone
ldi r28,40
call playSound ; This calls the function to play sound.
call delay ; Delay to hear the different tones.
call playSound ; This calls the function to play sound.

ldi r27,6 ; How long to play a tone
ldi r28,27;
call playsound ; This calls the function to play sound
call delay ; Delay to hear the different tones.
call playSound ; This calls the function to play sound.
ldi r27,7 ; How long to play a tone
ldi r28,24
call playSound ; This calls the function to play sound.
call delay ; Delay to hear the different tones.
call playSound ; This calls the function to play sound.
ldi r27,7 ; How long to play a tone
ldi r28,27;
call playsound ; This calls the function to play sound
call playSound ; This calls the function to play sound.


ldi r27,05 ; How long to play a tone
ldi r28,30
call playSound ; This calls the function to play sound.
call delay ; Delay to hear the different tones.
call playSound ; This calls the function to play sound.
ldi r28,32;
call playsound ; This calls the function to play sound
call delay ; Delay to hear the different tones.
call playSound ; This calls the function to play sound.
ldi r27,04 ; How long to play a tone
ldi r28,36
call playSound ; This calls the function to play sound.
call delay ; Delay to hear the different tones.
call playSound ; This calls the function to play sound.
ldi r28,40;
call playsound ; This calls the function to play sound
call playSound ; This calls the function to play sound.


ldi r27,06 ; How long to play a tone
ldi r28,27
call playSound ; This calls the function to play sound.
call delay ; Delay to hear the different tones.
call playSound ; This calls the function to play sound.
ldi r27,06 ; How long to play a tone
ldi r28,30;
call playsound ; This calls the function to play sound
call delay ; Delay to hear the different tones.
call playSound ; This calls the function to play sound.
ldi r28,32
call playSound ; This calls the function to play sound.
call delay ; Delay to hear the different tones.
call playSound ; This calls the function to play sound.
ldi r27,04 ; How long to play a tone
ldi r28,36;
call playsound ; This calls the function to play sound
call playSound ; This calls the function to play sound.


ldi r27,06 ; How long to play a tone
ldi r28,27
call playSound ; This calls the function to play sound.
call delay ; Delay to hear the different tones.
call playSound ; This calls the function to play sound.
ldi r27,05 ; How long to play a tone
ldi r28,30;
call playsound ; This calls the function to play sound
call delay ; Delay to hear the different tones.
call playSound ; This calls the function to play sound.
ldi r28,32
call playSound ; This calls the function to play sound.
call delay ; Delay to hear the different tones.
call playSound ; This calls the function to play sound.
ldi r27,04 ; How long to play a tone
ldi r28,36;
call playsound ; This calls the function to play sound
call playSound ; This calls the function to play sound.


ldi r28,40
call playSound ; This calls the function to play sound.
call delay ; Delay to hear the different tones.
call playSound ; This calls the function to play sound.
ldi r27,06 ; How long to play a tone
ldi r28,27;
call playsound ; This calls the function to play sound
call delay ; Delay to hear the different tones.
call playSound ; This calls the function to play sound.
ldi r27,07 ; How long to play a tone
ldi r28,24
call playSound ; This calls the function to play sound.
call delay ; Delay to hear the different tones.
call playSound ; This calls the function to play sound.
ldi r27,06 ; How long to play a tone
ldi r28,27;
call playsound ; This calls the function to play sound
call playSound ; This calls the function to play sound.

ldi r27,05 ; How long to play a tone
ldi r28,30
call playSound ; This calls the function to play sound.
call delay ; Delay to hear the different tones.
call playSound ; This calls the function to play sound.
ldi r28,32;
call playsound ; This calls the function to play sound
call delay ; Delay to hear the different tones.
call playSound ; This calls the function to play sound.
ldi r27,04 ; How long to play a tone
ldi r28,36
call playSound ; This calls the function to play sound.
call delay ; Delay to hear the different tones.
call playSound ; This calls the function to play sound.
ldi r28,40;
call playsound ; This calls the function to play sound
call playSound ; This calls the function to play sound.

infiniteLoop:
rjmp infiniteLoop





playSound:
mov r29,r27

again:

ldi r18,$80 ; Increase 18 to make the tone higher

loop1:
sub r30,r31 ; decrease register 21 with one.
brne loop1 ; branch if the last operation did not make zero.
mov r30,r28 ; register 30 now contains r28
add r18,r31 ; Increment register 18 with one.
brcc loop1 ; Branch if carry is 0.

out PORTB,r16 ; write register 16 to the port itself, which switches
; the LED on




ldi r18,$80 ; Increase 18 to make the tone higher

loop2:
sub r30,r31 ; increment register 21 with one.
brne loop2 ; branch if the last operation did not make zero.
mov r30,r28 ; register 30 now contains r28
add r18,r31 ; Increment register 18 with one.
brcc loop2 ; Branch if carry is 0.

out PORTB,r17 ; write register 17 to the port itself, which switches
; the LED off




; This counts how many times to play this cycle
add r19,r31 ; increment register 18 with one.
brcc again

ldi r19,$C0 ; This make the tone go away faster.

sub r29,r31;
brne again
ret;

delay:
sub r30,r31 ; increment register 21 with one.
brne delay ; branch if the last operation did not make zero.
ret;
