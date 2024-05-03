;--------------------------------------------------------------------------
#include		NY8A054E.H						; The Header File for NY8A054E
;--------------------------------------------------------------------------
;              -----|_|-----
;           --|1 ANT     	XC2 10|--
;           --|2 GND   		XC1  9|--
;           --|3 VCC	 	PB2  8|--PEN
;           --|4 PA5		PA2  7|--FB
;         LR--|5 PA4		PA3  6|--COM
;              -------------	
;CS连PA1，CLK连PA0，MOSI连PB5，MISO连PB4
#define		IO_RF_MISO			PORTB, 4
#define		IO_RF_MOSI			PORTB, 5
#define		IO_RF_SCK			PORTA, 0
#define		IO_RF_CSN			PORTA, 1

#define		LR_PIN				PORTA,4
#define		COM_PIN				PORTA,3
#define		FB_PIN				PORTA,2
#define		PEN_PIN				PORTB,2
;;------------------------------------------------
#define	TEST_RF_MISO			PORTA, 2	
#define	TEST_RF_MOSI			PORTA, 3
#define	TEST_RF_SCK				PORTA, 4
#define	TEST_RF_CSN				PORTA, 5
;;------------------------------------------------
; #define	C_CMD1_CHN				79
; #define	C_CMD2_CHN				80
; #define	C_CMD4_CHN				79
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
FLAG_3					EQU		0X48
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
LAST_TEMP_X				EQU		0X53
KEY_CNT					EQU		0X54
key_cmd1				EQU		0X55
key_cmd2				EQU		0X56
led_cnt					EQU		0X57
SLEEP_CNT1				EQU		0X58
SLEEP_CNT2				EQU		0X59
rx_outtimes				EQU		0X5A
SLEEP_CNT				EQU		0X5B


LAST_KEY_CHECK			EQU		0X74
CHECK_MODE				EQU		0X75
CHANNEL_MODE			EQU		0X76
CHANNEL_DATA			EQU		0X77
CHANNEL_CNT				EQU		0X78

;R_USER_FLAG			EQU		0X7D
R_S_TMP					EQU		0X7E
R_W_TMP					EQU		0X7F

;--------------------------------------------------------------------------
;              -----|_|-----
;           --|1 ANT     	XC2 10|--
;           --|2 GND   		XC1  9|--
;           --|3 VCC	 	PB2  8|--PEN
;           --|4 PA5		PA2  7|--FB
;         LR--|5 PA4		PA3  6|--COM
;              -------------	
;CS连PA1，CLK连PA0，MOSI连PB5，MISO连PB4
D_Iosta		EQU    	00010100B ;1,input,;0,output
D_PORTA		EQU    	00000000B

D_Iostb		EQU    	00010100B ;1,input,;0,output
D_PORTB		EQU    	00000000B

D_PHA  	    equ     11101011B ;1,disable;0,enable	PA上拉
D_PHB  	    equ     11101011B ;1,disable;0,enable	PB上拉

D_PDCon     equ    11111111B ;1,disable;0,enable	下拉 用于PA与PB

D_WakeUp_A	  equ    11111111B ;1,enable ;0,disable	PA唤醒
D_WakeUp_B    equ    11111111B ;1,enable ;0,disable	PB唤醒

D_BODCON	equ    00000000B ;1,enable ;0,disable	PB开漏
D_POWER		equ    11101000B 	

;--------------- Constant Definition --------------------------------------
;--------------------------------------------------------------------------
;flag_1
	#define		DELAY_8MS_FLAG			flag_1,0
;	#define		led_on_off_flag		flag_1,1
;	#define		txrx_flag			flag_1,2
;	#define		have_rx_flag		flag_1,3
;	#define		led_start_flag		flag_1,4
;	#define		last_rx_flag		flag_1,5
	#define		LAST_MODE_ZAIBO_FLAG		flag_1,6
	#define		LAST_CHANNEL_FLAG		flag_1,7
