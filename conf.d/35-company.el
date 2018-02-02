(use-package company
  :diminish company-mode
  :config
  (global-company-mode))

(use-package company-c-headers
  :config
  (add-to-list 'company-backends 'company-c-headers))

(use-package company-restclient
  :config
  (add-to-list 'company-backends 'company-restclient))
