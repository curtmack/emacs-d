(use-package clojure-mode
  :commands clojure-mode
  :mode "\\.clj[xs]?\\'")

;; cider must be installed in order for it to hook into clojure-mode properly
(use-package cider :demand t)

(use-package ess   :demand t)

(use-package geiser
  :commands geiser-mode
  :init
  (progn
    (add-hook 'scheme-mode-hook 'geiser-mode)))

(use-package haskell-mode
  :commands haskell-mode
  :mode "\\.hs\\'"
  :interpreter "haskell")

(use-package markdown-mode
  :commands markdown-mode
  :mode "\\.md\\'")

(use-package org
  :commands org-mode
  :mode ("\\.org\\'" . org-mode))

(use-package php-mode
  :commands php-mode
  :mode "\\.php\\'")

(use-package restclient
  :commands restclient-mode
  :mode ("\\.http\\'" . restclient-mode))

(use-package web-mode
  :commands web-mode
  :mode (("\\.[pxs]?html?\\'" . web-mode)
         ("\\.tpl\\'" . web-mode)
         ("\\.[agj]sp\\'" . web-mode)
         ("\\.as[cp]x\\'" . web-mode)
         ("\\.erb\\'" . web-mode)
         ("\\.mustache\\'" . web-mode)
         ("\\.djhtml\\'" . web-mode)))

;;; prefer cperl-mode to perl-mode
(defalias 'perl-mode 'cperl-mode)
;;; cperl setup
;; Disable everything electric
(setq cperl-electric-lbrace-space nil)
(setq cperl-electric-parens nil)
(setq cperl-electric-linefeed nil)
(setq cperl-electric-keywords nil)
(add-hook 'cperl-mode-hook (lambda ()
                             ;; Nilling out these keys is fine, they'll be
                             ;; replaced from the global map
                             (define-key cperl-mode-map "{" 'nil)
                             (define-key cperl-mode-map "[" 'nil)
                             (define-key cperl-mode-map "(" 'nil)
                             (define-key cperl-mode-map "<" 'nil)
                             (define-key cperl-mode-map "}" 'nil)
                             (define-key cperl-mode-map "]" 'nil)
                             (define-key cperl-mode-map ")" 'nil)
                             (define-key cperl-mode-map ";" 'nil)
                             (define-key cperl-mode-map ":" 'nil)
                             ;; This one is a bit more complicated, because it
                             ;; needs to be bound differently if smartparens is
                             ;; active. The easiest way to do it is to just bind
                             ;; it to an interactive lambda that does the right
                             ;; thing.
                             (define-key cperl-mode-map [backspace]
                               (lambda ()
                                 (interactive)
                                 (if (bound-and-true-p smartparens-mode)
                                     (sp-backward-delete-char)
                                   (backward-delete-char))))))

;;; use dired extended commands
(load "dired-x")
