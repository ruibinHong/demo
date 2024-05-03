;=======================================================================================================================
;=======================================================================================================================
;File:			NY8A054E.h
;Description:	The Header File for NY8A054E
;Author:		JasonLee
;Date:			2020/06/02
;=======================================================================================================================
;=======================================================================================================================
;-----------------------------------------------------------------------------------------------------------------------
;MOVR and MOVAR instrutions for access R-page Register (General Purpose Register)
;-----------------------------------------------------------------------------------------------------------------------
;R-page sregisters				;	bit7	|	bit6	|	bit5	|	bit4	|	bit3	|	bit2	|	bit1	|	bit0
;-----------------------------------------------------------------------------------------------------------------------	
; 00H --------- Indirect Addressing Register
INDF				EQU		00H
; 01H --------- Timer0 Data Register	
TMR0				EQU		01H
; 02H --------- Low Byte of Program Counter
PCL					EQU		02H
; 03H --------- Status Register
STATUS				EQU		03H ;	BK[1]		BK[0]		-			/WDT_TO		/Sleep		Z			Half_C		C	
; 04H --------- File Selection Register
FSR					EQU		04H ;	-			FSR[6]		FSR[5]		FSR[4]		FSR[3]		FSR[2]		FSR[1]		FSR[0]	         
; 05H --------- PortA Data Register
PORTA				EQU		05H
; 06H --------- PortB Data Register
PORTB				EQU		06H
; 07H --------- Reserved
; 08H --------- Power Control Register (WatchDog, LVD , LVR and comparator Control) (/PA[4]: Pull-Low) (/PA[5]: Pull-High)
PCON				EQU		08H ;	WDTEn		/PA4		LVDEn		/PA5		LVREn		CMPEn		-			-	
; 09H --------- PortB Wakeup Control Register
BWUCON				EQU		09H ;	-			-			PB[5]		PB[4]		PB[3]		PB[2]		PB[1]		PB[0]
; 0AH --------- High Byte of Program Counter (B'xxxxxDDD')
PCHBUF				EQU		0AH ;	BGEn		XSPD_STP	-			-			-			PCHBUF[2]	PCHBUF[1]	PCHBUF[0]
; 0BH --------- PortA/B Pull-Low Control Register
ABPLCON				EQU		0BH ;	/PB[3]		/PB[2]		/PB[1]		/PB[0]		/PA[3]		/PA[2]		/PA[1]		/PA[0]		
; 0CH --------- PortB Pull-High Control Register
BPHCON				EQU		0CH ;	-			-			/PB[5]		/PB[4]		/PB[3]	    /PB[2]		/PB[1]		/PB[0]	
; 0DH --------- Reserved
; 0EH --------- Interrupt Enable Register
INTE				EQU		0EH ;	ExtINT1		WDT			-			LVDIE		TMR1		ExtINT0		PABKey		TMR0	
; 0FH --------- Interrupt Flag	(Write '0' to Clear Flag)
INTF				EQU		0FH ;	ExtINT1		WDT			-			LVDIF		TMR1		ExtINT0		PABKey		TMR0	
; 10H --------- Reserved	
; 11H --------- Reserved
; 12H --------- Reserved
; 13H --------- Reserved
; 14H --------- Reserved
; 15H --------- PortA Wakeup Control Register
AWUCON				EQU		15H ;	PA[7]		PA[6]		PA[5]		PA[3]		PA[3]		PA[2]		PA[1]		PA[0]
; 16H --------- Reserved
; 17H --------- Reserved
; 18H --------- External Interrupt Contorl Register
INTEDG 				EQU		18H ;	-			-			ExINT1En	ExINT0En	INT1_Edg[1]	INT1_Edg[0]	INT0_Edg[1]	INT0_Edg[0]	
; 19H --------- TIMER1 Data and PWMDUTY1/2 msb 2 bits Register
TMRH  				EQU		19H ;	-			-			TMR1_DATA9	TMR1_DATA8	PWM2_DUTY9	PWM2_DUTY8	PWM1_DUTY9	PWM1_DUTY8	
; 1AH --------- Reserved
; 1BH --------- Resistor to Frequency Converter Control Register
RFC 				EQU		1BH	;	RFCEN		-			-			-			PADSel[3]	PADSel[2]	PADSel[1]	PADSel[0]
; 1CH --------- TIMER3 Data and PWMDUTY3/4 msb 2 bits Register
TM34RH  			EQU		1CH	;	-			-			TMR3_DATA9	TMR3_DATA8	PWM4_DUTY9	PWM4_DUTY8	PWM3_DUTY9	PWM3_DUTY8	
; 1DH --------- Reserved
; 1EH --------- Reserved
; 1FH --------- Interrupt2 Enable Register	(Write '0' to Clear Flag)
INTE2 				EQU		1FH	;	-			-			-			T3IF		-			-			-			T3IE			
;-----------------------------------------------------------------------------------------------------------------------
;T0MD and T0MDR instrutions for access T0MD Register
;-----------------------------------------------------------------------------------------------------------------------
; xxH --------- Timer0 Control Register (Only Accessed by Instruction T0MD / T0MDR)
;T0MD				EQU		xxH	;	LClkSrc		-			ClkSel		EdgeSel		PS0WDT		PS0Div[2]	PS0Div[1]	PS0Div[0]	

;-----------------------------------------------------------------------------------------------------------------------
;IOST and IOSTR instrution for access F-page Register (IO Configuration Register)
;-----------------------------------------------------------------------------------------------------------------------
;F-page registers				;	bit7	|	bit6	|	bit5	|	bit4	|	bit3	|	bit2	|	bit1	|	bit0
;-----------------------------------------------------------------------------------------------------------------------	
; 05H --------- PortA Direction(1:Input/0:Output) Control Register
IOSTA				EQU		05H
; 06H --------- PortB Direction(1:Input/0:Output) Control Register
IOSTB				EQU		06H
; 09H --------- PortA Pull-High Control Register (/PA[5]: Pull-Low)
APHCON				EQU		09H ;	/PA[7]		/PA[6]		/PA[5]		/PA[4]		/PA[3]		/PA[2]		/PA[1]		/PA[0]	
; 0AH --------- Prescaler0 Counter Value Register
PS0CV				EQU		0AH
; 0CH --------- PortB Open-Drain Control Register
BODCON				EQU		0CH ;	-			-			PB[5]		PB[4]		PB[3]  		PB[2]		PB[1]		PB[0]		
; 0EH --------- Comparator voltage select Control Register
CMPCR				EQU		0EH ;	-	 		RBIAS_H 	RBIAS_L		CMPF_INV	PS1			PS0			NS1			NS0		
; 0FH --------- Power Control Register 1
PCON1				EQU		0FH ;	GIE			LVDOUT		LVDS3		LVDS2		LVDS1		LVDS0		-			TMR0En	

