# Makefile para Linux e macOS

PROG = BasicoOpenGL
FONTES = Ponto.cpp Poligono.cpp Temporizador.cpp ListaDeCoresRGB.cpp Personagens.cpp TransformacoesGeometricas.cpp
OBJETOS = $(FONTES:.cpp=.o)
CPPFLAGS = -g -O3 -DGL_SILENCE_DEPRECATION -Wno-write-strings -Wno-narrowing -Wno-stringop-overflow # -Wall -g  # Todas as warnings, infos de debug
UNAME := $(shell uname)

ifeq ($(UNAME), Darwin)
    all: $(PROG)

    $(PROG): $(OBJETOS)
	    g++ $(OBJETOS) -O3 -framework OpenGL -framework Cocoa -framework GLUT -lm -o $(PROG)

else
    all: $(OBJETOS)
	    g++ -O3 $(OBJETOS) -lGL -lGLU -lglut -lm -o $(PROG)
endif

clean:
	-@ rm -f $(OBJETOS) $(PROG)