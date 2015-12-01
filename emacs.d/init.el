;; init.el --- Emacs configuration

;; INSTALL PACKAGES
;; ----------------

(setq tls-checktrust 'ask) ;; enable HTTPS for package archives

(require 'package)

(add-to-list 'package-archives
       '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar selectedPackages 
  '(column-marker
    ein
    elpy
    exec-path-from-shell
    flycheck
    py-autopep8
    solarized-theme))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      selectedPackages)

;; BASIC CUSTOMIZATION
;; -------------------

;; get shell environment when running OS X
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


(require 'column-marker)

(setq column-number-mode t) ;; show column number in status bar
(setq inhibit-startup-message t) ;; hide the startup message
(load-theme 'solarized-light t) ;; load solarized-light theme
(global-hl-line-mode 1) ;; highlight current line
(global-linum-mode t) ;; enable line numbers globally
(scroll-bar-mode -1) ;; disable scrollbars
(tool-bar-mode -1) ;; disable toolbar

;; PYTHON CONFIGURATION
;; --------------------

(elpy-enable)
(elpy-use-ipython)

;; use flycheck not flymake with elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; enable autopep8 formatting on save
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; columns in Python code
(add-hook 'elpy-mode-hook (lambda () (interactive) (column-marker-1 72)))
(add-hook 'elpy-mode-hook (lambda () (interactive) (column-marker-2 79)))
(add-hook 'elpy-mode-hook (lambda () (interactive) (column-marker-3 99)))
