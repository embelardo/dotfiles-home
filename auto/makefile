SHELL := /usr/local/bin/zsh

help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.PHONY: help

# General #####################################################################

sh.calendar: ## Show 2022 Calendar
	ncal -w 2022

sh.clear.scrollback: ## Clear screen and reset scrollback
	@clear
	@printf '\e[3J'

# Depends on cloud-drive being available.
sh.create.links: ## Create cloud links
	ln -s ~/cloud-drive/stationhome/jrnl ~/jrnl
	ln -s ~/cloud-drive/stationhome/doc ~/doc
	ln -s ~/cloud-drive/stationhome/pluralsight ~/pluralsight
	ln -s ~/cloud-drive/stationhome/workspaces ~/workspaces

.PHONY: sh.calendar sh.clear.scrollback sh.create.links

# Git #########################################################################

g.add: ## Git add items (arg: files)
	git add $(files)

g.add.all: ## Git add all
	git add --all

g.commit: ## Git commit (arg: msg)
	git commit --message '$(msg)'

g.commit.amend: ## Git commit amend
	git commit --amend

g.commit.amend.push: ## Git commit amend and push force
	git commit --amend
	git push --force-with-lease

g.commit.push: ## Git commit and push (arg: msg)
	git commit --message '$(msg)'
	git push

g.diff: sh.clear.scrollback ## Git diff
	git diff

g.log.graph: sh.clear.scrollback ## Git log graph (arg: limit)
ifdef limit
	git log --graph --max-count $(limit)
else
	git log --graph
endif

g.log.short: sh.clear.scrollback ## Git log one-liners (+ time and author) (arg: limit)
ifdef limit
	git log --graph \
	--pretty='%Cred%h%Creset - %s %Cgreen(%ar)%C(bold blue)<%an>%Creset%C(auto)%d%Creset' \
	--max-count $(limit)
else
	git log --graph \
	--pretty='%Cred%h%Creset - %s %Cgreen(%ar)%C(bold blue)<%an>%Creset%C(auto)%d%Creset'
endif

g.log.short.files: sh.clear.scrollback ## Git log one-liners (+ time and author) and file list (arg: limit)
ifdef limit
	git log --graph \
	--pretty='%Cred%h%Creset - %s %Cgreen(%ar)%C(bold blue)<%an>%Creset%C(auto)%d%Creset' \
	--stat --max-count $(limit)
else
	git log --graph \
	--pretty='%Cred%h%Creset - %s %Cgreen(%ar)%C(bold blue)<%an>%Creset%C(auto)%d%Creset' \
	--stat
endif

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

g.remote.show.origin: ## Show remote origin of this repo
	git remote show origin

g.restore.staged: ## Move staged files back to working directory (arg: files)
	git restore --staged $(files)

g.stash: ## Git stash
	git stash

g.stash.pop: ## Git stash pop
	git stash pop

g.status: ## Git status
	git status

.PHONY: g.add g.add.all g.commit g.commit.amend g.commit.amend.push
.PHONY: g.commit.push g.diff g.log.graph g.log.short g.log.short.files
.PHONY: g.pull.rebase g.push g.push.force g.rebase.continue
.PHONY: g.rebase.interactive g.remote.show.origin g.restore.staged g.stash
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

j.tags.filter: sh.clear.scrollback ## Filter journal by tag (arg: name, tags)
	@jrnl $(name) $(tags)
	@echo
	@ncal -w -A 2

j.tags.list: ## List tags in journal (arg: name)
	jrnl $(name) --tags

.PHONY: j.edit j.list j.search j.show j.tags.filter j.tags.list 

# eof #########################################################################
