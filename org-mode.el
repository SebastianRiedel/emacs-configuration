(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-agenda-files (list "~/org/gtd.org"))
(setq org-default-notes-file (concat org-directory "/journal.org"))
(define-key global-map "\C-cc" 'org-capture)
(defun gtd ()
   (interactive)
   (find-file "~/org/gtd.org")
)
(defun journal ()
   (interactive)
   (find-file "~/org/journal.org")
)
(defun someday ()
   (interactive)
   (find-file "~/org/someday.org")
)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-custom-commands (quote (("H" "Agenda and tagged TODOs" ((agenda "" nil) (tags-todo "{\\(OFFICE\\|HOME\\|COMPUTER\\|FRIENDS\\|READING\\|TV\\)}-SCHEDULED>=\"<2008-10-11>\"" nil)) nil nil) ("D" "Daily Action List" ((agenda "" ((org-agenda-ndays 1) (org-agenda-sorting-strategy (quote ((agenda time-up priority-down tag-up)))) (org-deadline-warning-days 0)))) nil))))
 '(org-refile-targets (quote (("~/org/archive_gtd.org" :maxlevel . 2) ("~/org/someday.org" :maxlevel . 2) ("~/org/gtd.org" :maxlevel . 2))))
 '(org-startup-truncated nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq org-capture-templates
      '(("i" "Immediate Todo, goes on tasks list" entry (file+headline "~/org/gtd.org" "Tasks")
	 "* TODO %?\n")
	("t" "New Todo, goes into journal for refiling" entry (file+headline "~/org/journal.org" "Tasks")
	 "* TODO %?\n")
	("j" "Journal" entry (file+datetree "~/org/journal.org")
	 "* %?\n")))


(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
       (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)