;-----------------------------------------------------------------------------------------------------------------------
;SFUN and SFUNR instrution for access S-page Register (Special Function Register)
;-----------------------------------------------------------------------------------------------------------------------
;S-page registers				;	bit7	|	bit6	|	bit5	|	bit4	|	bit3	|	bit2	|	bit1	|	bit0
;-----------------------------------------------------------------------------------------------------------------------											
; 00H --------- Timer1 Data Register	
TMR1				EQU		00H
; 01H --------- Timer1 Control Register	1
T1CR1				EQU		01H ;	PWM1En		PWM1ActB	-			-			-			OneShot		Reload		TMR1En	
; 02H --------- Timer1 Control Register	2
T1CR2				EQU		02H ;	-			-			ClkSel		EdgeSel		/PS1En		PS1Div[2]	PS1Div[1]	PS1Div[0]	
; 03H --------- PWM1 Duty Register
PWM1DUTY			EQU		03H
; 04H --------- Prescaler1 Counter Value Register
PS1CV				EQU		04H
; 05H --------- Buzzer1 Control Register
BZ1CR				EQU		05H ;	BZ1En		-			-			-			FSel[3]		FSel[2]		FSel[1]		FSel[0]	
; 06H --------- IR Control Register
IRCR				EQU		06H ;	IROSC358M   -			-			-			-			PolSel  	IRF57K		IREn	
; 07H --------- Table Access High Byte Address Pointer Register
TBHP				EQU		07H ;	-			-			-			-			-			HPoint[2]	HPoint[1]	HPoint[0]	
; 08H --------- Table Access High Byte Data Register
TBHD				EQU		08H ;	-			-			HData[5]	HData[4]	HData[3]	HData[2]	HData[1]	HData[0]	
; 09H --------- Reserved	
; 0AH --------- Timer2 Control Register	1
P2CR1				EQU		0AH ;	PWM2En		PWM2ActB	-			-			-			-			-			-	
; 0BH --------- Reserved
; 0CH --------- PWM2 Duty Register
PWM2DUTY			EQU		0CH
; 0DH --------- Reserved
; 0EH --------- Reserved
; 0FH --------- Oscillation Control Register (Include Switch Working Mode)
OSCCR				EQU		0FH ;	-			-			-			-			Mode[1]		Mode[0]		HOSC_Stop	HOSC_Sel
; 10H --------- Timer3 Data Register	
TMR3				EQU		10H
; 11H --------- Timer3 Control Register	1
T3CR1				EQU		11H ;	PWM3En		PWM3ActB	-			-			-			OneShot		Reload		TMR3En	
; 12H --------- Timer3 Control Register	2
T3CR2				EQU		12H ;	-			-			ClkSel		EdgeSel		/PS3En		PS3Div[2]	PS3Div[1]	PS3Div[0]	
; 13H --------- PWM3 Duty Register
PWM3DUTY			EQU		13H
; 14H --------- Prescaler3 Counter Value Register
PS3CV				EQU		14H
; 15H --------- Reserved	
; 16H --------- Timer4 Control Register	1
P4CR1				EQU		16H ;	PWM4En		PWM4ActB	-			-			-			-			-			-	
; 17H --------- Reserved	
; 18H --------- PWM4 Duty Register
PWM4DUTY			EQU		18H
; 19H --------- Reserved
; 1AH --------- Reserved	
; 1BH --------- Timer5 Control Register	1
P5CR1				EQU		1BH ;	PWM5En		PWM5ActB	-			-			-			-			-			-	
; 1CH ---------	Reserved
; 1DH --------- PWM5 Duty Register
PWM5DUTY			EQU		1DH
; 1EH --------- Reserved
; 1FH --------- PWMDUTY5 msb 2 bits Register
PWM5RH  			EQU		1FH	;	-			-			-			-			-			-			PWM5_DUTY9	PWM5_DUTY8	

;=======================================================================================================================
;=======================================================================================================================
;-----------------------------------------------------------------------------------------------------------------------
; R-page Special Function Register (General Purpose Register)
;-----------------------------------------------------------------------------------------------------------------------
;------------------------------------------------------------
; INDF (00H)	--------- Indirect Addressing Register
;------------------------------------------------------------
;Bit[7:0] : Indirect Address
	C_Indir_Addr		EQU		FFH

;------------------------------------------------------------
; TMR0 (01H)	--------- Timer0 Data Register	
;------------------------------------------------------------
;Bit[7:0] : Timer0 Data
	C_TMR0_Data			EQU		FFH

;------------------------------------------------------------
; PCL (02H)	--------- Low Byte of Program Counter
;------------------------------------------------------------
;Bit[7:0] : Low Byte of Program Counter
	C_PCLow_Data		EQU		FFH

;------------------------------------------------------------
; STATUS (03H)		--------- Status Register (Include RAM Bank Select)
;------------------------------------------------------------
;Bit[7:6] : RAM Bank Selection
	C_RAM_Bank			EQU		C0H			; Select Ram Bank
	C_RAM_Bank0			EQU		00H			; Select Ram Bank0
	C_RAM_Bank1			EQU		40H			; Select Ram Bank1
	C_RAM_Bank2			EQU		80H			; Select Ram Bank2
	C_RAM_Bank3			EQU		C0H			; Select Ram Bank3	
;Bit[4:0] : System Status
	C_Status_WDT		EQU		10H			; WatchDog Overflow Flag
	C_Status_Slp		EQU		08H			; Sleep (Power Down) Flag
	C_Status_Z			EQU		04H			; Zero Flag
	C_Status_HalfC		EQU		02H			; Half Carry/Half Borrow Flag
	C_Status_C			EQU		01H			; Carry/Borrow Flag
	
	C_Status_WDT_Bit	EQU		4
	C_Status_Slp_Bit	EQU		3
	C_Status_Z_Bit		EQU		2
	C_Status_HalfC_Bit	EQU		1
	C_Status_C_Bit		EQU		0

;------------------------------------------------------------ 
; FSR (04H)		--------- File Selection Register       
;------------------------------------------------------------
;Bit[7] : Reserved	
;Bit[6:0] : Select one Register out of 128 registers of specific Bank.
	C_SFR_RAM_Addr		EQU		7FH			; RAM Address Bit[6:0] 

;------------------------------------------------------------	 
; PORTA (05H)		--------- PortA Data Register
;------------------------------------------------------------ 
;Bit[7:0] : PORTA Data Bit Define	
	C_PA_Data			EQU		FFH			; PA  Data
	C_PA7_Data			EQU		80H			; PA7 Data
	C_PA6_Data			EQU		40H			; PA6 Data
	C_PA5_Data			EQU		20H			; PA5 Data
	C_PA4_Data			EQU		10H			; PA4 Data	
	C_PA3_Data			EQU		08H			; PA3 Data
	C_PA2_Data			EQU		04H			; PA2 Data
	C_PA1_Data			EQU		02H			; PA1 Data
	C_PA0_Data			EQU		01H			; PA0 Data
	
