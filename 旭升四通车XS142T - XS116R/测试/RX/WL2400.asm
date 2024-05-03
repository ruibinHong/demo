;;##############################################################################
;;File description
;;This file includes the subroutines about RF config and setting
;;Date:2013/12/10
;;##############################################################################
;;/******************CONTROL  REGISTER*******************/
#define CFG_TOP					(0X00)
#define	EN_AA					(0X01)
#define	EN_RXADDR				(0X02)
#define	SETUP_AW				(0X03)
#define	SETUP_RETR				(0X04)
#define	RF_CH					(0X05)
#define	SETUP_RF				(0X06)
#define	RF_STATUS				(0X07)
#define	OBSERVE_TX				(0X08)
#define	RSSI					(0X09)
#define	RX_ADDR_P0				(0X0A)
#define	RX_ADDR_P1				(0X0B)
#define	RX_ADDR_P2				(0X2)
#define	RX_ADDR_P3				(0X3)
#define	RX_ADDR_P4				(0X4)
#define	RX_ADDR_P5				(0X5)
#define	RX_ADDR_P2TOP5			(0X0C)
#define	BER_RESULT				(0X0D)
#define	AGC_SETTING				(0X0E)
#define	PGA_SETTING				(0X0F)
#define	TX_ADDR					(0X10)
#define	RX_PW_PX				(0X11)
#define	ANALOG_CFG0				(0X12)
#define	ANALOG_CFG1				(0X13)
#define	ANALOG_CFG2				(0X14)
#define	ANALOG_CFG3				(0X15)
#define	STATUS_FIFO				(0X17)
#define	RSSIREC					(0X18)
#define	TXPROC_CFG				(0X19)
#define	RXPROC_CFG				(0X1A)
#define	DYNPD					(0X1C)
#define	FEATURE					(0X1D)
#define	RAMP_CFG				(0X1E)

#define R_REG					0x00//@
#define	R_REGISTER				000H                            				;;SPI read RF data
#define W_REG 					0x20//@
#define	W_REGISTER				020H                            				;;SPI write RF data
#define R_RX_PLOAD 				0x61//@
#define W_TX_PLOAD				0xA0//@
#define FLUSH_TX				0xE1//@
#define FLUSH_RX				0xE2//@
#define REUSE_TX_PL				0xE3//@
#define R_RX_PL_WID				0x60//@
#define W_ACK_PLOAD				0xA8//@
#define W_TX_PLOAD_NOACK		0xB0//@
#define CMD_NOP					0xFF//@

;/* CFG_TOP register set */
#define CE_SEL              	0x80
#define WHITEN_OPT          	0x10
#define IF_2M_SEL           	0x04//@
#define BPS_IDLE_RST			0x02//@
#define BPS_GATED_CLK			0x01//@
#define	LOOPBACK_EN				0x80//@
#define MASK_RX_DR				0x40//@
#define MASK_TX_DS				0x20//@
#define MASK_MAX_RT				0x10//@
#define EN_CRC					0x08//@
#define CRC_2B					0x04//@
#define PWR_ON					0x02//@
#define RX_ON					0x01//@

;/* EN_AA Enable/Disable Auto ACK */
#define ENAA_P5					0x20//@
#define ENAA_P4					0x10//@
#define ENAA_P3					0x08//@
#define ENAA_P2					0x04//@
#define ENAA_P1					0x02//@
#define ENAA_P0					0x01//@

;/* EN_RXADDR Enable/Disable RX pipe number */
#define ENRX_P5					0x20//@
#define ENRX_P4					0x10//@
#define ENRX_P3					0x08//@
#define ENRX_P2					0x04//@
#define ENRX_P1					0x02//@
#define ENRX_P0					0x01//@

#define TX_ADDR_3BYTE			(0x1 << 2)//@
#define TX_ADDR_4BYTE			(0x2 << 2)//@
#define TX_ADDR_5BYTE			(0x3 << 2)//@

#define RX_ADDR_3BYTE			(0x1)//@
#define RX_ADDR_4BYTE			(0x2)//@
#define RX_ADDR_5BYTE			(0x3)//@

