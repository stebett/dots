/* modifier 0 means no modifier */
static int surfuseragent    = 1;  /* Append Surf version to default WebKit user agent */
static char *fulluseragent  = ""; /* Or override the whole user agent string */
static char *scriptfile     = "~/.surf/script.js";
static char *styledir       = "~/.surf/styles/";
static char *certdir        = "~/.surf/certificates/";
static char *cachedir       = "~/.surf/cache/";
static char *cookiefile     = "~/.surf/cookies.txt";

static const char dmenufont[]       = "Anonymous Pro:pixelsize=22:style:bold";
static SearchEngine searchengines[] = {
	{ "g",   "http://www.google.com/search?q=%s"   },
	{ "d", "https://www.duckduckgo.com/?q=%s"   },
};

static const char col_bg[]          = "#282828";
static const char col_red1[]        = "#cc241d";
static const char col_red2[]        = "#fb4934";
static const char col_green1[]      = "#98971a";
static const char col_green2[]      = "#b8bb36";
static const char col_yellow1[]     = "#d79921";
static const char col_yellow2[]     = "#fabd3f";
static const char col_blue1[]       = "#458588";
static const char col_blue2[]       = "#83a598";
static const char col_purple1[]     = "#b16286";
static const char col_purple2[]     = "#d3869b";
static const char col_gray1[]       = "#928374";
static const char col_gray2[]       = "#a89984";
static const char col_aqua1[]       = "#689d6a";
static const char col_aqua2[]       = "#8ec07c";
static const char col_orange1[]     = "#d65d0e";
static const char col_orange2[]     = "#fe8019";
static const char col_fg[]          = "#ebdbb2";

/* Webkit default features */
/* Highest priority value will be used.
 * Default parameters are priority 0
 * Per-uri parameters are priority 1
 * Command parameters are priority 2
 */
static Parameter defconfig[ParameterLast] = {
	/* parameter                    Arg value       priority */
	[AcceleratedCanvas]   =       { { .i = 1 },     },
	[AccessMicrophone]    =       { { .i = 0 },     },
	[AccessWebcam]        =       { { .i = 0 },     },
	[Certificate]         =       { { .i = 0 },     },
	[CaretBrowsing]       =       { { .i = 0 },     },
	[CookiePolicies]      =       { { .v = "@Aa" }, },
	[DefaultCharset]      =       { { .v = "UTF-8" }, },
	[DiskCache]           =       { { .i = 1 },     },
	[DNSPrefetch]         =       { { .i = 0 },     },
	[FileURLsCrossAccess] =       { { .i = 0 },     },
	[FontSize]            =       { { .i = 14 },    },
	[FrameFlattening]     =       { { .i = 0 },     },
	[Geolocation]         =       { { .i = 0 },     },
	[HideBackground]      =       { { .i = 0 },     },
	[Inspector]           =       { { .i = 0 },     },
	[Java]                =       { { .i = 1 },     },
	[JavaScript]          =       { { .i = 1 },     },
	[KioskMode]           =       { { .i = 0 },     },
	[LoadImages]          =       { { .i = 1 },     },
	[MediaManualPlay]     =       { { .i = 1 },     },
	[Plugins]             =       { { .i = 0 },     },
	[PreferredLanguages]  =       { { .v = (char *[]){ NULL } }, },
	[RunInFullscreen]     =       { { .i = 0 },     },
	[ScrollBars]          =       { { .i = 1 },     },
	[ShowIndicators]      =       { { .i = 1 },     },
	[SiteQuirks]          =       { { .i = 1 },     },
	[SmoothScrolling]     =       { { .i = 0 },     },
	[SpellChecking]       =       { { .i = 1 },     },
	[SpellLanguages]      =       { { .v = ((char *[]){ "en_US", NULL }) }, },
	[StrictTLS]           =       { { .i = 1 },     },
	[Style]               =       { { .i = 1 },     },
	[WebGL]               =       { { .i = 0 },     },
	[ZoomLevel]           =       { { .f = 1.2 },   },
};

