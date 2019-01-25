THEMES = Шаблоны_тем
AUX_FILES = $(THEMES).odt
TARGET_FILES = $(THEMES).pdf

all: $(THEMES).pdf

$(THEMES).pdf: 
	emacs --batch --execute '(progn (find-file "$(THEMES).org") (org-odt-export-to-odt))'
	libreoffice --convert-to pdf $(THEMES).odt

clean:
	rm $(AUX_FILES)
	rm $(TARGET_FILES)
