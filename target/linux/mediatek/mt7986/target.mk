ARCH:=aarch64
SUBTARGET:=mt7986
BOARDNAME:=MT7986
CPU_TYPE:=cortex-a53

KERNELNAME:=Image dtbs
DEFAULT_PROFILE:=glinet_gl-mt6000

define Target/Description
	Build firmware images for MediaTek MT7986 ARM based boards.
endef
