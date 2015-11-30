;; init.el --- Emacs configuration

;; INSTALL PACKAGES
;; ----------------

(setq tls-checktrust 'ask)

(require 'package)

(add-to-list 'package-archives
       '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar selectedPackages 
  '(ein
    elpy
    flycheck
    py-autopep8
    solarized-theme))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      selectedPackages)

;; BASIC CUSTOMIZATION
;; -------------------

(setq inhibit-startup-message t) ;; hide the startup message
(load-theme 'solarized-light t) ;; load solarized-light theme
(global-linum-mode t) ;; enable line numbers globally
(scroll-bar-mode -1)
(tool-bar-mode -1)

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
