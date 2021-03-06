(setq user-full-name "Sebastian Riedel")
(setq user-mail-address "sebastian.riedel@ultimanet.de")

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

;; Set up el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))

;; set up  use-package
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

;; wanted packages
(use-package autopair
	 :ensure autopair
	 :init (progn
		  ;; Do something after the package is initialized
		))

(use-package company
	 :ensure company
	 :init (progn
		  ;; Do something after the package is initialized
		))

(use-package buffer-move
	 :ensure buffer-move
	 :init (progn
		  ;; Do something after the package is initialized
		))

(use-package flycheck
	 :ensure flycheck
	 :init (progn
		  ;; Do something after the package is initialized
		))

(use-package highlight-symbol
	 :ensure highlight-symbol
	 :init (progn
		  ;; Do something after the package is initialized
		))

(use-package ido-hacks
	 :ensure ido-hacks
	 :init (progn
		  ;; Do something after the package is initialized
		))

(use-package ido-vertical-mode
	 :ensure ido-vertical-mode
	 :init (progn
		  ;; Do something after the package is initialized
		))

(use-package magit
	 :ensure magit
	 :init (progn
		  ;; Do something after the package is initialized
		))
(setq magit-last-seen-setup-instructions "1.4.0")

(use-package multiple-cursors
	 :ensure multiple-cursors
	 :init (progn
		  ;; Do something after the package is initialized
		))

(use-package switch-window
	 :ensure switch-window
	 :init (progn
		  ;; Do something after the package is initialized
		))

(use-package visual-regexp
	 :ensure visual-regexp
	 :init (progn
		  ;; Do something after the package is initialized
		))

(use-package yasnippet
	 :ensure yasnippet
	 :init (progn
		  ;; Do something after the package is initialized
		))

(use-package switch-window
	 :ensure switch-window
	 :init (progn
		  ;; Do something after the package is initialized
		))

(use-package python-mode
	 :ensure python-mode
	 :init (progn
		  ;; Do something after the package is initialized
		))

(use-package flymake
	 :ensure flymake
	 :init (progn
		  ;; Do something after the package is initialized
		))
(global-flycheck-mode t)

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


;; key bindings
(load-theme 'whiteboard t)
(global-set-key (kbd "C-S-f") 'imenu) ;; use iMenu
(global-set-key (kbd "C-x o") 'switch-window)
(global-set-key "\C-xg" 'magit-status)
(global-set-key [f7] 'find-file-in-repository)

(defun ido-find-file-in-tag-files ()
  (interactive)
  (save-excursion
    (let ((enable-recursive-minibuffers t))
      (visit-tags-table-buffer))
    (find-file
     (expand-file-name
      (ido-completing-read
       "Project file: " (tags-table-files) nil t)))))

(global-set-key (kbd "C-S-x C-S-f") 'ido-find-file-in-tag-files)

;; Python mode settings
(add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
(setq py-electric-colon-active t)
(add-hook 'python-mode-hook 'autopair-mode)
(add-hook 'python-mode-hook 'yas-minor-mode)

(add-hook 'python-mode-hook
	  (lambda ()
	    (jedi:setup)
	    (jedi:ac-setup)
	    (local-set-key "\C-cd" 'jedi:show-doc)
	    (local-set-key (kbd "M-SPC") 'jedi:complete)
	    (local-set-key (kbd "M-.") 'jedi:goto-definition)))

(add-hook 'python-mode-hook 'company-mode)

;; load other init files
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
