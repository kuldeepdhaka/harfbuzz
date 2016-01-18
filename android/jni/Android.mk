# Ref: http://stackoverflow.com/a/23670298/1500988

LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

REL_PATH:= ../..
ABS_PATH:= $(LOCAL_PATH)/$(REL_PATH)

LOCAL_SRC_FILES:= \
	$(ABS_PATH)/src/hb-blob.cc \
	$(ABS_PATH)/src/hb-buffer.cc \
	$(ABS_PATH)/src/hb-buffer-serialize.cc \
	$(ABS_PATH)/src/hb-common.cc \
	$(ABS_PATH)/src/hb-face.cc \
	$(ABS_PATH)/src/hb-fallback-shape.cc \
	$(ABS_PATH)/src/hb-font.cc \
	$(ABS_PATH)/src/hb-ft.cc \
	$(ABS_PATH)/src/hb-set.cc \
	$(ABS_PATH)/src/hb-shape.cc \
	$(ABS_PATH)/src/hb-shape-plan.cc \
	$(ABS_PATH)/src/hb-shaper.cc \
	$(ABS_PATH)/src/hb-ucdn.cc \
	$(ABS_PATH)/src/hb-unicode.cc \
	$(ABS_PATH)/src/hb-warning.cc \
	$(ABS_PATH)/src/hb-ot-shape-fallback.cc \
	$(ABS_PATH)/src/hb-ot-tag.cc \
	$(ABS_PATH)/src/hb-ot-shape-normalize.cc \
	$(ABS_PATH)/src/hb-ot-font.cc \
	$(ABS_PATH)/src/hb-ot-layout.cc \
	$(ABS_PATH)/src/hb-ot-map.cc \
	$(ABS_PATH)/src/hb-ot-shape.cc \
	$(ABS_PATH)/src/hb-ot-shape-complex-use.cc \
	$(ABS_PATH)/src/hb-ot-shape-complex-use-table.cc \
	$(ABS_PATH)/src/hb-ot-shape-complex-indic-table.cc \
	$(ABS_PATH)/src/hb-ot-shape-complex-myanmar.cc \
	$(ABS_PATH)/src/hb-ot-shape-complex-thai.cc \
	$(ABS_PATH)/src/hb-ot-shape-complex-tibetan.cc \
	$(ABS_PATH)/src/hb-ot-shape-complex-arabic.cc \
	$(ABS_PATH)/src/hb-ot-shape-complex-default.cc \
	$(ABS_PATH)/src/hb-ot-shape-complex-hangul.cc \
	$(ABS_PATH)/src/hb-ot-shape-complex-hebrew.cc \
	$(ABS_PATH)/src/hb-ot-shape-complex-indic.cc \
	$(ABS_PATH)/src/hb-ucdn/ucdn.c

LOCAL_C_INCLUDES:= \
	$(ABS_PATH)/src \
	$(ABS_PATH)/src/hb-ucdn \
	$(LOCAL_PATH)/../include

LOCAL_EXPORT_C_INCLUDES:= 				\
	$(ABS_PATH)/src	\
	$(LOCAL_PATH)/../include

LOCAL_MODULE:= harfbuzz
LOCAL_CPP_EXTENSION:= .cc
LOCAL_SHARED_LIBRARIES:= freetype2
LOCAL_CFLAGS:= -DHAVE_CONFIG_H -DHB_NO_MT

include $(BUILD_SHARED_LIBRARY)

#define variable FREETYPE2_PATH=<path-to-freetype2-code>
#Future Note: I see no usage of fontconfig
#  but config.h have a option to enable it

import-it = 										\
	$(call import-add-path,$(shell dirname $(1)));	\
	$(call import-module,$(shell basename $(1))/$(2))

$(call import-it,$(FREETYPE2_PATH),builds/android/jni)
