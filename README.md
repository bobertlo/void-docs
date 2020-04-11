# Void Documentation

Welcome to void-docs, the documentation repository for the [Void Linux
Project](https://github.com/void-linux). This repository contains the source
data behind <https://docs.voidlinux.org/>. Contributing to this repository
follows the same protocol as the packages tree.

## Style Guide

This style guide outlines the standards for contributing to the
[void-docs](https://github.com/void-linux/void-docs/) project. The Handbook is
generated from an [mdBook](https://rust-lang-nursery.github.io/mdBook/) stored
in the [void-docs](https://github.com/void-linux/void-docs/) repository.

### Formatting

For markdown formatting, the
[void-docs](https://github.com/void-linux/void-docs/) project uses the
[Versioned Markdown](https://github.com/bobertlo/vmd) format, and enforces use
of the auto-formatter `vmdfmt`, which works very similarly to `gofmt`. Most
valid markdown is accepted by the formatter. The output format is described in
the project's [README](https://github.com/bobertlo/vmd/blob/master/README.md).

Void provides the package `vmdfmt`. Otherwise you may `go get` from the repo:

```
$ go get https://github.com/bobertlo/vmd/cmd/vmdfmt
```

To format a file you have edited, run:

```
vmdfmt -w <filepath>
```

To format the entire *mdBook* from the repository root, outputting a list of
files modified, run:

```
vmdfmt -w -l .
```

### Commands

Command code-blocks should start with a `#` or `$` character, indicating whether
the command should be run as `root` or a regular user, respectively.

For example:

```
# vi /etc/fstab
```

And not:

```
$ sudo vi /etc/fstab
```

And also not:

```
vi /etc/fstab
```

Command code-blocks should not be used to describe routine tasks documented
elsewhere in this Handbook. For example, when writing documentation for the
`foo` package, do not provide a command code-block stating that one should
install it via `xbps-install foo`.

### Links

#### Man Page Links

Including links to man page is encouraged. These links should point to their man
page on `https://docs.voidlinux.org`, have their title section number in
parenthesis, and contain no formatting in their bodies. For example:
[man(1)](https://man.voidlinux.org/man.1), and not
[`man(1)`](https://man.voidlinux.org/man.1).

#### Auto Links

Auto links (links with the same title as URL) should use the following notation:

```
<https://www.example.com/>
```

They should not be formatted like this:

```
[https://www.example.com/](https://www.example.com/)
```

### Case

Filenames and directories should use [kebab
case](https://en.wikipedia.org/wiki/Kebab_case) when splitting words. For
example the filename should be `post-install.md` not `postinstall.md`.

Words that are part of trademarks or well known package names are exempt from
this rule. Examples include `PulseAudio` and `NetworkManager` which are well
known by their squashed names.

### Voice

Prefer the active imperative voice when writing documentation. Consider the
following examples:

- Poor: Now we need to install the CUPS drivers and configure them.
- Better: Install and configure the CUPS drivers, then configure them as shown.

The first version is conversational and friendlier, but contains unnecessary
language that may not be as clear to an non-native English reader. The second
version contains a clear command to act, and a follow up that shows what will be
done next. It is clear both to native English speakers, ESL readers, and to
translators.

## Submitting Changes

Proposed changes should be submitted as pull-requests to the
[void-docs](https://github.com/void-linux/void-docs) repository on
[GitHub](https://github.com/). Please note that, unlike a wiki, submissions will
be reviewed before they are merged. If any changes are required they will need
to be made before a pull-request is accepted. This process is in place to ensure
the quality and standards of the handbook are sustained.

### Requirements

To clone the repository and push changes
[git(1)](https://man.voidlinux.org/git.1) is required, which is available as the
`git` package.

Building the Void Handbook locally requires
[mdBook](https://rust-lang-nursery.github.io/mdBook/), which can be installed
with the `mdBook` package on Void. At the root of the void-docs repository
`mdbook serve` can be run to serve the docs on your localhost.

### Forking

To fork the repository a [GitHub account](https://github.com/join) is needed.
After the account is created follow GitHub's
[guide](https://help.github.com/en/articles/fork-a-repo) on setting up a fork.

Clone the repository onto your computer, enter it, and create a new branch:

```
$ git clone https://github.com/YOUR_USERNAME/void-docs.git
$ cd void-docs
$ git checkout -b <BRANCH_NAME>
```

After editing the file(s), commit the changes and push them to the forked
repository:

```
$ git add <EDITED_FILE(S)>
$ git commit -m "<COMMIT_MESSAGE>"
$ git push --set-upstream origin <BRANCH_NAME>
```

The commit message should be in the form of `section: what was changed`.

Pull requests should only contain a single commit. If a change is made after the
initial commit `git add` the changed files and then run `git commit --amend`.
The updated commit will need to be force pushed: `git push --force`.

If multiple commits are made they will need to be squashed into one with `git
rebase -i HEAD~X` where X is the number of commits that need to be squashed. An
editor will appear to choose which commits to squash. A second editor will
appear to choose the commit message. See
[git-rebase(1)](https://man.voidlinux.org/git-rebase.1) for more information.
The updated commit will need to be force pushed: `git push --force`.