;/* STATUS Interrupt status */
#define XC_RX_DR    			(0x1 << 6)//@
#define XC_TX_DS    			(0x1 << 5)//@
#define XC_MAX_RT   			(0x1 << 4)//@

;/* FIFO Status */
#define TX_REUSE        		(0x1 << 6)//@
#define TX_FULL            		(0x1 << 5)//@
#define TX_EMPTY        		(0x1 << 4)//@
#define RX_FULL            		(0x2)//@
#define RX_EMPTY        		(0x1)//@
;;;;;;;;;;;;;;;;;;;;;;;;;;RF parameter;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;1M只能用0db及以下的功率。
;;250K的可以用全功率
#define	C_RF10dBm               03FH		;; 10dBm
#define	C_RF9dBm                038H		;; 9dbm
#define	C_RF8dBm                034H		;; 8dbm
#define	C_RF7dBm                030H		;; 7dbm
#define	C_RF6dBm                02CH		;; 6dbm
#define	C_RF5dBm                028H		;; 5dbm
#define	C_RF4dBm                024H		;; 4dbm
#define	C_RF3dBm                020H		;; 3dbm
#define	C_RF2dBm                014H		;; 2dbm
#define	C_RF0dBm                010H		;; 0dBm
#define	C_RF_2dBm               00CH		;; -2dBm
#define	C_RF_6dBm               008H		;; -6dBm
#define	C_RF_12dBm              004H		;; -12dBm
#define	C_RF_18dBm              002H		;; -18dBm
#define	C_RF_24dBm              001H		;; -24dBm

#define C_DR_1M                 002H											;;通信速率 1Mbps
#define C_DR_250K               022H											;;通信速率 250Kbps

#define	MAX_RT					BIT_4
#define	TX_DS					BIT_5
#define	RX_DR					BIT_6
#define	RF_STATE_BIT			(BIT_4|BIT_5|BIT_6)
;;---------------------------------------------------------------
;;------------------------------------------------
;;------------------------------------------------
#define RF_PACKET_SIZE			9
#define ADD_WIDTH				5
#define	C_CHN_INDEX				4
;==========================================================
;;------------------------------------------------
;;;软件拉高CE	
;;------------------------------------------------
RF_CE_HIGH:
		MOVIA		(R_REGISTER+CFG_TOP)
		MOVAR		R_SPI_ADR
		MOVIA		2
		MOVAR		R_RF_DATA_LEN
		LCALL		RF_TEMP_R
		BSR			R_SPI_TEMP1, 6
		MOVIA		(W_REGISTER+CFG_TOP)
		MOVAR		R_SPI_ADR
		MOVIA		2
		MOVAR		R_RF_DATA_LEN
		LCALL		RF_TEMP_W
		RET
;;------------------------------------------------	
;;;软件拉低CE	
;;------------------------------------------------	
RF_CE_LOW:
		MOVIA		(R_REGISTER+CFG_TOP)
		MOVAR		R_SPI_ADR
		MOVIA		2
		MOVAR		R_RF_DATA_LEN
		LCALL		RF_TEMP_R
		BCR			R_SPI_TEMP1, 6
		MOVIA		(W_REGISTER+CFG_TOP)
		MOVAR		R_SPI_ADR
		MOVIA		2
		MOVAR		R_RF_DATA_LEN
		LCALL		RF_TEMP_W
		RET
;;------------------------------------------------	
;;	清 TX FIFO   清 RX FIFO 
;;------------------------------------------------
RF_CLEAR_STATUS:
		MOVIA		FLUSH_TX		;清 TX FIFO
		MOVAR		R_SPI_ADR
		MOVIA		CMD_NOP
		MOVAR  		R_SPI_DATA
		LCALL 		SPI_WRITE

		MOVIA		FLUSH_RX		;清 RX FIFO
		MOVAR		R_SPI_ADR
		MOVIA		CMD_NOP
		MOVAR  		R_SPI_DATA
		LCALL 		SPI_WRITE

		MOVIA		(W_REGISTER+RF_STATUS)
		MOVAR		R_SPI_ADR
		MOVIA		070H
		MOVAR		R_SPI_DATA
		LCALL		SPI_WRITE
		RET		