;------------------------------------------------------------
; PORTB (06H)		--------- PortB Data Register
;------------------------------------------------------------
;Bit[7:6] : Reserved	
;Bit[5:0] : PORTB Data Bit Define	
	C_PB_Data			EQU		3FH			; PB  Data
	C_PB5_Data			EQU		20H			; PB5 Data
	C_PB4_Data			EQU		10H			; PB4 Data	
	C_PB3_Data			EQU		08H			; PB3 Data
	C_PB2_Data			EQU		04H			; PB2 Data
	C_PB1_Data			EQU		02H			; PB1 Data
	C_PB0_Data			EQU		01H			; PB0 Data

;------------------------------------------------------------	
; PCON (08H)		--------- Power Control Register (WatchDog,LVD ,LVR and Comparator Control) (/PA[4]: Pull-Low) (/PA[5]: Pull-High)
;------------------------------------------------------------
;Bit[7] : WatchDog Eanble
	C_WDT_En			EQU		80H			; WatchDog Enable
;Bit[6] : PA4 Pull-Low Control bit			(1:Disable, 0:Pull-Low)
    C_PA4_PLB_Dis		EQU		40H			; Disble PA4 Pull-Low    
    C_PA4_PLB_En		EQU		00H			; Enable PA4 Pull-Low 
;Bit[5] : LVD Eanble
	C_LVD_En			EQU		20H			; LVD Enable	
;Bit[4] : PA5 Pull-High Control bit			(1:Disable, 0:Pull-High)
    C_PA5_PHB_Dis		EQU		10H			; Disable PA5 Pull-High
    C_PA5_PHB_En		EQU		00H			; Enable PA5 Pull-High
;Bit[3] : LVR Enable
	C_LVR_En			EQU		08H			; LVR Enable
;Bit[2] : Comparator Enable
	C_CMP_En			EQU		04H			; Comparator Enable	
;Bit[1:0] : Reserved

	C_WDT_En_Bit		EQU		7	
	C_PA4_PLB_Bit		EQU		6	
	C_LVD_En_Bit		EQU		5
	C_PA5_PHB_Bit		EQU		4	
	C_LVR_En_Bit		EQU		3
	C_CMP_En_Bit		EQU		2
	
;------------------------------------------------------------	
; BWUCON (09H)	--------- PortB Wakeup Control Register
;------------------------------------------------------------
;Bit[7:6] : Reserved
;Bit[5:0] : BWUCON Bit Define
	C_PB_Wakeup			EQU		3FH			; PortB Wakeup Enable	
	C_PB5_Wakeup		EQU		20H			; PB5 Wakeup Enable
	C_PB4_Wakeup		EQU		10H			; PB4 Wakeup Enable 	
	C_PB3_Wakeup		EQU		08H			; PB3 Wakeup Enable
	C_PB2_Wakeup		EQU		04H			; PB2 Wakeup Enable 
	C_PB1_Wakeup		EQU		02H			; PB1 Wakeup Enable
	C_PB0_Wakeup		EQU		01H			; PB0 Wakeup Enable
		
;------------------------------------------------------------	
; PCHBUF (0AH) --------- High Byte of Program Counter
;------------------------------------------------------------
;Bit[7] : Enable/disable Bandgap Voltage 
	C_BG_En					EQU		80H		; Enable Bandgap Voltage 
	C_BG_Dis				EQU		00H		; Disable Bandgap Voltage 	
;Bit[6] : E_LXT Buckup Contorl Bit	(1:Disable, 0:Enable)
	C_ELXT_Backup_Dis		EQU		40H	
;Bit[5:3] : Reserved
;Bit[2:0] : High Byte of Program Counter
	C_PCHigh_Data			EQU		07H

	C_BG_En_Bit				EQU		7	
	C_ELXT_Backup_Dis_Bit	EQU		6
		
;------------------------------------------------------------		
; ABPLCON (0BH)	--------- PortA/B Pull-Low Control Register
;------------------------------------------------------------
;Bit[7:4] : PortB Pull-Low Control Register (1:Disable, 0:Pull-High)
    C_PB_PLB			EQU		F0H			; PortB Pull-Low Control bit
    C_PB3_PLB			EQU		80H			; PB3 Pull-Low Control bit
    C_PB2_PLB			EQU		40H			; PB2 Pull-Low Control bit	
    C_PB1_PLB			EQU		20H			; PB1 Pull-Low Control bit 	
    C_PB0_PLB			EQU		10H			; PB0 Pull-Low Control bit
;Bit[3:0] : PortA Pull-Low Control Register
    C_PA_PLB			EQU		0FH			; PortA Pull-Low Control bit
    C_PA3_PLB			EQU		08H			; PA3 Pull-Low Control bit
    C_PA2_PLB			EQU		04H			; PA2 Pull-Low Control bit	
    C_PA1_PLB			EQU		02H			; PA1 Pull-Low Control bit	
    C_PA0_PLB			EQU		01H			; PA0 Pull-Low Control bit

;------------------------------------------------------------	
; BPHCON (0CH)	--------- PortB Pull-High Control Register
;------------------------------------------------------------
;Bit[7:6] : Reserved
;Bit[5:0] : PortB Pull-High Control Register (1:Disable, 0:Pull-High)
	C_PB_PHB			EQU		3FH			; PortB Pull-High Control bit 
	C_PB5_PHB			EQU		20H			; PB5 Pull-High Control bit	
	C_PB4_PHB			EQU		10H			; PB4 Pull-High Control bit	
	C_PB3_PHB			EQU		08H			; PB3 Pull-High Control bit	
	C_PB2_PHB			EQU		04H			; PB2 Pull-High Control bit
	C_PB1_PHB			EQU		02H			; PB1 Pull-High Control bit
	C_PB0_PHB			EQU		01H			; PB0 Pull-High Control bit

;------------------------------------------------------------	
; INTE (0EH)		--------- Interrupt Enable Register
; INTF (0FH)		--------- Interrupt Flag
;------------------------------------------------------------
;Bit[7:0] : Interrupt Source
	C_INT_EXT1			EQU		80H			; EX_INT1 interrupt enable bit
	C_INT_WDT			EQU		40H			; WDT timeout interrupt enable bit
	C_INT_LVD			EQU		10H			; LVD interrupt enable bit	
	C_INT_CMP			EQU		10H			; Comparator interrupt enable bit		
	C_INT_TMR1			EQU		08H			; Timer1 underflow interrupt enable bit
	C_INT_EXT0			EQU		04H			; EX_INT0 interrupt enable bit
	C_INT_PABKey		EQU		02H			; PortA/B input change interrupt enable bit
	C_INT_TMR0			EQU		01H			; Timer0 overflow interrupt enable bit 

	C_INT_EXT1_Bit		EQU		7
	C_INT_WDT_Bit		EQU		6	
	C_INT_LVD_Bit		EQU		4	
	C_INT_CMP_Bit		EQU		4		
	C_INT_TMR1_Bit		EQU		3
	C_INT_EXT0_Bit		EQU		2
	C_INT_PABKey_Bit	EQU		1
	C_INT_TMR0_Bit		EQU		0
	
