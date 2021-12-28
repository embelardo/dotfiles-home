SHELL := /usr/local/bin/zsh

help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.PHONY: help

# General #####################################################################

# Depends on cloud-drive being available.
sh.create.links: ## Create cloud links
	ln -s ~/cloud-drive/stationhome/jrnl ~/jrnl
	ln -s ~/cloud-drive/stationhome/doc ~/doc
	ln -s ~/cloud-drive/stationhome/pluralsight ~/pluralsight
	ln -s ~/cloud-drive/stationhome/workspaces ~/workspaces

.PHONY: sh.create.links

# Git #########################################################################

g.add.all: ## Git add all
	git add --all

g.add: ## Git add items (arg: files)
	git add $(files)

g.commit: ## Git commit (arg: msg)
	git commit --message '$(msg)'

g.commit.amend: ## Git commit amend
	git commit --amend

g.diff: ## Git diff
	git diff

g.log.graph: ## Git log graph
	git log --graph

g.log.short.files: ## Git log one-liners (+ time and author) and file list
	git log --graph --pretty='%Cred%h%Creset - %s %Cgreen(%ar)%C(bold blue)<%an>%Creset%C(auto)%d%Creset' --stat

g.log.short: ## Git log one-liners (+ time and author)
	git log --graph --pretty='%Cred%h%Creset - %s %Cgreen(%ar)%C(bold blue)<%an>%Creset%C(auto)%d%Creset'

g.pull.rebase: ## Git pull and rebase current branch after fetch
	git pull --rebase

g.push: ## Git push
	git push

g.push.force: ## Git push
	git push --force-with-lease

g.rebase.continue: ## Git rebase continue
	git rebase --continue

g.rebase.interactive: ## Git rebase interactive (arg: commit=[3e1aa46])
	git rebase --interactive $(commit)

g.restore.staged: ## Move staged files back to working directory (arg: files)
	git restore --staged $(files)

g.stash: ## Git stash
	git stash

g.stash.pop: ## Git stash pop
	git stash pop

g.status: ## Git status
	git status

.PHONY: g.add g.add.all g.commit g.commit.amend g.diff g.log.graph
.PHONY: g.log.short.files g.log.short g.pull.rebase g.push g.push.force
.PHONY: g.rebase.continue g.rebase.interactive g.restore.staged g.stash
.PHONY: g.stash.pop g.status

# jrnl ########################################################################

j.edit: ## Edit journal (arg: name)
	jrnl $(name) --edit

j.list: ## List journals
	jrnl --list

j.search: ## Search journal by text (arg: text)
	jrnl -contains $(text)

j.show: ## Show journal from beginning (arg: name)
	jrnl $(name) -to today

j.tags.filter: ## Filter journal by tag (arg: name, tags)
	jrnl $(name) $(tags)

j.tags.list: ## List tags in journal (arg: name)
	jrnl $(name) --tags

.PHONY: j.edit j.list j.search j.show j.tags.filter j.tags.list 

# eof #########################################################################