;;------------------------------------------------
;跳频
;;------------------------------------------------	
RF_SET_CHANNEL:
		ADDIA		96				;A+2400=
		MOVAR		R_SPI_TEMP0
		MOVIA		9				;2304
		MOVAR		R_SPI_TEMP1

		MOVIA		06H				;; AFC置位
		MOVAR		R_SPI_DATA
		MOVIA		(W_REGISTER+ANALOG_CFG0)
		MOVAR		R_SPI_ADR
		LCALL 		SPI_WRITE
		
		MOVIA		0EH			;; 使能AFC工作
		MOVAR		R_SPI_DATA
		MOVIA		(W_REGISTER+ANALOG_CFG0)
		MOVAR		R_SPI_ADR
		LCALL 		SPI_WRITE

		MOVIA		(W_REGISTER+RF_CH)	;; 写入频点
		MOVAR		R_SPI_ADR
		MOVIA		2
		MOVAR		R_RF_DATA_LEN
		LCALL 		RF_TEMP_W
		
		BSR			R_SPI_TEMP1, 5	;; AFC锁定
		MOVIA		2
		MOVAR		R_RF_DATA_LEN
		LCALL		RF_TEMP_W
		RET
		

; ;==========================================================
;;RF发射接收地址设置
; ;==========================================================
; RF_SET_ID_ADR_RX:
		; MOVIA		(W_REGISTER + TX_ADDR)
		; MOVAR		R_SPI_ADR
        ; LCALL		RF_SET_RX_ID 
		; LCALL		RF_SPI_ADD_SET
		; MOVIA		(W_REGISTER + RX_ADDR_P0)
		; MOVAR		R_SPI_ADR
		; LCALL		RF_SET_RX_ID      
		; LGOTO		RF_SPI_ADD_SET
; RF_SET_TX_ID:  
		; MOVIA		0XCC
		; MOVAR		R_RF_SEND_0
		; MOVR		R_TX_ADDR0, TO_A
		; MOVAR		R_RF_SEND_1
		; MOVR		R_TX_ADDR1, TO_A
		; MOVAR		R_RF_SEND_2
		; MOVR		R_TX_ADDR2, TO_A
		; MOVAR		R_RF_SEND_3
		; MOVIA		0XCC
		; MOVAR		R_RF_SEND_4
        ; RET      
; RF_SET_ID_ADR:
		; MOVIA		(W_REGISTER + TX_ADDR)
		; MOVAR		R_SPI_ADR
		; LCALL		RF_SET_TX_ID
		; LCALL		RF_SPI_ADD_SET
		; MOVIA		(W_REGISTER + RX_ADDR_P0)
		; MOVAR		R_SPI_ADR
		; LCALL		RF_SET_TX_ID      
		; LGOTO		RF_SPI_ADD_SET
; ;==========================================================		
; ;==========================================================
; RF_SET_RX_ID:			
		; MOVIA		0XCC
		; MOVAR		R_RF_SEND_0
		; MOVAR		R_RF_SEND_4
		; MOVR		R_RX_ADDR0, TO_A
		; MOVAR		R_RF_SEND_1
		; MOVR		R_RX_ADDR1, TO_A
		; MOVAR		R_RF_SEND_2
		; MOVR		R_RX_ADDR2, TO_A
		; MOVAR		R_RF_SEND_3
        ; RET
;==========================================================
; RF KSL297L initialize subroutine
;==========================================================
INIT_RF:
		BCR			IO_RF_MOSI
		BCR			IO_RF_SCK
		BSR			IO_RF_CSN
		LCALL		DELAY_50MS
		LCALL		DETECT_SPI