;------------------------------------------------------------	
; AWUCON (15H) 	--------- PortA Wakeup Control Register
;------------------------------------------------------------	
;Bit[7:0] : AWUCON Bit Define
	C_PA_Wakeup			EQU		FFH			; Port A Wakeup Enable		
	C_PA7_Wakeup		EQU		80H			; PA7 Wakeup Enable
	C_PA6_Wakeup		EQU		40H			; PA6 Wakeup Enable 
	C_PA5_Wakeup		EQU		20H			; PA5 Wakeup Enable
	C_PA4_Wakeup		EQU		10H			; PA4 Wakeup Enable	
	C_PA3_Wakeup		EQU		08H			; PA3 Wakeup Enable
	C_PA2_Wakeup		EQU		04H			; PA2 Wakeup Enable 
	C_PA1_Wakeup		EQU		02H			; PA1 Wakeup Enable
	C_PA0_Wakeup		EQU		01H			; PA0 Wakeup Enable

;------------------------------------------------------------	
; INTEDG (18H) 	--------- External Interrupt Contorl Register
;------------------------------------------------------------	
;Bit[7:6] : Reserved	
;Bit[5] : External INT1 Eanble
	C_INT1_En			EQU		20H			; PB1/PA2 set as INT1 input
;Bit[4] : External INT0 Eanble	
	C_INT0_En			EQU		10H			; PB0 set as INT0 input
;Bit[3:2] : INT1 edge trigger select 
    C_INT1_Edge			EQU		0CH			; INT1 trigger edge  --- 11b: Rising & Falling Edge, 10b:Falling Edge, 01b:Rising Edge    
	C_INT1_TwoEdge		EQU		0CH			; Rising & Falling edge trigger
	C_INT1_FallingEdge	EQU		08H			; Falling edge trigger	
	C_INT1_RisingEdge	EQU		04H			; Rising edge trigger			
;Bit[1:0] : INT0 edge trigger select 
    C_INT0_Edge			EQU		03H			; INT0 trigger edge  --- 11b: Rising & Falling Edge, 10b:Falling Edge, 01b:Rising Edge  
	C_INT0_TwoEdge		EQU		03H			; Rising & Falling edge trigger
	C_INT0_FallingEdge	EQU		02H			; Falling edge trigger	
	C_INT0_RisingEdge	EQU		01H			; Rising edge trigger	

	C_INT1_En_Bit		EQU		5
	C_INT0_En_Bit		EQU		4
	
;------------------------------------------------------------	
; TMRH (19H) 	--------- TIMER1 Data and PWMDUTY1/2 msb 2 bits Register
;------------------------------------------------------------	
;Bit[7:6] : Reserved
;Bit[5] : Timer1 Data Bit9	
	C_TMR1_Data_b9		EQU		20H			; Timer1 data bit9 
;Bit[4] : Timer1 Data Bit8	
	C_TMR1_Data_b8		EQU		10H			; Timer1 data bit8		
;Bit[3] : PWM2 Duty Bit9	
	C_PWM2_Duty_b9		EQU		08H			; PWM2 Duty bit9 
;Bit[2] : PWM2 Duty Bit8	
	C_PWM2_Duty_b8		EQU		04H			; PWM2 Duty bit8
;Bit[1] : Timer1 PWM Duty Bit9	
	C_PWM1_Duty_b9		EQU		02H			; PWM1 Duty bit9 
;Bit[0] : Timer1 PWM Duty Bit8	
	C_PWM1_Duty_b8		EQU		01H			; PWM1 Duty bit8	
	
;------------------------------------------------------------	
; RFC (1BH) 	--------- Resistor to Frequency Converter Control Register
;------------------------------------------------------------		
;Bit[7] : Enable/disable RFC function
	C_RFC_En			EQU		80H			; Enable RFC function
	C_RFC_Dis			EQU		00H			; Disable RFC function	
;Bit[6:4] : Reserved	
;Bit[3:0] : Select one of the RFC pad
	C_RFC_PB5			EQU		0DH			; Select PB5 as RFC pad
	C_RFC_PB4			EQU		0CH			; Select PB4 as RFC pad	
	C_RFC_PB3			EQU		0BH			; Select PB3 as RFC pad
	C_RFC_PB2			EQU		0AH			; Select PB2 as RFC pad	
	C_RFC_PB1			EQU		09H			; Select PB1 as RFC pad	
	C_RFC_PB0			EQU		08H			; Select PB0 as RFC pad	
	C_RFC_PA7			EQU		07H			; Select PA7 as RFC pad
	C_RFC_PA6			EQU		06H			; Select PA6 as RFC pad
	C_RFC_PA5			EQU		05H			; Select PA5 as RFC pad
	C_RFC_PA4			EQU		04H			; Select PA4 as RFC pad
	C_RFC_PA3			EQU		03H			; Select PA3 as RFC pad
	C_RFC_PA2			EQU		02H			; Select PA2 as RFC pad	
	C_RFC_PA1			EQU		01H			; Select PA1 as RFC pad
	C_RFC_PA0			EQU		00H			; Select PA0 as RFC pad	
		
	C_RFC_En_Bit		EQU		7
	C_PSEL3_Bit			EQU		3
	C_PSEL2_Bit			EQU		2
	C_PSEL1_Bit			EQU		1
	C_PSEL0_Bit			EQU		0	

;------------------------------------------------------------	
; TM34RH (1CH) 	--------- TIMER3 Data and PWMDUTY3/4 msb 2 bits Register
;------------------------------------------------------------	
;Bit[7:6] : Reserved	
;Bit[5] : Timer3 Data Bit9	
	C_TMR3_Data_b9		EQU		20H			; Timer3 data bit9 
;Bit[4] : Timer3 Data Bit8	
	C_TMR3_Data_b8		EQU		10H			; Timer3 data bit8		
;Bit[3] : PWM4 Duty Bit9	
	C_PWM4_Duty_b9		EQU		08H			; PWM4 Duty bit9 
;Bit[2] : PWM4 Duty Bit8	
	C_PWM4_Duty_b8		EQU		04H			; PWM4 Duty bit8		
;Bit[1] : Timer3 PWM Duty Bit9	
	C_PWM3_Duty_b9		EQU		02H			; PWM3 Duty bit9 
;Bit[0] : Timer3 PWM Duty Bit8	
	C_PWM3_Duty_b8		EQU		01H			; PWM3 Duty bit8	

;------------------------------------------------------------	
; INTE2 (1FH)		--------- Interrupt2 Enable Register
;------------------------------------------------------------
;Bit[7:5] : Reserved	
;Bit[4] : Timer3 underflow Interrupt flag bit
	C_INF_TMR3			EQU		10H			; Timer3 underflow interrupt flag bit
;Bit[3:1] : Reserved
;Bit[0] : Timer3 underflow Interrupt enable bit
	C_INE_TMR3			EQU		01H			; Timer3 underflow interrupt enable bit 

