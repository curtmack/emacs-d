;;; Allow loading from emacs-color-theme-solarized
(add-to-list 'custom-theme-load-path
             (expand-file-name "site-lisp/emacs-color-theme-solarized"
                               user-emacs-directory))

;;; Light for graphical frames, dark for terminal frames
(defun set-appropriate-background-mode (frame)
  (let ((mode (if (display-graphic-p frame) 'light 'dark)))
    (set-frame-parameter    frame 'background-mode mode)
    (set-terminal-parameter frame 'background-mode mode)
    (load-theme 'solarized)))

;;; Set up light/dark for new frames
(add-hook 'after-make-frame-functions 'set-appropriate-background-mode)

;;; Set up light/dark initially
(add-hook 'window-setup-hook (lambda ()
                               (mapc
                                'set-appropriate-background-mode
                                (frame-list))))
