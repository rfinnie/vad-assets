all: vad2000_dark.svg

clean:
	@rm -f vad2000_dark.svg vad2000.png vad2000_dark.png

vad2000_dark.svg: vad2000.svg
	bin/switch_dark $< $@

vad2000.png: vad2000.svg
	inkscape -z -e $@ -w 3600 $<

vad2000_dark.png: vad2000_dark.svg
	inkscape -z -e $@ -w 3600 $<
