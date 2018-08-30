#
# Makefile
#
# 2018 (C) GraphLab Computação Ltda.
#

BASE_DIR     = $(shell pwd)
TARGET_ALL   =
TARGET_CLEAN =
DOT_PHONY    =

include *.mk

all: $(TARGET_ALL)
	@echo "all videos downloaded!"
	@echo 

.%.fmt: $(patsubst .%.fmt, %.fmt, $@)
	@echo "Getting formats available for $(*F) ..."
	youtube-dl --mark-watched --get-filename https://www.youtube.com/watch?v=$(*F) | tee $(*D)/!$(*F).part
	youtube-dl --mark-watched --list-formats https://www.youtube.com/watch?v=$(*F) | tee $(*D)/!$(*F).part --append
	@echo "Downloading video $(*F) ..."
	youtube-dl --mark-watched --format '(137/136)+(140)' --merge-output-format mkv --restrict-filenames \
		--output '$(*D)/%(title)s [%(id)s].%(ext)s' \
		https://www.youtube.com/watch?v=$(*F)
	@mv $(*D)/!$(*F).part $@
	@echo "Finished."
	@echo

clean: $(TARGET_CLEAN)
	@echo "Clean."
	@echo 


.DEFAULT_GOAL := all

.PHONY: all clean $(DOT_PHONY)
.EXPORT_ALL_VARIABLES:
