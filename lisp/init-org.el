;; Copyright (C) 2022  Matthias Paulmier

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

(require 'init-functions)

(use-package org
  :ensure nil
  :bind (("C-c a" . org-agenda)
         ("C-c c" . org-capture)
         ("C-c o" . #'mp/browse-org-dir)
         ("C-c x w" . #'org-copy-region-as-markdown))
  :custom
  (org-export-backends '(ascii html icalendar latex odt md))
  (org-startup-folded 'overview)
  (org-log-into-drawer t)
  (org-todo-keywords '("TODO(t)" "WAIT(w@)" "NEXT(n!)" "|" "DONE(d!)" "CANCELLED(c@)"))
  (org-capture-templates
   `(("t" "Task")
     ("tt" "New Task" entry (file ,(concat mp/org-directory "inbox.org"))
      "* TODO %?\n %U\n %a\n %i" :empty-lines 1)
     ("c" "Call")
     ("cc")))
  :init
  (require 'org-capture)
  :config
  (setq-default org-agenda-files '()
                initial-major-mode 'org-mode
                initial-scratch-message "#+TITLE: Scratch buffer\n\n")
  (dolist (file '("todo.org" "habits.org"))
    (add-to-list 'org-agenda-files (concat mp/org-directory file))))

(use-package org-bullets
  :ensure t
  :hook (org-mode . org-bullets-mode))

(provide 'init-org)
