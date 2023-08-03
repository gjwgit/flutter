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

# Testing. I can have exactly the same files in test and
# integration_test. Whenit is run from integration_test the widgets
# get renderedd to the screen. When run from test they do not get
# rendered and are much quicker to test! Needs more exploration.

test:
	flutter test test

itest:
	flutter test --device-id \
	$(shell flutter devices | grep desktop | perl -pe 's|^[^•]*• ([^ ]*) .*|\1|') \
	integration_test
