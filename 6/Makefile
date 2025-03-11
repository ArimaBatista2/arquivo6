CC=gcc
#CC=arm-none-eabi-gcc
STFILE=build/plc.st
#IECGENERATEDSOURCES=build/STD_CONF.c build/STD_RESSOURCE.c 
SOURCES=$(IECGENERATEDSOURCES)  build/plc_main.c build/config.c build/plc_debugger.c build/resource1.c main.c
OBJECTS=$(SOURCES:.c=.o)
CFLAGS=-I $(MATIEC_C_INCLUDE_PATH) -c -g -Og
LDFLAGS=-lrt
EXECUTABLE=softplc

.PHONY: fresh clean all

all: $(STFILE) $(SOURCES) $(EXECUTABLE)
#all: $(STFILE) $(IECGENERATEDSOURCES) $(SOURCES) $(EXECUTABLE)
$(EXECUTABLE): $(OBJECTS)
	$(CC) $(OBJECTS) -o $@ $(LDFLAGS)

.c.o:
	$(CC) $(CFLAGS) $< -o $@

clean:
	#rm POUS.c
	#rm POUS.h
	#rm LOCATED_VARIABLES.h
	#rm VARIABLES.csv
	#rm STD_CONF.c
	#rm STD_CONF.h
	#rm STD_RESSOURCE.c
	rm *.o
	rm $(EXECUTABLE)

$(IECGENERATEDSOURCES): $(STFILE)
	iec2c $(STFILE) -I $(MATIEC_INCLUDE_PATH)	

fresh: | clean all