static UriParameters uriparams[] = {
	{ "(://|\\.)suckless\\.org(/|$)", {
	  [JavaScript] = { { .i = 0 }, 1 },
	  [Plugins]    = { { .i = 0 }, 1 },
	}, },
};

/* default window size: width, height */
static int winsize[] = { 800, 600 };

static WebKitFindOptions findopts = WEBKIT_FIND_OPTIONS_CASE_INSENSITIVE |
                                    WEBKIT_FIND_OPTIONS_WRAP_AROUND;

#define PROMPT_GO   "Go:"
#define PROMPT_FIND "Find:"


#define BM_PICK { .v = (char *[]){ "/bin/sh", "-c", \
"xprop -id $0 -f _SURF_GO 8s -set _SURF_GO \
`cat ~/.surf/bookmarks | dmenu || exit 0`", \
winid, NULL } }


#define BM_ADD { .v = (char *[]){ "/bin/bash", "-c", \
"(echo `xprop -id $0 _SURF_URI | cut -d '\"' -f 2` && \
cat ~/.surf/bookmarks | sort -u > ~/.surf/bookmarks_new && \
mv ~/.surf/bookmarks_new ~/.surf/bookmarks", \
winid, NULL } }


/* SETPROP(readprop, setprop, prompt)*/
#define SETPROP(r, s, p) { \
        .v = (const char *[]){ "/bin/sh", "-c", \
             "prop=\"$(printf '%b' \"$(xprop -id $1 $2 " \
             "| sed \"s/^$2(STRING) = //;s/^\\\"\\(.*\\)\\\"$/\\1/\")\" " \
             "| dmenu -p \"$4\" -w $1)\" && xprop -id $1 -f $3 8s -set $3 \"$prop\"", \
             "surf-setprop", winid, r, s, p, NULL \
        } \
}


/* DOWNLOAD(URI, referer) */
#define DOWNLOAD(u, r) { \
        .v = (const char *[]){ "st", "-e", "/bin/sh", "-c",\
             "curl -g -L -J -O -A \"$1\" -b \"$2\" -c \"$2\"" \
             " -e \"$3\" \"$4\"; read", \
             "surf-download", useragent, cookiefile, r, u, NULL \
        } \
}

/* PLUMB(URI) */
/* This called when some URI which does not begin with "about:",
 * "http://" or "https://" should be opened.
 */
#define PLUMB(u) {\
        .v = (const char *[]){ "/bin/sh", "-c", \
             "xdg-open \"$0\"", u, NULL \
        } \
}

/* VIDEOPLAY(URI) */
#define VIDEOPLAY(u) {\
        .v = (const char *[]){ "/bin/sh", "-c", \
             "mpv --really-quiet \"$0\"", u, NULL \
        } \
}

/* styles */
/*
 * The iteration will stop at the first match, beginning at the beginning of
 * the list.
 */
static SiteSpecific styles[] = {
	/* regexp               file in $styledir */
	{ ".*",                 "default.css" },
};

/* certificates */
/*
 * Provide custom certificate for urls
 */
static SiteSpecific certs[] = {
	/* regexp               file in $certdir */
	{ "://suckless\\.org/", "suckless.org.crt" },
};

#define MODKEY Mod1Mask /* ALT_L  */ 

/* hotkeys */
/*
 * If you use anything else but MODKEY and GDK_SHIFT_MASK, don't forget to
 * edit the CLEANMASK() macro.
 */
