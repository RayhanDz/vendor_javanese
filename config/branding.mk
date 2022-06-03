# Copyright (C) 2016 The Pure Nexus Project
# Copyright (C) 2016 The JDCTeam
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

# Komodo Version
KOMODO_PLATFORM_VERSION := 4.3
KOMODO_VERSION_NAME := SweetPea

OTA_VERSION := 12.1

# Define Var
CURRENT_DEVICE=$(shell echo "$(TARGET_PRODUCT)" | cut -d'_' -f 2,3)

# Set all versions
KOMODO_DATE_YEAR := $(shell date -u +%Y)
KOMODO_DATE_MONTH := $(shell date -u +%m)
KOMODO_DATE_DAY := $(shell date -u +%d)
KOMODO_DATE_HOUR := $(shell date -u +%H)
KOMODO_DATE_MINUTE := $(shell date -u +%M)
KOMODO_BUILD_DATE := $(KOMODO_DATE_YEAR)$(KOMODO_DATE_MONTH)$(KOMODO_DATE_DAY)-$(KOMODO_DATE_HOUR)$(KOMODO_DATE_MINUTE)

# Komodo Official Release
LIST = $(shell cat official-devices/komodo.devices | awk '{ print $$1 }')

ifeq ($(KOMODO_OFFICIAL), true)
   ifeq ($(filter $(CURRENT_DEVICE), $(LIST)), $(CURRENT_DEVICE))
      KOMODO_BUILD_TYPE := OFFICIAL
   else
      KOMODO_BUILD_TYPE := UNOFFICIAL
   endif
else
      KOMODO_BUILD_TYPE := UNOFFICIAL
endif

LIGHT_WALL := vendor/komodo/wallpaper/light.png
DARK_WALL := vendor/komodo/wallpaper/dark.png
DEFAULT_WALL := vendor/komodo/overlay/common/frameworks/base/core/res/res/drawable-nodpi/default_wallpaper.png

# Type of GAPPS
ifeq ($(KOMODO_GAPPS_TYPE), nogapps)
     KOMODO_BUILD_GAPPS_TYPE := TOXICOFERA
     $(shell cp $(LIGHT_WALL) $(DEFAULT_WALL))
else ifeq ($(KOMODO_GAPPS_TYPE), microg)
     KOMODO_BUILD_GAPPS_TYPE := MICROG
     $(shell cp $(DARK_WALL) $(DEFAULT_WALL))
else ifeq ($(KOMODO_GAPPS_TYPE), gapps)
     KOMODO_BUILD_GAPPS_TYPE := GAPPS
     $(shell cp $(DARK_WALL) $(DEFAULT_WALL))
else
    ifeq ($(KOMODO_GAPPS_TYPE),)
        $(warning "Komodo vendor: KOMODO_GAPPS_TYPE is undefined, assuming nogapps")
    else
        $(warning "Komodo vendor: Incorrect value for KOMODO_GAPPS_TYPE, forcing nogapps")
    endif
    KOMODO_BUILD_GAPPS_TYPE := TOXICOFERA
    KOMODO_GAPPS_TYPE := nogapps
    $(shell cp $(LIGHT_WALL) $(DEFAULT_WALL))
endif

KOMODO_VERSION := Komodo-v$(KOMODO_PLATFORM_VERSION)-$(KOMODO_VERSION_NAME)-$(KOMODO_BUILD)-$(KOMODO_BUILD_TYPE)-$(KOMODO_BUILD_GAPPS_TYPE)-$(KOMODO_BUILD_DATE)

TARGET_PRODUCT_SHORT := $(subst komodo_,,$(KOMODO_BUILD))

ROM_FINGERPRINT := Komodo/$(KOMODO_PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(KOMODO_BUILD_DATE)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    org.komodo.version=$(KOMODO_PLATFORM_VERSION) \
    org.komodo.version.display=$(KOMODO_VERSION) \
    org.komodo.build_type=$(KOMODO_BUILD_TYPE) \
    org.komodo.build_date=$(KOMODO_BUILD_DATE) \
    org.komodo.gapps_type=$(KOMODO_BUILD_GAPPS_TYPE) \
    org.komodo.fingerprint=$(ROM_FINGERPRINT) \
    org.komodo.version.name=$(KOMODO_VERSION_NAME)

KOMODO_DISPLAY_VERSION := $(PRODUCT_BRAND)-v$(VERSION)-$(KOMODO_VERSION_NAME)-$(KOMODO_BUILD_TYPE)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
  ro.komodo.display.version=$(KOMODO_DISPLAY_VERSION)