;flag_2
	#define		pair_flag			flag_2,0
	#define		txrx_flag			flag_2,1
	#define		rx_successful_flag	flag_2,2
	#define		have_high_flag		flag_2,3
	#define		B_4MsFlag			flag_2,4
	#define		START_FLAG			flag_2,5
	#define		lvd_flag			flag_2,6
	#define		SLEEP_FLAG			flag_2,7

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
	addar		PCL,R
	LGOTO		L_Channel0
	LGOTO		L_Channel1
	retia		PAIR_CHANNLE
L_Channel1:
	MOVR		RXcode_0,0
	andia		00001111B
	addar		PCL,R
	retia		13
	retia		17
	retia		21
	retia		25
	retia		29
	retia		33
	retia		37
	retia		41
	retia		45
	retia		49
	retia		53
	retia		57
	retia		61
	retia		65
	retia		69
	retia		73
	
L_Channel0:	
	MOVR		rollingcode_0,0
	andia  	    00001111B
	addar  	    PCL,R
	retia		10;0
	retia		14;1
	retia		18;2
	retia		22;3
	retia		26;4
	retia		30;5
	retia		34;6
	retia		38;7
	retia		42;8
	retia		46;9
	retia		50;10 
	retia		54;11
	retia		58;12
	retia		62;13
	retia		66;14
	retia		70;15

;======================================================================
;======================================================================		
V_Main:
		; Power ON initial - User program area 
		NOP
		NOP
		
		LCALL		FT_TEST
		LCALL		RAM_INIT
		LCALL		GPIO_FUNC
		LCALL		TIME_INIT
		ENI			;开中断

		BSR			COM_PIN
		LCALL		DELAY_5US
		BTRSC		FB_PIN
		LGOTO		MAIN_1
		
		LCALL		DELAY_10MS
		BTRSC		FB_PIN
		LGOTO		MAIN_1
		
		MOVIA		0X02
		MOVAR		CHECK_MODE
		MOVIA		0X01
		MOVAR		CHANNEL_MODE
;======================================================================		
CHECK_MAIN:  	
		clrwdt
		BTRSS		DELAY_8MS_FLAG
		LGOTO		CHECK_MAIN
		BCR			DELAY_8MS_FLAG		
		
		LCALL		KEY_FUNC
		LCALL		MODE_FUNC
		;LCALL		LED_CHECK_FUNC	
		LCALL		DATA_2G4_FUNC
	
		LGOTO		CHECK_MAIN	
;======================================================================
;
;======================================================================
MODE_FUNC:	
	MOVR	key_cmd1,0
	ANDIA	0X03			;0000 0011
	XORAR	LAST_KEY_CHECK,0
	BTRSC	ZF
	LGOTO	MODE_FUNC_EXIT
SAVE_CHECK:
	MOVR	key_cmd1,0
	ANDIA	0X03
	MOVAR	LAST_KEY_CHECK
	
	MOVR	LAST_KEY_CHECK,0
	BTRSC	ZF
	LGOTO	MODE_FUNC_EXIT

	BTRSS	key_cmd1,0
	LGOTO	CHANNEL_FUNC
	
	LCALL	INIT_RF			
	MOVIA	0X01
	MOVAR	CHANNEL_MODE
	BCR		STATUS,0
	RLR		CHECK_MODE,1		
	MOVIA	0X01
	BTRSC	CHECK_MODE,2
	MOVAR	CHECK_MODE
	CLRR	CHANNEL_CNT
	BSR		LAST_CHANNEL_FLAG
	
CHANNEL_FUNC:	
	BCR		LAST_MODE_ZAIBO_FLAG
	BCR		STATUS,0
	BTRSC	key_cmd1,1
	RLR		CHANNEL_MODE,1		;频点
	MOVIA	0X01
	BTRSC	CHANNEL_MODE,3
	MOVAR	CHANNEL_MODE
	LCALL	CHANNEL_MODE_FUNC		;查频点
	
	CLRR	CHANNEL_CNT
	BSR		LAST_CHANNEL_FLAG
	
	LGOTO	MODE_FUNC_EXIT	
	
