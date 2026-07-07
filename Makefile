VENV := $(HOME)/.venvs/ansible
ACT  := . $(VENV)/bin/activate &&

.DEFAULT_GOAL := help

.PHONY: help deps lint check run tags

help: ## Show this help
	@awk 'BEGIN {FS = ":.*##"; printf "Targets:\n"} /^[a-zA-Z_-]+:.*##/ { printf "  %-10s %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

deps: ## Bootstrap the Python venv and install Ansible + collections
	./pre-setup.sh

lint: ## Run yamllint and ansible-lint inside the venv
	$(ACT) yamllint . && ansible-lint

check: ## Dry-run the site playbook (--check --diff)
	$(ACT) ansible-playbook site.yml --check --diff -K

run: ## Run the site playbook
	$(ACT) ansible-playbook site.yml -K

tags: ## List all tags available in the site playbook
	$(ACT) ansible-playbook site.yml --list-tags
