;;; HACK: Temporary workaround for debbug 34341
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;;; Initialize package.el
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;;; Add all site-lisp packages to the load path
(defun load-from-children (dir)
  (mapc (lambda (f) (add-to-list 'load-path (expand-file-name f dir)))
	(directory-files dir nil "^[A-Za-z]")))

(load-from-children (expand-file-name "site-lisp" user-emacs-directory))

;;; Now that we've done that, load use-package (only needed at compile time)
(eval-when-compile
  (require 'use-package))

;;; Always load nonexistant packages from ELPA
(setq use-package-always-ensure t)

;;; Load all .el files in el.d in alphabetical order
(defun load-directory (dir)
  (mapc (lambda (f) (load-file (expand-file-name f dir)))
	(directory-files dir nil "\\.el$")))

(load-directory (expand-file-name "conf.d/" user-emacs-directory))

;;; Emacs can park its junk below this line
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#2c3e50" "#e74c3c" "#2ecc71" "#f1c40f" "#3498db" "#9b59b6" "#3498db" "#e0e0e0"])
 '(ansi-term-color-vector
   [unspecified "#2c3e50" "#e74c3c" "#2ecc71" "#f1c40f" "#3498db" "#9b59b6" "#3498db" "#e0e0e0"] t)
 '(c-backspace-function (quote sp-backward-delete-char))
 '(c-basic-offset 4)
 '(c-default-style
   (quote
    ((c-mode . "k&r")
     (c++-mode . "k&r")
     (java-mode . "java")
     (awk-mode . "awk")
     (other . "k&r"))))
 '(c-delete-function (quote sp-delete-char))
 '(c-offsets-alist
   (quote
    ((statement-case-intro . *)
     (case-label . *)
     (access-label . /))))
 '(company-clang-arguments (quote ("--std=c++14")))
 '(compilation-message-face (quote default))
 '(cperl-close-paren-offset -4)
 '(cperl-electric-backspace-untabify nil)
 '(cperl-electric-parens-mark nil)
 '(cperl-fix-hanging-brace-when-indent nil)
 '(cperl-indent-level 4)
 '(cperl-indent-parens-as-block t)
 '(cperl-label-offset -2)
 '(cperl-under-as-char t)
 '(csv-separators (quote ("|")))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(cursor-in-non-selected-windows (quote hollow))
 '(cursor-type (quote box))
 '(custom-safe-themes
   (quote
    ("8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "6271fc9740379f8e2722f1510d481c1df1fcc43e48fa6641a5c19e954c21cc8f" "36746ad57649893434c443567cb3831828df33232a7790d232df6f5908263692" "aea30125ef2e48831f46695418677b9d676c3babf43959c8e978c0ad672a7329" "5a39d2a29906ab273f7900a2ae843e9aa29ed5d205873e1199af4c9ec921aaab" "1025e775a6d93981454680ddef169b6c51cc14cea8cb02d1872f9d3ce7a1da66" "808b47c5c5583b5e439d8532da736b5e6b0552f6e89f8dafaab5631aace601dd" "e1498b2416922aa561076edc5c9b0ad7b34d8ff849f335c13364c8f4276904f0" "264b639ee1d01cd81f6ab49a63b6354d902c7f7ed17ecf6e8c2bd5eb6d8ca09c" "d9dab332207600e49400d798ed05f38372ec32132b3f7d2ba697e59088021555" "36282815a2eaab9ba67d7653cf23b1a4e230e4907c7f110eebf3cdf1445d8370" "73ad471d5ae9355a7fa28675014ae45a0589c14492f52c32a4e9b393fcc333fd" "16dd114a84d0aeccc5ad6fd64752a11ea2e841e3853234f19dc02a7b91f5d661" "cbd8e65d2452dfaed789f79c92d230aa8bdf413601b261dbb1291fb88605110c" "77a46326228485699b378a8537f9bc5d6b0d087566ac179bec752fab322d814a" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "93268bf5365f22c685550a3cbb8c687a1211e827edc76ce7be3c4bd764054bad" default)))
 '(custom-unlispify-tag-names nil)
 '(default-frame-alist (quote ((font . "PragmataPro Mono 11"))))
 '(electric-indent-mode t)
 '(electric-pair-delete-adjacent-pairs nil)
 '(emacs-lisp-docstring-fill-column 80)
 '(fci-rule-color "#073642")
 '(fill-column 80)
 '(geiser-active-implementations (quote (guile mit chicken)))
 '(geiser-autodoc-delay 0.5)
 '(geiser-default-implementation (quote guile))
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(indent-tabs-mode nil)
 '(inferior-lisp-program "sbcl")
 '(inhibit-startup-screen t)
 '(linum-relative-current-symbol "")
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(nxml-attribute-indent 2)
 '(nxml-child-indent 4)
 '(nxml-outline-child-indent 4)
 '(package-selected-packages
   (quote
    (mew stumpwm-mode slime-volleyball slime slime-company web-mode csv-mode helm-ag magit company-c-headers company- shrink-whitespace rainbow-delimiters rainbow-delimeters anzu linum-relative s pos-tip popwin popup dash-functional dash)))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(safe-local-variable-values
   (quote
    ((company-clang-arguments "-std=gnu11" "-pthread" "-I/usr/include/guile/2.0" "-lguile-2.0" "-lgc" "-lgcrypt")
     (company-clang-arguments "-pthread" "-I/usr/include/guile/2.0" "-lguile-2.0" "-lgc" "-lgcrypt")
     (company-clang-arguments "--std=gnu99")
     (company-clang-arguments "--std=gnu17")
     (company-clang-arguments . "gnu17")
     (comment-end-skip)
     (company-clang-arguments "-pthread" "-I/usr/include/guile/2.0" "-lguile-2.0" "-lgc"))))
 '(show-smartparens-global-mode t)
 '(smartparens-global-strict-mode t)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(solarized-bold nil)
 '(tab-width 4)
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#ff7f00")
     (60 . "#ffbf00")
     (80 . "#b58900")
     (100 . "#ffff00")
     (120 . "#ffff00")
     (140 . "#ffff00")
     (160 . "#ffff00")
     (180 . "#859900")
     (200 . "#aaff55")
     (220 . "#7fff7f")
     (240 . "#55ffaa")
     (260 . "#2affd4")
     (280 . "#2aa198")
     (300 . "#00ffff")
     (320 . "#00ffff")
     (340 . "#00ffff")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#fdf6e3" :foreground "#657b83" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 105 :width normal :foundry "fsdf" :family "PragmataPro Mono"))))
 '(markdown-code-face ((t nil)))
 '(mode-line ((t (:background "#eee8d5" :foreground "#586e75" :inverse-video t :box nil :weight bold)))))
(put 'upcase-region 'disabled nil)
