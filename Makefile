
OUTPUT_NAME=compiled.json

compile:
	cson2json worklog.cson > $(OUTPUT_NAME)

all: compile
