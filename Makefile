.PHONY: all clean

TARGETS := compiled/vad2000.svg compiled/vad2000_dark.svg compiled/vad2000.png compiled/vad2000_dark.png

all: $(TARGETS)

clean:
	$(RM) $(TARGETS)

compiled/vad2000.svg: vad2000.svg
	inkscape -z -l $@ $<

compiled/vad2000_dark.svg: vad2000.svg
	$(PWD)/bin/switch_dark $< $@.tmp.svg
	inkscape -z -l $@ $@.tmp.svg
	$(RM) $@.tmp.svg

compiled/vad2000.png: compiled/vad2000.svg
	inkscape -z -e $@ -d 600 -b '#ffffff' -y 0.0 $<

compiled/vad2000_dark.png: compiled/vad2000_dark.svg
	inkscape -z -e $@ -d 600 -b '#000000' -y 0.0 $<
