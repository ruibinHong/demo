;--------------------------------------------------------------------------
#include		NY8A054E.H						; The Header File for NY8A054E
;--------------------------------------------------------------------------
;              -----|_|-----
;           --|1 ANT     	XC2 16|--
;           --|2 GND   		XC1 15|--
;           --|3 VCC	 	VCC 14|--
;           --|4 PA7	    PB2 13|--
;           --|5 PA6     	PB3 12|-- 
;           --|6 PA5		PB1 11|-- 
;        LED--|7 PA4		PB0 10|--MUSIC_TX
;          T--|8 PA3		PA2  9|--MOTOR_TX
;              -------------	
#define		IO_RF_MISO			PORTB,4
#define		IO_RF_MOSI			PORTB,5
#define		IO_RF_SCK			PORTA,0
#define		IO_RF_CSN			PORTA,1

#define		LED_PIN				PORTA,4
#define		T_PIN				PORTA,3
#define		MOTOR_TX_PIN		PORTA,2

#define		MUSIC_TX_PIN		PORTB,0
;;------------------------------------------------
#define	TEST_RF_MISO			PORTB, 0	
#define	TEST_RF_MOSI			PORTA, 2
#define	TEST_RF_SCK				PORTA, 3
#define	TEST_RF_CSN				PORTA, 4
;;------------------------------------------------
;--------------- Variable Definition --------------------------------------
;--------------------------------------------------------------------------
R_RF_DAT_BUF			EQU		0X20
R_RF_SEND_0				EQU		0X20
R_RF_REC_0				EQU		0X20
R_RF_SEND_1				EQU		0X21
R_RF_REC_1				EQU		0X21
R_RF_SEND_2				EQU		0X22
R_RF_REC_2				EQU		0X22
R_RF_SEND_3				EQU		0X23
R_RF_REC_3				EQU		0X23
R_RF_SEND_4				EQU		0X24
R_RF_REC_4				EQU		0X24
R_RF_SEND_5				EQU		0X25
R_RF_REC_5				EQU		0X25
R_RF_SEND_6				EQU		0X26
R_RF_REC_6				EQU		0X26
R_RF_SEND_7				EQU		0X27
R_RF_REC_7				EQU		0X27
R_RF_SEND_8				EQU		0X28
R_RF_REC_8				EQU		0X28
R_RF_SEND_9				EQU		0X29
R_RF_REC_9				EQU		0X29
R_RF_SEND_10			EQU		0X2A
R_RF_REC_10				EQU		0X2A
R_RF_SEND_11			EQU		0X2B
R_RF_REC_11				EQU		0X2B
R_RF_SEND_12			EQU		0X2C
R_RF_REC_12				EQU		0X2C
R_RF_SEND_13			EQU		0X2D
R_RF_REC_13				EQU		0X2D
R_RF_SEND_14			EQU		0X2E
R_RF_REC_14				EQU		0X2E
R_RF_SEND_15			EQU		0X2F
R_RF_REC_15				EQU		0X2F

R_SPI_TEMP0				EQU		0X2D
R_SPI_TEMP1				EQU		0X2E
R_SPI_TEMP2				EQU		0X2F

R_SPI_ADR				EQU		0X30
R_RF_DATA_LEN			EQU		0X31
R_RF_RX_RESULT			EQU		0X32
R_RF_TX_RESULT			EQU		0X32
R_CHN_INDEX				EQU		0X33
R_RF_ADDR0				EQU		0X34
R_RF_ADDR1				EQU		0X35
R_RF_ADDR2				EQU		0X36
R_SPI_DATA				EQU		0X37
R_TEMP00				EQU		0X38
R_TEMP01				EQU		0X39
R_TEMP02				EQU		0X3A
R_DDL0					EQU		0X3B
R_DDL1					EQU		0X3C
R_TR_START				EQU		0X3D