;------------------------------------------------------------	
; T0MD (xxH)		--------- T0MD Register
;------------------------------------------------------------
;		C_TMR0_Clk		C_TMR0_LowClk	|	Timer 0 Clock Source
;------------------------------------------------------------
;		0				x				|	From Instruction Clock
;		1				0				|	From External Pin
;		1				1				|	From Low Oscillator Frequency (I_LRC or E_LXT)
;------------------------------------------------------------
;Bit[7,5:4] : Timer0 Clock Source Selection
	C_TMR0_LowClk		EQU		80H			; Same as LCKTM0	
	C_TMR0_Clk			EQU		20H			; Same as T0CS
	C_TMR0_ExtClk_Edge	EQU		10H			; Timer0 External Clock Edge Select --- 1:Falling Edge, 0:Rising Edge
;Bit[6] : Reserved
;Bit[3] : Watchdog Interrupt Source Selection / Timer0 Prescaler0 Selection
	C_PS0_WDT			EQU		08H			; Prescaler0 is assigned to WDT
	C_PS0_TMR0			EQU		00H			; Prescaler0 is assigned to TMR0
;Bit[2:0] : Prescaler0 Dividing Rate Selection
	C_PS0_Div			EQU		07H			; Prescaler0 Dividing Rate Selection
	C_PS0_Div2			EQU		00H
	C_PS0_Div4			EQU		01H
	C_PS0_Div8			EQU		02H
	C_PS0_Div16			EQU		03H
	C_PS0_Div32			EQU		04H
	C_PS0_Div64			EQU		05H
	C_PS0_Div128		EQU		06H
	C_PS0_Div256		EQU		07H

;=======================================================================================================================
;=======================================================================================================================
;-----------------------------------------------------------------------------------------------------------------------
; F-page Special Function Register (IO Configuration Register)
;-----------------------------------------------------------------------------------------------------------------------	
;------------------------------------------------------------
; IOSTA (05H)	--------- PortA Direction(Input/Output) Control Register
;------------------------------------------------------------
;Bit[7:0] : Port A Input/Output Mode Selection (1:Input, 0:Output)
	C_PA_Input			EQU		FFH			; Port A Input Mode Control
	C_PA_Output			EQU		00H			; Port A Output Mode Control

	C_PA7_Input			EQU		80H			; PA7 I/O mode Control bit
	C_PA6_Input			EQU		40H			; PA6 I/O mode Control bit
	C_PA5_Input			EQU		20H			; PA5 I/O mode Control bit
	C_PA4_Input			EQU		10H			; PA4 I/O mode Control bit 
	C_PA3_Input			EQU		08H			; PA3 I/O mode Control bit
	C_PA2_Input			EQU		04H			; PA2 I/O mode Control bit
	C_PA1_Input			EQU		02H			; PA1 I/O mode Control bit
	C_PA0_Input			EQU		01H			; PA0 I/O mode Control bit 
	C_PA7_Output		EQU		00H			; PA7 I/O mode Control bit
	C_PA6_Output		EQU		00H			; PA6 I/O mode Control bit
	C_PA5_Output		EQU		00H			; PA5 I/O mode Control bit
	C_PA4_Output		EQU		00H			; PA4 I/O mode Control bit 	
	C_PA3_Output		EQU		00H			; PA3 I/O mode Control bit
	C_PA2_Output		EQU		00H			; PA2 I/O mode Control bit
	C_PA1_Output		EQU		00H			; PA1 I/O mode Control bit
	C_PA0_Output		EQU		00H			; PA0 I/O mode Control bit 

;------------------------------------------------------------	
; IOSTB (06H)	--------- PortB Direction(Input/Output) Control Register
;------------------------------------------------------------
;Bit[7:6] : Reserved
;Bit[5:0] : Port B Input/Output Mode Selection (1:Input, 0:Output)
	C_PB_Input			EQU		3FH			; Port B Input Mode Control
	C_PB_Output			EQU		00H			; Port B Output Mode Control
	C_PB5_Input			EQU		20H			; PB5 I/O mode Control bit
	C_PB4_Input			EQU		10H			; PB4 I/O mode Control bit
	C_PB3_Input			EQU		08H			; PB3 I/O mode Control bit
	C_PB2_Input			EQU		04H			; PB2 I/O mode Control bit
	C_PB1_Input			EQU		02H			; PB1 I/O mode Control bit
	C_PB0_Input			EQU		01H			; PB0 I/O mode Control bit
	C_PB5_Output		EQU		00H			; PB5 I/O mode Control bit
	C_PB4_Output		EQU		00H			; PB4 I/O mode Control bit	
	C_PB3_Output		EQU		00H			; PB3 I/O mode Control bit
	C_PB2_Output		EQU		00H			; PB2 I/O mode Control bit
	C_PB1_Output		EQU		00H			; PB1 I/O mode Control bit
	C_PB0_Output		EQU		00H			; PB0 I/O mode Control bit

;------------------------------------------------------------	
; APHCON (09H)	--------- PortA Pull-High Control Register
;------------------------------------------------------------
;Bit[7:0] : PortA Pull-High Control Register (1:Disable, 0:Pull-High)
	C_PA_PHB			EQU		FFH			; PortA Pull-High Control bit 
	C_PA7_PHB			EQU		80H			; PA7 Pull-High Control bit 
	C_PA6_PHB			EQU		40H			; PA6 Pull-High Control bit   
	C_PA5_PLB			EQU		20H			; PA5 Pull-Low  Control bit
	C_PA4_PHB			EQU		10H			; PA4 Pull-High Control bit
	C_PA3_PHB			EQU		08H			; PA3 Pull-High Control bit	
	C_PA2_PHB			EQU		04H			; PA2 Pull-High Control bit
	C_PA1_PHB			EQU		02H			; PA1 Pull-High Control bit
	C_PA0_PHB			EQU		01H			; PA0 Pull-High Control bit

;------------------------------------------------------------	
; PS0CV (0AH)		--------- Prescaler0 Counter Value Register
;------------------------------------------------------------
;Bit[7:0] : Prescaler0 Counter Value
	C_PS0_Cnt			EQU		FFH			; Read-only	
	
;------------------------------------------------------------	
; B0DCON (0CH)	--------- PortB Open-Drain Control Register
;------------------------------------------------------------
;Bit[7:6] : Reserved
;Bit[5:0] : PortB Open-Drain Control (1:Open-Drain, 0:Disable)
	C_PB_OD				EQU		3FH			; Port B Open-Drain Control
	C_PB5_OD			EQU		20H			; PB5 Open-Drain Control bit	
	C_PB4_OD			EQU		10H			; PB4 Open-Drain Control bit	
	C_PB3_OD			EQU		08H			; PB3 Open-Drain Control bit	
	C_PB2_OD			EQU		04H			; PB2 Open-Drain Control bit
	C_PB1_OD			EQU		02H			; PB1 Open-Drain Control bit 
	C_PB0_OD			EQU		01H			; PB0 Open-Drain Control bit

;------------------------------------------------------------	
; CMPCR (0EH)	--------- Comparator voltage select Control Register
;------------------------------------------------------------
;Bit[7] : Reserved

