SHELL := /usr/local/bin/zsh

help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-22s\033[0m %s\n", $$1, $$2}'

.PHONY: help

# Git #########################################################################

git.add: ## Git add items (arg: files)
	git add $(files)

git.add.all: ## Git add all
	git add --all

git.branch.show: ## Git show all branches
	git branch -a

git.commit: ## Git commit (arg: msg)
	git commit --message '$(msg)'

git.commit.amend: ## Git commit amend
	GIT_COMMITTER_DATE="$(shell date)" git commit --amend --date "$(shell date)"

git.commit.amend.push: ## Git commit amend and push force
	GIT_COMMITTER_DATE="$(shell date)" git commit --amend --date "$(shell date)"
	git push --force-with-lease

git.commit.push: ## Git commit and push (arg: msg)
	git commit --message '$(msg)'
	git push

git.diff: sh.clear ## Git diff
	git diff

git.log.graph: sh.clear ## Git log graph (arg: limit)
ifdef limit
	git log --graph --max-count $(limit)
else
	git log --graph
endif

git.log.short: sh.clear ## Git log one-liners (+ time and author) (arg: limit)
ifdef limit
	git log --graph \
	--pretty='%Cred%h%Creset - %s %Cgreen(%ar)%C(bold blue)<%an>%Creset%C(auto)%d%Creset' \
	--max-count $(limit)
else
	git log --graph \
	--pretty='%Cred%h%Creset - %s %Cgreen(%ar)%C(bold blue)<%an>%Creset%C(auto)%d%Creset'
endif

git.log.short.files: sh.clear ## Git log one-liners (+ time and author) and file list (arg: limit)
ifdef limit
	git log --graph \
	--pretty='%Cred%h%Creset - %s %Cgreen(%ar)%C(bold blue)<%an>%Creset%C(auto)%d%Creset' \
	--stat --max-count $(limit)
else
	git log --graph \
	--pretty='%Cred%h%Creset - %s %Cgreen(%ar)%C(bold blue)<%an>%Creset%C(auto)%d%Creset' \
	--stat
endif

git.pull.rebase: ## Git pull and rebase current branch after fetch
	git pull --rebase

git.push: ## Git push
	git push

git.push.force: ## Git push
	git push --force-with-lease

git.rebase.continue: ## Git rebase continue
	git rebase --continue

git.rebase.interactive: ## Git rebase interactive (arg: commit=[3e1aa46])
	git rebase --interactive $(commit)

git.remote.show.origin: ## Show remote origin of this repo
	git remote show origin

git.restore.staged: ## Move staged files back to working directory (arg: files)
	git restore --staged $(files)

git.stash: ## Git stash
	git stash

git.stash.pop: ## Git stash pop
	git stash pop

git.status: ## Git status
	git status

.PHONY: git.add git.add.all git.branch.show git.commit git.commit.amend
.PHONY: git.commit.amend.push git.commit.push git.diff git.log.graph
.PHONY: git.log.short git.log.short.files git.pull.rebase git.push
.PHONY: git.push.force git.rebase.continue git.rebase.interactive
.PHONY: git.remote.show.origin git.restore.staged git.stash git.stash.pop git.status

# Jrnl ########################################################################

j.edit: ## Edit journal (arg: name)
	jrnl $(name) --edit

j.list: ## List journals
	jrnl --list

j.search: ## Search journal by text (arg: text)
	jrnl -contains $(text)

j.show: ## Show journal from beginning (arg: name)
	jrnl $(name) -to today

j.show.done: sh.clear.scrollback ## Show tasks done (arg: name)
ifdef name
	@jrnl $(name) -contains ✓
else
	@jrnl -contains ✓
endif
	@echo
	@ncal -w -A 2

j.show.todo: sh.clear.scrollback ## Show tasks todo (arg: name)
ifdef name
	@jrnl $(name) @todo
else
	@jrnl @todo
endif
	@echo
	@ncal -w -A 2

j.tags.filter: sh.clear.scrollback ## Filter journal by tag (arg: name, tags)
	@jrnl $(name) $(tags)
	@echo
	@ncal -w -A 2

j.tags.list: ## List tags in journal (arg: name)
	jrnl $(name) --tags

.PHONY: j.edit j.list j.search j.show j.show.done j.show.todo j.tags.filter
.PHONY: j.tags.list 

# Shell #######################################################################

sh.cal: ## Show 2022 Calendar
	ncal -w 2022

sh.clear: ## Clear screen
	@clear

sh.clear.scrollback: ## Clear screen and reset scrollback
	@clear
	@printf '\e[3J'

# Depends on cloud-drive being available.
sh.create.links: ## Create cloud links
	ln -s ~/cloud-drive/stationhome/jrnl ~/jrnl
	ln -s ~/cloud-drive/stationhome/doc ~/doc
	ln -s ~/cloud-drive/stationhome/pluralsight ~/pluralsight
	ln -s ~/cloud-drive/stationhome/workspaces ~/workspaces

.PHONY: sh.cal sh.clear sh.clear.scrollback sh.create.links

# eof #########################################################################