R_RX_ADDR0				EQU		0X40
R_RX_ADDR1				EQU		0X41
R_RX_ADDR2				EQU		0X42
R_TX_ADDR0				EQU		0X43
R_TX_ADDR1				EQU		0X44
R_TX_ADDR2				EQU		0X45
;--------------------------------------------------------------------------
FLAG_1					EQU		0X46
FLAG_2					EQU		0X47
;FLAG_3					EQU		0X48
rollingcode_0			EQU		0X49
rollingcode_1			EQU		0X4A
rollingcode_2			EQU		0X4B
rollingcode_3			EQU		0X4C
RXcode_0				EQU		0X4D
RXcode_1				EQU		0X4E
RXcode_2				EQU		0X4F
channel_table_offest	EQU		0X50
rf_channel				EQU		0X51
temp_x					EQU		0X52
DELAY_500US_CNT				EQU		0X53
TX_CNT1					EQU		0X54
key_cmd1				EQU		0X55
key_cmd2				EQU		0X56
led_cnt					EQU		0X57
DATA_1				EQU		0X58
TX_DATA_1				EQU		0X59
rx_outtimes				EQU		0X5A
DEMO_MUSIC_DATA				EQU		0X5B
rx_reset				EQU		0X5C
moto_outtimes			EQU		0X5D
MOTOR_DATA				EQU		0X5E
DELAY_100US_CNT			EQU		0X5F
data_cnt					EQU		0X60
TIME_CNT				EQU		0X61
TIME_CNT1					EQU		0X62
demo_cnt				EQU		0X63
demo_delay				EQU		0X64
demo_delay1				EQU		0X65
demo_delay2				EQU		0X66
tx_data_0				EQU		0X67
tx_cnt					EQU		0X68
MUSIC_ON_OFF_TIME_CNT		EQU		0X69
TX_DATA_2			EQU		0X6A
HEAD_CNT1			EQU		0X6B



;R_USER_FLAG			EQU		0X7D
R_S_TMP					EQU		0X7E
R_W_TMP					EQU		0X7F

;--------------------------------------------------------------------------
;              -----|_|-----
;           --|1 ANT     	XC2 16|--
;           --|2 GND   		XC1 15|--
;           --|3 VCC	 	VCC 14|--
;           --|4 PA7	    PB2 13|--
;           --|5 PA6     	PB3 12|-- 
;           --|6 PA5		PB1 11|-- 
;        LED--|7 PA4		PB0 10|--MUSIC_TX
;          T--|8 PA3		PA2  9|--MOTOR_TX
;              -------------	
;CS连PA1，CLK连PA0，MOSI连PB5，MISO连PB4
D_Iosta		EQU    	00000000B ;1,input,;0,output
D_PORTA		EQU    	00000000B

D_Iostb				EQU    	00010000B ;1,input,;0,output
D_PORTB				EQU    	00000000B

D_PHA  	    equ    11111111B ;1,disable;0,enable	PA上拉
D_PHB  	    equ    11101111B ;1,disable;0,enable	PB上拉

D_PDCon     equ    11111111B ;1,disable;0,enable	下拉 用于PA与PB

D_WakeUp_A	  equ    00000000B ;1,enable ;0,disable	PA唤醒
D_WakeUp_B    equ    00000000B ;1,enable ;0,disable	PB唤醒

D_BODCON	equ    00000000B ;1,enable ;0,disable	PB开漏
D_POWER		equ    11111000B 	

;--------------- Constant Definition --------------------------------------
;--------------------------------------------------------------------------
;flag_1
	#define		DELAY_4MS_FLAG			flag_1,0
	#define		LED_FLAG		flag_1,1
	#define		DEMO_FLAG			flag_1,2
	#define		LAST_SHOW_FLAG		flag_1,3
	#define		SILENCE_FLAG		flag_1,4
	#define		LAST_SILENCE_FLAG		flag_1,5
	#define		TIME_FLAG		flag_1,6
	#define		tx_flag		flag_1,7
;flag_2
	#define		pair_flag			flag_2,0
	#define		LAST_LED_FLAG		flag_2,1
	#define		tx_head_flag	flag_2,2
	#define		LAST_SYS_ON_MUSIC_FLAG		flag_2,3
	#define		B_4MsFlag			flag_2,4
	#define		DI_FLAG			flag_2,5
	#define		TX_HEAD_FLAG_1			flag_2,6
	#define		ON_OFF_MUSIC_FLAG			flag_2,7

;--------------------------------------------------------------------------
;--------------------------------------------------------------------------
#define		PAIR_CHANNLE		65
#define		PAIR_CHANNLE_RX		64
A				EQU		0x0
R				EQU		0x1
#define			ZF			STATUS,2
#define			CF			STATUS,0
;-------------------------------------------------
;-------------------------------------------------

