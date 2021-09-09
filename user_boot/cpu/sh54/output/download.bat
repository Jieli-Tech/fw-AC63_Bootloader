@echo ********************************************************************************
@echo 			SDK SH54			
@echo ********************************************************************************
@echo %date%

cd /d %~dp0

set OBJDUMP=C:\JL\pi32\bin\llvm-objdump.exe
set OBJCOPY=C:\JL\pi32\bin\llvm-objcopy.exe
set ELFFILE=uboot.elf

%OBJDUMP% -section-headers %ELFFILE%


%OBJCOPY% -O binary -j .text %ELFFILE% uboot.bin

set run_addr=0x1000
set load_addr=0x5000
set mask_addr=0xc0000


uboot_lz4.exe uboot.bin uboot.lz4 %run_addr% %load_addr% rom.image %mask_addr%
BankLink.exe %run_addr% uboot.lz4 uboot.boot 





