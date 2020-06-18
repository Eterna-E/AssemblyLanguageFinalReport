LD      01
OR      40
ANI     00
OUT     40

LD      40
ANI     63
TIM     60
#       80

LD      60
TIM     61
#       20

LD      61
TIM     62
#       80

LD      62
TIM     63
#       20

LDI     60
AND     40
ANI     21
OUT     20

LD      61
ANI     62
ANI     20
OUT     21

END

