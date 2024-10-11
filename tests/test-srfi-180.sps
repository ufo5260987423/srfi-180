#!/usr/bin/env scheme-script
;; -*- mode: scheme; coding: utf-8 -*- !#
;; Copyright (c) 2024 ufo
;; SPDX-License-Identifier: MIT
#!r6rs

(import 
  (chezscheme)
  (srfi :64 testing) 
  (srfi-180)
  (only (srfi :13) string-suffix?))

(test-begin "read&generate")
(map 
  (lambda (path)
        (pretty-print path)
    (call-with-input-file (string-append "./tests/resources/" path)
      (lambda (input-port)
        (let ([s (get-string-all input-port)]
            [output-port (open-output-string)])
          (json-write (json-read (open-input-string s)) output-port)
          (test-equal s (get-output-string output-port))))))
  (filter (lambda (path) (string-suffix? ".json" path)) (directory-list "./tests/resources/"))
)
(test-end)

(exit (if (zero? (test-runner-fail-count (test-runner-get))) 0 1))
