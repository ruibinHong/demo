;;##############################################################################
;;File description
;;This file includes the subroutines about RF TEST
;;Date:2013/12/10
;;##############################################################################
FT_TEST:
		MOVIA		100
		MOVAR		R_RF_SEND_0     	;上电200ms内判断10ms脉冲
WAIT_SIG_H:
		BTRSC		PORTB, 2
		LGOTO		WAIT_SIG_H_WAIT   	;检测到高电平，跳转到防抖
		LCALL		DELAY_2MS_TEST
		DECRSZ		R_RF_SEND_0, TO_R   ;倒计时计数
		LGOTO		WAIT_SIG_H        	;回到开始继续等待高电平
		LGOTO		SIG_CHECK_EXIT	  	;退出检测模式
WAIT_SIG_H_WAIT:
		LCALL		DELAY_2MS_TEST			;延时2ms防抖
		BTRSS		PORTB, 2
		LGOTO		WAIT_SIG_H          ;检测到低电平，返回开始继续等待高电平
		MOVIA		B'11111111'         ;成功检测到高电平，则将PB2下拉关闭，打开PB2上拉，等待PB2被拉低
		MOVAR		ABPLCON				;关闭PB2下拉
		MOVIA		B'11111011'    
		MOVAR		BPHCON				;打开PB2上拉
WAIT_SIG_L:
		LCALL		DELAY_6MS_TEST		;延时6ms，判断是否被拉低
		BTRSS		PORTB, 2
		LGOTO		SIG_CHECK_OK 		;检测到低电平，跳出测试
		LCALL		DELAY_6MS_TEST
		BTRSS		PORTB, 2 			;未检测到，延时10ms继续检测
		LGOTO		SIG_CHECK_OK
		LGOTO		SIG_CHECK_EXIT		;一直未检测到PA2被拉低，退出检测模式
SIG_CHECK_EXIT:
	    RET
	    
SIG_CHECK_OK:
;;————注意如果以下部分看不懂，请查看我司提供的汇编参考代码————
;;再次说明，以上部分在芯片初始化的时候调用，寄存器，宏等请根据需要修改
;;以下部分为-单载波模式进入子程序-
		MOVIA		B'11111111'		;;//PA&PB下拉电阻0:EN 1:DIS 
		MOVAR		ABPLCON
		MOVIA		B'11111100'		;;//PA口输出输入模式控制1：输入：0输出
		IOST		IOSTA
		MOVIA		B'11100011'		;;	//上拉电阻寄存器0:EN; 1:dis
		IOST		APHCON
		MOVIA		B'11011110'
		IOST		IOSTB
		MOVIA		B'11111111'
		MOVAR		BPHCON
FT_TEST_ST:
		CLRWDT
		BTRSC		IO_RF_MISO
		BSR			TEST_RF_MISO
		BTRSS		IO_RF_MISO
		BCR			TEST_RF_MISO
		
		BTRSC		TEST_RF_MOSI
		BSR			IO_RF_MOSI
		BTRSS		TEST_RF_MOSI
		BCR			IO_RF_MOSI
		
		BTRSC		TEST_RF_SCK
		BSR			IO_RF_SCK
		BTRSS		TEST_RF_SCK
		BCR			IO_RF_SCK
		
		BTRSC		TEST_RF_CSN
		BSR			IO_RF_CSN
		BTRSS		TEST_RF_CSN
		BCR			IO_RF_CSN
		
		LGOTO		FT_TEST_ST
;;#################################################################
;;DELAY MS
;;#################################################################  
DELAY_6MS_TEST:
		MOVIA		6
		LGOTO		DELAY_MS_BASE_TEST
DELAY_2MS_TEST:
		MOVIA		2
		LGOTO		DELAY_MS_BASE_TEST
DELAY_MS_BASE_TEST:
		MOVAR		R_DDL1
DELAY_MS_LOOP_TEST:
		CLRWDT
        LCALL       DELAY_1MS_TEST
		DECRSZ		R_DDL1, TO_R
		LGOTO		DELAY_MS_LOOP_TEST
		RET
;;#################################################################
;;DELAY US
;;#################################################################
DELAY_1MS_TEST:
		MOVIA		200
		LGOTO		DELAY_US_BASE_TEST
DELAY_US_BASE_TEST:
		MOVAR		R_DDL0
DELAY_XX_US_LOOP_TEST:			;5US
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
		LGOTO		DELAY_XX_US_LOOP_TEST
		RET