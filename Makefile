.PHONY: png all clean ship ship-clean

all: png

png: vad2000.png vad2000_dark.png

clean:
	rm -f vad2000.png vad2000_dark.png

ship: vad2000_dark.svg

ship-clean:
	rm -f vad2000_dark.svg

vad2000_dark.svg: vad2000.svg
	bin/switch_dark $< tmp_$@
	inkscape -z -l $@ tmp_$@
	rm tmp_$@

vad2000.png: vad2000.svg
	inkscape -z -e $@ -d 600 -b '#ffffff' -y 0.0 $<

vad2000_dark.png: vad2000_dark.svg
	inkscape -z -e $@ -d 600 -b '#000000' -y 0.0 $<
