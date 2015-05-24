;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; General Settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq user-full-name "Sebastian Riedel")
(setq user-mail-address "sebastian.riedel@ultimanet.de")

;; Set abbrev file
(setq abbrev-file-name "~/.emacs.d/abbrev_defs")

;; Ask "y" or "n" instead of "yes" or "no". Yes, laziness is great.
(fset 'yes-or-no-p 'y-or-n-p)

;; Highlight corresponding parentheses when cursor is on one
(show-paren-mode t)

;; Highlight tabulations
(setq-default highlight-tabs t)

;; Show trailing white spaces
(setq-default show-trailing-whitespace t)

;; Remove useless whitespace before saving a file
(add-hook 'before-save-hook 'whitespace-cleanup)
(add-hook 'before-save-hook (lambda() (delete-trailing-whitespace)))

;; Save backup files in a dedicated directory
(setq backup-directory-alist '(("." . "~/.saves")))

;; Set locale to UTF8
(set-language-environment 'utf-8)
(set-terminal-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; When splitting a window, move cursor to the new window
(global-set-key "\C-x2" (lambda () (interactive)(split-window-vertically) (other-window 1)))
(global-set-key "\C-x3" (lambda () (interactive)(split-window-horizontally) (other-window 1)))

;; use shift to move around windows
(windmove-default-keybindings 'meta)

;; use firefox as default browser
(setq browse-url-browser-function 'browse-url-firefox)

;; save last session
(desktop-save-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Use Package - Setup
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.org/packages/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (progn
    (package-refresh-contents)
    (package-install 'use-package)))

(require 'use-package)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Packages to Install if necessary
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq py-install-directory "~/.emacs.d/elpa/python-mode-20150327.438/")
(add-to-list 'load-path py-install-directory)
(add-to-list 'load-path "~/software/helm-bibtex/")

(use-package python-mode
	 :ensure python-mode
	 :init (progn
		  ;; Do something after the package is initialized
		))

(use-package autopair
	 :ensure autopair
	 :init (progn
		  ;; Do something after the package is initialized
		))

(use-package auto-complete
	 :ensure auto-complete
	 :init (progn
		  ;; Do something after the package is initialized
		))

(use-package flycheck
	 :ensure flycheck
	 :init (progn
		  ;; Do something after the package is initialized
		))

(setq magit-last-seen-setup-instructions "1.4.0")
(use-package magit
	 :ensure magit
	 :init (progn
		  ;; Do something after the package is initialized
		))

(use-package yasnippet
	 :ensure yasnippet
	 :init (progn
		  ;; Do something after the package is initialized
		))

(use-package find-file-in-repository
	 :ensure find-file-in-repository
	 :init (progn
		  ;; Do something after the package is initialized
		))

(use-package python-environment
	 :ensure python-environment
	 :init (progn
		  ;; Do something after the package is initialized
		))

(use-package jedi
	 :ensure jedi
	 :init (progn
		  ;; Do something after the package is initialized
		))

(use-package virtualenv
	 :ensure virtualenv
	 :init (progn
		  ;; Do something after the package is initialized
		))

(use-package sublimity
	 :ensure sublimity
	 :init (progn
		  ;; Do something after the package is initialized
		 ))

(use-package helm
	 :ensure helm
	 :init (progn
		  ;; Do something after the package is initialized
		 ))

(use-package projectile
      :ensure projectile
      :init (progn
	       ;; Do something after the package is initialized
	      ))

(use-package helm-projectile
	 :ensure helm-projectile
	 :init (progn
		  ;; Do something after the package is initialized
		 ))

(use-package switch-window
	 :ensure switch-window
	 :init (progn
		  ;; Do something after the package is initialized
		))

(use-package parsebib
	 :ensure parsebib
	 :init (progn
		  ;; Do something after the package is initialized
		))

(use-package s
	 :ensure s
	 :init (progn
		  ;; Do something after the package is initialized
		))

(use-package f
	 :ensure f
	 :init (progn
		  ;; Do something after the package is initialized
		))

(use-package dash
	 :ensure dash
	 :init (progn
		  ;; Do something after the package is initialized
		))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Package-Specific Settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; switch window
(global-set-key (kbd "C-x o") 'switch-window)

;; flycheck
(global-flycheck-mode t)

;; ---- magit
(require 'magit)
(global-set-key "\C-xg" 'magit-status)

;; ---- others
(require 'auto-complete)
(require 'autopair)
(require 'yasnippet)
(require 'flycheck)
(global-flycheck-mode t)
;;(global-set-key [f7] 'find-file-in-repository)

;; ---- sublimity
(require 'sublimity)
(require 'sublimity-scroll)
(sublimity-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Load other init files
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defconst user-init-dir
  (cond ((boundp 'user-emacs-directory)
	 user-emacs-directory)
	((boundp 'user-init-directory)
	 user-init-directory)
	(t "~/.emacs.d/")))


(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))

(load-user-file "org-mode.el")
(load-user-file "conf-helm.el")
