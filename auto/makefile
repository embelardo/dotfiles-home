SHELL := /usr/local/bin/zsh

help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

# Linux #######################################################################

# Depends on dotfiles-home repo, which must first be cloned using init-home
# function.
create-links: ## Create home links.
	ln -s ~/cloud-drive/stationhome/jrnl jrnl
	ln -s ~/cloud-drive/stationhome/doc doc
	ln -s ~/cloud-drive/stationhome/pluralsight pluralsight
	ln -s ~/cloud-drive/stationhome/workspaces workspaces

.PHONY: create-links

# Git #########################################################################

g-add: ## Git add items (arg: items)
	git add $(items)

g-add-all: ## Git add all
	git add --all

g-diff: ## Git diff
	git diff

g-status: ## Git status
	git status

.PHONY: g-status

# Zsh #########################################################################

man-zsh: ## Show zsh man page.
	man zsh

.PHONY: man-zsh

# eof #########################################################################