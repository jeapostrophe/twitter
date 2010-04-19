#lang scribble/manual
@(require (for-label scheme/base
                     scheme/gui
                     scheme/contract
                     "main.ss"))

@title{Twitter}
@author{@(author+email "Jay McCarthy" "jay@plt-scheme.org")}

A Twitter API.

@defmodule[(planet jaymccarthy/twitter)]

@defproc[(tweet! [username string?]
                 [password string?]
                 [status (string-len/c 140)])
         void]

Tweets @scheme[status] using @scheme[username] as the username and @scheme[password] as the password with HTTP Basic Authentication.