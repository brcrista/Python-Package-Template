PIP := pip
PYTHON := python

PACKAGE_NAME := placeholder-package-name

.PHONY: all
all: clean install-dependencies typecheck tests build sdist wheel install

.PHONY: clean
clean:
	rm -rf **/__pycache__
	rm -rf .mypy_cache
	rm -rf build
	rm -rf dist
	rm -rf *.egg-info

.PHONY: install-dependencies
install-dependencies:
	$(PIP) install --upgrade pip
	$(PIP) install -r requirements.txt
	$(PIP) install -r requirements-dev.txt

.PHONY: typecheck
typecheck:
	mypy $(PACKAGE_NAME) --strict
	mypy tests --ignore-missing-imports --strict

.PHONY: tests
tests:
	pytest --doctest-modules

.PHONY: build
build:
	$(PYTHON) setup.py build

.PHONY: sdist
sdist:
	$(PYTHON) setup.py sdist

.PHONY: install
install:
	$(PIP) install .

.PHONY: uninstall
uninstall:
	$(PIP) uninstall $(PACKAGE_NAME) --yes

.PHONY: wheel
wheel:
	$(PIP) install wheel
	$(PYTHON) setup.py bdist_wheel

.PHONY: upload
upload:
	twine upload --repository-url https://test.pypi.org/legacy/ dist/*
