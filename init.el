;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; General Settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;; When splitting a window, move cursor to the new window
(global-set-key "\C-x2" (lambda () (interactive)(split-window-vertically) (other-window 1)))
(global-set-key "\C-x3" (lambda () (interactive)(split-window-horizontally) (other-window 1)))

;; use shift to move around windows
(windmove-default-keybindings 'meta)

;; use firefox as default browser
(setq browse-url-browser-function 'browse-url-firefox)

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

;; (use-package ido-vertical-mode
;;       :ensure ido-vertical-mode
;;       :init (progn
;;                ;; Do something after the package is initialized
;;              ))

(use-package sublimity
	 :ensure sublimity
	 :init (progn
		  ;; Do something after the package is initialized
		))

;; (use-package projectile
;;       :ensure projectile
;;       :init (progn
;;                ;; Do something after the package is initialized
;;              ))

;; (use-package neotree
;;       :ensure neotree
;;       :init (progn
;;                ;; Do something after the package is initialized
;;              ))
;; (setq projectile-switch-project-action 'neotree-projectile-action)

;; (use-package find-file-in-project
;;       :ensure find-file-in-project
;;       :init (progn
;;                ;; Do something after the package is initialized
;;              ))
;; (setq ffip-project-file ".svn")

;; (use-package flx-ido
;;       :ensure flx-ido
;;       :init (progn
;;                ;; Do something after the package is initialized
;;              ))

(use-package switch-window
	 :ensure switch-window
	 :init (progn
		  ;; Do something after the package is initialized
		))
(global-set-key (kbd "C-x o") 'switch-window)

(use-package helm
	 :ensure helm
	 :init (progn
		  ;; Do something after the package is initialized
		))

(use-package helm-projectile
	 :ensure helm-projectile
	 :init (progn
		  ;; Do something after the package is initialized
		))
(require 'helm-projectile)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Package-Specific Settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ---- magit
(require 'magit)
(global-set-key "\C-xg" 'magit-status)

;; ---- helm
(require 'helm)
(require 'helm-config)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-multi-files)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-c h g") 'helm-google-suggest)
(global-set-key (kbd "C-c h g") 'helm-google-suggest)
(global-set-key (kbd "C-c s") 'helm-org-agenda-files-headings)


(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))


(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t
      helm-M-x-fuzzy-match                  t ; enable fuzzy matching
      helm-buffers-fuzzy-matching           t ; --
      helm-recentf-fuzzy-match              t
      helm-semantic-fuzzy-match t
      helm-imenu-fuzzy-match    t
      helm-google-suggest-default-browser-function 'browse-url-firefox
      helm-surfraw-default-browser-function 'browse-url-firefox
      helm-google-suggest-search-url "http://www.google.com/search?source=ig&hl=en&rlz=1G1GGLQ_ENUS264&q=%s&btnI=I'm+Feeling+Lucky")


(helm-mode 1)
(semantic-mode 1)

;; ---- others
(require 'auto-complete)
(require 'autopair)
(require 'yasnippet)
(require 'flycheck)
(global-flycheck-mode t)
;;(global-set-key [f7] 'find-file-in-repository)
;;(projectile-global-mode)

;; ---- auto-complete mode extra settings
(setq
 ac-auto-start 2
 ac-override-local-map nil
 ac-use-menu-map t
 ac-candidate-limit 20)

;; ---- Python mode settings
(require 'python-mode)
(add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
(setq py-electric-colon-active t)
(add-hook 'python-mode-hook 'autopair-mode)
(add-hook 'python-mode-hook 'yas-minor-mode)

;; ---- Jedi settings
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

;;(ido-mode t)
;;(ido-everywhere 1)
;;(ido-vertical-mode 1)
;;(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
;;(setq ido-enable-flex-matching t)
;;(setq ido-use-faces nil)

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
