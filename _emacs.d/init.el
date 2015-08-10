;; Default frame size
(add-to-list 'default-frame-alist '(width . 128))
(add-to-list 'default-frame-alist '(height . 48))

;; Disable toolbar
(tool-bar-mode -1)

;; Disable scrollbars
(scroll-bar-mode -1)

;; Package archives
(package-initialize)
(require 'package)
(add-to-list 'package-archives
	     '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives
	     '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives
	     '("gnu" . "http://elpa.gnu.org/packages/"))

;; Interactively Do Things
(require 'ido)
(ido-mode t)
