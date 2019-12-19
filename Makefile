PNAME=frg
PDEMO=${PNAME}_demo
PP2F=png2${PNAME}
PLIBSOVER=1
PLIB=lib${PNAME}.so.${PLIBSOVER}
PP2FSHARED=png2${PNAME}-shared
OBJS=src/reader/frg_draw.o src/reader/frg_reader.o src/writer/frg_private/bgr_zip/frg_color_table.o src/writer/frg_private/bgr_zip/frg_color_zip.o src/writer/frg_private/bgr_zip/frg_match_image.o src/writer/frg_private/bgr_zip/frg_match_table.o src/writer/frg_private/bytes_rle.o src/writer/frg_private/frg_color_tools.o src/writer/frg_writer.o

CFLAGS=-Wall -std=c99
CPPFLAGS=-Wall
LDLIBS=-llz4
LDLIBSPNG=-lpng15
LDFLAGS=-s
AR=ar rc

all: $(PDEMO) $(PP2F) $(PP2FSHARED)

$(PDEMO): $(OBJS) src/demo/frg_demo.cpp
	$(CXX) $(CPPFLAGS) $^ -o $@ $(LDLIBS) $(LDFLAGS)

$(PP2F): $(OBJS) src/demo/png2frg.cpp
	$(CXX) $(CPPFLAGS) $^ -o $@ $(LDLIBS) $(LDLIBSPNG) $(LDFLAGS)

$(PLIB): $(OBJS)
	$(CXX)  $(CPPFLAGS) -shared -Wl,-soname,$@ $^ -o $@ $(LDLIBS) $(LDFLAGS)

$(PP2FSHARED): $(PLIB) src/demo/png2frg.cpp
	$(CXX) $(CPPFLAGS) $^ -o $@ $(LDLIBSPNG) $(LDFLAGS)

clean:
	$(RM) -rf $(OBJS) $(PLIBA) $(PDEMO) $(PP2F) $(PLIB) $(PP2FSHARED)
