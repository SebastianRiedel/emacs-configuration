(setq user-full-name "Sebastian Riedel")
(setq user-mail-address "sebastian.riedel@dlr.de")

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

;; Set up el-get
;; (add-to-list 'load-path "~/.emacs.d/el-get/el-get")
;; (unless (require 'el-get nil 'noerror)
;;   (with-current-buffer
;;       (url-retrieve-synchronously
;;        "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
;;     (let (el-get-master-branch)
;;       (goto-char (point-max))
;;       (eval-print-last-sexp))))

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
(setq py-install-directory "~/.emacs.d/elpa/python-mode-20150327.438/")
(add-to-list 'load-path py-install-directory)
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
(global-flycheck-mode t)

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

(use-package ido-vertical-mode
	 :ensure ido-vertical-mode
	 :init (progn
		  ;; Do something after the package is initialized
		))

(use-package sublimity
	 :ensure sublimity
	 :init (progn
		  ;; Do something after the package is initialized
		))

(use-package projectile
	 :ensure projectile
	 :init (progn
		  ;; Do something after the package is initialized
		))

(use-package neotree
	 :ensure neotree
	 :init (progn
		  ;; Do something after the package is initialized
		))
(setq projectile-switch-project-action 'neotree-projectile-action)

(use-package find-file-in-project
	 :ensure find-file-in-project
	 :init (progn
		  ;; Do something after the package is initialized
		))
(setq ffip-project-file ".svn")

(use-package flx-ido
	 :ensure flx-ido
	 :init (progn
		  ;; Do something after the package is initialized
		))

(use-package switch-window
	 :ensure switch-window
	 :init (progn
		  ;; Do something after the package is initialized
		))
(global-set-key (kbd "C-x o") 'switch-window)


(require 'magit)
(global-set-key "\C-xg" 'magit-status)

(require 'auto-complete)
(require 'autopair)
(require 'yasnippet)
(require 'flycheck)
(global-flycheck-mode t)

(global-set-key [f7] 'find-file-in-repository)

; auto-complete mode extra settings
(setq
 ac-auto-start 2
 ac-override-local-map nil
 ac-use-menu-map t
 ac-candidate-limit 20)

;; ;; Python mode settings
(require 'python-mode)
(add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
(setq py-electric-colon-active t)
(add-hook 'python-mode-hook 'autopair-mode)
(add-hook 'python-mode-hook 'yas-minor-mode)

;; ;; Jedi settings
(require 'jedi)
;; It's also required to run "pip install --user jedi" and "pip
;; install --user epc" to get the Python side of the library work
;; correctly.
;; With the same interpreter you're using.

;; if you need to change your python intepreter, if you want to change it
;; (setq jedi:server-command
;;       '("python2" "/home/andrea/.emacs.d/elpa/jedi-0.1.2/jediepcserver.py"))

(add-hook 'python-mode-hook
	  (lambda ()
	    (jedi:setup)
	    (jedi:ac-setup)
	    (local-set-key "\C-cd" 'jedi:show-doc)
	    (local-set-key (kbd "C-M-SPC") 'jedi:complete)
	    (local-set-key (kbd "C-M-.") 'jedi:goto-definition)
	    ))


(add-hook 'python-mode-hook 'auto-complete-mode)

(ido-mode t)
(ido-everywhere 1)
(ido-vertical-mode 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

(require 'sublimity)
(require 'sublimity-scroll)
(sublimity-mode 1)

(projectile-global-mode)


;; -------------------- extra nice things --------------------
;; use shift to move around windows
(windmove-default-keybindings 'meta)
(show-paren-mode t)
;; Turn beep off

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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-custom-commands (quote (("H" "Agenda and tagged TODOs" ((agenda "" nil) (tags-todo "{\\(OFFICE\\|HOME\\|COMPUTER\\|FRIENDS\\|READING\\|TV\\)}-SCHEDULED>=\"<2008-10-11>\"" nil)) nil nil) ("D" "Daily Action List" ((agenda "" ((org-agenda-ndays 1) (org-agenda-sorting-strategy (quote ((agenda time-up priority-down tag-up)))) (org-deadline-warning-days 0)))) nil))))
 '(org-startup-truncated nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
