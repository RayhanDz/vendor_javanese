# Copyright (C) 2018-2020 ArrowOS
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


# Required packages
PRODUCT_PACKAGES += \
    BluetoothExt \
    SimpleCalendar \
    ExactCalculator \
    LatinIME \
    Launcher3QuickStep \
    messaging \
    SimpleGallery \
    Stk \
    stats \
    ThemePicker \
    OmniJaws \
    WeatherIcons

# SystemUI plugins
PRODUCT_PACKAGES += \
    QuickAccessWallet

# Charger mode images
ifeq ($(TARGET_INCLUDE_PIXEL_CHARGER),true)
PRODUCT_PACKAGES += \
    charger_res_images \
    product_charger_res_images
endif

# Config
PRODUCT_PACKAGES += \
    SimpleDeviceConfig

# Navbar
PRODUCT_PACKAGES += \
    GesturalNavigationOverlayLong \
    GesturalNavigationOverlayMedium \
    GesturalNavigationOverlayHidden

# Extra tools
PRODUCT_PACKAGES += \
    7z \
    bash \
    curl \
    getcap \
    htop \
    lib7z \
    libsepol \
    nano \
    pigz \
    powertop \
    setcap \
    unrar \
    unzip \
    vim \
    zip

# Exchange support
PRODUCT_PACKAGES += \
    Exchange2

# Extra packages
PRODUCT_PACKAGES += \
    KomodoWalls

# Filesystems tools
PRODUCT_PACKAGES += \
    fsck.ntfs \
    mke2fs \
    mkfs.ntfs \
    mount.ntfs

# Openssh
PRODUCT_PACKAGES += \
    scp \
    sftp \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh

# Overlays
PRODUCT_PACKAGES += \
    LauncherOverlay

# rsync
PRODUCT_PACKAGES += \
    rsync

# These packages are excluded from user builds
PRODUCT_PACKAGES_DEBUG += \
    procmem

# Charger images
PRODUCT_PACKAGES += \
    charger_res_images

# World APN list
PRODUCT_PACKAGES += \
    apns-conf.xml
