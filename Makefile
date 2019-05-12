
SOURCE_NAME = cw-innovations
SOURCE_FILE = $(SOURCE_NAME).org

BUILD_DIR = docs
HTML_FILE = $(BUILD_DIR)/index.html

EMACS_EXPORT = emacs --batch --exec "(progn (find-file \"$(1)\") ($(2)))"

all: $(HTML_FILE)


clean:
	@echo Clearing
	rm -r $(BUILD_DIR)


$(BUILD_DIR):
	@echo Creating build dir
	mkdir -p $@
	cp -r org-html-styles $@/org-html-styles


$(HTML_FILE): $(SOURCE_FILE) $(BUILD_DIR)
	@echo Converting to html
	$(call EMACS_EXPORT,$(<),org-html-export-to-html)
	mv $(subst .org,.html,$(SOURCE_FILE)) $(BUILD_DIR)/index.html

