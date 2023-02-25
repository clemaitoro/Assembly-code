

.device atmega328p
ldi r16,$0 ; This is to make r16 empty.
ldi r17,$4 ; one multiplicand, try other values!
ldi r18,$6 ; the other multiplicand, try other values!

;-------------------------------------------------------------
ldi r19,$03
loop:
sbrc r17,0 ; If the last bit from r17 is not 1, we do not need to add something.
add r16,r18 ; If the last bit from r17 is 1, we need to add r18 to the total sum.
lsr r17 ; Then we need to look at the next bit of r17, we do that by shifting all bits to the right.
lsl r18 ; Because we are now looking to a bit with a higher significance in r17, we need to multiply r18 with 2, so it is more significant.
subi r19,$01 ; Now we subtract one from r19 to count down.
brne loop ; If we are not at zero yet, we need to calculate for other bits.


;-----------------------------------------------------------

call sendr16tolaptop ; send calculation result to laptop
again:
rjmp again ; finished, go into infinite loop
.include "rs232link.inc"