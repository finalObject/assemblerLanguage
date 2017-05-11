format
[标号:] 操作码／伪操作码 [操作数] [;注释]

;(10H+20H)-15
		ORG		0100H
START:	MOV		A,#10H
		ADD 	A,#20H
		SUBB	A,#15
		NOP	
		END

LJMP START ;跳转到START
END ;程序结束

DB(define byte);定义变量，前面加上ORG配合使用，确定变量位置
		ORG 1000H
DATA1:	DB 0,1,4,9,16
		ORG 1020H
DATA2:	DB	"An Apple!"
		END

DW(define word);和DB类似，感觉不常用

DS(define stotage);空出位置
		ORG 200H
		DS	08H
		DB  41H,42H;208H储存41H，209H储存42H

EQU(equate)赋值命令,相当于宏定义
	X EQU 20
	Y EQU 30
	Z EQU X+Y

DATA 和EQU类似，区别可以先使用后定义？What？
BIT 用来定义位地址
		A1	BIT 40H;


		MOV A,#30H; 吧30H这个数字放入A
		MOV A,30H; 吧内部RAM中30H位置的数字放入A
		MOV A,@R0 ;A<-((R0))
		MOVC A,@A+DPTR;A<-((A)+(DPTR))

JC 相当于C中的goto
		JC LOOP

		ORG     0000H
START:	MOV     DPTR,#1000H;(DPTR)<-1000H
		MOV     A,#0
		MOVX	@DPTR,A;((DPTR))<-(A)
		END

		ORG     0000H
START:	MOV     DPTR,#TABLE
		MOV     A,#5
		MOVC	A,@A+DPTR;((#TABLE)+5)->A
		NOP
TABLE	DB      0,1,4,9,16,25,36,49,64,81
		END



