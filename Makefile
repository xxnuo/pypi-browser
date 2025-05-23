.PHONY: test
test:
	poetry run coverage run -m pytest tests
	poetry run coverage report
	poetry run mypy pypi_browser
	poetry run pre-commit run --all-files

.PHONY: start-dev
start-dev:
	PYPI_BROWSER_PYPI_URL=http://192.168.1.239:10608/simple PYPI_BROWSER_DEBUG=1 PYPI_BROWSER_PACKAGE_CACHE_PATH=$(CURDIR)/cache uvicorn --reload --port 3000 pypi_browser.app:app
