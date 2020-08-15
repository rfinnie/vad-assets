.PHONY: all clean

TARGETS := vad2000_light.svg vad2000_dark.svg vad2000_light.png vad2000_dark.png

all: $(TARGETS)

clean:
	$(RM) $(TARGETS)

vad2000_light.svg: vad2000.svg
	rsvg-convert --format svg --dpi-x 150 --dpi-y 150 <$< >$@

vad2000_dark.svg: vad2000.svg
	bin/switch_dark <$< | rsvg-convert --format svg --dpi-x 150 --dpi-y 150 >$@

vad2000_light.png: vad2000_light.svg
	rsvg-convert --format png --background-color '#ffffff00' --zoom 4 <$< >$@

vad2000_dark.png: vad2000_dark.svg
	rsvg-convert --format png --background-color '#00000000' --zoom 4 <$< >$@
