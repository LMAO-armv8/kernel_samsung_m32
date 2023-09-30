# SPDX-License-Identifier: GPL-2.0
dtb-y += mediatek/mt6768.dtb
dtbo-y += samsung/m32_swa_open_w00_r01.dtbo
dtbo-y += samsung/m32_swa_open_w00_r02.dtbo


targets += dtbs
DTB_LIST  := $(dtb-y) $(dtbo-y)
always    := $(DTB_LIST)

dtbs: $(addprefix $(obj)/, $(DTB_LIST))

clean-files := *.dtb*
