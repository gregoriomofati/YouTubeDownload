#
# Makefile
#
# 2018 (C) GraphLab Computação Ltda.
#

include Experimental.mk

all: $(patsubst %, .%.fmt, $(EXPERIMENTAL))
	@echo "Done."
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

clean:
	@echo "clean"
	@rm -f .*.fmt *.part *.m4a *.mp4 *.webm *.mkv *.out
	@echo 

#eof
