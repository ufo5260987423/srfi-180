;; -*- mode: scheme; coding: utf-8 -*-
;; Copyright (c) 2024 ufo
;; SPDX-License-Identifier: MIT
#!r6rs

(library (srfi-180)
  (export 
    json-number-of-character-limit
    json-nesting-depth-limit
    json-null?
    json-error?
    json-error-reason
    json-fold
    json-generator
    json-read
    json-lines-read
    json-sequence-read
    json-accumulator
    json-write)

  (import 
    (chezscheme)
	  (srfi :145)
	  (only (srfi :60) arithmetic-shift bitwise-ior))

(define (%read-error? x) (error? x))

(define (valid-number? string)
	(number? (string->number string)))
    (include "body.scm")
)