MODE_FUNC_EXIT:
	RET	
	
;---------------------------------------------	
;---------------------------------------------
CHANNEL_MODE_FUNC:
	MOVIA	10
	BTRSC	CHANNEL_MODE,0
	MOVAR	CHANNEL_DATA
	
	MOVIA	42
	BTRSC	CHANNEL_MODE,1
	MOVAR	CHANNEL_DATA
	
	MOVIA	70
	BTRSC	CHANNEL_MODE,2
	MOVAR	CHANNEL_DATA
	
	RET		
;---------------------------------------------
;------------------------------------------------------------------------------
DATA_2G4_FUNC:
	BTRSC	CHECK_MODE,1
	LGOTO	MODE_ZAIBO_FUNC
	BTRSC	CHECK_MODE,0
	LGOTO	MODE_TIAOZHI_FUNC
	RET
MODE_ZAIBO_FUNC:
;载波
	BTRSC	LAST_MODE_ZAIBO_FLAG
	LGOTO	MODE_ZAIBO_FUNC_1
	BSR		LAST_MODE_ZAIBO_FLAG
	LCALL	RF_SET_TX_MODE
	
MODE_ZAIBO_FUNC_1:	
	BTRSC		LAST_CHANNEL_FLAG
	LGOTO		MODE_ZAIBO_FUNC_2
	INCR		CHANNEL_CNT,1
	MOVR		CHANNEL_CNT,0
	SUBIA		249				;8MS*250=2S
	BTRSC		STATUS,0
	LGOTO		MODE_ZAIBO_FUNC_3
	CLRR		CHANNEL_CNT
	BSR			LAST_CHANNEL_FLAG
	
MODE_ZAIBO_FUNC_2:
	BCR			LAST_CHANNEL_FLAG
	MOVR		CHANNEL_DATA,0
	LCALL		RF_SET_CHANNEL
MODE_ZAIBO_FUNC_3:	
	LCALL		SEND_RF_DATA
	RET	
;------------------------------------------------------------------------------	
	; BTRSC	LAST_MODE_ZAIBO_FLAG
	; RET
	; BSR		LAST_MODE_ZAIBO_FLAG
	
	; LCALL	RF_SET_TX_MODE
	; MOVR		CHANNEL_DATA,0
	; LCALL		RF_SET_CHANNEL
	; LCALL		SEND_RF_DATA
	; RET	
;------------------------------------------------------------------------------	
	
	
MODE_TIAOZHI_FUNC:	
;调制波
	BTRSC	LAST_MODE_ZAIBO_FLAG
	RET
	BSR		LAST_MODE_ZAIBO_FLAG
	
	LCALL	RF_CARRIER_SET
	MOVR	CHANNEL_DATA,0
	LCALL	RF_SET_CHANNEL
	RET	
		

	
;======================================================================		
; LED_CHECK_FUNC:
		; BTRSC		CHECK_MODE,0
		; LGOTO		LED_CHECK_MODE_ONE
		; BTRSC		CHECK_MODE,1
		; LGOTO		LED_CHECK_MODE_TWO
		; BTRSC		CHECK_MODE,2
		; LGOTO		LED_CHECK_MODE_THREE
		
; LED_OFF_1:
		; BSR			LED1_PIN
		; BSR			LED2_PIN
		; BSR			LED3_PIN
		; LGOTO		LED_FUNC_EXIT
; LED_ON_1:
		; BCR			LED1_PIN
		; BCR			LED2_PIN
		; BCR			LED3_PIN
		; LGOTO		LED_FUNC_EXIT		
