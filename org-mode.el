(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-agenda-files (list "~/org/gtd.org" "~/org/work.org" "~/org/private.org"))
(setq org-default-notes-file (concat org-directory "/journal.org"))
(setq org-archive-location "archive_gtd.org::datetree/")
(setq org-tag-alist '(("OFFICE" . ?o) ("HOME" . ?h) ("READING" . ?r) ("TV" . ?t) ("COMPUTER" . ?c) ("LUNCHTIME" . ?l) ("FRIENDS" . ?f) ("PROJECT" . ?p)))
(setq org-refile-targets (quote (("~/org/archive_gtd.org" :maxlevel . 2) ("~/org/someday.org" :maxlevel . 2) (org-agenda-files :maxlevel . 2))))
(define-key global-map "\C-cc" 'org-capture)

;;
;; hot keys for fast opening specific org-files
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
(defun private ()
  (interactive)
  (find-file "~/org/private.org")
)
(defun work ()
  (interactive)
  (find-file "~/org/work.org")
)

;;
;; templates for capturing notes and todos
(setq org-capture-templates
      '(("i" "Immediate Todo, goes on tasks list" entry (file+headline "~/org/gtd.org" "Tasks")
	 "* TODO %?\n")
	("t" "New Todo, goes into journal for refiling" entry (file+headline "~/org/journal.org" "Tasks")
	 "* TODO %?\n")
	("j" "Journal" entry (file+datetree "~/org/journal.org")
	 "* %?\n")))

;;
;;"Switch entry to DONE when all subentries are done, to TODO otherwise."
(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
       (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)