;Bit[6] : VDD_ref bias high enable bit  (1:Enable, 0: Disable)
	C_RBias_High_Dis 		EQU		00H
	C_RBias_High_En 		EQU		40H	
;LVDS[3:0]		VDD_ref
;------------------------------
;0000			0.51 * VDD  (about)
;0001			0.48 * VDD	(about)		
;0010			0.44 * VDD	(about)	
;0011			0.40 * VDD	(about)	
;0100			0.37 * VDD	(about)		
;0101			0.34 * VDD	(about)		
;0110			0.33 * VDD	(about)		
;0111			0.32 * VDD	(about)		
;1000			0.31 * VDD	(about)		
;1001			0.29 * VDD	(about)		
;1010			0.28 * VDD	(about)		
;1011			0.27 * VDD	(about)		
;1100			0.26 * VDD	(about)		
;1101			0.25 * VDD	(about)		
;1110			0.24 * VDD	(about)		
;1111			0.23 * VDD	(about)

;Bit[5] : VDD_ref bias low enable bit  (1:Enable, 0: Disable) 
	C_RBias_Low_Dis 		EQU		00H
	C_RBias_Low_En 			EQU		20H
;LVDS[3:0]		VDD_ref
;------------------------------
;0000			0.24 * VDD	(about)	
;0001			0.23 * VDD	(about)		
;0010			0.20 * VDD	(about)	
;0011			0.17 * VDD	(about)		
;0100			0.15 * VDD	(about)		
;0101			0.13 * VDD	(about)		
;0110			0.124 * VDD	(about)		
;0111			0.116 * VDD	(about)		
;1000			0.106 * VDD	(about)		
;1001			0.096 * VDD	(about)		
;1010			0.088 * VDD	(about)		
;1011			0.080 * VDD	(about)		
;1100			0.072 * VDD	(about)		
;1101			0.065 * VDD	(about)		
;1110			0.059 * VDD	(about)		
;1111			0.055 * VDD	(about)

;Bit[4] : Comparator Interrupt  trigger edge control(Comparator output state need polling SFR bit "LVDOUT")
	C_CMPFINV_Dis		EQU		00H			; LVDIF=1 when Vp > Vn
	C_CMPFINV_En		EQU		10H			; LVDIF=1 when Vp < Vn	
	
;Bit[3:2] :	Non-inverting input	pad select
;Bit[1:0] :	Inverting input	pad	select

;Comparator input select
;Bit[3:0]	Non-inverting input		Inverting input
;-------------------------------------------
;0000		PA0						PA1
;0001		PA0						PA3
;0010		PA0						Bandgap
;0011		PA0						VDD_ref
;0100		PA2						PA1
;0101		PA2						PA3
;0110		PA2						Bandgap
;0111		PA2						VDD_ref
;1000		VDD_ref					PA1
;1001		VDD_ref					PA3
;1010		VDD_ref					Bandgap				(only for LVD)
;1011		NA						NA
;11XX		NA						NA

; Bandgap voltage is about 0.6V	

;------------------------------------------------------------	
; PCON1 (0FH)	--------- Power Control Register 1
;------------------------------------------------------------
;Bit[7] : All Interrupt Enable
	C_All_INT_En		EQU		80H			; Enable all unmasked interrupts
;Bit[6] : Low voltage detector output 		( This bit can be Comparator output state when SFR bit "CMPEN=1")
	C_LVDOUT			EQU		40H			; read-only
	C_CMPOUT			EQU		40H			; read-only	
;Bit[5:2] : Select one of the 16 LVD voltage ( Note: SFR CMPCR[7:0] must be set 00001010b )
	C_LVD_4P15V			EQU		3CH			; LVD Voltage=4.15V
	C_LVD_4P05V			EQU		38H			; LVD Voltage=4.05V	
	C_LVD_3P9V			EQU		34H			; LVD Voltage=3.9V	
	C_LVD_3P75V			EQU		30H			; LVD Voltage=3.75V	
	C_LVD_3P6V			EQU		2CH			; LVD Voltage=3.6V
	C_LVD_3P45V			EQU		28H			; LVD Voltage=3.45V	
	C_LVD_3P3V			EQU		24H			; LVD Voltage=3.3V	
	C_LVD_3P15V			EQU		20H			; LVD Voltage=3.15V	
	C_LVD_3P0V			EQU		1CH			; LVD Voltage=3.0V	
	C_LVD_2P9V			EQU		18H			; LVD Voltage=2.9V	
	C_LVD_2P8V			EQU		14H			; LVD Voltage=2.8V
	C_LVD_2P6V			EQU		10H			; LVD Voltage=2.6V	
	C_LVD_2P4V			EQU		0CH			; LVD Voltage=2.4V
	C_LVD_2P2V			EQU		08H			; LVD Voltage=2.2V
	C_LVD_2P0V			EQU		04H			; LVD Voltage=2.0V
	C_LVD_1P9V			EQU		00H			; LVD Voltage=1.9V
;Bit[1] : Reserved	
;Bit[0] : Timer0 Enable
	C_TMR0_En			EQU		01H			; Enable Timer0
	C_TMR0_Dis			EQU		00H			; Disable Timer0

	C_LVDOUT_Bit		EQU		6			; read-only
	C_CMPOUT_bit		EQU		6			; read-only			
;=======================================================================================================================
;=======================================================================================================================
;-----------------------------------------------------------------------------------------------------------------------
; S-page Special Function Register (Special Function Register)
;-----------------------------------------------------------------------------------------------------------------------		
;------------------------------------------------------------
; TMR1 (00H)	--------- Timer1 Data Register
;------------------------------------------------------------
;Bit[7:0] : Timer1 Data
	C_TMR1_Data			EQU		FFH	
	
;------------------------------------------------------------	
; T1CR1 (01H)	--------- Timer1 Control Register 1
;------------------------------------------------------------
;Bit[7:6] : PWM1 Control
	C_PWM1_En			EQU		80H 		; PWM1 output will be present on PB3 or PA4
	C_PWM1_Active		EQU		40H 		; PWM1 output is active
	C_PWM1_Active_Lo	EQU		40H 		; PWM1 output is active low 
	C_PWM1_Active_Hi	EQU		00H 		; PWM1 output is active high 
;Bit[5:3] : Reserved
;Bit[2:0] : Timer1 Control
	C_TMR1_OneShot		EQU		04H 		; One-Shot mode. Timer1 will count once from the initial value to 0x00
	C_TMR1_Reload		EQU		02H 		; Initial value is reloaded from reload register TMR1(T1OS=0)

	C_TMR1_En			EQU		01H 		; Enable Timer1
	C_TMR1_Dis			EQU		00H 		; Disable Timer1

;------------------------------------------------------------	
; T1CR2 (02H)	--------- Timer1 Control Register 2
;------------------------------------------------------------
;Bit[7:6] : Reserved
;Bit[5] : Timer1 Clock Source Select
	C_TMR1_ClkSrc_Ext	EQU		20H			; Timer1 clock source from External Clock Input(EX_CKI0)
	C_TMR1_ClkSrc_Inst	EQU		00H			; Timer1 clock source from Internal Instruction Clock	
