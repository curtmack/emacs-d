(defun my-create-newline-and-enter-sexp (&rest _ignored)
  "Open a new brace or bracket expression, with relevant newlines and indent."
  (newline)
  (indent-according-to-mode)
  (forward-line -1)
  (indent-according-to-mode))

;;; Enable smartparens with the default configuration and keybindings to make it
;;; work like paredit
(use-package smartparens-config
  :ensure smartparens
  :demand t ; has to be demanded because otherwise use-package gets very confused
  :bind (:map smartparens-mode-map
              ("C-M-f"            . sp-forward-sexp)
              ("C-M-b"            . sp-backward-sexp)

              ("C-M-d"            . sp-down-sexp)
              ("C-M-a"            . sp-backward-down-sexp)
              ("C-S-d"            . sp-beginning-of-sexp)
              ("C-S-a"            . sp-end-of-sexp)

              ("C-M-e"            . sp-up-sexp)
              ("C-M-u"            . sp-backward-up-sexp)
              ("C-M-t"            . sp-transpose-sexp)

              ("C-M-n"            . sp-next-sexp)
              ("C-M-p"            . sp-previous-sexp)

              ("C-M-k"            . sp-kill-sexp)
              ("C-M-w"            . sp-copy-sexp)

              ("M-<delete>"       . sp-unwrap-sexp)
              ("M-<backspace>"    . sp-backward-unwrap-sexp)

              ("C-<right>"        . sp-forward-slurp-sexp)
              ("C-<left>"         . sp-forward-barf-sexp)
              ("C-M-<left>"       . sp-backward-slurp-sexp)
              ("C-M-<right>"      . sp-backward-barf-sexp)

              ("M-D"              . sp-splice-sexp)
              ("C-M-<delete>"     . sp-splice-sexp-killing-forward)
              ("C-M-<backspace>"  . sp-splice-sexp-killing-backward)
              ("M-r"              . sp-splice-sexp-killing-around)

              ("M-]"              . sp-select-next-thing-exchange)
              ("M-["              . sp-select-previous-thing)
              ("C-M-]"            . sp-select-next-thing)

              ("M-F"              . sp-forward-symbol)
              ("M-B"              . sp-backward-symbol)

              ("C-\""             . sp-change-inner)

              ("C-M-;"            . sp-comment)

              ;; It's also nice to have ; by itself bound to sp-comment for lisp
              ;; modes. We'll do that programatically because scheme-mode
              ;; doesn't define its own map (??)
              ;; (";"                . (lambda ()
              ;;                         (interactive)
              ;;                         (if (or (eq major-mode 'emacs-lisp-mode)
              ;;                                 (eq major-mode 'scheme-mode)
              ;;                                 (eq major-mode 'lisp-mode)
              ;;                                 (eq major-mode 'clojure-mode))
              ;;                             (sp-comment)
              ;;                           (self-insert-command ";"))))
              )
  :config
  (progn
    ;; Enable curly brace newline to automatically make a newline and indent in
    ;; c-ish modes
    (cl-macrolet
        ((curly-newline (mode)
                        `(sp-local-pair
                          ,mode "{" nil
                          :post-handlers
                          '((my-create-newline-and-enter-sexp "RET")))))
      (curly-newline 'c-mode)
      (curly-newline 'c++-mode)
      (curly-newline 'java-mode)
      (curly-newline 'cperl-mode))))

;;; Delete trailing whitespace before saving every time
(add-hook 'before-save-hook 'delete-trailing-whitespace)
