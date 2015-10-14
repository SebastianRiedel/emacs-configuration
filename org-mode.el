(require 'org)
(autoload 'ox-mediawiki "ox-mediawiki" "" t)
(require 'ox-mediawiki)

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-agenda-files (list "~/org/gtd.org" "~/org/work.org" "~/org/private.org"))
(setq org-agenda-text-search-extra-files (list "~/org/journal.org" "~/org/archive_gtd.org"))
(setq org-default-notes-file (concat org-directory "/journal.org"))
(setq org-archive-location "archive_gtd.org::datetree/")
(setq org-tag-alist '(("OFFICE" . ?o) ("HOME" . ?h) ("READING" . ?r) ("TV" . ?t) ("COMPUTER" . ?c) ("LUNCHTIME" . ?l) ("FRIENDS" . ?f) ("PROJECT" . ?p)))
(setq org-todo-keywords (list "TODO(t)" "STARTED(s)" "WAITING(w!)" "APPT(a)" "|" "DONE(d)" "CANCELLED(c)" "DEFERRED(f)" "DELEGATED(g)"))
(setq org-refile-targets (quote (("~/org/archive_gtd.org" :maxlevel . 2) ("~/org/someday.org" :maxlevel . 2) (org-agenda-files :maxlevel . 2))))
(define-key global-map "\C-cc" 'org-capture)
(setq org-startup-truncated nil)
(setq org-startup-indented 1)
(setq org-log-done 'time)

;;code for filtering agenda items with regexp
;; ((org-agenda-skip-function '(org-agenda-skip-entry-if 'notregexp ":OFFICE:"))

(setq org-agenda-custom-commands (quote (
   ("A" "All TODOs"
       ((agenda "" nil)
	(tags-todo "{\\(OFFICE\\|HOME\\|COMPUTER\\|FRIENDS\\|READING\\|TV\\)}-SCHEDULED>=\"<2008-10-11>\"" nil))
	nil nil)
   ("O" "Office TODOs"
       ((agenda "" nil)
	(tags-todo "{\\(OFFICE\\)}-SCHEDULED>=\"<2008-10-11>\"" nil))
	nil nil)
   ("H" "Home TODOs"
       ((agenda "" nil)
	(tags-todo "{\\(HOME\\|COMPUTER\\|FRIENDS\\|READING\\|TV\\)}-SCHEDULED>=\"<2008-10-11>\"" nil))
	nil nil)
   ("D" "Daily Action List"
       ((agenda "" ((org-agenda-ndays 1)
		    (org-agenda-sorting-strategy (quote ((agenda time-up priority-down tag-up))))
		    (org-deadline-warning-days 0))))
	 nil)

)))

;;(require 'org-publish)
(setq org-export-with-tags nil)
(setq org-export-with-timestamps nil)
(setq org-export-with-toc 2)
(setq org-publish-project-alist
      '(

       ("org-notes"
	:base-directory "~/org/"
	:base-extension "org"
	:publishing-directory "~/org_html/"
	:recursive t
	:publishing-function org-html-publish-to-html
	:headline-levels 10             ; Just the default for this project.
	:auto-preamble t
	)

       ("org-static"
	:base-directory "~/org/"
	:base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
	:publishing-directory "~/org_html/"
	:recursive t
	:publishing-function org-publish-attachment
	)

       ("org" :components ("org-notes" "org-static"))

      ))

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

;; screenshot function
(defun my/img-maker ()
 "Make folder if not exist, define image name based on time/date"
  (setq myvar/img-folder-path (concat default-directory "img/"))

  ; Make img folder if it doesn't exist.
  (if (not (file-exists-p myvar/img-folder-path)) ;[ ] refactor thir and screenshot code.
       (mkdir myvar/img-folder-path))

  (setq myvar/img-name (concat "img_" (format-time-string "%Y_%m_%d__%H_%M_%S") ".png"))
  (setq myvar/img-Abs-Path (concat myvar/img-folder-path myvar/img-name)) ;Relative to workspace.

  (setq myvar/relative-filename (concat "./img/" myvar/img-name))
  (insert "[[" myvar/relative-filename "]]" "\n")
)

(defun my/org-screenshot ()
  "Take a screenshot into a time stamped unique-named file in the
 sub-directory (%filenameIMG) as the org-buffer and insert a link to this file."
  (interactive)
  (my/img-maker)
  ;(make-frame-invisible)
  (lower-frame)
  (call-process "import" nil nil nil myvar/img-Abs-Path)

  (raise-frame)
  ;(make-frame-visible)
  (org-display-inline-images)
)

;; (let ((default-directory (getenv "PAPERS_BASE_DIR")))
;;   (setq bib-file-link-abbrev (expand-file-name "refs.bib::%s"))
;;   (setq paper-vault-link-abbrev (expand-file-name "vault/%s.pdf")))

;; (setq org-link-abbrev-alist
;;       `(("bib" . ,bib-file-link-abbrev)
;;	("notes" . "~/org/work.org::#%s")
;;	("papers" . ,paper-vault-link-abbrev)))


;; ;; org mode research paper organization setup
;; (defun org-mode-reftex-setup ()
;;   (load-library "reftex")
;;   (and (buffer-file-name) (file-exists-p (buffer-file-name))
;;        (progn
;;	 ;enable auto-revert-mode to update reftex when bibtex file changes on disk
;;	 (global-auto-revert-mode t)
;;	 (reftex-parse-all)
;;	 ;add a custom reftex cite format to insert links
;;	 (reftex-set-cite-format
;;	  '((?b . "[[bib:%l][%l-bib]]")
;;	    (?n . "[[notes:%l][%l-notes]]")
;;	    (?p . "[[papers:%l][%l-paper]]")
;;	    (?t . "%t")
;;	    (?h . "** %t\n:PROPERTIES:\n:Custom_ID: %l\n:END:\n[[papers:%l][%l-paper]]")))))
;;   (define-key org-mode-map (kbd "C-c )") 'reftex-citation)
;;   (define-key org-mode-map (kbd "C-c (") 'org-mode-reftex-search))

;; (add-hook 'org-mode-hook 'org-mode-reftex-setup)

;; (defun org-mode-reftex-search ()
;;   ;;jump to the notes for the paper pointed to at from reftex search
;;   (interactive)
;;   (org-open-link-from-string (format "[[notes:%s]]" (first (reftex-citation t)))))
