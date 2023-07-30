.PHONY: analyze docs linux test

analyze:
	dart analyze

docs:
	dart doc

linux:
	flutter run -d linux

test:
	flutter test
