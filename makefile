PROJ = simple_cone_tracer

IDIR = include
SRCDIR = src
OBJDIR = build/obj
BUILDDIR = build
LIBDIR = -Llib

CC = clang
CFLAGS = $(foreach DIR,$(IDIR),-I$(DIR))

_LIBS = glfw GL
LIBS = $(foreach LIB,$(_LIBS),-l$(LIB))

_DEPS = defines.h window.h
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

_OBJ = main.o window.o
OBJ = $(patsubst %,$(OBJDIR)/%,$(_OBJ))

$(OBJDIR)/%.o : $(SRCDIR)/%.c $(DEPS)
	$(CC) $(CFLAGS) -c -o $@ $<

build : $(OBJ)
	$(CC) $(CFLAGS) $(LIBS) -o $(BUILDDIR)/$(PROJ) $^ $(LIBDIR)

.PHONY: clean

clean:
	rm $(OBJDIR)/*
	rm $(BUILDDIR)/$(PROJ)*

.PHONY: run

run : build
	./build/$(PROJ)

.PHONY: rebuild

rebuild : clean build

WINCC = x86_64-w64-mingw32-clang
_WINLIBS = glfw3dll opengl32
WINLIBS = $(foreach LIB,$(_WINLIBS),-l$(LIB))

_WINOBJ = $(foreach O,$(_OBJ),$(O)bj)
WINOBJ = $(patsubst %,$(OBJDIR)/%,$(_WINOBJ))

$(OBJDIR)/%.obj : $(SRCDIR)/%.c $(DEPS)
	$(WINCC) $(CFLAGS) -c -o $@ $<

.PHONY: windows

windows : $(WINOBJ)
	$(WINCC) -DGLFW_DLL $(CFLAGS) $(LIBDIR) -o $(BUILDDIR)/$(PROJ).exe $^ $(WINLIBS)

.PHONY: wine

wine : windows
	cd build && wine $(PROJ).exe