;Bit[4] : Timer1 external clock edge selection
    C_TMR1_ExtClk_Edge	EQU		10H			; Timer1 External Clock Edge Select --- 1:Falling Edge, 0:Rising Edge  
	C_TMR1_ExtFalling	EQU		10H			; Timer1 will decrease one while EX_CKI0 Falling Edge.
	C_TMR1_ExtRising	EQU		00H			; Timer1 will decrease one while EX_CKI0 Rising Edge.
;Bit[3] :  Disable/enable Prescaler1
    C_PS1_Dis           EQU		08H			; Disable Prescaler1
	C_PS1_EN			EQU		00H			; Enable Prescaler1
;Bit[2:0] : Prescaler 1 Dividing Rate Selection
	C_PS1_Div			EQU		07H			; Prescaler1 Dividing Rate Selection
	C_PS1_Div2			EQU		00H
	C_PS1_Div4			EQU		01H
	C_PS1_Div8			EQU		02H
	C_PS1_Div16			EQU		03H
	C_PS1_Div32			EQU		04H
	C_PS1_Div64			EQU		05H
	C_PS1_Div128		EQU		06H
	C_PS1_Div256		EQU		07H

;------------------------------------------------------------	
; PWM1DUTY (03H)	--------- PWM1 Duty Register
;------------------------------------------------------------
;Bit[7:0] : PWM1 Duty Value
	C_PWM1_Duty			EQU		FFH

;------------------------------------------------------------	
; PS1CV (04H)		--------- Prescaler1 Counter Value Register
;------------------------------------------------------------
;Bit[7:0] : Prescaler1 Counter Value
	C_PS1_Cnt			EQU		FFH			; Read-only

;------------------------------------------------------------	
; BZ1CR (05H)		--------- Buzzer1 Control Register
;------------------------------------------------------------
;Bit[7] : BZ1 Enable
	C_BZ1_En			EQU		80H			; Enable BZ1 output
;Bit[6:4] : Reserved
;Bit[3:0] : BZ1 Frequency Selection
	C_BZ1_FSel			EQU		0FH			; BZ1 frequency selection

	C_BZ1_PS1Div2		EQU		00H			; Clock Soruce from Prescaler 1
	C_BZ1_PS1Div4		EQU		01H
	C_BZ1_PS1Div8		EQU		02H
	C_BZ1_PS1Div16		EQU		03H
	C_BZ1_PS1Div32		EQU		04H
	C_BZ1_PS1Div64		EQU		05H
	C_BZ1_PS1Div128		EQU		06H
	C_BZ1_PS1Div256		EQU		07H

	C_BZ1_TMR1B0		EQU		08H			; Clock Source from Timer 1
	C_BZ1_TMR1B1		EQU		09H
	C_BZ1_TMR1B2		EQU		0AH
	C_BZ1_TMR1B3		EQU		0BH
	C_BZ1_TMR1B4		EQU		0CH
	C_BZ1_TMR1B5		EQU		0DH
	C_BZ1_TMR1B6		EQU		0EH
	C_BZ1_TMR1B7		EQU		0FH

;------------------------------------------------------------	
; IRCR (06H)		--------- IR Control Register
;------------------------------------------------------------
;Bit[7] : IR Clock Source Selection (1:3.58MHz, 0:455KHz)
	C_IR_ClkSrc_358M	EQU		80H			; IRCR[7]=1 , external crystal is 3.58MHz (This bit is ignored if internal high frequency oscillation is used)
	C_IR_ClkSrc_455K	EQU		00H			; IRCR[7]=0 , external crystal is 455KHz
;Bit[6:3] : Reserved
;Bit[2] : IR Polarity Selection
	C_IR_Pol_Sel		EQU		04H
;Bit[1] : IR Carrier Frequency Selection (1:57KHz, 0:38KHz)
	C_IR_57K			EQU		02H			; IRCR[1]=1 , IR carrier frequency is 57KHz
	C_IR_38K			EQU		00H			; IRCR[1]=0 , IR carrier frequency is 38KHz
;Bit[0] : IR Enable
	C_IR_En				EQU		01H			; Enable IR carrier output

;------------------------------------------------------------	
; TBHP (07H)	--------- Table Access High Byte Address Pointer Register
;------------------------------------------------------------
;Bit[7:3] : Reserved
;Bit[2:0] : Table Access High Byte Address Pointer
	C_TbHigh_Addr		EQU		07H			; When instruction CALLA, GOTOA or TABLEA is executed TBHP[2:0] is PC[10:8]

;------------------------------------------------------------	
; TBHD (08H)	--------- Table Access High Byte Data Register
;------------------------------------------------------------
;Bit[7:6] : Reserved
;Bit[5:0] : Table Access High Byte Data
	C_TbHigh_Data		EQU		3FH
		
;------------------------------------------------------------	
; P2CR1 (0AH)	--------- PWM2 Control Register 1
;------------------------------------------------------------
;Bit[7:6] : PWM2 Control
	C_PWM2_En			EQU		80H 		; PWM2 output will be present on PB2 or PA0
	C_PWM2_Active		EQU		40H 		; PWM2 output is active
	C_PWM2_Active_Lo	EQU		40H 		; PWM2 output is active low 
	C_PWM2_Active_Hi	EQU		00H 		; PWM2 output is active high 
;Bit[5:0] : Reserved

;------------------------------------------------------------	
; PWM2DUTY (0CH)	--------- PWM2 Duty Register
;------------------------------------------------------------
;Bit[7:0] : PWM2 Duty Value
	C_PWM2_Duty			EQU		FFH
	
;------------------------------------------------------------   
; OSCCR (0FH)	--------- Oscillation Control Register (Include Switch Working Mode)
;------------------------------------------------------------
;Bit[7:4] : Reserved
;Bit[3:2] : System Mode Select
	C_Mode				EQU		0CH			; System Operating Mode Selection
	C_Normal_Mode		EQU		00H			; Enter Normal mode
	C_Halt_Mode			EQU		04H			; Enter Halt mode
	C_Standby_Mode		EQU		08H			; Enter Standby mode
;Bit[1] : Stop FHOSC
	C_FHOSC_Stop		EQU		02H			; Disable high-frequency oscillation (FHOSC)
;Bit[0] : FOSC Seletction
	C_FHOSC_Sel			EQU		01H			; OSCCR[0]=1 , FOSC is high-frequency oscillation (FHOSC)
	C_FLOSC_Sel			EQU		00H			; OSCCR[0]=0 , FOSC is Low-frequency oscillation (FLOSC)	
	
;------------------------------------------------------------
; TMR3 (10H)	--------- Timer3 Data Register
;------------------------------------------------------------
;Bit[7:0] : Timer3 Data
	C_TMR3_Data			EQU		FFH	
	