INIT_RF_00:
;; 模拟电路配置
		MOVIA		(R_REGISTER+ANALOG_CFG0)
		MOVAR		R_SPI_ADR
		MOVIA		16
		MOVAR		R_RF_DATA_LEN
		LCALL		RF_FIFO_R			;读FIFO
		BSR			R_RF_SEND_12, 6
		BCR			R_RF_SEND_4, 2
		MOVIA		(W_REGISTER+ANALOG_CFG0)
		MOVAR		R_SPI_ADR
		MOVIA		16
		MOVAR		R_RF_DATA_LEN
		LCALL		RF_FIFO_W			;写入FIFO

;1、配置为软件CE，2、唤醒RF
		LCALL		RF_MODULE_WAKE
; 配置应答PIPE
		MOVIA		(W_REGISTER+EN_AA)	;0X01
		MOVAR		R_SPI_ADR
		MOVIA		03FH
		MOVAR		R_SPI_DATA
		LCALL		SPI_WRITE
; 配置使能地址
		MOVIA		(W_REGISTER+EN_RXADDR)
		MOVAR		R_SPI_ADR
		MOVIA		03FH
		MOVAR		R_SPI_DATA
		LCALL		SPI_WRITE
;;配置地址长度
		MOVIA		B'10101111'		;地址长度为5byte
		MOVAR		R_SPI_DATA
		MOVIA		(W_REGISTER+SETUP_AW)
		MOVAR		R_SPI_ADR
		LCALL		SPI_WRITE
;;配置重传次数和时间间隔
		MOVIA		0X12;B'00000010'		;250us  2次
		MOVAR		R_SPI_DATA
		MOVIA		(W_REGISTER+SETUP_RETR)
		MOVAR		R_SPI_ADR
		LCALL		SPI_WRITE
;;配置为1M通信方式		002H
;;配置为250K通信方式	022H  0010 0010	
		MOVIA		(W_REGISTER+SETUP_RF)
		MOVAR		R_SPI_ADR
		MOVIA		022H;002H
		MOVAR		R_SPI_DATA
		LCALL		SPI_WRITE
;;配置PIPE0&PIPE1接收包长度
		MOVIA		(W_REGISTER+RX_PW_PX)
		MOVAR		R_SPI_ADR
		MOVIA		RF_PACKET_SIZE	
		MOVAR		R_RF_SEND_0
		MOVAR		R_RF_SEND_1
		MOVIA		2
		MOVAR		R_RF_DATA_LEN
		LCALL		RF_FIFO_W
;;配置PIPE动态长度使能位: 所有PIPE都不需要使能动态
		MOVIA		(W_REGISTER+DYNPD)
		MOVAR		R_SPI_ADR
		MOVIA		0
		MOVAR		R_SPI_DATA
		LCALL		SPI_WRITE
;;配置其他RF特性:
;;bit7&6=00 发送寄存器地址时返回State
;;bit5=0 非长数据包
;;bit4=1 禁止FEC功能
;;bit3=1 FEATURE 配置有效
;;bit2=0 动态长度功能关闭
;;bit1=0 ACK不用带PL
;;bit0=0 未开启W_TX_PAYLOAD_NOACK模式
		MOVIA		(W_REGISTER+FEATURE)
		MOVAR		R_SPI_ADR
		MOVIA		018H			;0001 1000
		MOVAR		R_SPI_DATA
		LCALL		SPI_WRITE
	
		LCALL		RF_REC_CAL			; RF 接收校准
		LCALL		RF_SET_NORMAL_PWR	;信号强度
		LCALL		RF_SET_DEFAULT_ADR	;写入通讯地址
		;LCALL		RF_SET_TX_MODE
		RET
;;------------------------------------------------
;;检测SPI
;;------------------------------------------------
DETECT_SPI:
		MOVIA		10
		MOVAR		R_SPI_DATA
		MOVIA		(W_REGISTER+EN_AA)
		MOVAR		R_SPI_ADR
		LCALL 		SPI_WRITE
		LCALL		DELAY_50US
		MOVIA		(R_REGISTER+EN_AA)
		MOVAR		R_SPI_ADR
		LCALL		SPI_READ
		MOVR		R_SPI_DATA, TO_A
		XORIA		10
		BTRSC		STATUS, Z_B
		RET
		LCALL		DELAY_2MS
		LGOTO		DETECT_SPI	
