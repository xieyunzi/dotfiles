#!/usr/bin/env bash
if [[ ! $DOT_SHELL_LIB_CHECKS -eq 1 ]]; then
DOT_SHELL_LIB_CHECKS=1

# find usage from the `man bash` pages (especially the CONDITIONAL EXPRESSIONS section)
# checks (stolen from zshuery)
if [[ $(uname) = 'Linux'   ]] >/dev/null 2>&1; then export IS_LINUX=1; fi
if [[ $(uname) = 'Darwin'  ]] >/dev/null 2>&1; then export IS_MAC=1; fi
if [[ -x $(which brew)     ]] >/dev/null 2>&1; then export HAS_BREW=1; fi
if [[ -x $(which apt-get)  ]] >/dev/null 2>&1; then export HAS_APT=1; fi
if [[ -x $(which yum)      ]] >/dev/null 2>&1; then export HAS_YUM=1; fi
if [[ -x $(which nvim)     ]] >/dev/null 2>&1; then export HAS_NVIM=1; fi

fi
