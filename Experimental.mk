#
# Experimental
#
# 2018 (C) GraphLab Computação Ltda.
#

EXPERIMENTAL = Experimental
EXPERIMENTAL_DIR = $(BASE_DIR)/$(EXPERIMENTAL)

# 1 vídeo
# "Matemáticos"
MATEMATICOS = K9R5OCocIp4

$(EXPERIMENTAL)_all: $(EXPERIMENTAL_DIR) $(patsubst %, .%.fmt, $(MATEMATICOS))

$(EXPERIMENTAL_DIR):
	@mkdir --parents --verbose $(EXPERIMENTAL_DIR)/

$(EXPERIMENTAL)_clean:
	@rm --recursive --force --verbose $(EXPERIMENTAL_DIR)/

TARGET_ALL += $(EXPERIMENTAL)_all
TARGET_CLEAN += $(EXPERIMENTAL)_clean

ALL_PHONY += $(EXPERIMENTAL)_all $(EXPERIMENTAL)_clean
