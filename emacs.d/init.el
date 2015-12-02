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
    color-theme-solarized
    exec-path-from-shell
    flycheck
    py-autopep8))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      selectedPackages)

;; BASIC CUSTOMIZATION
;; -------------------

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; get shell environment when running OS X
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


(require 'column-marker)

(setq column-number-mode t) ;; show column number in status bar
(setq inhibit-startup-message t) ;; hide the startup message
(load-theme 'solarized t) ;; load solarized-light theme
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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (color-theme-solarized solarized-theme py-autopep8 flycheck exec-path-from-shell elpy ein column-marker))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