static Key keys[] = {
	/* modifier              keyval          function    arg */
	{ MODKEY,                 56,    /* b */    spawn,      BM_PICK },
    { MODKEY|GDK_SHIFT_MASK,  56,    /* b */    spawn,      BM_ADD },
    { MODKEY,                 42,    /* g */    spawn,      SETPROP("_SURF_URI", "_SURF_GO", PROMPT_GO) },
	{ MODKEY,                 61,    /* slash*/ spawn,      SETPROP("_SURF_FIND", "_SURF_FIND", PROMPT_FIND) },

	{ MODKEY,                 58,    /* m */    stop,       { 0 } },

	{ MODKEY|GDK_SHIFT_MASK,  28,    /* t */    reload,     { .i = 1 } },
	{ MODKEY,                 28,    /* t */    reload,     { .i = 0 } },

	{ MODKEY,                 32,    /* o */    navigate,   { .i = +1 } },
	{ MODKEY,                 31,    /* i */    navigate,   { .i = -1 } },

	/* vertical and horizontal scrolling, in viewport percentage */
	{ MODKEY,                 44,    /* j */    scrollv,    { .i = +10 } },
	{ MODKEY,                 45,    /* k */    scrollv,    { .i = -10 } },
	{ MODKEY,                 40,    /* d */    scrollv,    { .i = +50 } },
	{ MODKEY,                 30,    /* u */    scrollv,    { .i = -50 } },


	{ MODKEY|GDK_SHIFT_MASK,  44,    /* j */    zoom,       { .i = -1 } },
	{ MODKEY|GDK_SHIFT_MASK,  45,    /* k */    zoom,       { .i = +1 } },
	{ MODKEY|GDK_SHIFT_MASK,  24,    /* q */    zoom,       { .i = 0  } },
	{ MODKEY,                 20,    /* minus*/ zoom,       { .i = -1 } },
	{ MODKEY,                 21,    /* plus */ zoom,       { .i = +1 } },

	{ MODKEY,                 33,    /* p */    clipboard,  { .i = 1 } },
	{ MODKEY,                 29,    /* y */    clipboard,  { .i = 0 } },

	{ MODKEY,                 57,    /* n */    find,       { .i = +1 } },
	{ MODKEY|GDK_SHIFT_MASK,  57,    /* n */    find,       { .i = -1 } },

	{ MODKEY|GDK_SHIFT_MASK,  33,    /* p */    print,      { 0 } },

	{ MODKEY|GDK_SHIFT_MASK,  38,    /* a */    togglecookiepolicy, { 0 } },
	{ MODKEY|GDK_SHIFT_MASK,  32,    /* o */    toggleinspector, { 0 } },

	{ MODKEY|GDK_SHIFT_MASK,  54,    /* c */    toggle,     { .i = CaretBrowsing } },
	{ MODKEY|GDK_SHIFT_MASK,  41,    /* f */    toggle,     { .i = FrameFlattening } },
	{ MODKEY|GDK_SHIFT_MASK,  42,    /* g */    toggle,     { .i = Geolocation } },
	{ MODKEY|GDK_SHIFT_MASK,  39,    /* s */    toggle,     { .i = JavaScript } },
	{ MODKEY|GDK_SHIFT_MASK,  31,    /* i */    toggle,     { .i = LoadImages } },
	{ MODKEY|GDK_SHIFT_MASK,  55,    /* v */    toggle,     { .i = Plugins } },
	{ MODKEY|GDK_SHIFT_MASK,  56,    /* b */    toggle,     { .i = ScrollBars } },
	{ MODKEY|GDK_SHIFT_MASK,  28,    /* t */    toggle,     { .i = StrictTLS } },
	{ MODKEY|GDK_SHIFT_MASK,  58,    /* m */    toggle,     { .i = Style } },
};

/* button definitions */
/* target can be OnDoc, OnLink, OnImg, OnMedia, OnEdit, OnBar, OnSel, OnAny */
static Button buttons[] = {
	/* target       event mask      button  function        argument        stop event */
	{ OnLink,       0,              2,      clicknewwindow, { .i = 0 },     1 },
	{ OnLink,       MODKEY,         2,      clicknewwindow, { .i = 1 },     1 },
	{ OnLink,       MODKEY,         1,      clicknewwindow, { .i = 1 },     1 },
	{ OnAny,        0,              8,      clicknavigate,  { .i = -1 },    1 },
	{ OnAny,        0,              9,      clicknavigate,  { .i = +1 },    1 },
	{ OnMedia,      MODKEY,         1,      clickexternplayer, { 0 },       1 },
};

#define HOMEPAGE "https://google.com/"