; LED_CHECK_MODE_ONE:
		; INCR		led_cnt,1
		; MOVR		led_cnt,0
		; SUBIA		15
		; BTRSC		STATUS,0
		; LGOTO		LED_ON_1
		; MOVR		led_cnt,0
		; SUBIA		124				;8*125=1000S
		; BTRSC		STATUS,0
		; LGOTO		LED_OFF_1
		; CLRR		led_cnt
		; LGOTO		LED_OFF_1
; LED_CHECK_MODE_TWO:
		; INCR		led_cnt,1
		; MOVR		led_cnt,0
		; SUBIA		15
		; BTRSC		STATUS,0
		; LGOTO		LED_ON_1
		; MOVR		led_cnt,0
		; SUBIA		30
		; BTRSC		STATUS,0
		; LGOTO		LED_OFF_1
		; MOVR		led_cnt,0
		; SUBIA		45
		; BTRSC		STATUS,0
		; LGOTO		LED_ON_1
		; MOVR		led_cnt,0
		; SUBIA		124				;8*125=1000S
		; BTRSC		STATUS,0
		; LGOTO		LED_OFF_1
		; CLRR		led_cnt
		; LGOTO		LED_OFF_1
; LED_CHECK_MODE_THREE:
		; INCR		led_cnt,1
		; MOVR		led_cnt,0
		; SUBIA		15
		; BTRSC		STATUS,0
		; LGOTO		LED_ON_1
		; MOVR		led_cnt,0
		; SUBIA		30
		; BTRSC		STATUS,0
		; LGOTO		LED_OFF_1
		; MOVR		led_cnt,0
		; SUBIA		45
		; BTRSC		STATUS,0
		; LGOTO		LED_ON_1
		; MOVR		led_cnt,0
		; SUBIA		60
		; BTRSC		STATUS,0
		; LGOTO		LED_OFF_1
		; MOVR		led_cnt,0
		; SUBIA		75
		; BTRSC		STATUS,0
		; LGOTO		LED_ON_1
		; MOVR		led_cnt,0
		; SUBIA		124				;8*125=1000S
		; BTRSC		STATUS,0
		; LGOTO		LED_OFF_1
		; CLRR		led_cnt
		; LGOTO		LED_OFF_1
	
; LED_CHECK_FUNC_EXIT:
	; RET
;======================================================================	
MAIN_1:		
		LCALL		Get_rolling_code	
		LCALL		INIT_RF
		
			
;======================================================================
;======================================================================
MAIN:  	
		clrwdt
		BTRSS		DELAY_8MS_FLAG
		LGOTO		MAIN
		BCR			DELAY_8MS_FLAG
		
		
		LCALL		KEY_FUNC
		LCALL		TXRX_FUNC	
		LCALL		SLEEP_FUNC
		LCALL		SYS_SLEEP_FUNC
	
		LGOTO		MAIN
;======================================================================	
;-------------------------------------------------------------------------------
;-------------------------------------------------------------------------------
TXRX_FUNC:
	BTRSS		pair_flag		
	LGOTO		TXRX_PAIR
TX_MORMAL:	
	LCALL		GET_channel
	MOVR		rf_channel,0
	LCALL		RF_SET_CHANNEL
	LCALL		RF_SET_TX_MODE	
	
	MOVR		rollingcode_0,0
	MOVAR		R_RF_SEND_0
	MOVR		rollingcode_1,0
	MOVAR		R_RF_SEND_1
	MOVR		rollingcode_2,0
	MOVAR		R_RF_SEND_2
	MOVR		RXcode_0,0
	MOVAR		R_RF_SEND_3
	MOVR		RXcode_1,0
	MOVAR		R_RF_SEND_4
	MOVR		RXcode_2,0
	MOVAR		R_RF_SEND_5
	MOVIA		0X55
	MOVAR		R_RF_SEND_6
	MOVR		key_cmd1,0
	MOVAR		R_RF_SEND_7
	
	MOVR		key_cmd2,0
	MOVAR		R_RF_SEND_8
	
	
	LCALL		SEND_RF_DATA	
	LCALL		DELAY_2MS	
	
	LGOTO		TXRX_FUNC_EXIT
	
