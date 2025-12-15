;=================================================================
; Doom
;=================================================================
(setq doom-font (font-spec :family "IosevkaTerm Nerd Font" :size 30 :weight 'semi-light))
(setq doom-theme 'doom-gruvbox-light)
(setq display-line-numbers-type 'visual)

(require 'cl)


;=================================================================
; email settings
;=================================================================

(eval-when-compile
  (add-to-list 'load-path "/nix/store/0m88mq6p3mdlq6fi6199qmma2cazisfc-emacs-mu4e-1.12.11/share/emacs/site-lisp/elpa/mu4e-1.12.11")
  (require 'use-package))

(use-package mu4e
  :defer 20 ; Wait until 20 seconds after startup
  :config

    (setq user-mail-address "kirkmatt@proton.me")

    (setq mu4e-change-filenames-when-moving t ; avoid sync conflicts
        mu4e-update-interval (* 10 60) ; check mail 10 minutes
        mu4e-compose-format-flowed t ; re-flow mail so it's not hard wrapped
        mu4e-get-mail-command "mbsync -a"
        mu4e-maildir "~/Mail/ProtonMail"
        user-mail-address "kirkmatt@proton.me")

    (setq mu4e-drafts-folder "/Drafts"
        mu4e-sent-folder   "/Sent"
        mu4e-refile-folder "/All Mail"
        mu4e-trash-folder  "/Trash")

    (setq mu4e-maildir-shortcuts
        '(("/inbox"     . ?i)
        ("/Sent"      . ?s)
        ("/Trash"     . ?t)
        ("/Drafts"    . ?d)
        ("/All Mail"  . ?a)))

    (setq message-send-mail-function 'smtpmail-send-it
        auth-sources '("~/.authinfo") ;need to use gpg version but only local smtp stored for now
        smtpmail-smtp-server "127.0.0.1"
        smtpmail-smtp-service 1025
        smtpmail-stream-type  'plain))

;=================================================================
; html publish
;=================================================================

(require 'ox-publish)
(setq org-publish-project-alist
      '(
        ("org-notes"
        :base-directory "~/org/"
        :base-extension "org"
        :publishing-directory "~/public_html/"
        :recursive t
        :publishing-function org-html-publish-to-html
        :headline-levels 4             ; Just the default for this project.
        :auto-preamble t
        )

        ("org-static"
        :base-directory "~/org/"
        :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
        :publishing-directory "~/public_html/"
        :recursive t
        :publishing-function org-publish-attachment
        )
        ("org" :components ("org-notes" "org-static"))      ;; ... add all the components here (see below)...
      ))

;=================================================================
; calendar
;=================================================================

(defun calendar-helper () ;; doesn't have to be interactive
  (cfw:open-calendar-buffer
   :contents-sources
   (list
    (cfw:org-create-source "Purple")
    (cfw:ical-create-source "Uni" "https://scientia-eu-v4-api-d3-02.azurewebsites.net//api/ical/b5098763-4476-40a6-8d60-5a08e9c52964/33ff0a46-42c9-fa35-e710-20a89e30a8cd/timetable.ics" "Red")
    (cfw:ical-create-source "Life" "https://calendar.proton.me/api/calendar/v1/url/1RZQ6qxSo4AGgUOR_cCVlj9d_KXgckkAdOEN0wszIXMvSXALutYgoIiNWltRW2q5_EUdfmwf4zwM2wYdDIPdCA==/calendar.ics?CacheKey=CuxtvSb__5z15LJQckBW7w%3D%3D&PassphraseKey=cHyl07vC-qgAdoCiCQZZZvcItem-zCk6fYfdCnn1_E4%3D" "Black"))))

(defun calendar-init ()
  ;; switch to existing calendar buffer if applicable
  (if-let (win (cl-find-if (lambda (b) (string-match-p "^\\*cfw:" (buffer-name b)))
                           (doom-visible-windows)
                           :key #'window-buffer))
      (select-window win)
    (calendar-helper)))
(defun =my-calendar ()
  "Activate (or switch to) *my* `calendar' in its workspace."
  (interactive)
  (if (modulep! :ui workspaces) ;; create workspace (if enabled)
      (progn
        (+workspace-switch "Calendar" t)
        (doom/switch-to-scratch-buffer)
        (calendar-init)
        (+workspace/display))
    (setq +calendar--wconf (current-window-configuration))
    (delete-other-windows)
    (switch-to-buffer (doom-fallback-buffer))
    (calendar-init)))

;=================================================================
; packages
;=================================================================

(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                          ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

;=================================================================
; emms
; =================================================================
(emms-all)
(setq emms-player-list '(emms-player-mpv)
      emms-info-functions '(emms-info-native))

;=================================================================
; hooks
; =================================================================

(add-hook 'justl-mode-hook (lambda () (evil-local-mode -1)))
(add-hook 'org-mode-hook 'abbrev-hook)
(add-hook 'minibuffer-mode-hook 'abbrev-hook)
(add-hook 'pdf-view-mode-hook 'pdf-view-midnight-minor-mode)
(defun abbrev-hook ()
  (abbrev-mode 1))

;=================================================================
; settings
; =================================================================
(setq! abbrev-file-name "~/Dotfiles/.config/doom/abbrev_defs")
(setq! scroll-margin 8)
(setq! find-file-visit-truename nil)
(setq evil-shift-width 4)
(setq org-startup-with-latex-preview t)
(setq emms-source-file-default-directory "~/music/")
(setq company-mode nil)
(setq emms-repeat-playlist t)
(setq org-icalendar-timezone "Europe/London")
(setq emms-repeat-playlist t)
(setq centaur-tabs-mode nil)
(setq ob-mermaid-cli-path "~/.nix-profile/bin/mmdc")
(setq yas-snippet-dirs '("~/Dotfiles/.config/doom/snippets"))
(setq tab-width 4)
(setq evil-shift-width 4)

;=================================================================
; bindings
; =================================================================

(define-key ctl-x-map "p" 'emms-pause)
(define-key ctl-x-map "P" 'org-pomodoro)
(global-set-key (kbd "M-i") 'ace-window)
(global-set-key (kbd "C-c f") 'org-roam-node-find)
(global-set-key (kbd "C-c i") 'org-roam-node-insert)
(global-set-key (kbd "C-c r") 'org-roam-refile)
(global-set-key (kbd "C-c d m") 'org-roam-dailies-goto-tomorrow)
(global-set-key (kbd "C-c d t") 'org-roam-dailies-goto-today)
(global-set-key (kbd "C-c p d") 'org-pdfview-store-link)
(global-set-key (kbd "M-C-h") help-map)
(global-set-key (kbd "C-h") 'windmove-left)
(global-set-key (kbd "C-l") 'windmove-right)
(global-set-key (kbd "C-j") 'windmove-down)
(global-set-key (kbd "C-k") 'windmove-up)
(global-set-key (kbd "<normal state> L") 'centaur-tabs-forward)
(global-set-key (kbd "<normal state> H") 'centaur-tabs-backward)
(local-unset-key (kbd "C-j"))
(local-unset-key (kbd "C-k"))
(local-unset-key (kbd "S-l"))
(local-unset-key (kbd "S-h"))
(require 's)

;=================================================================
; calendar sync
; =================================================================
;;; define categories that should be excluded
(setq org-export-exclude-category (list "google" "private"))

;;; define filter. The filter is called on each entry in the agenda.
;;; It defines a regexp to search for two timestamps, gets the start
;;; and end point of the entry and does a regexp search. It also
;;; checks if the category of the entry is in an exclude list and
;;; returns either t or nil to skip or include the entry.

(defun org-mycal-export-limit ()
  "Limit the export to items that have a date, time and a range. Also exclude certain categories."
  (setq org-tst-regexp "<\\([0-9]\\{4\\}-[0-9]\\{2\\}-[0-9]\\{2\\} ... [0-9]\\{2\\}:[0-9]\\{2\\}[^\r\n>]*?\
\)>")
  (setq org-tstr-regexp (concat org-tst-regexp "--?-?" org-tst-regexp))
  (save-excursion
    ; get categories
    (setq mycategory (org-get-category))
    ; get start and end of tree
    (org-back-to-heading t)
    (setq mystart    (point))
    (org-end-of-subtree)
    (setq myend      (point))
    (goto-char mystart)
    ; search for timerange
    (setq myresult (re-search-forward org-tstr-regexp myend t))
    ; search for categories to exclude
    (setq mycatp (member mycategory org-export-exclude-category))
    ; return t if ok, nil when not ok
    (if (and myresult (not mycatp)) t nil)))

;;; activate filter and call export function
(defun org-mycal-export ()
  (let ((org-icalendar-verify-function 'org-mycal-export-limit))
   (org-export-icalendar-combine-agenda-files)))

;=================================================================
; org
; =================================================================

(custom-set-variables
 '(org-directory "~/org")
 '(diary-file "~/org/diary.org"))

(setq org-agenda-files
      (append
       (directory-files-recursively (expand-file-name "~/org/agenda")  "\\.org$")))

(setq org-tag-alist (quote ((:startgroup)
                            ("@uniLibrary". ?u)
                            ("@withlib". ?w)
                            ("@home" . ?h)
                            (:endgroup))))

(setq org-default-notes-file (concat org-directory "/notes.org"))
(add-hook 'org-mode-hook
          (lambda ()
            (evil-define-key 'normal org-mode-map (kbd "C-k") nil)
            (evil-define-key 'normal org-mode-map (kbd "C-j") nil)))

(add-hook 'evil-mode-hook
          (lambda ()
            (evil-define-key 'normal evil-org-mode-map (kbd "S-h") nil)
            (evil-define-key 'normal evil-org-mode-map (kbd "S-l") nil)))

(define-key evil-motion-state-map (kbd "H") nil)
(define-key evil-motion-state-map (kbd "L") nil)

(add-to-list 'org-agenda-custom-commands
             '("b" agenda "Today's Deadlines"
               ((org-agenda-span 'day)
                (org-agenda-skip-function '(org-agenda-skip-deadline-if-not-today))
                (org-agenda-entry-types '(:deadline))
                (org-agenda-overriding-header "Today's Deadlines "))))

(setq org-roam-capture-templates
    '(("d" "default" plain "%?"
       :target (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                          "#+title: ${title}\n")
       :unnarrowed t))
)

;=================================================================
; TODO
; =================================================================
(setq org-todo-keywords '((sequence "TODO" "|" "DONE" "HOLD")
                          (sequence "PRAC" "|" "COMP")))

;=================================================================
; jupyter
; =================================================================

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (julia . t)
   (python . t)
   (jupyter . t)))

(setq ob-async-no-async-languages-alist '("jupyter-python"))
(setq gnutls-trustfiles
      (append gnutls-trustfiles
              '("~/.jupyter/jupyter.crt")))
(setq ob-async-no-async-languages-alist '("jupyter-python"))

;=================================================================
; el gantt
;=================================================================

(add-to-list 'load-path "~/Dotfiles/.config/doom/lisp/elgantt/")
(require 'elgantt)
(setq elgantt-agenda-files "~/org/agenda/diss_index.org")
(setq elgantt-user-set-color-priority-counter 0)
(elgantt-create-display-rule draw-scheduled-to-deadline
  :parser ((elgantt-color . ((when-let ((colors (org-entry-get (point) "ELGANTT-COLOR")))
                               (s-split " " colors)))))
  :args (elgantt-scheduled elgantt-color elgantt-org-id)
  :body ((when elgantt-scheduled
           (let ((point1 (point))
                 (point2 (save-excursion
                           (elgantt--goto-date elgantt-scheduled)
                           (point)))
                 (color1 (or (car elgantt-color)
                             "white"))
                 (color2 (or (cadr elgantt-color)
                             "yellow")))
             (when (/= point1 point2)
               (elgantt--draw-gradient
                color1
                color2
                (if (< point1 point2) point1 point2) ;; Since cells are not necessarily linked in
                (if (< point1 point2) point2 point1) ;; chronological order, make sure they are sorted
                nil
                `(priority ,(setq elgantt-user-set-color-priority-counter
                                  (1- elgantt-user-set-color-priority-counter))
                           ;; Decrease the priority so that earlier entries take
                           ;; precedence over later ones (note: it doesn’t matter if the number is negative)
                           :elgantt-user-overlay ,elgantt-org-id)))))))
(setq elgantt-header-type 'outline
      elgantt-insert-blank-line-between-top-level-header t
      elgantt-startup-folded nil
      elgantt-show-header-depth t
      elgantt-draw-overarching-headers t)
