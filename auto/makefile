SHELL := /usr/local/bin/zsh

help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

# Linux #######################################################################

# Depends on dotfiles-home repo, which must first be cloned using init-home
# function.
create-links: ## Create home links
	ln -s ~/cloud-drive/stationhome/jrnl jrnl
	ln -s ~/cloud-drive/stationhome/doc doc
	ln -s ~/cloud-drive/stationhome/pluralsight pluralsight
	ln -s ~/cloud-drive/stationhome/workspaces workspaces

.PHONY: create-links

# Git #########################################################################

g-add-all: ## Git add all
	git add --all

g-add: ## Git add items (arg: items)
	git add $(items)

g-commit: ## Git commit (arg: msg)
	git commit --message '$(msg)'

g-diff: ## Git diff
	git diff

g-log-graph: ## Git log graph
	git log --graph

g-log-short-files: ## Git log one-liners (+ time and author) and file list
	git log --graph --pretty='%Cred%h%Creset - %s %Cgreen(%ar)%C(bold blue)<%an>%Creset%C(auto)%d%Creset' --stat

g-log-short: ## Git log one-liners (+ time and author)
	git log --graph --pretty='%Cred%h%Creset - %s %Cgreen(%ar)%C(bold blue)<%an>%Creset%C(auto)%d%Creset'

g-log-shorter: ## Git log one-liners
	git log --graph --oneline --decorate --all

g-push: ## Git push
	git push

g-status: ## Git status
	git status

.PHONY: g-add g-add-all g-commit g-diff g-log-graph g-log-short g-log-short-files
.PHONY: g-log-shorter g-push g-status

# eof #########################################################################