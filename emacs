(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

(setq indent-tabs-mode nil)
(show-paren-mode)

;; ido mode
(require 'ido)
(ido-mode t)

;; Display ido results vertically, rather than horizontally
(setq ido-decorations (quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))
(defun ido-disable-line-truncation () (set (make-local-variable 'truncate-lines) nil))
(add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-truncation)
(defun ido-define-keys () ;; C-n/p is more intuitive in vertical layout
  (define-key ido-completion-map (kbd "C-n") 'ido-next-match)
  (define-key ido-completion-map (kbd "C-p") 'ido-prev-match))
(add-hook 'ido-setup-hook 'ido-define-keys)

;; javascript
(require 'flymake-jshint)
(add-hook 'js-mode-hook 'flymake-jshint-load)
(setq js-indent-level 2)

(setq go-mode-indent-level 2)

;; web mode
(setq web-mode-markup-indent-offset 2)
(setq web-mode-code-indent-offset 2)

;; auto complete
(require 'auto-complete-config)
(ac-config-default)
(global-company-mode t)
(push 'company-robe company-backends)
(defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
  (rvm-activate-corresponding-ruby))

;; scss
(setq scss-compile-at-save nil)
(setq css-indent-offset 2)

;; ruby, rails, etc
(require 'flymake-ruby)
(require 'robe)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)
(add-hook 'ruby-mode-hook 'rubocop-mode)

(setq ruby-deep-indent-paren t)
(setq ruby-indent-level 2)
(setq ruby-deep-indent-paren nil)
(projectile-global-mode)
;; (add-hook 'ruby-mode-hook 'projectile-on)
;; (remove-hook 'ruby-mode-hook 'projectile-on)
(add-hook 'projectile-mode-hook 'projectile-rails-on)
(add-hook 'ruby-mode-hook 'robe-mode)

(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile$" . ruby-mode))

;; web mode
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))

;; rvm integration
(global-set-key (kbd "C-c r a") 'rvm-activate-corresponding-ruby)

;; magit
(require 'magit-gitflow)
(global-set-key (kbd "C-c g s") 'magit-status)
(add-hook 'magit-mode-hook 'turn-on-magit-gitflow)

;; simp
(require 'simp)
(simp-project-define
 '(:has (.git)
	:ignore (tmp coverage log vendor .git public/system public/assets)))
;; (global-set-key [(control p)] 'simp-project-find-file)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector (vector "#c5c8c6" "#cc6666" "#b5bd68" "#f0c674" "#81a2be" "#b294bb" "#8abeb7" "#1d1f21"))
 '(custom-enabled-themes (quote (sanityinc-solarized-dark)))
 '(custom-safe-themes (quote ("4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" default)))
 '(fci-rule-color "#373b41")
 '(indent-tabs-mode nil)
 '(safe-local-variable-values (quote ((haskell-process-use-ghci . t) (haskell-indent-spaces . 4))))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map (quote ((20 . "#cc6666") (40 . "#de935f") (60 . "#f0c674") (80 . "#b5bd68") (100 . "#8abeb7") (120 . "#81a2be") (140 . "#b294bb") (160 . "#cc6666") (180 . "#de935f") (200 . "#f0c674") (220 . "#b5bd68") (240 . "#8abeb7") (260 . "#81a2be") (280 . "#b294bb") (300 . "#cc6666") (320 . "#de935f") (340 . "#f0c674") (360 . "#b5bd68"))))
 '(vc-annotate-very-old-color nil)
 '(winner-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; theme
(require 'color-theme)
(color-theme-initialize)
(color-theme-solarized)

;; auto resize font to keep 80 column buffer
;; (load-file "~/.emacs.d/auto-resize-font.el")

;; https://raw.githubusercontent.com/brandon-rhodes/dot-emacs/master/auto-resize-font.el
;; (load-file "~/.emacs.d/auto-resize-font.el")

;; prefer unicode
(prefer-coding-system 'utf-8)

;; slime
(require 'slime-autoloads)
(setq slime-contribs '(slime-fancy))
(setq inferior-lisp-program "sbcl")

;; org-mode
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; some configs suggested by Mastering Emacs
(global-set-key (kbd "M-o") 'other-window) ;; change current buffer using M-o
(windmove-default-keybindings) ;; allow to change buffer
                               ;; using shift and arrow keys

;; (setq org-default-notes-file (concat org-directory "/notes.org"));;
(define-key global-map "\C-cc" 'org-capture)

;; haskell configuration
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

;; blog admin
(require 'blog-admin)
(setq blog-admin-backend-path "~/blog")


(eval-after-load "haskell-mode"
  '(progn
     (define-key haskell-mode-map (kbd "C-x C-d") nil)
     (define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
     (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-file)
     (define-key haskell-mode-map (kbd "C-c C-b") 'haskell-interactive-switch)
     (define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
     (define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
     (define-key haskell-mode-map (kbd "C-c M-.") nil)
     (define-key haskell-mode-map (kbd "C-c C-d") nil)))

;; (require 'bts)

;; ;; Key Binding
;; (global-unset-key (kbd "M-b"))
;; (global-set-key (kbd "M-b n")   'bts:ticket-new)
;; (global-set-key (kbd "M-b s")   'bts:summary-open)
;; (global-set-key (kbd "M-b p n") 'bts:project-new)
;; (global-set-key (kbd "M-b p u") 'bts:project-update)
;; (global-set-key (kbd "M-b p d") 'bts:project-remove)
;; (global-set-key (kbd "M-b p D") 'bts:project-remove-all)
;; (global-set-key (kbd "M-b q n") 'bts:query-new)
;; (global-set-key (kbd "M-b q u") 'bts:query-update)
;; (global-set-key (kbd "M-b q d") 'bts:query-remove)
;; (global-set-key (kbd "M-b q D") 'bts:query-remove-all
