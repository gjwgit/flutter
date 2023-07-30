APP=Flutter Experience

.PHONY: analyze clean docs help linux test

define HELP
$(APP):

  analyze
  clean
  docs		Run `dart doc` to update doc/api/index.html.
  linux
  test		Run the integration test suite.

endef
export HELP

help::
	@echo "$$HELP"

analyze:
	dart analyze

clean:
	flutter clean

docs:
	dart doc

linux:
	flutter run -d linux

test:
	flutter test