;;==========================================================
;配置为软件CE，唤醒RF
;;==========================================================
RF_MODULE_WAKE:
		MOVIA		(W_REGISTER+CFG_TOP)
		MOVAR		R_SPI_ADR
		MOVIA		7EH			;0111 1110
		MOVAR		R_RF_SEND_0
		MOVIA		082H		;1000 0010
		MOVAR		R_RF_SEND_1
		MOVIA		00BH		;0000 1011
		MOVAR		R_RF_SEND_2
		MOVIA		3
		MOVAR		R_RF_DATA_LEN
		LCALL		RF_FIFO_W
		RET		
;==========================================================
;功率设置
;==========================================================
RF_SET_0DB_PWR:
RF_SET_NORMAL_PWR:
		;MOVIA		(C_RF0dBm)
		MOVIA		(C_RF6dBm)
		LGOTO		SET_RF_POWER
RF_SET_LOW_PWR:
		MOVIA		(C_RF_2dBm)
		;LGOTO		SET_RF_POWER
SET_RF_POWER:
		MOVAR		R_TEMP00
		MOVIA		(R_REGISTER + RF_CH)
		MOVAR		R_SPI_ADR
		MOVIA		3
		MOVAR		R_RF_DATA_LEN
		LCALL		RF_TEMP_R
		
		MOVIA		(W_REGISTER + RF_CH)
        MOVAR		R_SPI_ADR
		MOVR		R_TEMP00, TO_A
		MOVAR		R_SPI_TEMP2
		MOVIA		3
		MOVAR		R_RF_DATA_LEN
		LCALL		RF_TEMP_W
		RET
;==========================================================
;TX_ADDR      发射地址，只用于发射	
;RX_ADDR_P0   接收地址，只用于接收	
;==========================================================
RF_SET_DEFAULT_ADR:
		MOVIA		(W_REGISTER + TX_ADDR)
		MOVAR		R_SPI_ADR
		LCALL		RF_SET_DEFAULT_ADR_NEXT
		MOVIA		(W_REGISTER + RX_ADDR_P0)
		MOVAR		R_SPI_ADR
RF_SET_DEFAULT_ADR_NEXT:
		MOVIA		0XCC
		MOVAR		R_RF_SEND_0
		MOVAR		R_RF_SEND_1
		MOVAR		R_RF_SEND_2
		MOVAR		R_RF_SEND_3
        MOVAR		R_RF_SEND_4          
RF_SPI_ADD_SET:
		MOVIA		ADD_WIDTH
RF_SPI_FIFO_SET:
		MOVAR		R_RF_DATA_LEN
        LCALL		RF_FIFO_W
        RET		

;;----------------------------------------------------
;;RF休眠
;;----------------------------------------------------
RF_MODULE_SLEEP:
		LCALL		RF_CE_LOW
		
		MOVIA		(W_REGISTER+CFG_TOP)
		MOVAR		R_SPI_ADR
		MOVIA		07CH
		MOVAR		R_RF_SEND_0
		MOVIA		082H
		MOVAR		R_RF_SEND_1
		MOVIA		003H
		MOVAR		R_RF_SEND_2
		MOVIA		3
		MOVAR		R_RF_DATA_LEN
		LCALL		RF_FIFO_W
CONFIG_OTHER_PIN:
		RET