#define		F_RF_TX_OK			R_RF_TX_RESULT, 5
#define		F_RF_RX_OK			R_RF_RX_RESULT, 6


;--------------- Vector Definition ----------------------------------------
;--------------------------------------------------------------------------
		ORG		0x000		
		lgoto	V_Main                
		
		ORG		0x008
		lgoto	V_INT
		
;--------------- Code Start -----------------------------------------------
;--------------------------------------------------------------------------
        ORG		0x010
GET_channel:	
	INCR	channel_table_offest,1
	MOVR	channel_table_offest,0
	SUBIA	2
	BTRSS	CF
	CLRR	channel_table_offest
	
	MOVR	channel_table_offest,0
	LCALL	Data_Channel_Table
	MOVAR	rf_channel
	RET	
	
Data_Channel_Table:        
        addar                PCL,R
        GOTO                L_Channel0
        GOTO                L_Channel1
        retia                PAIR_CHANNLE
L_Channel1:
        MOVR                rollingcode_0,0
        andia                00001111B
        addar                PCL,R
        retia                13
        retia                17
        retia                21
        retia                25
        retia                29
        retia                33
        retia                37
        retia                41
        retia                45
        retia                49
        retia                53
        retia                57
        retia                61
        retia                65
        retia                69
        retia                73
        
L_Channel0:        
        MOVR                RXcode_0,0
        andia              00001111B
        addar              PCL,R
        retia                10;0
        retia                14;1
        retia                18;2
        retia                22;3
        retia                26;4
        retia                30;5
        retia                34;6
        retia                38;7
        retia                42;8
        retia                46;9
        retia                50;10 
        retia                54;11
        retia                58;12
        retia                62;13
        retia                66;14
        retia                70;15
	
;======================================================================
;======================================================================		
V_Main:
		; Power ON initial - User program area 
		LCALL		FT_TEST			
		LCALL		RAM_INIT
		LCALL		GPIO_FUNC
		LCALL		TIME_INIT
		
		MOVIA		4
		MOVAR		HEAD_CNT1
		MOVAR		TX_DATA_1
		ENI			;开中断
	
		
		
		LCALL		Get_rolling_code	
		LCALL		INIT_RF
		MOVIA		PAIR_CHANNLE_RX		  ;; 接收频点比发射频点小1MHz
		LCALL		RF_SET_CHANNEL
		LCALL		RF_SET_RX_MODE
		
;======================================================================
;======================================================================
MAIN:  	
		clrwdt
		BTRSS		DELAY_4MS_FLAG
		LGOTO		MAIN
		BCR			DELAY_4MS_FLAG	
			
		LCALL		TXRX_FUNC
		LCALL		MOTO_FUNC
		
	
		LGOTO		MAIN	
;-------------------------------------------------------------------------------
;-------------------------------------------------------------------------------
TXRX_FUNC:    
		LCALL		REC_RF_DATA
    
		BTRSS		F_RF_RX_OK
		LGOTO		NO_RF_RX
        
        MOVR        R_RF_SEND_6,0
        XORIA       0X5A
        BTRSS       ZF
        LGOTO       RF_RX_MORMAL

        MOVR        R_RF_SEND_0,0
        MOVAR        RXcode_0
        MOVR        R_RF_SEND_1,0
        MOVAR        RXcode_1
        MOVR        R_RF_SEND_2,0
        MOVAR        RXcode_2
        BSR			pair_flag   
		
        LGOTO        SEND_PACKET
;-------------------------------------------------------------------------------
RF_RX_MORMAL:
		MOVR        R_RF_SEND_0,0
        MOVAR        RXcode_0
        MOVR        R_RF_SEND_1,0
        MOVAR        RXcode_1
        MOVR        R_RF_SEND_2,0
        MOVAR        RXcode_2
        
        MOVR        R_RF_SEND_7,0
        MOVAR        key_cmd1
        MOVR        R_RF_SEND_8,0
        MOVAR        key_cmd2
        
        BSR         pair_flag
		
        CLRR        rx_outtimes
        CLRR        moto_outtimes
        CLRR        rx_reset
        LGOTO        TXRX_FUNC_EXIT
        