;-------------------------------------------------------------------------------
;是否匹配的功能
;-------------------------------------------------------------------------------
TXRX_PAIR:
	INCR		SLEEP_CNT1,1					;延时30S，如果没匹配的话，sleep
	MOVR		SLEEP_CNT1,0
	SUBIA		250				;4MS*250=1000MS=1S
	BTRSC		STATUS,0
	LGOTO		TXRX_PAIR1
	CLRR		SLEEP_CNT1
	INCR		SLEEP_CNT2,1
	MOVR		SLEEP_CNT2,0
	SUBIA		30				;1*30=30S
	BTRSC		STATUS,0
	LGOTO		TXRX_PAIR1
	CLRR		SLEEP_CNT2
	BSR			SLEEP_FLAG
	LGOTO		TXRX_PAIR1
	
TXRX_PAIR1:
	BTRSC		txrx_flag
	LGOTO		RX_FUNC
	BSR			txrx_flag
	
	MOVIA		PAIR_CHANNLE
	LCALL		RF_SET_CHANNEL
	LCALL		RF_SET_TX_MODE	
	
	MOVR		rollingcode_0,0
	MOVAR		R_RF_SEND_0
	MOVR		rollingcode_1,0
	MOVAR		R_RF_SEND_1
	MOVR		rollingcode_2,0
	MOVAR		R_RF_SEND_2
	CLRR		R_RF_SEND_3
	CLRR		R_RF_SEND_4
	CLRR		R_RF_SEND_5
	MOVIA		0X5A
	MOVAR		R_RF_SEND_6
	CLRR		R_RF_SEND_7
	
	CLRR		R_RF_SEND_8
	
	LCALL		SEND_RF_DATA
	LCALL		DELAY_2MS
	
	;转接收
	MOVIA		PAIR_CHANNLE_RX		  ;; 接收频点比发射频点小1MHz
	LCALL		RF_SET_CHANNEL
	LCALL		RF_SET_RX_MODE
	
	CLRR		rx_outtimes
	LGOTO		TXRX_FUNC_EXIT

RX_FUNC:
	INCR		rx_outtimes,1
	MOVR		rx_outtimes,0		
	SUBIA		4					
	BTRSS		CF
	BCR			txrx_flag


	LCALL		REC_RF_DATA
	
	BTRSS		F_RF_RX_OK
	LGOTO		TXRX_FUNC_EXIT
	
	MOVR		R_RF_SEND_6,0
	XORIA		0XAA			;接收配对标志 0XAA
	BTRSS		STATUS,2
	LGOTO		TXRX_FUNC_EXIT

	MOVR		R_RF_SEND_0,0
	XORAR		rollingcode_0,0
	BTRSS		ZF
	LGOTO		TXRX_FUNC_EXIT
	
	MOVR		R_RF_SEND_1,0
	XORAR		rollingcode_1,0
	BTRSS		ZF
	LGOTO		TXRX_FUNC_EXIT
	
	MOVR		R_RF_SEND_2,0
	XORAR		rollingcode_2,0
	BTRSS		ZF
	LGOTO		TXRX_FUNC_EXIT

	MOVR		R_RF_SEND_3,0			;接受端的滚动码
	MOVAR		RXcode_0
	MOVR		R_RF_SEND_4,0
	MOVAR		RXcode_1
	MOVR		R_RF_SEND_5,0
	MOVAR		RXcode_2

	BSR			pair_flag		;tx_flag
	CLRR		SLEEP_CNT1
	CLRR		SLEEP_CNT2
	BCR			txrx_flag
	
TXRX_FUNC_EXIT:
	RET	      		
			