;;;==========================================================
;;载波测试
;;;==========================================================
RF_CARRIER_TEST:
		MOVIA		(R_REGISTER+ANALOG_CFG0)
		MOVAR		R_SPI_ADR
		MOVIA		16
		MOVAR		R_RF_DATA_LEN
		LCALL		RF_FIFO_R
		BSR			R_RF_SEND_12, 6
		BCR			R_RF_SEND_4, 2
		MOVIA		(W_REGISTER+ANALOG_CFG0)
		MOVAR		R_SPI_ADR
		MOVIA		16
		MOVAR		R_RF_DATA_LEN
		LCALL		RF_FIFO_W

		MOVIA		(W_REGISTER|TXPROC_CFG)
		MOVAR		R_SPI_ADR
		MOVIA		0
		MOVAR		R_SPI_DATA
		LCALL		SPI_WRITE

		MOVIA		(W_REGISTER|SETUP_RF)
		MOVAR		R_SPI_ADR
		MOVIA		2
		MOVAR		R_RF_DATA_LEN
		MOVIA		1
		MOVAR		R_RF_SEND_0
		MOVIA		0
		MOVAR		R_RF_SEND_1
		LCALL		RF_FIFO_W

		LCALL		RF_CLEAR_STATUS
		RET
;;;=========================================================
;;写入FIFO数据
;;总长8ms左右
;;;=========================================================
SEND_RF_DATA:
		;MOVIA		MAX_RT				;; Default state is MAX_RETRY
		CLRR		R_RF_TX_RESULT
CLEAR_TX_FIFO:
		LCALL		RF_CLEAR_STATUS

		MOVIA		(RF_PACKET_SIZE)	
		MOVAR		R_RF_DATA_LEN
		MOVIA		W_TX_PLOAD		;写发射数据
		MOVAR		R_SPI_ADR
		LCALL		RF_FIFO_W
		LCALL		RF_CE_HIGH		;启动发射
		LCALL		DELAY_1MS		;发射时间
;;1M&2M config
;;Waiting for IRQ duration is 1ms~6mS
;;250K config
;;Waiting for IRQ duration is 2ms~6mS
		MOVIA		200										;;
		MOVAR		R_RF_DATA_LEN
SEND_RF_DATA_COMPLETE_DETECT:								;; SPI byte RW timer is about 250uS while Instruction frequency is 3.64/4
		LCALL 		DELAY_50US
		LCALL 		DELAY_50US
		MOVIA		(R_REGISTER + RF_STATUS)      	; Check sending RF packet successful or not. If failed, retry; Max APP_RETRY_TIMES times.
		MOVAR 		R_SPI_ADR
		LCALL		SPI_READ
		MOVR		R_SPI_DATA, TO_A
		MOVAR		R_RF_TX_RESULT
		ANDIA		B'01110000';;(TX_DS+MAX_RT+RX_DR)
		BTRSS		STATUS, Z_B								;; If not complete
		LGOTO		SEND_RF_DATA_COMPLETE
		DECRSZ		R_RF_DATA_LEN, TO_R
		LGOTO		SEND_RF_DATA_COMPLETE_DETECT
SEND_RF_DATA_COMPLETE:
		LCALL		RF_CE_LOW
SEND_RF_DATA_QUIT:
		RET
	
;;;==========================================================
;;;读取FIFO数据
;;;==========================================================
REC_RF_DATA:
		MOVIA		(R_REGISTER + RF_STATUS)
		MOVAR		R_SPI_ADR
		LCALL		SPI_READ
		MOVR		R_SPI_DATA, TO_A
        ANDIA		0XFE
		MOVAR		R_RF_RX_RESULT
        BTRSC		STATUS, Z_B
        RET
		ANDIA		B'01110000'
		XORIA		RX_DR
		BTRSS		STATUS, Z_B
		LGOTO		RF_REC_FAIL
		
		;LCALL		RF_CE_LOW
		LGOTO		$+1
		LGOTO		$+1
		
		MOVIA		(R_REGISTER + R_RX_PL_WID)	
		MOVAR		R_SPI_ADR
		LCALL		SPI_READ		;读 RX FIFO 最顶部 RX-payload 数据宽度
		MOVR		R_SPI_DATA, TO_A
		XORIA		RF_PACKET_SIZE
		BTRSS		STATUS, Z_B
		LGOTO		REC_RF_QUIT0
		MOVIA		R_RX_PLOAD		  		;;写R_RX_PAYLOAD
		MOVAR		R_SPI_ADR
		MOVIA		RF_PACKET_SIZE
		MOVAR		R_RF_DATA_LEN
		LCALL		RF_FIFO_R
        ;读接收数据，读操作通常由第 0 字节开始，读完过
		;后数据将从 RX FIFO 中删除，接收模式下执行
		
		CLRR		R_TR_START
        MOVR		R_RF_RX_RESULT, TO_A
       	ANDIA		0X0E
        BTRSS		STATUS, Z_B
        LGOTO		REC_RF_DATA_00
        MOVIA		1
        MOVAR		R_TR_START
        LGOTO		REC_RF_QUIT0
        
