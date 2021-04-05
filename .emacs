
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'dired-x)

;; TODO atal: Add shortcut key to toggle line numbers -- don't want it globally, as it slows org-mode up/down navigation
;; TODO atal: Consider tabber-mode or tabber-ruler (http://ergoemacs.org/emacs/emacs_make_modern.html)
;; TODO atal: Consider undo-tree.el (http://ergoemacs.org/emacs/emacs_best_redo_mode.html)

(savehist-mode 1) ; Save minibuffer history across restarts
(visual-line-mode 1) ; Word wrap
(column-number-mode 1) ; Display current row and column in the mode line
(desktop-save-mode 1) ; Save session state across restarts
(setq ring-bell-function 'ignore) ; Disable audible and visual bell

;; ==============================================================================
;; Spell Checker
;; ==============================================================================
;; TODO atal: Look into (setq ispell-program-name "aspell" ispell-extra-args '("--sug-mode=ultra")) as suggested in http://emacs-fu.blogspot.co.il/2009/12/automatically-checking-your-spelling.html.
(setq ispell-program-name "/usr/local/bin/aspell")
(flyspell-mode 1)

;; ==============================================================================
;; org-mode
;; ==============================================================================

;; Load org-mode
;;(add-to-list 'load-path "/Users/atal/.emacs.d/org-8.2.6/lisp")
;;(add-to-list 'load-path "/Users/atal/.emacs.d/org-8.2.6/contrib/lisp")

;; org key bindings
(global-set-key (kbd "\C-cc") 'org-capture)
(global-set-key (kbd "\C-cl") 'org-store-link)
(global-set-key (kbd "\C-ca") 'org-agenda)
(global-set-key (kbd "\C-cb") 'org-iswitchb)

;; Add all .org files to agenda list
(setq org-agenda-files (list "~/gdrive/hgwd" "~/gdrive/hgwd/voc" "~/gdrive/hgwd/athena" "~/gdrive/hgwd/mna" "~/gdrive/hgwd/Media Analytics" "~/gdrive/hgwd/mpa"))

;; Disallow editing of hidden text
(setq org-catch-invisible-edits 'error)

;; Enable org-indent-mode
(setq org-startup-indented 1)

;; Add extra TODO states
(setq org-todo-keywords '((sequence "TODO(t)" "|" "DONE(d)" "CANCELED(c)")))

;; Log a timestamp when a TODO item is closed
(setq org-log-done 'time)

;; Set agenda week views to start on Sunday
(setq org-agenda-start-on-weekday 0)

;; Make M-Ret insert heading after the current subtree.
;; Necessary because Aquamacs steals C-Ret.
(setq org-insert-heading-respect-content t)

;; Make <RET> follow the hyperlink at point
(setq org-return-follows-link t)

;; Show completion suggestions when typing in the minibuffer
(setq icomplete-mode t)

;; Enable Markdown export
(eval-after-load "org"
  '(require 'ox-md nil t))

;; Enable Melpa package manager
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

;; TODO atal: Configure MobileOrg
;; TODO atal: Extract "~/gdrive/hgwd/" to a constant
(setq org-directory "~/gdrive/hgwd")
(setq org-mobile-directory "~/MobileOrg")
(setq org-mobile-inbox-for-pull "~/MobileOrg/from-mobile.org")
(setq org-mobile-force-id-on-agenda-items nil)

;; TODO atal: Find the git commit that added this and update the "@@@" below
;; TODO atal: Doesn't work yet -- was only introduced in @@@
;; TODO atal: Find a way to be notified when this feature gets released
;; (setq org-html-checkbox-type 'html)

(setq org-default-notes-file "~/gdrive/hgwd/capture.org")


;; ==============================================================================
;; ack-and-a-half
;; ==============================================================================
(add-to-list 'load-path "/Users/atal/elisp/ack-and-a-half")
(require 'ack-and-a-half)
(defalias 'ack 'ack-and-a-half)
(defalias 'ack-same 'ack-and-a-half-same)
(defalias 'ack-find-file 'ack-and-a-half-find-file)
(defalias 'ack-find-file-same 'ack-and-a-half-find-file-same)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-html-doctype "html5")
 '(package-selected-packages (quote (htmlize org-plus-contrib org magit adoc-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)