;-------------------------------------------------------------------------------
NO_RF_RX:
        INCR        moto_outtimes,1
        MOVR        moto_outtimes,0                ;信号超时，停止操作
        SUBIA        200                                ;200-moto_outtimes
        BTRSC        CF
        LGOTO        NO_RF_RX_1
        CLRR        moto_outtimes
        CLRR        key_cmd1
        CLRR        key_cmd2

NO_RF_RX_1:
        INCR        rx_outtimes,1
        MOVR        rx_outtimes,0
        SUBIA       9                ;4MS*10=40MS
        BTRSC       CF
        LGOTO       TXRX_FUNC_EXIT     ;没配对上，每隔40ms，转换接收地址
        CLRR        rx_outtimes
        LGOTO       RESET_RF
;-------------------------------------------------------------------------------
SEND_PACKET:   
	MOVIA		PAIR_CHANNLE
	LCALL		RF_SET_CHANNEL
	LCALL		RF_SET_TX_MODE	
	
	MOVR		RXcode_0,0
	MOVAR		R_RF_SEND_0
	MOVR		RXcode_1,0
	MOVAR		R_RF_SEND_1
	MOVR		RXcode_2,0
	MOVAR		R_RF_SEND_2
	MOVR		rollingcode_0,0
	MOVAR		R_RF_SEND_3
	MOVR		rollingcode_1,0
	MOVAR		R_RF_SEND_4
	MOVR		rollingcode_2,0
	MOVAR		R_RF_SEND_5
	MOVIA		0XAA
	MOVAR		R_RF_SEND_6
	CLRR		R_RF_SEND_7
	CLRR		R_RF_SEND_8
	
	LCALL		SEND_RF_DATA
	LCALL		DELAY_2MS
	LCALL		DELAY_2MS
		
RESET_RF:
        INCR		rx_reset,1
        MOVR		rx_reset,0
        SUBIA		50                                ;40ms*50=2S
        BTRSC		CF
        LGOTO		RESET_RX                ;没配对上，每隔2S，重新初始化2.4G
        CLRR		rx_reset

       ; LCALL		INIT_RF
        
RESET_RX:
		LCALL		INIT_RF
		LCALL       GET_channel
		DECR		rf_channel,1		  ;; 接收频点比发射频点小1MHz
		
		MOVIA		PAIR_CHANNLE_RX
        BTRSS		pair_flag
        MOVAR		rf_channel
		
		MOVR		rf_channel,0
		LCALL		RF_SET_CHANNEL
		LCALL		RF_SET_RX_MODE
		
		LGOTO		TXRX_FUNC_EXIT
        
TXRX_FUNC_EXIT:
        RET  		
;-------------------------------------------------------------------------------
;0   1   2   3    4    5      6      7     0       1    2  
;F   B   L   R   UP   DOWN   ZL     ZR    MUSIC    L    S
;-------------------------------------------------------------------------------
MOTO_FUNC:
;              -----|_|-----
;           --|1 ANT     	XC2 16|--
;           --|2 GND   		XC1 15|--
;           --|3 VCC	 	VCC 14|--
;           --|4 PA7	    PB2 13|--
;           --|5 PA6     	PB3 12|-- 
;           --|6 PA5		PB1 11|-- 
;        LED--|7 PA4		PB0 10|--MUSIC_TX
;          T--|8 PA3		PA2  9|--MOTOR_TX
;              -------------	

	BTRSC	key_cmd1,0
	BSR		PORTA,7
	BTRSS	key_cmd1,0
	BCR		PORTA,7
	
	BTRSC	key_cmd1,1
	BSR		PORTA,6
	BTRSS	key_cmd1,1
	BCR		PORTA,6
	
	BTRSC	key_cmd1,2
	BSR		PORTA,5
	BTRSS	key_cmd1,2
	BCR		PORTA,5
	
	BTRSC	key_cmd1,3
	BSR		PORTA,4
	BTRSS	key_cmd1,3
	BCR		PORTA,4
	
	BTRSC	key_cmd1,4
	BSR		PORTA,3
	BTRSS	key_cmd1,4
	BCR		PORTA,3
	
	BTRSC	key_cmd1,5
	BSR		PORTA,2
	BTRSS	key_cmd1,5
	BCR		PORTA,2
	
	BTRSC	key_cmd1,6
	BSR		PORTB,0
	BTRSS	key_cmd1,6
	BCR		PORTB,0
	
	BTRSC	key_cmd1,7
	BSR		PORTB,1
	BTRSS	key_cmd1,7
	BCR		PORTB,1
	
	BTRSC	key_cmd2,0
	BSR		PORTB,3
	BTRSS	key_cmd2,0
	BCR		PORTB,3
	
	BTRSC	key_cmd2,1
	BSR		PORTB,2
	BTRSS	key_cmd2,1
	BCR		PORTB,2
	