REC_RF_DATA_00:
		ANDIA		0X02
        BTRSC		STATUS, Z_B
        LGOTO		REC_RF_QUIT0
        MOVIA		2
        MOVAR		R_TR_START
        
REC_RF_QUIT0:
		LCALL		RF_CLEAR_STATUS
		;LCALL		RF_CE_HIGH
		RET
		
RF_REC_FAIL:
		LCALL		RF_CLEAR_STATUS
		CLRR		R_RF_RX_RESULT
		RET

;;----------------------------------------------------
;;开启发射
;;----------------------------------------------------	
RF_SET_TX_MODE:
		LCALL		RF_CE_LOW		
		LCALL		RF_CLEAR_STATUS
		
		MOVIA		(W_REGISTER+CFG_TOP)
		MOVAR		R_SPI_ADR
		MOVIA		7EH
		MOVAR		R_SPI_DATA
		LCALL		SPI_WRITE

		;LCALL		RF_REC_CAL
		RET
;;----------------------------------------------------
;;开启接收
;;----------------------------------------------------	
RF_SET_RX_MODE:
		LCALL		RF_CE_LOW
		LCALL		RF_CLEAR_STATUS

		MOVIA		(W_REGISTER+CFG_TOP)
		MOVAR		R_SPI_ADR
		MOVIA		7FH
		MOVAR		R_SPI_DATA
		LCALL		SPI_WRITE

		;LCALL		RF_REC_CAL

		LCALL		DELAY_2MS
		LCALL		RF_CE_HIGH
		RET
;==========================================================
;; RF 接收校准，仅需要上电执行一次即可。
;==========================================================
RF_REC_CAL:
		MOVIA		100
		MOVAR		R_DDL1
RF_REC_CAL_LOOP:
		LCALL		DELAY_50US
		MOVIA		(R_REGISTER+ANALOG_CFG3)
		MOVAR		R_SPI_ADR
		MOVIA		2
		MOVAR		R_RF_DATA_LEN
		LCALL		RF_TEMP_R
		BSR			R_SPI_TEMP1, 7
		BCR			R_SPI_TEMP1, 5
		BSR			R_SPI_TEMP1, 4
		MOVIA		(W_REGISTER+ANALOG_CFG3)
		MOVAR		R_SPI_ADR
		MOVIA		2
		MOVAR		R_RF_DATA_LEN
		LCALL		RF_TEMP_W
		BSR			R_SPI_TEMP1, 6
		MOVIA		(W_REGISTER+ANALOG_CFG3)
		MOVAR		R_SPI_ADR
		MOVIA		2
		MOVAR		R_RF_DATA_LEN
		LCALL		RF_TEMP_W
		NOP
		MOVIA		(R_REGISTER+STATUS_FIFO)
		MOVAR		R_SPI_ADR
		MOVIA		2
		MOVAR		R_RF_DATA_LEN
		LCALL		RF_TEMP_R
		MOVR		R_SPI_TEMP1, TO_A
		MOVAR		R_TEMP00
		BTRSC		R_SPI_TEMP1, 5
		LGOTO		RF_REC_CAL_COMPLETE
		DECRSZ		R_DDL1, TO_R
		LGOTO		RF_REC_CAL_LOOP
