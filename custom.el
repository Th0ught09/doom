(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("bf658d8c16dea1ee035e3bc3c8749965bc248acb1cc2cf0a1b0f7ccb53a4ca56"
     "691d671429fa6c6d73098fc6ff05d4a14a323ea0a18787daeb93fde0e48ab18b" default))
 '(diary-file "~/org/diary.org")
 '(org-agenda-files
   '("~/projects/regli/regli/regli.org"
     "/home/kirkm/org/agenda/20250616203545-x86_schedule.org"
     "/home/kirkm/org/agenda/20250617071133-org_schedule.org"
     "/home/kirkm/org/agenda/20250625082757-pandas_todo.org"
     "/home/kirkm/org/agenda/20250627202040-vim_todo.org"
     "/home/kirkm/org/agenda/20250711145908-emacs_todo.org"
     "/home/kirkm/org/agenda/20250713132754-emacs_schedule.org"
     "/home/kirkm/org/agenda/20250714192150-assembly_schedule.org"
     "/home/kirkm/org/agenda/20250714192223-guitar_schedule.org"
     "/home/kirkm/org/agenda/20250714192243-oss_schedule.org"
     "/home/kirkm/org/agenda/20250714192304-shrt_schedule.org"
     "/home/kirkm/org/agenda/20250714192829-nix_schedule.org"
     "/home/kirkm/org/agenda/20250714193022-haskell_schedule.org"
     "/home/kirkm/org/agenda/20250714193125-chess_schedule.org"
     "/home/kirkm/org/agenda/20250726080620-admin.org"
     "/home/kirkm/org/agenda/20250809090037-stats_schedule.org"
     "/home/kirkm/org/agenda/20250818080514-os_schedule_policies.org"
     "/home/kirkm/org/agenda/20250825135146-schedule.org"
     "/home/kirkm/org/agenda/20250902164026-asm_index.org"
     "/home/kirkm/org/agenda/20250902183723-elisp_index.org"
     "/home/kirkm/org/agenda/20251215181721-sword_world.org"
     "/home/kirkm/org/agenda/20260317195637-day_planner.org"
     "/home/kirkm/org/agenda/admin.org" "/home/kirkm/org/agenda/ads_index.org"
     "/home/kirkm/org/agenda/agile_index.org"
     "/home/kirkm/org/agenda/calendar.org"
     "/home/kirkm/org/agenda/chip_multiprogramming_index.org"
     "/home/kirkm/org/agenda/cl_index.org"
     "/home/kirkm/org/agenda/day_schedule.org"
     "/home/kirkm/org/agenda/diss_index.org"
     "/home/kirkm/org/agenda/dist_index.org"
     "/home/kirkm/org/agenda/emacs_index.org"
     "/home/kirkm/org/agenda/games_index.org"
     "/home/kirkm/org/agenda/godot_index.org"
     "/home/kirkm/org/agenda/haskell_index.org"
     "/home/kirkm/org/agenda/ind_index.org"
     "/home/kirkm/org/agenda/iot_index.org"
     "/home/kirkm/org/agenda/learning_todo.org"
     "/home/kirkm/org/agenda/lin_alg_index.org"
     "/home/kirkm/org/agenda/linux_index.org" "/home/kirkm/org/agenda/logic.org"
     "/home/kirkm/org/agenda/mc_index.org"
     "/home/kirkm/org/agenda/meaning_index.org"
     "/home/kirkm/org/agenda/ml_index.org"
     "/home/kirkm/org/agenda/nix_index.org"
     "/home/kirkm/org/agenda/nix_todo.org"
     "/home/kirkm/org/agenda/notes_todo.org"
     "/home/kirkm/org/agenda/os_index.org" "/home/kirkm/org/agenda/refuze.org"
     "/home/kirkm/org/agenda/refuze.todo.org"
     "/home/kirkm/org/agenda/rust_index.org"
     "/home/kirkm/org/agenda/stats_index.org" "/home/kirkm/org/agenda/todo.org"
     "/home/kirkm/org/agenda/ux_index.org"
     "/home/kirkm/org/agenda/vim_index.org"
     "/home/kirkm/org/agenda/website_index.org"
     "/home/kirkm/org/recall/20250915191341-distributed_system.org"
     "/home/kirkm/org/recall/agile.org" "/home/kirkm/org/recall/cities.org"
     "/home/kirkm/org/recall/cmp.org" "/home/kirkm/org/recall/dist.org"
     "/home/kirkm/org/recall/iot.org" "/home/kirkm/org/recall/italian.org"
     "/home/kirkm/org/recall/lc_revision.org" "/home/kirkm/org/recall/mil.org"
     "/home/kirkm/org/recall/palace.org" "/home/kirkm/org/recall/spanish.org"
     "/home/kirkm/org/recall/ux_revision.org" "/home/kirkm/org/todos.org"))
 '(org-capture-templates
   '(("t" "Personal todo" entry (file+headline +org-capture-todo-file "Inbox")
      "* [ ] %?\12%i\12%a" :prepend t)
     ("n" "Personal notes" entry (file+headline +org-capture-notes-file "Inbox")
      "* %u %?\12%i\12%a" :prepend t)
     ("j" "Journal" entry (file+olp+datetree +org-capture-journal-file)
      "* %u %?\12%i\12%a" :prepend t)
     ("p" "Templates for projects")
     ("pt" "Project-local todo" entry
      (file+headline +org-capture-project-todo-file "Inbox")
      "* TODO %?\12%i\12%a" :prepend t)
     ("pn" "Project-local notes" entry
      (file+headline +org-capture-project-notes-file "Inbox")
      "* %U %?\12%i\12%a" :prepend t)
     ("pc" "Project-local changelog" entry
      (file+headline +org-capture-project-changelog-file "Unreleased")
      "* %U %?\12%i\12%a" :prepend t)
     ("o" "Centralized templates for projects")
     ("ot" "Project todo" entry #'+org-capture-central-project-todo-file
      "* TODO %?\12 %i\12 %a" :heading "Tasks" :prepend nil)
     ("on" "Project notes" entry #'+org-capture-central-project-notes-file
      "* %U %?\12 %i\12 %a" :prepend t :heading "Notes")
     ("oc" "Project changelog" entry
      #'+org-capture-central-project-changelog-file "* %U %?\12 %i\12 %a"
      :prepend t :heading "Changelog")))
 '(org-directory "~/org")
 '(org-roam-directory "/home/kirkm/org/")
 '(package-selected-packages
   '(ace-window cabal-mode chess corfu corfu-candidate-overlay djvu el-get ess
     exercism gdscript-mode ghci-completion gnuplot haskell-mode helm-R html2org
     julia-snail jupyter justl leetcode lsp-haskell lsp-mode nasm-mode nov
     ob-ipython ob-latex-as-png ob-mermaid ob-nix org-drill org-pdftools
     org-pomodoro org-ql org-roam org-roam-ui org-trello pdf-tools persist
     rustic sx tldr uv-mode wiki-summary wikinfo x86-lookup)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq! gdb-many-windows t)