MOTO_FUNC_EXIT:
	RET		
	
;--------------- Interrupt Service Routine --------------------------------
;--------------------------------------------------------------------------
V_INT:
		; Interrupt Service - User program area
		; ...
		; ...
		MOVAR  			R_W_TMP
		SWAPR			STATUS, TO_A
		MOVAR  			R_S_TMP
		
		MOVIA			0
		MOVAR			INTF
		
		MOVIA			244
		MOVAR			TMR0		;12*8US=96US

		; MOVIA		0X10
		; XORAR		PORTA,1	;LED_PIN	PORTA,4
		
		INCR		DELAY_100US_CNT,1
		MOVR		DELAY_100US_CNT,0
		SUBIA		39				;100US*40=4MS
		BTRSC		CF
		LGOTO		EXIT_INT
		CLRR		DELAY_100US_CNT
		BSR			DELAY_4MS_FLAG
		
EXIT_INT:
		SWAPR			R_S_TMP, TO_A
		MOVAR  			STATUS
		SWAPR			R_W_TMP, TO_R
		SWAPR			R_W_TMP, TO_A	
		; Clear Interrupt Flag
		retie								; Return from interrupt and enable interrupt globally

;--------------------------------------------------------------------------
;--------------------------------------------------------------------------
TIME_INIT:
	;0	  1	  2	  3	   4	  5	     6	   7
	;/2  /4  /8  /16   /32   /64   /128    /256
	movia		4		;8/32=0.25MHZ,4US,	4US*2T=8US
	T0MD					;TIME0的分频器	;10110101
	movia		0x01
	IOST		PCON1		;0000_0001	开启定时器TIME0,开启git
	MOVIA		244
	MOVAR		TMR0
	
	movia		0x01
	movar		INTE		;中断控制	0000_0000
	movia		0x00
	movar		INTF		;中断标志位
	clrr		INTF		;（ 中断标志寄存器 ）
	RET	

;--------------------------------------------------------------------------
;--------------------------------------------------------------------------
GPIO_FUNC:
	movia		D_Iosta		
	IOST		IOSTA		;输入输出 (1:Input/0:Output)
	movia		D_PORTA		
	movar		PORTA		
	
	movia		D_Iostb			
	IOST		IOSTB		;输入输出 (1:Input/0:Output)
	movia		D_PORTB		
	movar		PORTB		
	
	movia		D_PHA		
	IOST		APHCON		;PA上拉 
	movia		D_PHB		
	movar		BPHCON		;PB上拉 
	
	movia		D_PDCon
	movar		ABPLCON		;下拉
	
	movia		D_WakeUp_A
	movar		AWUCON		;PA唤醒	
	movia		D_WakeUp_B
	movar		BWUCON		;PB唤醒	
	movia		D_BODCON
	IOST		BODCON		;开漏
	
	
	;LVR(低电复位)		LVD(11阶低电压检测电路)
	movia		D_POWER		;0x88		;10001000
	movar		PCON		;WDTEN,EIS,LVD,LVR,
	ret	
;=================================================================
RAM_INIT:
		MOVIA		0X20
		MOVAR		FSR
RAM_CLR_LOOP:
		CLRR		INDF
		MOVIA		0X7F
		XORAR		FSR,TO_A
		BTRSC		STATUS,Z_B
		LGOTO		RAM_CLR_LOOP_EXIT
		INCR		FSR,TO_R
		LGOTO		RAM_CLR_LOOP
RAM_CLR_LOOP_EXIT:	
		RET
; ================================================================
IO_CONFIG:
		MOVIA		B'00000000'
		IOST		BODCON
		;MOVIA		B'11111111'
		;MOVAR		ABPLCON	
		MOVIA		B'01111111'
		IOST		APHCON
		;BCR			PCON, C_PA5_PHB_Bit
		;MOVIA		B'11111111'
		;MOVAR		BPHCON		
		MOVIA		B'00000000'
		IOST		IOSTA
		MOVIA		B'00010000'
		IOST		IOSTB
		MOVIA		B'00000000'
		MOVAR		PORTA
		MOVIA		B'00010000'
		MOVAR		PORTB		
		;MOVIA		B'00000000'
		;MOVAR		AWUCON
		;MOVIA		B'00000000'
		;MOVAR		BWUCON
		RET
