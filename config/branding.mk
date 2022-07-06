# Define Var
CURRENT_DEVICE=$(shell echo "$(TARGET_PRODUCT)" | cut -d'_' -f 2,3)

# Javanese Version
JAVANESE_PLATFORM_VERSION := 1.0
JAVANESE_VERSION_NAME := Surili

# Set all versions
JAVANESE_DATE_YEAR := $(shell date -u +%Y)
JAVANESE_DATE_MONTH := $(shell date -u +%m)
JAVANESE_DATE_DAY := $(shell date -u +%d)
JAVANESE_DATE_HOUR := $(shell date -u +%H)
JAVANESE_DATE_MINUTE := $(shell date -u +%M)
JAVANESE_BUILD_DATE := $(JAVANESE_DATE_YEAR)$(JAVANESE_DATE_MONTH)$(JAVANESE_DATE_DAY)-$(JAVANESE_DATE_HOUR)$(JAVANESE_DATE_MINUTE)

# Komodo Official Release
LIST = $(shell cat vendor/javanese/javanese.devices | awk '{ print $$1 }')

ifeq ($(JAVANESE_OFFICIAL), true)
   ifeq ($(filter $(CURRENT_DEVICE), $(LIST)), $(CURRENT_DEVICE))
      JAVANESE_BUILD_TYPE := OFFICIAL

      # OTA
      JAVANESE_OTA_VERSION_CODE := 11

      JAVANESE_PROPERTIES += \
         sys.ota.disable_uncrypt=1

      PRODUCT_PACKAGES += \
          Updates

  else
      JAVANESE_BUILD_TYPE := UNOFFICIAL
  endif
else
      JAVANESE_BUILD_TYPE := UNOFFICIAL
endif

# Type of GAPPS
ifeq ($(JAVANESE_GAPPS_TYPE), nogapps)
     JAVANESE_BUILD_GAPPS_TYPE := SURILI
else ifeq ($(KOMODO_GAPPS_TYPE), microg)
     JAVANESE_BUILD_GAPPS_TYPE := MICROG
else ifeq ($(KOMODO_GAPPS_TYPE), gapps)
     JAVANESE_BUILD_GAPPS_TYPE := GAPPS
else
    ifeq ($(JAVANESE_GAPPS_TYPE),)
        $(warning "Javanese vendor: JAVANESE_GAPPS_TYPE is undefined, assuming nogapps")
    else
        $(warning "Javanese vendor: Incorrect value for JAVANESE_GAPPS_TYPE, forcing nogapps")
    endif
    JAVANESE_BUILD_GAPPS_TYPE := SURILI
    JAVANESE_GAPPS_TYPE := nogapps
endif

JAVANESE_VERSION := Javanese-v$(JAVANESE_PLATFORM_VERSION)-$(JAVANESE_BUILD)-$(JAVANESE_BUILD_TYPE)-$(JAVANESE_BUILD_GAPPS_TYPE)-$(JAVANESE_BUILD_DATE)

TARGET_PRODUCT_SHORT := $(subst Javanese_,,$(JAVANESE_BUILD))

ROM_FINGERPRINT := Javanese/$(JAVANESE_PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(JAVANESE_BUILD_DATE)

JAVANESE_PROPERTIES := \
    org.javanese.version=$(JAVANESE_PLATFORM_VERSION) \
    org.javanese.version.display=$(JAVANESE_VERSION) \
    org.javanese.build_type=$(JAVANESE_BUILD_TYPE) \
    org.javanese.build_date=$(JAVANESE_BUILD_DATE) \
    org.javanese.gapps_type=$(JAVANESE_BUILD_GAPPS_TYPE) \
    org.javanese.fingerprint=$(ROM_FINGERPRINT) \
    org.javanese.version.name=$(JAVANESE_VERSION_NAME)
