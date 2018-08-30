#
$(info Experimental)
#
# 2018 (C) GraphLab Computação Ltda.
#


#
# Files:
#

#
# 1 video
# "Example"
#
EXAMPLE = xkEykZNul7A


#
# Rules:
#

EXPERIMENTAL       = Experimental
EXPERIMENTAL_DIR   = $(BASE_DIR)/$(EXPERIMENTAL)
EXPERIMENTAL_FILES = $(EXAMPLE)


$(EXPERIMENTAL)_all: $(EXPERIMENTAL)_dir $(patsubst %, $(EXPERIMENTAL_DIR)/.%.fmt, $(EXPERIMENTAL_FILES))

$(EXPERIMENTAL)_dir:
	@mkdir --parents --verbose $(EXPERIMENTAL_DIR)/

$(EXPERIMENTAL)_clean:
	@rm --recursive --force --verbose $(EXPERIMENTAL_DIR)/


TARGET_ALL   += $(EXPERIMENTAL)_all
TARGET_CLEAN += $(EXPERIMENTAL)_clean
DOT_PHONY    += $(EXPERIMENTAL)_all $(EXPERIMENTAL)_dir $(EXPERIMENTAL)
