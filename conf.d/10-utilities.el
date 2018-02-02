;;; RMS, I love you, but this is nuts
(setq sentence-end-double-space nil)

;;; linum mode
(add-hook 'prog-mode-hook (lambda ()
                            (linum-mode 1)))

;;; This snippet adds one space after the default line numbering in console
(unless window-system
  (add-hook 'linum-before-numbering-hook
    (lambda ()
      (setq-local linum-format-fmt
	(let ((w (length (number-to-string
			  (count-lines (point-min) (point-max))))))
	  (concat " %" (number-to-string w) "d "))))))

(defun linum-format-func (line)
  (propertize (format linum-format-fmt line) 'face 'linum))

(unless window-system
  (setq linum-format 'linum-format-func))

;;; Some neat stuff
(use-package anzu
  :diminish anzu-mode
  :config
  (progn
    (global-anzu-mode +1)))

(use-package comment-tags)

(use-package powerline
  :config
  (progn
    (powerline-default-theme)))

(use-package rainbow-delimiters
  :config
  (progn
    (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)))

(use-package shrink-whitespace
  :bind (("M-\\" . shrink-whitespace)))

(use-package undo-tree
  :diminish (undo-tree-mode . " U")
  :config
  (progn
    (global-undo-tree-mode)))

(use-package which-key
  :diminish which-key-mode
  :config
  (progn
    (which-key-mode)))

;;; VCS stuff
(use-package magit
  :bind (("C-x g" . magit-status)))

(use-package git-commit)
