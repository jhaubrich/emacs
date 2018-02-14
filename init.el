

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#272822" "#F92672" "#A6E22E" "#E6DB74" "#66D9EF" "#FD5FF0" "#A1EFE4" "#F8F8F2"])
 '(compilation-message-face (quote default))
 '(custom-safe-themes
   (quote
    ("e297f54d0dc0575a9271bb0b64dad2c05cff50b510a518f5144925f627bb5832" "4980e5ddaae985e4bae004280bd343721271ebb28f22b3e3b2427443e748cd3f" "ac16245796399c31a7c3ab6a4c0ecf88add866a988d2928248a260b8149ea4ad" "cc12c3806b4fc53fff742ad164c04f8fdb0619730679cf25251129033ee10af1" "c7a9a68bd07e38620a5508fef62ec079d274475c8f92d75ed0c33c45fbe306bc" "1fc1fdf975c8c8c3767c29787a063eee50cbceef903644a0771fa66568ee8777" "8c7f2e40f339a92bb9a4467e6d74aca3a1c553736efcc5955881c53de5d33a18" "e8a976fbc7710b60b069f27f5b2f1e216ec8d228fe5091f677717d6375d2669f" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "6178ac343d9eedcf5dbf321f414c742252df0bc77b4653204eeb114b29904f72" default)))
 '(fci-rule-color "#b6b7c1")
 '(highlight-changes-colors (quote ("#01a00f" "#517e00")))
 '(highlight-tail-colors
   (quote
    (("#b6b7c1" . 0)
     ("#9865fe" . 20)
     ("#b34151" . 30)
     ("#e24a2f" . 50)
     ("#6570de" . 60)
     ("#58a3ff" . 70)
     ("#0cf620" . 85)
     ("#b6b7c1" . 100))))
 '(magit-diff-use-overlays nil)
 '(package-selected-packages
   (quote
    (clojure-mode golden-ratio helm helm-c-yasnippet elpy org-beautify-theme org-beautify noctilux-theme dracula-theme smartparens paredit-everywhere clj-refactor flycheck-clojure paredit 4clojure cider systemd swiper pyvenv ac-cider ein sml-mode mu4e-maildirs-extension csv-mode zzz-to-char zop-to-char helm-themes helm-descbinds undo-tree jedi auto-yasnippet multi-term yaml-mode xkcd web-mode use-package spaceline sos smex rcirc-notify rainbow-mode rainbow-identifiers pkg-info page-break-lines org-bullets multiple-cursors mingus markdown-mode magit lua-mode jinja2-mode ido-vertical-mode ido-hacks ibuffer-vc helm-swoop guide-key git-timemachine git-gutter-fringe gist flx f expand-region edit-server dockerfile-mode darktooth-theme counsel charmap bug-hunter bbcode-mode avy auto-complete ag)))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#06d98d")
     (40 . "#30b0e0")
     (60 . "#3d93f0")
     (80 . "#18248b")
     (100 . "#5472ff")
     (120 . "#5e70ff")
     (140 . "#676dff")
     (160 . "#7169ff")
     (180 . "#591dd1")
     (200 . "#8d65e1")
     (220 . "#9f62c3")
     (240 . "#b161a3")
     (260 . "#c36086")
     (280 . "#5e101a")
     (300 . "#d66459")
     (320 . "#d76949")
     (340 . "#d86f3c")
     (360 . "#992610"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (unspecified "#d7d7d7" "#b6b7c1" "#08ffa8" "#06d98d" "#793cf2" "#591dd1" "#414dbb" "#18248b" "#bf351a" "#992610" "#04ca15" "#01a00f" "#8b2431" "#5e101a" "#07070d" "#07070f")))

;;; init.el --- Where all the magic begins
;;
;; This file loads Org-mode and then loads the rest of our Emacs initialization from Emacs lisp
;; embedded in literate Org-mode files.

;; Load up Org Mode and (now included) Org Babel for elisp embedded in Org Mode files
(setq dotfiles-dir (file-name-directory (or (buffer-file-name) load-file-name)))

(let* ((org-dir (expand-file-name
                 "lisp" (expand-file-name
                         "org" (expand-file-name
                                "src" dotfiles-dir))))
       (org-contrib-dir (expand-file-name
                         "lisp" (expand-file-name
                                 "contrib" (expand-file-name
                                            ".." org-dir))))
       (load-path (append (list org-dir org-contrib-dir)
                          (or load-path nil))))
  ;; load up Org-mode and Org-babel
  (require 'org-install)
  (require 'ob-tangle))

;; load up all literate org-mode files in this directory
(mapc #'org-babel-load-file (directory-files dotfiles-dir t "\\.org$"))

;;; init.el ends here

(put 'downcase-region 'disabled nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#202020" :foreground "#cccccc" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 113 :width normal :foundry "ADBO" :family "Source Code Pro"))))
 '(mu4e-header-highlight-face ((t (:background "#b6b7c1"))))
 '(mu4e-unread-face ((t (:inherit nil :weight bold)))))
