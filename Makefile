#
# Makefile
#
# 2018 (C) GraphLab Computação Ltda.
#

BASE_DIR = $(shell pwd)
TARGET_ALL =
TARGET_CLEAN =

include *.mk

all: $(TARGET_ALL)
	@echo "all videos downloaded!"
	@echo 

.%.fmt: $(patsubst .%.fmt, %.fmt, $@)
	@echo "Getting formats available for $* ..."
	youtube-dl --mark-watched --get-filename https://www.youtube.com/watch?v=$* | tee $*.part
	youtube-dl --mark-watched --list-formats https://www.youtube.com/watch?v=$* | tee --append $*.part
	@echo "Downloading video $* ..."
	youtube-dl --mark-watched --format '137+140' --merge-output-format mkv \
                   https://www.youtube.com/watch?v=$*
	@mv $*.part $@
	@echo "Finished."
	@echo

clean: $(TARGET_CLEAN)
	@echo "clean"
	@rm -f .*.fmt *.part *.m4a *.mp4 *.webm *.mkv *.out
	@echo 

.PHONY: all clean
.EXPORT_ALL_VARIABLES:
