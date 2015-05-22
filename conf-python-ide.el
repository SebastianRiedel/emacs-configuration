;; ;; ---- auto-complete mode extra settings
;; (setq
;;  ac-auto-start 2
;;  ac-override-local-map nil
;;  ac-use-menu-map t
;;  ac-candidate-limit 20)

;; ;; ---- Python mode settings
;; (require 'python-mode)
;; (add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
;; (setq py-electric-colon-active t)
;; (add-hook 'python-mode-hook 'autopair-mode)
;; (add-hook 'python-mode-hook 'yas-minor-mode)

;; ;; ---- Jedi settings
;; (require 'jedi)
;; ;; It's also required to run "pip install --user jedi" and "pip
;; ;; install --user epc" to get the Python side of the library work
;; ;; correctly.
;; ;; With the same interpreter you're using.

;; ;; if you need to change your python intepreter, if you want to change it
;; ;; (setq jedi:server-command
;; ;;       '("python2" "/home/andrea/.emacs.d/elpa/jedi-0.1.2/jediepcserver.py"))

;; (add-hook 'python-mode-hook
;;	  (lambda ()
;;	    (jedi:setup)
;;	    (jedi:ac-setup)
;;	    (local-set-key "\C-cd" 'jedi:show-doc)
;;	    (local-set-key (kbd "C-M-SPC") 'jedi:complete)
;;	    (local-set-key (kbd "C-M-.") 'jedi:goto-definition)
;;	    ))


;; (add-hook 'python-mode-hook 'auto-complete-mode)