;======================================================================
;0   1   2    3     4      5      6      7 
;F	 B	 L	  R		PEN
;======================================================================
KEY_FUNC:
		CLRR		temp_x

		LCALL		FB_FUNC
		LCALL		LR_FUNC

		BTRSS		PEN_PIN
		BSR			temp_x,4
		
		MOVR		temp_x,0
		XORAR		LAST_TEMP_X,0
		BTRSS		ZF
		LGOTO		EER_KEY
		
		INCR		KEY_CNT,1
		MOVR		KEY_CNT,0
		SUBIA		3
		BTRSC		STATUS,0
		LGOTO		KEY_FUNC_EXIT
		DECR		KEY_CNT,1
		
		MOVR		temp_x,0
		MOVAR		key_cmd1
		LGOTO		KEY_FUNC_EXIT
;------------------------------------------------------------------------------
FB_FUNC:
		BSR			COM_PIN
		LCALL		DELAY_5US
		BTRSS		FB_PIN
		LGOTO		HAVE_F_KEY
		BCR			COM_PIN
		LCALL		DELAY_5US
		BTRSC		FB_PIN
		RET
HAVE_B_KEY:
		BSR			temp_x,1
		RET
HAVE_F_KEY:
		BSR			temp_x,0
		RET
;------------------------------------------------------------------------------
LR_FUNC:
		BSR			COM_PIN
		LCALL		DELAY_5US
		BTRSS		LR_PIN
		LGOTO		HAVE_L_KEY
		BCR			COM_PIN
		LCALL		DELAY_5US
		BTRSC		LR_PIN
		RET
HAVE_R_KEY:
		BSR			temp_x,3
		RET
HAVE_L_KEY:
		BSR			temp_x,2
		RET
;------------------------------------------------------------------------------
DELAY_5US:
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		RET		
;------------------------------------------------------------------------------		
EER_KEY:
		MOVR		temp_x,0
		MOVAR		LAST_TEMP_X
		CLRR		KEY_CNT
		LGOTO		KEY_FUNC_EXIT
;------------------------------------------------------------------------------		
KEY_FUNC_EXIT:
		RET		
		

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
SLEEP_FUNC:
		BTRSS	pair_flag		;没有匹配上，出去继续循环等待
		LGOTO	SLEEP_FUNC_EXIT
		
		MOVR	key_cmd1,0
		BTRSS	ZF
		CLRR	SLEEP_CNT
		MOVR	key_cmd2,0
		BTRSS	ZF
		CLRR	SLEEP_CNT
		
		INCR	SLEEP_CNT,1
		MOVR	SLEEP_CNT,0
		SUBIA	250					;4MS*100=400MS
		BTRSC	CF
		RET
		CLRR	SLEEP_CNT
		BSR		SLEEP_FLAG
		LGOTO	SLEEP_FUNC_EXIT
		
SLEEP_FUNC_EXIT:
		RET	

;------------------------------------------------------------------------------	
;------------------------------------------------------------------------------     
SYS_SLEEP_FUNC:
		BTRSS	SLEEP_FLAG
		RET
		
		LCALL	RF_MODULE_SLEEP
		
		CLRR	SLEEP_CNT
		CLRR	SLEEP_CNT1
		CLRR	SLEEP_CNT2
		BCR		SLEEP_FLAG
		
		LCALL	GPIO_FUNC
		
	
		MOVIA	0X48		;0100 1000
		MOVAR	PCON
		
		MOVIA	0X02		;0000 0010
		MOVAR	INTE
		MOVIA	0X00
		MOVAR	INTF
		
		sleep
		nop
		nop
		nop       

		LCALL		GPIO_FUNC	
		LCALL		TIME_INIT
		LCALL		INIT_RF
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
		
		MOVIA			0X06
		MOVAR			TMR0		;250*16US=4MS
		
		BSR				DELAY_8MS_FLAG
		
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
	movia		6		;8/128=0.0625MHZ,16US,	16US*2T=32US
	T0MD					;TIME0的分频器	;10110101
	movia		0x01
	IOST		PCON1		;0000_0001	开启定时器TIME0,开启git
	MOVIA		0X06
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
		