;;#################################################################
;;DELAY MS
;;#################################################################
DELAY_200MS:
		MOVIA 		200
		LGOTO		DELAY_MS_BASE
DELAY_100MS:
		MOVIA 		100
		LGOTO		DELAY_MS_BASE
DELAY_50MS:
		MOVIA 		50
		LGOTO		DELAY_MS_BASE
DELAY_20MS:
		MOVIA 		20
		LGOTO		DELAY_MS_BASE
DELAY_10MS:
		MOVIA 		10
		LGOTO		DELAY_MS_BASE
DELAY_2MS:
		MOVIA 		2
		LGOTO		DELAY_MS_BASE
DELAY_MS_BASE:
		MOVAR  		R_DDL1
DELAY_MS_LOOP:
		CLRWDT
		LCALL		DELAY_1MS
		DECRSZ		R_DDL1, TO_R
		LGOTO		DELAY_MS_LOOP
		RET
;;#################################################################
;;DELAY US
;;#################################################################
DELAY_1MS:
		MOVIA 		100
		LGOTO		DELAY_US_BASE
DELAY_750US:
		MOVIA 		75
		LGOTO		DELAY_US_BASE
DELAY_500US:
		MOVIA 		50
		LGOTO		DELAY_US_BASE
DELAY_250US:
		MOVIA 		25
		LGOTO		DELAY_US_BASE
DELAY_100US:
		MOVIA 		10
		LGOTO		DELAY_US_BASE
DELAY_50US:
		MOVIA 		5
		LGOTO		DELAY_US_BASE
DELAY_40US:
		MOVIA 		4
		LGOTO		DELAY_US_BASE
DELAY_10US:
		MOVIA 		1
		LGOTO		DELAY_US_BASE
DELAY_US_BASE:
		MOVAR  		R_DDL0
DELAY_XX_US_LOOP:			;40US
		CLRWDT
		LGOTO		$+1
		LGOTO		$+1
		LGOTO		$+1
		LGOTO		$+1
		LGOTO		$+1
		LGOTO		$+1
		LGOTO		$+1
		LGOTO		$+1
		
		LGOTO		$+1
		LGOTO		$+1
		LGOTO		$+1
		LGOTO		$+1
		LGOTO		$+1
		LGOTO		$+1
		LGOTO		$+1
		LGOTO		$+1
		LGOTO		$+1
		LGOTO		$+1
		DECRSZ		R_DDL0, TO_R
		LGOTO		DELAY_XX_US_LOOP
		RET	
;------------------------------------------------------------------------------
;获取滚动码
;------------------------------------------------------------------------------
Get_rolling_code: 
		MOVIA		0X00
		SFUN		TBHP
		MOVIA		0X0E
		TABLEA
		movar       rollingcode_0
		SFUNR		TBHD
		ANDIA		0X03
		MOVAR		rollingcode_3
		
		
		MOVIA		0X00
		SFUN		TBHP
		MOVIA		0X0F
		TABLEA
		movar      	rollingcode_1
		
		SFUNR		TBHD
		ANDIA		0X03
		movar       rollingcode_2
		
		
		BCR 	CF
		RLR 	rollingcode_2,1
		RLR 	rollingcode_2,1
		btrsc 	rollingcode_1,7
		bsr 	rollingcode_2,1
		btrsc 	rollingcode_1,6
		bsr 	rollingcode_2,0
		 
		BCR 	CF
		RLR 	rollingcode_1,1
		BCR 	CF
		RLR 	rollingcode_1,1
		btrsc 	rollingcode_3,1

		bsr 	rollingcode_1,1
		btrss 	rollingcode_3,1
		BCR 	rollingcode_1,1
		btrsc 	rollingcode_3,0
		bsr 	rollingcode_1,0
		btrss 	rollingcode_3,0
		BCR 	rollingcode_1,0
		
		RET		
		
;;******************************************************************
#INCLUDE		"WL2400.asm"
#INCLUDE		"FT_TEST.asm"
;;******************************************************************
;;******************************************************************
end											; End of Code
		