;------------------------------------------------------------	
; T3CR1 (11H)	--------- Timer3 Control Register 1
;------------------------------------------------------------
;Bit[7:6] : PWM3 Control
	C_PWM3_En			EQU		80H 		; PWM3 output will be present on PA3 or PB4
	C_PWM3_Active		EQU		40H 		; PWM3 output is active
	C_PWM3_Active_Lo	EQU		40H 		; PWM3 output is active low 
	C_PWM3_Active_Hi	EQU		00H 		; PWM3 output is active high 
;Bit[5:3] : Reserved
;Bit[2:0] : Timer3 Control
	C_TMR3_OneShot		EQU		04H 		; One-Shot mode. Timer3 will count once from the initial value to 0x00
	C_TMR3_Reload		EQU		02H 		; Initial value is reloaded from reload register TMR3(T3OS=0)
         
	C_TMR3_En			EQU		01H 		; Enable Timer3
	C_TMR3_Dis			EQU		00H 		; Disable Timer3

;------------------------------------------------------------	
; T3CR2 (12H)	--------- Timer3 Control Register 2
;------------------------------------------------------------
;Bit[7:6] : Reserved
;Bit[5] : Timer3 Clock Source Select
	C_TMR3_ClkSrc_Ext	EQU		20H			; Timer3 clock source from External Clock Input(EX_CKI1)
	C_TMR3_ClkSrc_Inst	EQU		00H			; Timer3 clock source from Internal Instruction Clock	
;Bit[4] : Timer3 external clock edge selection
    C_TMR3_ExtClk_Edge	EQU		10H			; Timer3 External Clock Edge Select --- 1:Falling Edge, 0:Rising Edge  
	C_TMR3_ExtFalling	EQU		10H			; Timer3 will decrease one while EX_CKI1 Falling Edge.
	C_TMR3_ExtRising	EQU		00H			; Timer3 will decrease one while EX_CKI1 Rising Edge.
;Bit[3] : Disable/enable Prescaler3
    C_PS3_Dis           EQU		08H			; Disable Prescaler3
	C_PS3_EN			EQU		00H			; Enable Prescaler3
;Bit[2:0] : Prescaler 3 Dividing Rate Selection
	C_PS3_Div			EQU		07H			; Prescaler3 Dividing Rate Selection
	C_PS3_Div2			EQU		00H
	C_PS3_Div4			EQU		01H
	C_PS3_Div8			EQU		02H
	C_PS3_Div16			EQU		03H
	C_PS3_Div32			EQU		04H
	C_PS3_Div64			EQU		05H
	C_PS3_Div128		EQU		06H
	C_PS3_Div256		EQU		07H

;------------------------------------------------------------	
; PWM3DUTY (13H)	--------- PWM3 Duty Register
;------------------------------------------------------------
;Bit[7:0] : PWM3 Duty Value
	C_PWM3_Duty			EQU		FFH

;------------------------------------------------------------	
; PS3CV (14H)		--------- Prescaler3 Counter Value Register
;------------------------------------------------------------
;Bit[7:0] : Prescaler3 Counter Value
	C_PS3_Cnt			EQU		FFH			; Read-only	
	
;------------------------------------------------------------	
; P4CR1 (16H)	--------- PWM4 Control Register 1
;------------------------------------------------------------
;Bit[7:6] : PWM4 Control
	C_PWM4_En			EQU		80H 		; PWM4 output will be present on PA2 or PB5
	C_PWM4_Active		EQU		40H 		; PWM4 output is active
	C_PWM4_Active_Lo	EQU		40H 		; PWM4 output is active low 
	C_PWM4_Active_Hi	EQU		00H 		; PWM4 output is active high 
;Bit[5:0] : Reserved

;------------------------------------------------------------	
; PWM4DUTY (18H)	--------- PWM4 Duty Register
;------------------------------------------------------------
;Bit[7:0] : PWM4 Duty Value
	C_PWM4_Duty			EQU		FFH
	
;------------------------------------------------------------	
; P5CR1 (1BH)	--------- PWM5 Control Register 1
;------------------------------------------------------------
;Bit[7:6] : PWM5 Control
	C_PWM5_En			EQU		80H 		; PWM5 output will be present on PA1 or PB0
	C_PWM5_Active		EQU		40H 		; PWM5 output is active
	C_PWM5_Active_Lo	EQU		40H 		; PWM5 output is active low 
	C_PWM5_Active_Hi	EQU		00H 		; PWM5 output is active high 
;Bit[5:0] : Reserved

;------------------------------------------------------------	
; PWM5DYTY (1DH)	--------- PWM5 Duty Register
;------------------------------------------------------------
;Bit[7:0] : PWM5 Duty Value
	C_PWM5_Duty			EQU		FFH

;------------------------------------------------------------	
; PWM5RH (1FH) 	--------- PWMDUTY5 msb 2 bits Register
;------------------------------------------------------------	
;Bit[7:2] : Reserved			
;Bit[1] : PWM5 PWM Duty Bit9	
	C_PWM5_Duty_b9		EQU		02H			; PWM5 Duty bit9 
;Bit[0] : PWM5 PWM Duty Bit8	
	C_PWM5_Duty_b8		EQU		01H			; PWM5 Duty bit8	
			
;=======================================================================================================================
;=======================================================================================================================
;-----------------------------------------------------------------------------------------------------------------------
;General Constant Define
;-----------------------------------------------------------------------------------------------------------------------
	C_SaveToAcc			EQU		00H	
	C_SaveToReg			EQU		01H	

	C_Bit0				EQU		01H
	C_Bit1				EQU		02H
	C_Bit2				EQU		04H
	C_Bit3				EQU		08H
	C_Bit4				EQU		10H
	C_Bit5				EQU		20H
	C_Bit6				EQU		40H
	C_Bit7				EQU		80H

	C_Num0				EQU		0
	C_Num1				EQU		1
	C_Num2				EQU		2
	C_Num3				EQU		3
	C_Num4				EQU		4
	C_Num5				EQU		5
	C_Num6				EQU		6
	C_Num7				EQU		7
	
	C_nBit0				EQU		FEH
	C_nBit1				EQU		FDH
	C_nBit2				EQU		FBH
	C_nBit3				EQU		F7H
	C_nBit4				EQU		EFH
	C_nBit5				EQU		DFH
	C_nBit6				EQU		BFH
	C_nBit7				EQU		7FH
	
#DEFINE		BIT_0		B'00000001'
#DEFINE		BIT_1		B'00000010'
#DEFINE		BIT_2		B'00000100'
#DEFINE		BIT_3		B'00001000'
#DEFINE		BIT_4		B'00010000'
#DEFINE		BIT_5		B'00100000'
#DEFINE		BIT_6		B'01000000'
#DEFINE		BIT_7		B'10000000'

TO_R			 EQU  H'0001'
TO_A			 EQU  H'0000'
C_B              EQU  H'0000'
DC_B             EQU  H'0001'
HC_B			 EQU  H'0001'
Z_B              EQU  H'0002'