RF_REC_CAL_COMPLETE:
		MOVIA		(R_REGISTER+ANALOG_CFG3)
		MOVAR		R_SPI_ADR
		MOVIA		2
		MOVAR		R_RF_DATA_LEN
		LCALL		RF_TEMP_R
		MOVR		R_SPI_TEMP1, TO_A
		ANDIA		B'10001111'
		IORIA		B'00100000'
		MOVAR		R_SPI_TEMP1
		MOVIA		B'00000111'
		ANDAR		R_SPI_TEMP0, TO_R
		RLR			R_TEMP00, TO_R
		RLR			R_TEMP00, TO_R
		RLR			R_TEMP00, TO_A
		ANDIA		B'11111000'
		IORAR		R_SPI_TEMP0, TO_R
		MOVIA		(W_REGISTER+ANALOG_CFG3)
		MOVAR		R_SPI_ADR
		MOVIA		2
		MOVAR		R_RF_DATA_LEN
		LCALL		RF_TEMP_W
		RET
;==========================================================
; input: R_RF_SEND_0 ~ R_RF_SEND_7
;==========================================================
RF_TEMP_R:
		MOVIA		R_SPI_TEMP0
		LGOTO		RF_FIFO_R_0
RF_FIFO_R:
		MOVIA		R_RF_SEND_0
RF_FIFO_R_0:
		MOVAR		FSR
		BCR			IO_RF_CSN
		MOVR		R_SPI_ADR, TO_A
		MOVAR		R_TEMP01
		LCALL		SPI_RW
RF_FIFO_R_LOOP:
		CLRR		R_TEMP01
		LCALL		SPI_RW
		MOVR		R_TEMP01, TO_A
		MOVAR		INDF
		INCR		FSR, TO_R
		DECRSZ		R_RF_DATA_LEN, TO_R
		LGOTO		RF_FIFO_R_LOOP
		BSR			IO_RF_CSN
		RET

RF_TEMP_W:
		MOVIA		R_SPI_TEMP0
		LGOTO		RF_FIFO_W_0
RF_FIFO_W:
		MOVIA		R_RF_SEND_0
RF_FIFO_W_0:
		MOVAR		FSR
		BCR			IO_RF_CSN
		MOVR		R_SPI_ADR, TO_A
		MOVAR		R_TEMP01
		LCALL		SPI_RW
RF_FIFO_W_LOOP:
		MOVR		INDF, TO_A
		MOVAR		R_TEMP01
		LCALL		SPI_RW
		INCR		FSR, TO_R
		DECRSZ		R_RF_DATA_LEN, TO_R
		LGOTO		RF_FIFO_W_LOOP
		BSR			IO_RF_CSN
		RET
;;=========================================================
;;=========================================================
;input:R_SPI_ADR
;output:R_SPI_DATA
;;=========================================================
SPI_WRITE:
SPI_READ:
		BCR			IO_RF_CSN
		MOVR  		R_SPI_ADR, TO_A
		MOVAR  		R_TEMP01
		LCALL 		SPI_RW
		MOVR  		R_SPI_DATA, TO_A
		MOVAR  		R_TEMP01
		LCALL 		SPI_RW
		MOVR  		R_TEMP01,  TO_A
		MOVAR  		R_SPI_DATA
		BSR			IO_RF_CSN
		RET
;;=========================================================
;input: R_TEMP01
;output:R_TEMP01
;;=========================================================
SPI_RW:
		CLRWDT
		BCR			IO_RF_SCK
		MOVIA		8
		MOVAR		R_TEMP02
SPI_RW_LOOP:
		RLR			R_TEMP01, TO_R
		BTRSC		STATUS, C_B							;DATA, check C
		LGOTO		$+3
		BCR			IO_RF_MOSI
		LGOTO		$+2
		BSR			IO_RF_MOSI

		BSR			IO_RF_SCK
		BTRSS		IO_RF_MISO
		LGOTO		$+3
		BSR			R_TEMP01, 0
		LGOTO		$+2
		BCR			R_TEMP01, 0
		BCR			IO_RF_SCK
		DECRSZ		R_TEMP02, TO_R
		LGOTO		SPI_RW_LOOP
		BCR			IO_RF_MOSI
		RET