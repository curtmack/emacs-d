(use-package projectile
  :delight '(:eval (concat " " (projectile-project-name)))
  :config
  (progn
    (projectile-mode)))

(use-package helm-projectile
  :config
  (helm-projectile-on))
