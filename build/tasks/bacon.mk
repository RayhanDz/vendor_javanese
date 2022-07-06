# Copyright (C) 2017 Unlegacy-Android
# Copyright (C) 2017 The LineageOS Project
# Copyright (C) 2018 The PixelExperience Project
# Copyright (C) 2019-2022 Javanese OS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# Build system colors
#
# PFX: Prefix "target C++:" in yellow
# INS: Module "Install:" output color (cyan for ics)
ifneq ($(BUILD_WITH_COLORS),0)
    include $(TOP_DIR)vendor/javanese/build/core/colors.mk
endif

KOMODO_TARGET_PACKAGE := $(PRODUCT_OUT)/$(JAVANESE_VERSION).zip
MD5 := prebuilts/build-tools/path/$(HOST_PREBUILT_TAG)/md5sum

.PHONY: javanese
komodo: $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) mv $(INTERNAL_OTA_PACKAGE_TARGET) $(JAVANESE_TARGET_PACKAGE)
	$(hide) $(MD5) $(JAVANESE_TARGET_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(JAVANESE_TARGET_PACKAGE).md5sum
	$(hide) ./vendor/javanese/tools/generate_json_build_info.sh $(JAVANESE_TARGET_PACKAGE)
	@echo -e ""
	@echo -e ${CL_RED}"Finish ${cya}Building ${bldcya}Javanese ${txtrst}"${CL_RED}
	@echo -e ${CL_RST}""${CL_RST}
       @echo -e ${CL_GRN}"×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=××=×=×=×=×=×=×=×=×=×"
       @echo -e ${CL_GRN}"*   aMMb                                                                     aMMMb   dMMMb   "${CL_GRN}
       @echo -e ${CL_GRN}"*       dMP           AmmP        Vmp            Vmp         Ammp           dMP dMP dMP  VP  "${CL_GRN}
       @echo -e ${CL_GRN}"*       dMP        AmmP   DMmp      vmp        Vmp       Ammp    Ammp       dMP dMP  VMMMb   "${CL_GRN}
       @echo -e ${CL_GRN}"*       dMP     AMmP  Vmmp  DMmp      vmp   vmp        Ammp  VmmP  Ammp     dMP aMP dP  dMP  "${CL_GRN}
       @echo -e ${CL_GRN}"* Dmmp VmmP   AmmP            Dmmp      vmp          AmmP            Amp     VMMMP   VMMMP   "${CL_GRN}
       @echo -e ${CL_GRN}"* THANKS FOR CHOOSING MAGNUS OS, HAPPY FLASHING!                          "${CL_GRN}
       @echo -e ${CL_GRN}"×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×=×==×=×=××=×=×=×=×=×=×=×=×=×"
     
	@echo -e ${CL_RST}""${CL_RST}
	@echo -e ${CL_RED}"================================================"${CL_RED}
	@echo -e ${CL_RED}"surili Islands "${CL_RED}
	@echo -e ${CL_YLW}"zip: $(JAVANESE_TARGET_PACKAGE)"${CL_YLW}
	@echo -e ${CL_YLW}"md5: `cat $(JAVANESE_TARGET_PACKAGE).md5sum | cut -d ' ' -f 1`"${CL_YLW}
	@echo -e ${CL_YLW}"size:`ls -lah $(JAVANESE_TARGET_PACKAGE) | cut -d ' ' -f 5`"${CL_YLW}
	@echo -e ${CL_RED}"================================================"${CL_RED}
	@echo -e ${CL_RST}""${CL_RST}
