<p align="center">
  <img src="https://raw.githubusercontent.com/wincent/vcs-jump/media/logo.png" />
</p>

# vcs-jump<a name="vcs-jump-vcs-jump" href="#user-content-vcs-jump-vcs-jump"></a>


## Intro<a name="vcs-jump-intro" href="#user-content-vcs-jump-intro"></a>

This plug-in allows you to jump to useful places within a Git or Mercurial repository: diff hunks, merge conflicts, and &quot;grep&quot; results.

The actual work is done by the included `vcs-jump` script, which is a Ruby port of the &quot;git-jump&quot; (shell) script from official Git repo, adapted to work transparently with either Git or Mercurial:

https://git.kernel.org/pub/scm/git/git.git/tree/contrib/git-jump


## Requirements<a name="vcs-jump-requirements" href="#user-content-vcs-jump-requirements"></a>

- A Ruby interpreter must be available on the host system: the `vcs-jump` script uses a &quot;shebang&quot; line of &quot;/usr/bin/env ruby&quot;.


## Installation<a name="vcs-jump-installation" href="#user-content-vcs-jump-installation"></a>

To install vcs-jump, use your plug-in management system of choice.


## Commands<a name="vcs-jump-commands" href="#user-content-vcs-jump-commands"></a>

<p align="right"><a name="vcsjump" href="#user-content-vcsjump"><code>:VcsJump</code></a></p>

### `:VcsJump`<a name="vcs-jump-vcsjump" href="#user-content-vcs-jump-vcsjump"></a>

This command invokes the bundled `vcs-jump` script to get the list of &quot;interesting&quot; locations (diff hunks, merge conflicts, or grep results) in the repo, and put them in the <strong>`quickfix`</strong> list.

Filename completion is available in the context of this command.

Subcommands are:

- &quot;diff&quot;: Results are diff hunks. Arguments are passed on to the Mercurial or Git `diff` invocation. This means that in the absence of any arguments, a diff against the current &quot;HEAD&quot; will be performed, but you can change that by passing options (eg. `--cached`) or specifying a target revision to compare against.
- &quot;merge&quot;: Results are merge conflicts. Arguments are ignored.
- &quot;grep&quot;: Results are grep hits. Arguments are given to the underlying Git or Mercurial `grep` command.


## Mappings<a name="vcs-jump-mappings" href="#user-content-vcs-jump-mappings"></a>


### `<Plug>(VcsJump)`<a name="vcs-jump-plugvcsjump" href="#user-content-vcs-jump-plugvcsjump"></a>

This mapping invokes the bundled `vcs-jump` script, defaulting to &quot;diff&quot; mode.

By default, `<Leader>d` will invoke this mapping unless:

- A mapping with the same <strong>`{lhs}`</strong> already exists; or:
- An alternative mapping to <strong>[`<Plug>(VcsJump)`](#user-content-plugvcsjump)</strong> has already been defined in your <strong>`.vimrc`</strong>.

You can create a different mapping like this:

```
" Use <Leader>g instead of <Leader>d
nmap <Leader>d <Plug>(VcsJump)
```


## Options<a name="vcs-jump-options" href="#user-content-vcs-jump-options"></a>

<p align="right"><a name="gvcsjumploaded" href="#user-content-gvcsjumploaded"><code>g:VcsJumpLoaded</code></a></p>

### `g:VcsJumpLoaded` (any, default: none)<a name="vcs-jump-gvcsjumploaded-any-default-none" href="#user-content-vcs-jump-gvcsjumploaded-any-default-none"></a>

To prevent vcs-jump from being loaded, set <strong>[`g:VcsJumpLoaded`](#user-content-gvcsjumploaded)</strong> to any value in your &quot; <strong>`.vimrc`</strong>. For example:

```
let g:VcsJumpLoaded=1
```


## Website<a name="vcs-jump-website" href="#user-content-vcs-jump-website"></a>

The official vcs-jump source code repo is at:

http://git.wincent.com/vcs-jump.git

A mirror exists at:

https://github.com/wincent/vcs-jump

Official releases are listed at:

http://www.vim.org/scripts/script.php?script_id=5790


## License<a name="vcs-jump-license" href="#user-content-vcs-jump-license"></a>

Copyright 2014-present Greg Hurrell. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS &quot;AS IS&quot; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


## Development<a name="vcs-jump-development" href="#user-content-vcs-jump-development"></a>


### Contributing patches<a name="vcs-jump-contributing-patches" href="#user-content-vcs-jump-contributing-patches"></a>

Patches can be sent via mail to greg@hurrell.net, or as GitHub pull requests at: https://github.com/wincent/vcs-jump/pulls


### Cutting a new release<a name="vcs-jump-cutting-a-new-release" href="#user-content-vcs-jump-cutting-a-new-release"></a>

At the moment the release process is manual:

- Perform final sanity checks and manual testing
- Update the <strong>[`vcs-jump-history`](#user-content-vcs-jump-history)</strong> section of the documentation
- Verify clean work tree:

```
git status
```

- Tag the release:

```
git tag -s -m "$VERSION release" $VERSION
```

- Publish the code:

```
git push origin master --follow-tags
git push github master --follow-tags
```

- Produce the release archive:

```
git archive -o vcs-jump-$VERSION.zip HEAD -- .
```

- Upload to http://www.vim.org/scripts/script.php?script_id=5790


## Authors<a name="vcs-jump-authors" href="#user-content-vcs-jump-authors"></a>

vcs-jump is written and maintained by Greg Hurrell &lt;greg@hurrell.net&gt;.


## History<a name="vcs-jump-history" href="#user-content-vcs-jump-history"></a>


### 0.1 (2 June 2019)<a name="vcs-jump-01-2-june-2019" href="#user-content-vcs-jump-01-2-june-2019"></a>

- Initial release: originally extracted from my dotfiles in https://wincent.com/n/vcs-jump-origin and then iterated on before extracting into a standalone Vim plugin.